"
I'm an exception that is signalled in a case when a user has given a negative integer when we want a positive one. 
"
Class {
	#name : #IsNegativeException,
	#superclass : #LinkedListException,
	#category : #LinkedList
}

{ #category : #'as yet unclassified' }
IsNegativeException class >> message [ 
 ^ 'Must be a non negative number'
]

{ #category : #signalling }
IsNegativeException class >> signal: aString argument: anObject [
	^ self new
	signal: aString;
	argument: anObject;
	yourself.
]
