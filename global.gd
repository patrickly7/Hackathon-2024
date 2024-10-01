# Global Variables
extends Node

const possibleCards = [
	"Bat",
	"Candy Bat",
	"Candy Ghost",
	"Candy Pumpkin",
	"Candy Tree",
	"Ghost",
	"Pumpkin",
	"Snowflake Bat",
	"Snowflake Ghost",
	"Snowflake Pumpkin",
	"Snowflake Tree",
	"Tree",
	"Candy Candy Corn",
	"Candy Corn",
	"Candy Scarecrow",
	"Candy Spider",
	"Candy Witch",
	"Scarecrow",
	"Snowflake Candy Corn",
	"Snowflake Scarecrow",
	"Snowflake Spider",
	"Snowflake Witch",
	"Spider",
	"Witch"
]

const cardToSetIconDict = {
	# Bow
	"Bat": "res://Assets/Art/Icons/Set_Bow.png",
	"Candy Bat": "res://Assets/Art/Icons/Set_Bow.png",
	"Candy Ghost": "res://Assets/Art/Icons/Set_Bow.png",
	"Candy Pumpkin": "res://Assets/Art/Icons/Set_Bow.png",
	"Candy Tree": "res://Assets/Art/Icons/Set_Bow.png",
	"Ghost": "res://Assets/Art/Icons/Set_Bow.png",
	"Pumpkin": "res://Assets/Art/Icons/Set_Bow.png",
	"Snowflake Bat": "res://Assets/Art/Icons/Set_Bow.png",
	"Snowflake Ghost": "res://Assets/Art/Icons/Set_Bow.png",
	"Snowflake Pumpkin": "res://Assets/Art/Icons/Set_Bow.png",
	"Snowflake Tree": "res://Assets/Art/Icons/Set_Bow.png",
	"Tree": "res://Assets/Art/Icons/Set_Bow.png",
	
	# Shield
	"Candy Candy Corn": "res://Assets/Art/Icons/Set_Shield.png",
	"Candy Corn": "res://Assets/Art/Icons/Set_Shield.png",
	"Candy Scarecrow": "res://Assets/Art/Icons/Set_Shield.png",
	"Candy Spider": "res://Assets/Art/Icons/Set_Shield.png",
	"Candy Witch": "res://Assets/Art/Icons/Set_Shield.png",
	"Scarecrow": "res://Assets/Art/Icons/Set_Shield.png",
	"Snowflake Candy Corn": "res://Assets/Art/Icons/Set_Shield.png",
	"Snowflake Scarecrow": "res://Assets/Art/Icons/Set_Shield.png",
	"Snowflake Spider": "res://Assets/Art/Icons/Set_Shield.png",
	"Snowflake Witch": "res://Assets/Art/Icons/Set_Shield.png",
	"Spider": "res://Assets/Art/Icons/Set_Shield.png",
	"Witch": "res://Assets/Art/Icons/Set_Shield.png"
}

var cardsToPull = []
var cardsPulled = []
var currentSQ = ""
var currentSQWeight = 0

# Used for Scoring
var sqsCompleted = 0
var wrongShippingUsed = 0
var wrongCardsPulled = 0
var correctCardsPulled = 0
