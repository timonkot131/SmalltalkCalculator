Class {
	#name : #BaselineOfSmalltalkCalculatorRelease,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmalltalkCalculatorRelease
}

{ #category : #'as yet unclassified' }
BaselineOfSmalltalkCalculatorRelease >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			self loadBloc: spec.
			self loadAnnouncer: spec.
			
			spec package: 'SmalltalkCalculator'.
		]
]

{ #category : #'as yet unclassified' }
BaselineOfSmalltalkCalculatorRelease >> loadAnnouncer: spec [
	spec
		baseline: 'GToolkitBasicUtility'
		with: [ spec repository: 'github://feenkcom/gtoolkit-utility:main/src' ].
	spec
		package: 'GToolkit-Utility-Announcer'
		with: [ spec requires: #('GToolkitBasicUtility') ]
]

{ #category : #'as yet unclassified' }
BaselineOfSmalltalkCalculatorRelease >> loadBloc: spec [
	spec postLoadDoIt: #postLoadBloc:.
	spec
		baseline: 'Beacon'
			with: [ spec repository: 'github://feenkcom/pharo-beacon/repository' ];
		baseline: 'Telemetry'
			with: [ spec repository: 'github://feenkcom/pharo-telemetry:main/src' ];
		baseline: 'Futures'
			with: [ spec repository: 'github://feenkcom/pharo-futures:main/src' ];
		baseline: 'Fenster'
			with: [ spec repository: 'github://feenkcom/fenster:main/src' ];
		baseline: 'Sparta'
			with: [ spec repository: 'github://feenkcom/Sparta:main/src' ];
		baseline: 'Glutin'
			with: [ spec repository: 'github://feenkcom/gtoolkit-glutin:main/src' ].
	spec
		package: #Bloc
			with: [ spec requires: #('Beacon' 'Fenster' 'Telemetry' 'Futures') ];
		package: #'Bloc-Animation' with: [ spec requires: #(#Bloc) ];
		package: #'Bloc-Layout' with: [ spec requires: #(#Bloc #'Bloc-Animation') ];
		package: #'Bloc-Text' with: [ spec requires: #(#Bloc) ];
		package: #'Bloc-Text-Rope' with: [ spec requires: #(#Bloc #'Bloc-Text') ];
		package: #'Bloc-Text-Elements'
			with: [ spec requires: #(#Bloc #'Bloc-Text' #'Bloc-Text-Rope') ];
		package: #'BlocHost-Mock' with: [ spec requires: #(#Bloc #Bloc) ];
		package: #'BlocHost-Morphic' with: [ spec requires: #(#Bloc) ];
		package: #'Bloc-Tests' with: [ spec requires: #(#Bloc #'BlocHost-Mock') ];
		package: #'BlocHost-Glutin'
			with: [ spec requires: #(#Bloc 'Fenster' 'Glutin') ];
		package: #'Bloc-Compositor' with: [ spec requires: #(#Bloc 'Sparta') ];
		package: #'Bloc-Sparta'
			with: [ spec
					requires: #('Sparta' #Bloc #'Bloc-Text' #'Bloc-Text-Elements' #'Bloc-Compositor') ];
		package: #'Bloc-Exporter' with: [ spec requires: #(#Bloc #'Bloc-Sparta') ];
		package: #'Bloc-DevTool'
			with: [ spec requires: #(#Bloc #'Bloc-Layout' #'Bloc-Text-Elements' #'Bloc-Text-Rope') ];
		package: #'Bloc-Scripter'
			with: [ spec requires: #(#Bloc #'Bloc-Layout' #'Bloc-Exporter' #'BlocHost-Mock') ]
]
