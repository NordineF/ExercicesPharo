Class {
        #name: #BaselineOfExercicesPharo,
        #superclass: #BaselineOf,
        #category: #BaselineOfExercicesPharo
}

{ #category : #baselines}
BaselineOfExercicesPharo >> baselineOf: [
        <baseline>
        spec
                for: #common
                do: [ spec
                            package: 'GenerateDoc';
                            package: 'LinkedListExercice';
                            package: 'GenerateDoc-Tests'
                                    with: [ spec requires: #('GenerateDoc')];
                            package: 'LinkedListExercice'
                                    with: [spec requires: #('LinkedListExerice')].
                    ]
    	spec
		        group: 'default' with: #('core' 'tests');
			    group: 'core'
				    with:
				    #('GenerateDoc' 'LinkedListExercice');
			    group: 'tests'
				    with:
				    #('GenerateDoc-Tests' 'LinedListExercice-Tests').
]
