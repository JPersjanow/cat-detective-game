extends Node

const ICON_1 = preload("uid://cxtic4qtq2weq")
const ICON_2 = preload("uid://jjo3drto6axw")
const ICON_3 = preload("uid://ckv1610liasw7")
const ICON_4 = preload("uid://dmckpqc5u5u6v")
const ICON_5 = preload("uid://jujydq2ri0at")
const ICON_6 = preload("uid://b2sj2opvw0bnf")

enum Abilities {SCRATCH, MEOW, CLIMB, LIQUID, SWIM, PURR}
var AbilitiesNames: Dictionary = {
	Abilities.SCRATCH: "Scratch",
	Abilities.MEOW: "Meow",
	Abilities.CLIMB: "Climb",
	Abilities.LIQUID: "Liquid Cat",
	Abilities.SWIM: "Swim",
	Abilities.PURR: "Purr"
}
var AbilitiesDescriptions: Dictionary = {
	Abilities.SCRATCH: "No pillow stands a chance!",
	Abilities.MEOW: "Meow meow meow",
	Abilities.CLIMB: "There's no mountain high enough",
	Abilities.LIQUID: "Fit into any space",
	Abilities.SWIM: "It's bath time",
	Abilities.PURR: "Vibrate yourself and air around you"
}
var AbilitiesTextures: Dictionary = {
	Abilities.SCRATCH: ICON_1,
	Abilities.MEOW: ICON_2,
	Abilities.CLIMB: ICON_3,
	Abilities.LIQUID: ICON_4,
	Abilities.SWIM: ICON_5,
	Abilities.PURR: ICON_6
	}
