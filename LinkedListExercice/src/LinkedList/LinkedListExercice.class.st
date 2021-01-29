"
I'm a Linked List, a linear collection of data elements whose order is not given by their physical placement in memory.
I'm initialized with a size equal to 0. 


Representation LinkedLst size = 2 :

 --------               --------           
| Node 1 |  ---------> | Node 2 |---------> Nil
 --------               --------           


example:
|newLinkedList node |
newLinkedList := LinkedListExercice new. 
newLinkedList size. ""-> 0""
newLinkedList insert:1. 
newLinkedList size. ""-> 1""
newLinkedList insert: 2. 
newLinkedList insert: 3. 
newLinkedList insert: 4. 
newLinkedList insert: 5. 
newLinkedList insert: 6. 
newLinkedList insert: 7.
newLinkedList size. ""-> 7""
node := newLinkedList getIemeElement: 6.
node data. ""-> 6""
node := newLinkedList removeIemeElement: 6.
newLinkedList size. ""-> 6""
node := newLinkedList getIemeElement: 6.
node data. ""-> 7""

"
Class {
	#name : #LinkedListExercice,
	#superclass : #Object,
	#instVars : [
		'head',
		'size'
	],
	#category : #LinkedList
}

{ #category : #accessing }
LinkedListExercice >> getIemeElement: anInteger [
"		Give us the anInteger eme element present 
	 	in the LinkedList
	  
		@param:
		anInteger                          the position of the ieme element.
							
		@throws:
		EmptyException                     if the LinkedList is empty. 
		IsNegativeException                if anInteger is negative or equal to 0
		NonIntingerException               if anInteger is not an integer. 
		IndexOutOfBoundsException          can be raise by getIemeElement self function. 
		
		@return:
		iemeNode                           the Node present at the anInteger position in the LinkedList
"
	| iemeNode ieme |
	anInteger isInteger ifFalse:[ NonIntegerException signal: NonIntegerException message argument: anInteger ].
	anInteger >= 0 ifFalse:[  IsNegativeException  signal: IsNegativeException message argument: anInteger ]. 
	self isEmpty ifTrue:[ EmptyException  signal: EmptyException message  argument: size ].
	"  -2 for the to: do: in the ifTrue"
	ieme:= anInteger - 2.
	iemeNode := head. 
	anInteger <= size ifTrue: [ 
		" If user give 0 then ieme:= -2 but we have assigned head to iemeNode so if the user enter 0 or 1 we give him the head data"
		0 to: ieme do:[  :x | iemeNode:= iemeNode next ].
		^ iemeNode. 
	] ifFalse: [ IndexOutOfBoundsException  signal: IndexOutOfBoundsException message  argument: anInteger ] 
]

{ #category : #accessing }
LinkedListExercice >> head [
"		Getter
"
	^ head
]

{ #category : #accessing }
LinkedListExercice >> head: anObject [
"		Setter
"
	^ head := anObject
]

{ #category : #initialization }
LinkedListExercice >> initialize [ 
"		Initialize LinkedList with a size equal to 0
"
	super initialize.
 	size := 0. 
	
]

{ #category : #adding }
LinkedListExercice >> insert: aData [ 
"		insert an element at the end of LinkedList
		also increment the size by 1. 
		
		@param:
		aData                              the data we assign to the new Node. 
"
	| newNode curNode last |
	newNode := Node data: aData. 
	head ifNotNil: [ 
		curNode := head. 
		[ curNode isNotNil ] whileTrue: [ 
			last:= curNode. curNode := curNode next 
		]. 
		last next: newNode.  
	].
	head  ifNil: [  head:= newNode ].
	size := size +1 . 
	

]

{ #category : #testing }
LinkedListExercice >> isEmpty [ 
"		Allows us to know the if Linked List is empty
		
		@return:
		boolean                            true if the linked list is empty, false otherwise
"
	^ size = 0.
]

{ #category : #printing }
LinkedListExercice >> printOn: aStream [
"		enhance the print display on playground
"
	super printOn: aStream.
	aStream nextPutAll: ' with length: ',  size printString.
	aStream cr.

]

{ #category : #removing }
LinkedListExercice >> removeIemeElement: anInteger [
"		Remove the ieme Element in LinkedList
	  	and return the deleted element 
		
		@param:
		anInteger                          the index 
		
		@throw:
		EmptyException                     if the LinkedList is empty. 
		IsNegativeException                if anInteger is negative or equal to 0
		NonIntingerException               if anInteger is not an integer. 
		IndexOutOfBoundsException          can be raise by getIemeElement self function. 
			
		@return:
		deletedElement                     the deleted Node. 	
"
	| deletedElement newLast ieme |
	anInteger isInteger ifFalse:[ NonIntegerException signal: NonIntegerException message argument: anInteger ].
	anInteger > 0 ifFalse:[  IsNegativeException  signal: IsNegativeException message argument: anInteger ]. 
	self isEmpty ifTrue:[ EmptyException  signal: EmptyException message  argument: size ].
	anInteger =  1 ifTrue:[
		deletedElement := head. 
		head:=head next. 
		size:= size -1.
		^ deletedElement.
	].
	ieme:= anInteger -1.
	newLast := self getIemeElement:ieme.
	deletedElement 	:= self getIemeElement: anInteger.
	newLast next: deletedElement next.
	deletedElement  next: nil.
	size:= size -1.
	^ deletedElement.
	
]

{ #category : #removing }
LinkedListExercice >> removeLast [ 
"	 	Remove the ieme Element in LinkedList
	  	and return the deleted element 
		
		@throw:
		EmptyException                     if the LinkedList is empty. 
					
		@return:
		deletedElement                     the deleted Node. 	
"
	| deletedElement newLast |
	self isEmpty ifTrue:[ EmptyException signal: EmptyException message argument: size ].
	size = 1 ifTrue:[ 
		deletedElement:= head. 
		head:= nil. 
		size:= size -1.
		 ^ deletedElement ]
	ifFalse:[
		deletedElement:= self getIemeElement: size.
		newLast :=  self getIemeElement: size-1. 
		newLast next: nil.
		size:= size-1.
		^ deletedElement. 
	].

	
	
]

{ #category : #accessing }
LinkedListExercice >> size [
"		Getter
"
	^ size
]
