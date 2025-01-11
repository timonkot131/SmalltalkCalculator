Extension { #name : #BlElement }

{ #category : #'*SmalltalkCalculator' }
BlElement >> action: aBlock for: aSymbol [
	(self childNamed: aSymbol) action: [aBlock value: self viewModel]. 
]
