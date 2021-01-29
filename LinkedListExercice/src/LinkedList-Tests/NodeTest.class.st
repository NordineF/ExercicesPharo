Class {
	#name : #NodeTest,
	#superclass : #TestCase,
	#category : #'LinkedList-Tests'
}

{ #category : #tests }
NodeTest >> testInitialize [ 
	
	| c | 
	c:= Node new.
	self assert: c data equals: 0.
]

{ #category : #tests }
NodeTest >> testInitializeWithData [
	
	| c | 
	c:= Node data: 15.
	self assert: c data equals: 15.
]
