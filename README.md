# Exercices Pharo

### Linked List:
Implémentation de la structure de donnée liste chaînée.

Voici les méthodes implantées:
  - initialize         : initialise la liste chaînée.
  - insert:            : permet d'insérer un élément prend en paramètre une valeur
  - isEmpty            : permet de savoir si la liste chaînée est vide.
  - printOn            : améliore l'affichage par défaut dans le playground.
  - getIemeElement:    : permet de récupérer le ieme élément d'une liste chaînée
  - removeLast         : supprime le dernier élément d'une liste chaînée.
  - removeIemeElement: : permet de supprimer le ieme élément d'une liste chaînée.
  - size               : permet de récupérer la taille de la liste.
  - head               : permet de récupérer le premier élément de la liste.
  - head:              : permet de modifier la tête de liste.

Les tests se trouvent dans LinkedListExercice-Test.

Représentation d'une liste chaînée à 2 éléments:

| Node 1 |  ---------> | Node 2 |---------> Nil

exemple:

```smalltalk
|newLinkedList node |
newLinkedList := LinkedListExercice new.
newLinkedList size. "-> 0"
newLinkedList insert:1.
newLinkedList size. "-> 1"
newLinkedList insert: 2.
newLinkedList insert: 3.
newLinkedList insert: 4.
newLinkedList insert: 5.
newLinkedList insert: 6.
newLinkedList insert: 7.
newLinkedList size. "-> 7"
node := newLinkedList getIemeElement: 6.
node data. "-> 6"
node := newLinkedList removeIemeElement: 6.
newLinkedList size. "-> 6"
node := newLinkedList getIemeElement: 6.
node data. "-> 7"
```


### GenerateDoc:

Implémentation d'un générateur de fichier contenant la documentation d'une classe.
Prend une classe et génère un fichier contenant sa documentation.

Méthode de la classe GenerateDoc:
- aClass                  ->  permet d'avoir la classe
- aClass:                 ->  permet de modifier la variable de classe aClass
- createDocDirectory      ->  permet de créer un répertoire /Pharo_Documentation/{className}/
- createDocDirectory:     ->  permet de créer un répertoire /Pharo_Documentation/{className}/ en lui passant une classe en paramètre.
- generateDocumentation   -> permet de générer la documentation de la classe aClass dans le fichier  /Pharo_Documentation/{aClassName}/{aClassName}_doc.txt
- generateDocumentation:  -> permet de générer la documentation de la classe en paramètre dans le fichier  /Pharo_Documentation/{aClassName}/{aClassName}_doc.txt

Les tests sont dans GenerateDoc-Test.

exemple:
```SmallTalk
|docForGenerateDoc|
docForGenerateDoc:= GenerateDoc new.
docForGenerateDoc generateDocumentation: GenerateDoc.

|docForLinkedListExercice|
docForLinkedListExercice:= GenerateDoc aClass: LinkedListExercice.
docForLinkedListExercice generateDocumentation.
```
