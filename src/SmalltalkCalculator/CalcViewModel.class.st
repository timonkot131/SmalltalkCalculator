Class {
	#name : #CalcViewModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'model'
	],
	#category : #SmalltalkCalculator
}

{ #category : #factory }
CalcViewModel class >> withModel: aCalculator [
self new model: aCalculator
]

{ #category : #announcer }
CalcViewModel >> announcer [
	<return: #Announcer>
	^announcer.
]

{ #category : #initialization }
CalcViewModel >> initialize [ 
	super initialize.
	announcer := Announcer new.
]

{ #category : #private }
CalcViewModel >> model [ 
^model
]

{ #category : #private }
CalcViewModel >> model: aCalculator [ 
model := aCalculator
]

{ #category : #operations }
CalcViewModel >> sendDiv [ 
	model state: #div.
]

{ #category : #operations }
CalcViewModel >> sendMinus [
	model state: #minus.
]

{ #category : #operations }
CalcViewModel >> sendMul [
	model state: #mul.
]

{ #category : #operations }
CalcViewModel >> sendPlus [
	model state: #plus
]
