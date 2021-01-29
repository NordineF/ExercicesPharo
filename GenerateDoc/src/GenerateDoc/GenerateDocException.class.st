"
GenerateDocException use as a super class for CannotCreateDirectoryException, CannotCreateFileException, IsNilException, NonClassArgumentException.

with two class method:
signal:argument: and message. 
"
Class {
	#name : #GenerateDocException,
	#superclass : #Error,
	#category : #GenerateDoc
}

{ #category : #accessing }
GenerateDocException class >> message [
	^ 'GenerateDocException'
]

{ #category : #signalling }
GenerateDocException class >> signal: aString argument: anObject [
	^ self new
	signal: aString;
	argument: anObject;
	yourself.
]
