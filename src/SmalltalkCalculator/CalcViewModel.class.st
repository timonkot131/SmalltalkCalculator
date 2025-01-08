Class {
	#name : #CalcViewModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'model',
		'currentNumber'
	],
	#category : #SmalltalkCalculator
}

{ #category : #accessing }
CalcViewModel class >> grid: buttons [
	| grid |
	grid := BlElement new
			layout: (BlGridLayout new columnCount: 3);
			width: 170;
			constraintsDo: [ :c | c vertical fitContent ];
			addChildren: buttons;
			yourself.
	^ grid
]

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

{ #category : #'as yet unclassified' }
CalcViewModel >> onInstalledIn: anObject [
]

{ #category : #'as yet unclassified' }
CalcViewModel >> onUninstalledIn: anObject [
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

{ #category : #'as yet unclassified' }
CalcViewModel >> sendNum: aNumber [ 
	currentNumber := currentNumber + aNumber asString.
	self announce: (NumberChanged with: currentNumber)
]

{ #category : #operations }
CalcViewModel >> sendPlus [
	model state: #plus
]
