Class {
	#name : #BaselineOfSmalltalkCalculatorRelease,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmalltalkCalculatorRelease
}

{ #category : #'as yet unclassified' }
BaselineOfSmalltalkCalculatorRelease >> baseline: spec [
	<baseline>
	^ spec
		for: #common
		do: [ self loadAnnouncer: spec.

			spec
				baseline: 'Brick'
				with: [ spec repository: 'github://feenkcom/Brick:main/src' ].

			spec 
				package: 'SmalltalkCalculator' 
				with: [ spec requires: #('Brick' 'GToolkitUtility') ]
			 ]
]

{ #category : #'as yet unclassified' }
BaselineOfSmalltalkCalculatorRelease >> loadAnnouncer: spec [
	spec
		baseline: 'GToolkitUtility'
		with: [ spec repository: 'github://feenkcom/gtoolkit-utility:main/src' ]. 		  			
]
