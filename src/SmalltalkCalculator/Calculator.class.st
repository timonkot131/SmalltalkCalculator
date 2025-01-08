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
	numState := self perform: msgState withArguments: aNumber.
]

{ #category : #operations }
Calculator >> div: aNumber [
 ^numState / aNumber.
]

{ #category : #initalization }
Calculator >> initialize [
super initialize.
self msgState: #print.
self numState: 0.
]

{ #category : #operations }
Calculator >> minus: aNumber [
^numState - aNumber.
]

{ #category : #accessing }
Calculator >> msgState [
	^msgState
]

{ #category : #accessing }
Calculator >> msgState: aSymbol [
 msgState := aSymbol.
]

{ #category : #operations }
Calculator >> mul: aNumber [
^numState * aNumber.
]

{ #category : #accessing }
Calculator >> numState [
	^ numState
]

{ #category : #accessing }
Calculator >> numState: anInteger [
	numState := anInteger
]

{ #category : #operations }
Calculator >> plus: aNumber [
	^numState + aNumber.
]

{ #category : #operations }
Calculator >> print: anInteger [
self
]
