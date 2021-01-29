Class {
	#name : #LinkedListExerciceTest,
	#superclass : #TestCase,
	#category : #'LinkedList-Tests'
}

{ #category : #tests }
LinkedListExerciceTest >> testGetIemeElement [
	
	| linkedList element |
	linkedList := LinkedListExercice new. 
	self should:  [ linkedList getIemeElement: 3 ] raise: EmptyException.
	linkedList insert: 2.
	linkedList insert: 10.
	element:= linkedList getIemeElement: 2.
	self assert: element data equals: 10. 
	element:= linkedList getIemeElement: 1.
	self assert: element data equals: 2.
	self should:  [ linkedList getIemeElement: 3 ] raise: IndexOutOfBoundsException.
	self should:  [ linkedList getIemeElement: #a ] raise: NonIntegerException.
	self should:  [ linkedList getIemeElement: -2 ] raise: IsNegativeException.
	
]

{ #category : #tests }
LinkedListExerciceTest >> testInitialize [
	| linkedList |
	linkedList := LinkedListExercice new. 
	self assert: linkedList size equals: 0.
	self assert: linkedList head isNil. 
]

{ #category : #tests }
LinkedListExerciceTest >> testInsert [ 
	
	| linkedList |
	linkedList := LinkedListExercice new. 
	linkedList insert: 2. 
	self assert: linkedList head data equals: 2. 
	self assert: linkedList size equals: 1. 
	
]

{ #category : #tests }
LinkedListExerciceTest >> testInsertAfterHead [ 
	| linkedList |
	linkedList := LinkedListExercice new. 
	linkedList insert: 2.
	linkedList insert: 10. 
	self assert: linkedList head next data equals: 10. 
	self assert: linkedList size equals: 2. 
]

{ #category : #tests }
LinkedListExerciceTest >> testIsEmpty [
	
	| linkedList |
	linkedList := LinkedListExercice new. 
	self assert: linkedList isEmpty equals:true. 	
	linkedList insert: 2. 
	self assert: linkedList isEmpty equals: false.

]

{ #category : #tests }
LinkedListExerciceTest >> testRemoveIemeElement [
	
	| linkedList deletedNode newOrder |
	linkedList := LinkedListExercice new. 
	self should:  [ linkedList getIemeElement: 3 ] raise: EmptyException.
	linkedList insert:1. 
	linkedList insert:2. 
	linkedList insert:3. 
	linkedList insert:4. 
	linkedList insert:5. 
	linkedList insert:6. 
	linkedList insert:7. 
	linkedList insert:8. 
	linkedList insert:9. 
	linkedList insert:10.  
	linkedList insert:11.  
	self assert: linkedList size equals:11. 
	deletedNode := linkedList removeIemeElement:6.
	self assert: deletedNode data equals: 6.
	self assert: linkedList size equals: 10. 
	self assert: deletedNode next equals:nil. 
	"check if the new link is good"
	newOrder:= linkedList getIemeElement: 6. 
	self assert: newOrder data equals:7. 
	self should: [ linkedList removeIemeElement: 11 ] raise: IndexOutOfBoundsException.
	self should: [ linkedList removeIemeElement: -1 ] raise: IsNegativeException.
	self should: [ linkedList removeIemeElement: #a ] raise: NonIntegerException.
]

{ #category : #tests }
LinkedListExerciceTest >> testRemoveLast [

	| linkedList nodeBeforeDelete nodeDeleted newLastNode |
	linkedList := LinkedListExercice new. 
	linkedList insert: 1. 
	linkedList insert: 2.
	linkedList insert: 3.
	linkedList insert: 4.
	linkedList insert: 5.
	linkedList insert: 6.
	nodeBeforeDelete:= linkedList getIemeElement: 6. 
	self assert: linkedList size equals: 6. 
	nodeDeleted:= linkedList removeLast.
	self assert: nodeBeforeDelete equals: nodeDeleted.
	newLastNode := linkedList getIemeElement: 5.
	self assert: newLastNode next equals:nil.
	self assert: linkedList size equals:5. 
	
]

{ #category : #tests }
LinkedListExerciceTest >> testRemoveLastWhenOneElement [
	
	| linkedList nodeBeforeDelete nodeDeleted |
	linkedList := LinkedListExercice new. 
	linkedList insert: 2. 
	nodeBeforeDelete:= linkedList getIemeElement: 1. 
	self assert: linkedList isEmpty equals: false.
	nodeDeleted:= linkedList removeLast.
	self assert: nodeBeforeDelete equals: nodeDeleted.
	self assert: linkedList head equals: nil.
	self assert: linkedList isEmpty equals:true. 
	
]
