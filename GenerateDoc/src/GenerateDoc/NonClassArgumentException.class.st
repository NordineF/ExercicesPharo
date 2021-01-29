"
I'm an exception that is signalled in a case when a user has given a non Class argument. 
"
Class {
	#name : #NonClassArgumentException,
	#superclass : #GenerateDocException,
	#category : #GenerateDoc
}

{ #category : #accessing }
NonClassArgumentException class >> message [
	^ 'Must be a Class'
]
