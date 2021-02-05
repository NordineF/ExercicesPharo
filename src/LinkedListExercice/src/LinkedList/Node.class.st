"
I representent a Node in a LinkedList.
By default i'm initialized with the data equal to 0. 


example:

|newNode|
newNode := Node new. 
newNode data. -> 0. 

newNode := Node data:5. 
newNoda data. -> 5 . 
"
Class {
	#name : #Node,
	#superclass : #Object,
	#instVars : [
		'data',
		'next'
	],
	#category : #LinkedList
}

{ #category : #'as yet unclassified' }
Node class >> data: aData [ 
	"Create a new Node with field and Node parameters"
	^ self new 
	data: aData;
	yourself
]

{ #category : #accessing }
Node >> data [
"Getter for field data"
	^ data
]

{ #category : #accessing }
Node >> data: aData [
"Setter for field data value"
	data := aData
]

{ #category : #accessing }
Node >> initialize [
	"Initialize"
	 super initialize.
	 data:=0.
]

{ #category : #converting }
Node >> isNode [
	^ true
]

{ #category : #accessing }
Node >> next [
"Getter for field next"
	^ next
]

{ #category : #accessing }
Node >> next: aNode [
"Setter for field next"
	next := aNode
]

{ #category : #printing }
Node >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' with value: ', data printString.
	aStream cr. 
]
