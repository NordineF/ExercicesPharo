"
I'm an Exception related to Linked List Error. 
"
Class {
	#name : #LinkedListException,
	#superclass : #Error,
	#category : #LinkedList
}

{ #category : #'error signalling' }
LinkedListException class >> message [
	 ^ 'LinkedListException'
]

{ #category : #signalling }
LinkedListException class >> signal: aString argument: anObject [
	^ self new
	signal: aString;
	argument: anObject;
	yourself.
]
