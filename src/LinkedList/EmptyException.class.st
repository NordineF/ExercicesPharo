"
I'm an exception that is signalled in a case when a user tried to access or modify an element present in LinkedList. 
"
Class {
	#name : #EmptyException,
	#superclass : #LinkedListException,
	#category : #LinkedList
}

{ #category : #'as yet unclassified' }
EmptyException class >> message [
  ^ 'LinkedList is empty'
]
