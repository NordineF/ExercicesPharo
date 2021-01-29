"
I'm an exception that is signalled in a case when we cannot create a file. 
"
Class {
	#name : #AClassInstanceIsNilException,
	#superclass : #GenerateDocException,
	#category : #GenerateDoc
}

{ #category : #accessing }
AClassInstanceIsNilException class >> message [
	^ 'aClass is nil cannot create directory Pharo_Documentation/{aClass}/'
]
