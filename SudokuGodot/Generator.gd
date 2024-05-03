# Courtesy of chat gpt, pasted here to save time, won0t work, use it as reference 
extends Node

var grid_size = 9
var grid = []

func _ready():
	generate_sudoku()
	print_sudoku()

func generate_sudoku():
	# Inizializza la griglia con zeri
	grid = []
	for i in range(grid_size):
		var row = []
		for j in range(grid_size):
			row.append(0)
		grid.append(row)
	
	# Riempie la griglia con numeri casuali validi
	solve_sudoku(0, 0)

	# Rimuove alcuni numeri per creare il puzzle
	remove_numbers(60) # Modifica il numero per regolare la difficoltà

func solve_sudoku(row, col):
	if row == grid_size:
		row = 0
		col += 1
		if col == grid_size:
			return true
	
	if grid[row][col] != 0:
		return solve_sudoku(row + 1, col)

	for num in range(1, grid_size + 1):
		if is_valid_move(row, col, num):
			grid[row][col] = num
			if solve_sudoku(row + 1, col):
				return true
			grid[row][col] = 0
	
	return false

func is_valid_move(row, col, num):
	for i in range(grid_size):
		if grid[row][i] == num or grid[i][col] == num:
			return false
	
	var start_row = row - row % 3
	var start_col = col - col % 3

	for i in range(3):
		for j in range(3):
			if grid[i + start_row][j + start_col] == num:
				return false
	
	return true

func remove_numbers(num_to_remove):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	for i in range(num_to_remove):
		var row = rng.randi_range(0, grid_size - 1)
		var col = rng.randi_range(0, grid_size - 1)
		while grid[row][col] == 0:
			row = rng.randi_range(0, grid_size - 1)
			col = rng.randi_range(0, grid_size - 1)
		grid[row][col] = 0

func print_sudoku():
	for row in grid:
		print(row)
