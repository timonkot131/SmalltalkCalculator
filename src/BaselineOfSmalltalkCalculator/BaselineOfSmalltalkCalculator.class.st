Class {
	#name : #BaselineOfSmalltalkCalculator,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmalltalkCalculator
}

{ #category : #loading }
BaselineOfSmalltalkCalculator class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'SmalltalkCalculator' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfSmalltalkCalculator >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'SmalltalkCalculator'.
			spec package: 'SmalltalkCalculator'
		]
]
