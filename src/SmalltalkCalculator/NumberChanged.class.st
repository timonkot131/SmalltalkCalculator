Class {
	#name : #NumberChanged,
	#superclass : #Announcement,
	#instVars : [
		'numAsString'
	],
	#category : #SmalltalkCalculator
}

{ #category : #'as yet unclassified' }
NumberChanged class >> with: aString [
	self new numAsString: aString
]

{ #category : #accessing }
NumberChanged >> numAsString [
	^ numAsString
]

{ #category : #accessing }
NumberChanged >> numAsString: anObject [
	numAsString := anObject
]
