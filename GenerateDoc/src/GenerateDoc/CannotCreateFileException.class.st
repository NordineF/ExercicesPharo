"
I'm an exception that is signalled in a case when we cannot create a file. 
"
Class {
	#name : #CannotCreateFileException,
	#superclass : #GenerateDocException,
	#category : #GenerateDoc
}

{ #category : #accessing }
CannotCreateFileException class >> message [ 
	^ 'Cannot create a file'.
]
