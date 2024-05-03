extends GridContainer

# Define constants
const GRID_SIZE = 9
const SUBGRID_SIZE = 3

# Define arrays for rows, columns, and squares
var rows = []
var Columns = []
var squares = []

func _ready():
	# Populate rows and columns
	for i in range(GRID_SIZE):
		var row = []
		var column = []
		for j in range(GRID_SIZE):
			# Assuming `grid` is your grid control node
			row.append(get_child(i * GRID_SIZE + j))
			column.append(get_child(j * GRID_SIZE + i))
		rows.append(row)
		Columns.append(column)

	# Populate squares
	for i in range(0, GRID_SIZE, SUBGRID_SIZE):
		for j in range(0, GRID_SIZE, SUBGRID_SIZE):
			var square = []
			for k in range(SUBGRID_SIZE):
				for l in range(SUBGRID_SIZE):
					square.append(get_child((i + k) * GRID_SIZE + j + l))
			squares.append(square)
	
	# Print the arrays to verify
	scrivi()

func scrivi():
	print(rows)
	for i in range(5):
		print("COLONNE")
	print(Columns)
	for i in range(5):
		print("Quadrati")
	print(squares)
