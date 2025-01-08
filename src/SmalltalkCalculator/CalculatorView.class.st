Class {
	#name : #CalculatorView,
	#superclass : #BlElement,
	#category : #SmalltalkCalculator
}

{ #category : #'as yet unclassified' }
CalculatorView >> grid [ 
|buttons|
buttons := (1 to: 9)
		collect: [ :i | 
			BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude new;
				matchParent;
				action: [self viewModel sendNum: i];
				label: i asString;
				beHugeSize ].
				
				^BlElement new
		layout: (BlGridLayout new columnCount: 3);
		width: 170;
		constraintsDo: [ :c | c vertical fitContent ];
		addChildren: buttons;
		yourself.
]

{ #category : #'as yet unclassified' }
CalculatorView >> grid: aBlock [
|buttons|
buttons := (1 to: 9)
		collect: [ :i | 
			BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude new;
				matchParent;
				action: aBlock i;
				label: i asString;
				beHugeSize ].
				
				^BlElement new
		layout: (BlGridLayout new columnCount: 3);
		width: 170;
		constraintsDo: [ :c | c vertical fitContent ];
		addChildren: buttons.
]

{ #category : #initialization }
CalculatorView >> initialize [
	| grid screen |
	super initialize.
	self 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c vertical fitContent.
			c horizontal fitContent.
		];
		viewModel: (CalcViewModel withModel: Calculator new).
	screen := self screen.
	grid := self grid: [ :i | self viewModel sendNum: i ].
	self viewModel when: NumberChanged do: [ :changed | 
		screen text: changed numAsString.
	]
]

{ #category : #accessing }
CalculatorView >> screen [
	^BlTextElement new
			text: 0 asRopedText;
			geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
			padding: (BlInsets all: 14);
			border: (BlBorder paint: Color veryVeryLightGray width: 1);
			constraintsDo: [ :c | c horizontal matchParent ];
			yourself
]
