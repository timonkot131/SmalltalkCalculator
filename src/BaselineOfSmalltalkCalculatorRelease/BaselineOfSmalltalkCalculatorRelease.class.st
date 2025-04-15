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
				with: [ spec repository: 'github://feenkcom/Brick/src' ].

			spec package: 'SmalltalkCalculator' ]
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

{ #category : #'as yet unclassified' }
BaselineOfSmalltalkCalculatorRelease >> loadBrick: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc:main/src' ];
			baseline: 'Futures' with: [
				spec repository: 'github://feenkcom/pharo-futures:main/src' ];
			baseline: 'BlocExamples' with: [
				spec repository: 'github://feenkcom/Bloc:main/src' ];
			baseline: 'BlocPac' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacExamples' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'GToolkitResourcesUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:main/src' ].
		spec 
			package: #'Brick-Core' with: [
				spec requires: #('Bloc' 'BlocPac' ). ];
			package: #'Brick-Editor' with: [
				spec requires: #(#'Brick-Core' ). ];
			package: #'Brick-Editor-Extensions' with: [
				spec requires: #(#'Brick-Editor' ). ];
			package: #'Brick' with: [
				spec requires: #(#'Brick-Core' #'Brick-Editor' 'Futures'). ];
			package: #'Brick-List' with: [
				spec requires: #(#'Brick'). ];
			package: #'Brick-List-Ungrouped' with: [
				spec requires: #(#'Brick' 'Brick-List'). ];
			package: #'Brick-List-Grouped' with: [
				spec requires: #(#'Brick' 'Brick-List'). ];
			package: #'Brick-Theme' with: [
				spec requires: #(#Brick ). ];
			package: #'Brick-Glamorous' with: [
				spec requires: #(#Brick 'GToolkitResourcesUtility' ). ];
			package: #'Brick-Material' with: [
				spec requires: #(#Brick ). ];
			package: #'Brick-Hydra' with: [
				spec requires: #(#Brick ). ];
			package: #'Brick-DevTool' with: [
				spec requires: #(#Brick 'Bloc' 'BlocPac' ). ];
			package: #'Brick-Examples' with: [
				spec requires: #('BlocExamples' #Brick #'Brick-Glamorous' #'Brick-Material' #'Brick-Hydra' #'Brick-DevTool' ). ];
			package: #'Brick-Theme-Examples' with: [
				spec requires: #(#'Brick-Theme' ). ];
			package: #'Brick-Theme-Migration' with: [
				spec requires: #(#'Brick-Theme' ). ];
			package: #'Brick-Editor-Examples' with: [
				spec requires: #(#Brick #'Brick-Editor' ). ]. ].

]
