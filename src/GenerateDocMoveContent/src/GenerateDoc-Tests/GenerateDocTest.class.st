Class {
	#name : #GenerateDocTest,
	#superclass : #TestCase,
	#category : #'GenerateDoc-Tests'
}

{ #category : #testing }
GenerateDocTest >> testCreateDocDirectoryWithArgument [
	| newDirectory docGenerate |
	
	docGenerate := GenerateDoc new. 
	newDirectory := FileLocator home.
	newDirectory := (newDirectory /'Pharo_Documentation'/  Integer name).
	"for the test delete if already exist"
	newDirectory exists ifTrue:[ newDirectory delete ].
	self assert: newDirectory exists equals: false. 
	docGenerate createDocDirectory:Integer . 
	self assert: newDirectory exists equals: true. 
	self assert: newDirectory isDirectory equals: true. 
   (newDirectory) delete.
	self assert: newDirectory exists equals: false. 
]

{ #category : #testing }
GenerateDocTest >> testCreateDocDirectoryWithoutArgument [
	| newDirectory docGenerate |
	
	docGenerate := GenerateDoc aClass: Integer. 
	newDirectory := FileLocator home.
	newDirectory := (newDirectory /'Pharo_Documentation'/ Integer name).
	"for the test delete if already exist"
	newDirectory exists ifTrue:[ newDirectory delete ].
	self assert: newDirectory exists equals: false. 
	docGenerate createDocDirectory. 
	self assert: newDirectory exists equals: true. 
	self assert: newDirectory isDirectory equals: true. 
   (newDirectory) delete.
	self assert: newDirectory exists equals: false. 
]

{ #category : #testing }
GenerateDocTest >> testCreateDocDirectoryWithoutArgumentAndNilAClass [
	| newDirectory docGenerate |
	
	docGenerate := GenerateDoc new . 
	newDirectory := FileLocator home.
	newDirectory := (newDirectory /'Pharo_Documentation'/ Integer name).
	"for the test delete if already exist"
	newDirectory exists ifTrue:[ newDirectory delete ].
	self assert: newDirectory exists equals: false. 
	self should: [ docGenerate createDocDirectory ] raise: IsNilException. 

]

{ #category : #testing }
GenerateDocTest >> testGenerateDocumentationWithArgument [
	| newFile newDirectory docGenerate fileName |
	
	docGenerate := GenerateDoc new. 
	newDirectory := FileLocator home.
	newDirectory := (newDirectory /'Pharo_Documentation'/ Integer name).
	fileName:= Integer name,'_doc.txt'.
	newFile := (newDirectory / fileName).
	"for the test delete if already exist"
	newFile exists ifTrue:[ newFile delete ].
	newDirectory exists ifTrue:[ newDirectory delete ].
	self assert: newDirectory exists equals: false. 
   docGenerate generateDocumentation: Integer.
 	self assert: newFile exists equals: true. 
	newFile delete.
	self assert: newFile exists equals: false. 

]

{ #category : #testing }
GenerateDocTest >> testGenerateDocumentationWithoutArgument [
	| newFile newDirectory docGenerate fileName |
	
	docGenerate := GenerateDoc aClass: Integer . 
	newDirectory := FileLocator home.
	newDirectory := (newDirectory /'Pharo_Documentation'/ Integer name).
	fileName:= Integer name,'_doc.txt'.
	newFile := (newDirectory / fileName).
	"for the test delete if already exist"
	newFile exists ifTrue:[ newFile delete ].
	newDirectory exists ifTrue:[ newDirectory delete ].
	self assert: newDirectory exists equals: false. 
   docGenerate generateDocumentation.
 	self assert: newFile exists equals: true. 
	newFile delete.
	self assert: newFile exists equals: false. 

]
