extends GridContainer

# Define constants
const GRID_SIZE = 9
const SUBGRID_SIZE = 3

# Define arrays for rows, columns, and squares
var rows = []
var Colums = []
var squares = []

func _ready():
	# Populate rows and columns
	for i in range(GRID_SIZE):
		var row = []
		var Colum = []
		for j in range(GRID_SIZE):
			# Assuming `grid` is your grid control node
			row.append(get_child(i * GRID_SIZE + j))
			Colum.append(get_child(j * GRID_SIZE + i))
		rows.append(row)
		Colums.append(Colum)

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
	# Check if rows, columns, and squares are filled correctly
	checkRows()
	checkColumns()
	checkSquares()

# Funzione per controllare se i valori in ogni riga sono unici

# Funzione per controllare se i valori in ogni riga sono unici
func checkUnique(Cells: Array) -> bool:
	var seen = []
	for cell in Cells:
		if cell.text == null:
			return false
		if seen.has(cell.text):
			return false
		else :
			seen.append(cell.text)
	#print("valore di array di prova        ", seen)
	return true


# Function to check if all rows are filled correctly
func checkRows():
	for i in range(rows.size()):
		var row = rows[i]
		if not checkUnique(row):  # chiama la funzione una volta per riga e chiama l'assert di conseguenza 
			print("There is an issue with row ", i + 1)
		else:
			print("Row ", i + 1, " is filled correctly")

# Function to check if all columns are filled correctly
func checkColumns():
	for i in range(Colums.size()):
		var Colum = Colums[i]
		if not checkUnique(Colum):
			print("There is an issue with column ", i + 1)
		else:
			print("Column ", i + 1, " is filled correctly")

# Function to check if all squares are filled correctly
func checkSquares():
	for i in range(squares.size()):
		var square = squares[i]
		if not checkUnique(square):
			print("There is an issue with square ", i + 1)
		else:
			print("Square ", i + 1, " is filled correctly")

# Print the arrays to verify
func scrivi():
	print(rows)
	print(Colums)
	print(squares)
