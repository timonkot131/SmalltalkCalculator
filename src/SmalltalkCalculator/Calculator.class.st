Class {
	#name : #Calculator,
	#superclass : #Object,
	#instVars : [
		'msgState',
		'numState'
	],
	#category : #SmalltalkCalculator
}

{ #category : #operations }
Calculator >> calc: aNumber [
	numState := self perform: msgState withArguments: {aNumber}.
	^numState.
]

{ #category : #operations }
Calculator >> div: aNumber [
 ^numState / aNumber.
]

{ #category : #initalization }
Calculator >> initialize [
super initialize.
self msg: #print: num: 0.
]

{ #category : #operations }
Calculator >> minus: aNumber [
^numState - aNumber.
]

{ #category : #'as yet unclassified' }
Calculator >> msg: aSymbol num: aNumber [ 
	numState := aNumber.
	msgState := aSymbol.
]

{ #category : #operations }
Calculator >> mul: aNumber [
^numState * aNumber.
]

{ #category : #operations }
Calculator >> plus: aNumber [
	^numState + aNumber.
]

{ #category : #operations }
Calculator >> print: aNumber [
^aNumber
]
