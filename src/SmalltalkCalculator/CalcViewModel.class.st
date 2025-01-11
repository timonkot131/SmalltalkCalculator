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
^self new model: aCalculator
]

{ #category : #announcer }
CalcViewModel >> announcer [
	<return: #Announcer>
	^announcer.
]

{ #category : #accessing }
CalcViewModel >> currentNumber [
	^ currentNumber
]

{ #category : #accessing }
CalcViewModel >> currentNumber: aNumber [
	currentNumber := aNumber.
	self announce: (NumberChanged with: currentNumber).
]

{ #category : #initialization }
CalcViewModel >> initialize [ 
	super initialize.
	currentNumber := ''.
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

{ #category : #'as yet unclassified' }
CalcViewModel >> sendBack [ 
	| cur|
	cur := self currentNumber. 
	self currentNumber: (cur sliceFrom: 0 to: cur size - 1).
]

{ #category : #operations }
CalcViewModel >> sendClear [ 
	model msg: #print: num: 0.
	self currentNumber: ''
]

{ #category : #operations }
CalcViewModel >> sendDiv [ 
	model msg: #div: num: currentNumber asNumber.
	self currentNumber: ''.
]

{ #category : #'as yet unclassified' }
CalcViewModel >> sendDot [
	| cur |
	cur := self currentNumber.
	((cur includesAny: '.') not & cur isEmptyOrNil not) ifTrue: [ self sendNum: '.' ]
]

{ #category : #operations }
CalcViewModel >> sendEquals [
	| tempNum result |
	tempNum := self currentNumber ifNotEmpty: [:s | s asNumber] ifEmpty: [0].
	result := model calc: tempNum.
	model msg: #print: num: result.
	result := result isFraction ifTrue: [result asFloat] ifFalse: [result].
	self currentNumber: result asString.

]

{ #category : #operations }
CalcViewModel >> sendMinus [
	model msg: #minus: num: currentNumber asNumber.
	self currentNumber: ''
]

{ #category : #operations }
CalcViewModel >> sendMul [
	model msg: #mul: num: currentNumber asNumber.
	self currentNumber: ''
]

{ #category : #operations }
CalcViewModel >> sendNum: aNumber [ 
	self currentNumber: self currentNumber, aNumber asString.
]

{ #category : #operations }
CalcViewModel >> sendPlus [
	model msg: #plus: num: currentNumber asNumber.
	self currentNumber: ''
]

{ #category : #'as yet unclassified' }
CalcViewModel >> sendZero [ 
	self sendNum: 0. 
]
