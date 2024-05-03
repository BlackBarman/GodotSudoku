extends Node2D

	# Define an array of arrays
var Rows = [
		[1, 2, 3],
		[4, 5, 6],
		[7, 8, 9]
	]

func _ready():
	# Call the function to iterate through the array of arrays
	iterateArrayOfArrays(Rows)

# Function to iterate through an array of arrays
func iterateArrayOfArrays(arr:Array):

	# Itera attraverso ogni array nell'array principale
	for i in arr:
		# Verifica se l'elemento è effettivamente un array
		if typeof(i) == TYPE_ARRAY:
			# Itera attraverso ogni elemento dell'array interno
			for element in i:
				# Fai qualcosa con l'elemento, ad esempio stampalo
				print(element)
		else:
			# Se l'elemento non è un array, gestisci l'errore o fai altro
			print("Elemento non valido:", arr)
