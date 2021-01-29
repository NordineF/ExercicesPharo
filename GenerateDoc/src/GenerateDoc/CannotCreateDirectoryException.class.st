"
I'm an exception that is signalled in a case when we cannot create a directory. 
"
Class {
	#name : #CannotCreateDirectoryException,
	#superclass : #GenerateDocException,
	#category : #GenerateDoc
}

{ #category : #accessing }
CannotCreateDirectoryException class >> message [
 ^ 'Cannot create a directory.'
]
