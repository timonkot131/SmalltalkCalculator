Class {
	#name : #CalculatorView,
	#superclass : #BlElement,
	#category : #SmalltalkCalculator
}

{ #category : #initialization }
CalculatorView class >> asElement [ 
	^self new
]

{ #category : #'as yet unclassified' }
CalculatorView >> bottomLayout [
	^ BlElement new
		layout: (BlGridLayout new columnCount: 5);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		addChildren: {BrButton new
					aptitude: BrGlamorousButtonWithLabelAptitude new;
					matchParent;
					id: #zero;
					label: '0';
					beHugeSize;
					constraintsDo: [ :c | c grid horizontal span: 2 ].
				BrButton new
					aptitude: BrGlamorousButtonWithLabelAptitude new;
					id: #dot;
					matchParent;
					label: ' . ';
					beHugeSize.
				BrButton new
					aptitude: BrGlamorousButtonWithLabelAptitude new;
					matchParent;
					id: #equals;
					label: '=';
					beHugeSize;
					constraintsDo: [ :c | c grid horizontal span: 2 ]}
]

{ #category : #initialization }
CalculatorView >> equal: aBlock [
	^ BrButton new
		aptitude: BrGlamorousButtonWithLabelAptitude new;
		action: aBlock;
		label: '=';
		beHugeSize;
		constraintsDo: [ :c | c horizontal matchParent ]
]

{ #category : #'as yet unclassified' }
CalculatorView >> grid: aBlock [
	| buttons botButtons |
	buttons := (1 to: 9)
			collect: [ :i | 
				BrButton new
					aptitude: BrGlamorousButtonWithLabelAptitude new;
					matchParent;
					action: [ aBlock value: i ];
					label: i asString;
					beHugeSize ].
	botButtons := {BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude new;
				matchParent;
				id: #zero;
				label: '0';
				beHugeSize;
				constraintsDo: [ :c | c grid horizontal span: 2 ].
			BrButton new
				aptitude: BrGlamorousButtonWithLabelAptitude new;
				id: #dot;
				matchParent;
				label: '.';
				beHugeSize}.

	^ BlElement new
		layout: (BlGridLayout new columnCount: 3);
		width: 120;
		constraintsDo: [ :c | c vertical fitContent ];
		addChildren: (buttons, botButtons)
]

{ #category : #initialization }
CalculatorView >> initialize [
	| screen textElem  midLayout |
	super initialize.
	self mainLayout viewModel: (CalcViewModel withModel: Calculator new).
	screen := self screen.

	midLayout := self midLayout: [ :i | self viewModel sendNum: i ].
	textElem := screen childNamed: #text.
	self
		addChildren: {screen.
				midLayout.
				}.
	self viewModel
		when: NumberChanged
		do: [ :c | textElem text: c numAsString asRopedText ].
	self
		action: #sendClear for: #clear;
		action: #sendPlus for: #plus;
		action: #sendZero for: #zero;
		action: #sendBack for: #back;
		action: #sendMinus for: #minus;
		action: #sendMul for: #mul;
		action: #sendEquals for: #equals;
		action: #sendDot for: #dot;
		action: #sendDiv for: #div.
]

{ #category : #initialization }
CalculatorView >> mainLayout [
	self
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ]
]

{ #category : #acccessing }
CalculatorView >> midLayout: aBlock [
	"aBlock is a click listener to num buttons"
	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		addChildren: {self grid: aBlock. self opGrid}.
]

{ #category : #acccessing }
CalculatorView >> opGrid [
	| dic eqElem opElems |
	dic := {#clear -> 'C'.
			#back -> '<'.
			#plus -> '+'.
			#minus -> '-'.
			#mul -> 'X'.
			#div -> '/'}.
	eqElem := {BrButton new
			aptitude: BrGlamorousButtonWithLabelAptitude new;
			matchParent;
			id: #equals;
			label: '=';
			beHugeSize;
			constraintsDo: [ :c | c grid horizontal span: 2 ]}.
	opElems := dic
			collect: [ :each | 
				BrButton new
					aptitude: BrGlamorousButtonWithLabelAptitude new;
					beHugeSize;
					id: each key;
					label: each value;
					constraintsDo: [ :c | c horizontal matchParent ] ].
	^ BlElement new
		layout: (BlGridLayout new columnCount: 2);
		width: 65;
		constraintsDo: [ :c | c vertical fitContent ];
		addChildren: (opElems, eqElem).
]

{ #category : #accessing }
CalculatorView >> screen [
	| text |
	text := BlTextElement new
			text: 0 asRopedText;
			constraintsDo: [ :c | c frame horizontal alignRight ];
			id: #text.
	^ BlElement new
		id: #frame;
		layout: BlFrameLayout new;
		height: 40;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		padding: (BlInsets all: 14);
		constraintsDo: [ :c | c horizontal matchParent ];
		border: (BlBorder paint: Color veryVeryLightGray width: 1);
		addChild: text
]
