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
	"Witch",
	"Candy Elf",
	"Candy Gift",
	"Candy Reindeer",
	"Candy Santa",
	"Elf",
	"Gift",
	"Reindeer",
	"Santa",
	"Snowflake Elf",
	"Snowflake Gift",
	"Snowflake Reindeer",
	"Snowflake Santa",
	"Candy Candy Cane",
	"Candy Cane",
	"Candy Mistletoe",
	"Candy Snowman",
	"Candy Stocking",
	"Mistletoe",
	"Snowflake Candy Cane",
	"Snowflake Mistletoe",
	"Snowflake Snowman",
	"Snowflake Stocking",
	"Snowman",
	"Stocking"
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
	"Witch": "res://Assets/Art/Icons/Set_Shield.png",
	
	# Staff
	"Candy Elf": "res://Assets/Art/Icons/Set_Staff.png",
	"Candy Gift": "res://Assets/Art/Icons/Set_Staff.png",
	"Candy Reindeer": "res://Assets/Art/Icons/Set_Staff.png",
	"Candy Santa": "res://Assets/Art/Icons/Set_Staff.png",
	"Elf": "res://Assets/Art/Icons/Set_Staff.png",
	"Gift": "res://Assets/Art/Icons/Set_Staff.png",
	"Reindeer": "res://Assets/Art/Icons/Set_Staff.png",
	"Santa": "res://Assets/Art/Icons/Set_Staff.png",
	"Snowflake Elf": "res://Assets/Art/Icons/Set_Staff.png",
	"Snowflake Gift": "res://Assets/Art/Icons/Set_Staff.png",
	"Snowflake Reindeer": "res://Assets/Art/Icons/Set_Staff.png",
	"Snowflake Santa": "res://Assets/Art/Icons/Set_Staff.png",
	
	# Sword
	"Candy Candy Cane": "res://Assets/Art/Icons/Set_Sword.png",
	"Candy Cane": "res://Assets/Art/Icons/Set_Sword.png",
	"Candy Mistletoe": "res://Assets/Art/Icons/Set_Sword.png",
	"Candy Snowman": "res://Assets/Art/Icons/Set_Sword.png",
	"Candy Stocking": "res://Assets/Art/Icons/Set_Sword.png",
	"Mistletoe": "res://Assets/Art/Icons/Set_Sword.png",
	"Snowflake Candy Cane": "res://Assets/Art/Icons/Set_Sword.png",
	"Snowflake Mistletoe": "res://Assets/Art/Icons/Set_Sword.png",
	"Snowflake Snowman": "res://Assets/Art/Icons/Set_Sword.png",
	"Snowflake Stocking": "res://Assets/Art/Icons/Set_Sword.png",
	"Snowman": "res://Assets/Art/Icons/Set_Sword.png",
	"Stocking": "res://Assets/Art/Icons/Set_Sword.png"
}

var firstTimePlaying = true

var isPlayerPaused = false

var cardsToPull = []
var cardsToPullQuantities = []
var cardsPulled = []
var cardsPulledQuantities = []

var currentSQ = ""
var currentSQWeight = 0
var currentSQComplete = false

# Used for Scoring
var sqsCompleted = 0
var wrongShippingUsed = 0
var wrongCardsPulled = 0
var correctCardsPulled = 0

# Static Functions
func getQuantityInCardsPulled(cardName):
	for i in len(cardsPulled):
		if cardsPulled[i] == cardName:
			return cardsPulledQuantities[i]
	return 0
	
func getIndexInCardsPulled(cardName):
	for i in len(cardsPulled):
		if cardsPulled[i] == cardName:
			return i
	return -1

func getQuantityInCardsToPull(cardName):
	for i in len(cardsToPull):
		if cardsToPull[i] == cardName:
			return cardsToPullQuantities[i]
	return 0
	
func getIndexInCardsToPull(cardName):
	for i in len(cardsToPull):
		if cardsToPull[i] == cardName:
			return i
	return -1
