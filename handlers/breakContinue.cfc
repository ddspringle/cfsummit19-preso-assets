/**
* I demonstrate break and continue strategies
*/
component {

	public struct function forBreak( 
		required array arrToCheck, 
		required string requiredValue 
	) {

		// set a flag to hold the result
		var isFound = false;

		// loop through the passed in array
		for( var item in arrToCheck ) {
			// check if this array item 
			// matches the required value
			if( findNoCase( item, arguments.requiredValue ) ) {
				// it does, set the flag to true
				isFound = true;
				// and break out of this for loop
				// because we have our answer
				break;
			}

		}

		/* 
			do something with isFound 
			being true or false
		*/

	}

	public struct function switchBreak( 
		required string condition 
	) {

		switch( arguments.condition ) {

			case 'a':
				// do something for case a
				doSomethingA();
			// and break out of the switch
			break;

			case 'b':
			case 'c':
				// do something for case b or c
				doSomethingBC();
			// and break out of the switch
			break;

			case 'x':
				// do something for case x
				doSomethingX();
			// and break out of the switch
			break;

			default:
				// do something in the default case
				doSomethingZed();
			// break is technically optional here, but
			// it aids code readability
			break;

		}

	}

	public function continueDemo(
		required array arrOfObjects
	) {

		// loop through the arrOfObjects
		for( var thisObj in arguments.arrOfObjects ) {

			// check if this object has a valid id
			if( !len( thisObj.getObjectId() ) ) {
				// invalid id, cannot process this object
				// continue to next object in arrOfObjects
				continue;
			}

		}

	}
}