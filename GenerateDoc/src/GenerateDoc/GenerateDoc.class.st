"
I create a directory with the name given in argument, in the directory.
The result directory is ""Pharo_Documentation/{class_name}""


I return true if the directory is created, otherwise raise an exception otherwise.
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	classInstance:		<Object>


    Implementation Points
"
Class {
	#name : #GenerateDoc,
	#superclass : #Object,
	#instVars : [
		'aClass'
	],
	#category : #GenerateDoc
}

{ #category : #accessing }
GenerateDoc class >> aClass: aClassArgument [
	^ self new 
		aClass: aClassArgument;
	yourself. 
]

{ #category : #accessing }
GenerateDoc >> aClass [
	"Getter"
	^ aClass
]

{ #category : #accessing }
GenerateDoc >> aClass: anObject [
	"Setter "
	aClass := anObject
]

{ #category : #generate }
GenerateDoc >> createDocDirectory [
"		
		Create documentation directory in the home/{userName}/Pharo_Documentation/{aClassName}
	 	with aClass the name of the class GenerateDoc variable.
	
		@throw:
		NonClassArgumentException               raise when the class variable aClass is not a Class.  		
					
		@return:
		true                                    true if the directory is created
			
" 
	| home |
	home := FileLocator home.
	aClass ifNil:[ IsNilException signal: IsNilException message argument: aClass ].
	aClass isClass ifFalse:[ NonClassArgumentException signal: NonClassArgumentException message argument: aClass ].
	(home / 'Pharo_Documentation' / aClass name) isDirectory ifFalse:[
		(home / 'Pharo_Documentation' / aClass name) ensureCreateDirectory.
		(home / 'Pharo_Documentation' / aClass name) isDirectory ifFalse:[
		CannotCreateDirectoryException signal: CannotCreateDirectoryException message argument: (home/'Pharo_Documentation' / aClass name).
		].
		^ true. 
	]ifTrue:[
		^ true. 
	]
]

{ #category : #generate }
GenerateDoc >> createDocDirectory: className [
"		
		Create documentation directory in the home/{userName}/Pharo_Documentation/{className}/
	 	with className the given parameter .
	
		@throw:
		NonClassArgumentException               raise when the argument className is not a Class.  		
					
		@return:
		true                                    true if the directory is created
" 
	| home |
	home := FileLocator home.
	className ifNil:[ IsNilException signal: IsNilException message argument: className ].
	className isClass ifFalse:[ NonClassArgumentException  signal: NonClassArgumentException  message argument: className ].
	(home / 'Pharo_Documentation' / className name) isDirectory ifFalse:[
		(home / 'Pharo_Documentation' / className name) ensureCreateDirectory.
		(home / 'Pharo_Documentation' / className name) isDirectory ifFalse:[
		CannotCreateDirectoryException signal: CannotCreateDirectoryException message argument: (home / 'Pharo_Documentation' / className name).
		].
		^ true. 
	]ifTrue:[
		^ true.
	]
]

{ #category : #generate }
GenerateDoc >> generateDocumentation [
"		
		Generate documentation in a file for a given class		
		The file name is under the following format: /home/{userName}/Pharo_Documentation/{aClassArgumentName}_doc.txt
		
		@throw: 
		CannotCreateFileException                              when we cannot create a file. 
		
		@param:
		aClassArgument                                         The class from which we want a documentation file.  				
						
		@return:
		None
"
	| home fileName stream arrayOfSelectors curSelector | 
	self createDocDirectory: aClass.
	home:= FileLocator home. 
	fileName:= aClass name,'_doc.txt'.
	stream:= (home / 'Pharo_Documentation' / aClass name /fileName) writeStream.
	(home / 'Pharo_Documentation' / aClass name /fileName) exists ifFalse:[ CannotCreateFileException signal: CannotCreateFileException argument: fileName ].
	stream nextPutAll: aClass name; cr. 
	arrayOfSelectors := aClass selectors.
	arrayOfSelectors do:[ :each | curSelector:= each asSymbol. 
		 stream nextPutAll: each asString; cr .
		 stream nextPutAll:(aClass>>curSelector) comment asString; cr;cr. 
	]. 
	stream close.
	
	
]

{ #category : #generate }
GenerateDoc >> generateDocumentation: aClassArgument [
"		
		Generate documentation in a file for a given class		
		The file name is under the following format: /home/{userName}/Pharo_Documentation/{aClassArgumentName}_doc.txt
		
		@throw: 
		CannotCreateFileException                              when we cannot create a file. 
		
		@param:
		aClassArgument                                         The class from which we want a documentation file.  				
						
		@return:
		None
"
	| home fileName stream arrayOfSelectors curSelector | 
	self createDocDirectory: aClassArgument.
	home:= FileLocator home. 
	fileName:= aClassArgument name,'_doc.txt'.
	stream:= (home / 'Pharo_Documentation' / aClassArgument name /fileName) writeStream.
	(home / 'Pharo_Documentation' / aClassArgument name /fileName) exists ifFalse:[ CannotCreateFileException signal: CannotCreateFileException argument: fileName ].
	stream nextPutAll: aClassArgument name; cr. 
	arrayOfSelectors := aClassArgument selectors.
	arrayOfSelectors do:[ :each | curSelector:= each asSymbol. 
		 stream nextPutAll: each asString; cr .
		 stream nextPutAll:(aClassArgument>>curSelector) comment asString; cr;cr. 
	]. 
	stream close.
	
	
]
