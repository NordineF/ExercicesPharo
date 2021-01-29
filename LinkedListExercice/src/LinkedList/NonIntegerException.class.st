"
I'm an Exception, that is signalled in a case when a user has given a negative integer when we want a positive one. 
"
Class {
	#name : #NonIntegerException,
	#superclass : #LinkedListException,
	#category : #LinkedList
}

{ #category : #'as yet unclassified' }
NonIntegerException class >> message [
 ^ 'Must be an Integer'
]

{ #category : #signalling }
NonIntegerException class >> signal: aString argument: anObject [
	^ self new
	signal: aString;
	argument: anObject;
	yourself.
]
