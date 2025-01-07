Class {
	#name : #VModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer',
		'model'
	],
	#category : #SmalltalkCalculator
}

{ #category : #announcer }
VModel >> announcer [
	<return: #Announcer>
	^announcer.
]

{ #category : #'as yet unclassified' }
VModel >> initialize [ 
	super initialize.
	announcer := Announcer new.
]

{ #category : #'as yet unclassified' }
VModel >> sendDiv [ 
	model state: #div.
]

{ #category : #'as yet unclassified' }
VModel >> sendMinus [
	model state: #minus.
]

{ #category : #'as yet unclassified' }
VModel >> sendMul [
	model state: #mul.
]

{ #category : #'as yet unclassified' }
VModel >> sendPlus [
	model state: #plus
]
