"
I create a file in the directory /home/{userName}/Pharo_Documentation/{ClassName}/{ClassName}_doc.txt with the className given in argument.
The result directory is ""Pharo_Documentation/{class_name}""



example:

|docForGenerateDoc|
docForGenerateDoc:= GenerateDoc new.
docForGenerateDoc generateDocumentation: GenerateDoc.

|docForLinkedListExercice|
docForLinkedListExercice:= GenerateDoc aClass: LinkedListExercice.
docForLinkedListExercice generateDocumentation.


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
