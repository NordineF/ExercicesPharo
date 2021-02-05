"
I'm an exception that is signalled in a case when a user tried to access an element in an index out of bound. 
"
Class {
	#name : #IndexOutOfBoundsException,
	#superclass : #LinkedListException,
	#category : #LinkedList
}

{ #category : #'as yet unclassified' }
IndexOutOfBoundsException class >> message [
	^ 'IndexOutOfBoundS'
]
