"
I'm an exception that is signalled in a case when a the aClass variable is nil and we want to use it. 
"
Class {
	#name : #IsNilException,
	#superclass : #GenerateDocException,
	#category : #GenerateDoc
}

{ #category : #accessing }
IsNilException class >> message [
	^ 'Is nil must be a class'
]
