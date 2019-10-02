/**
* I demonstrate a query caching anti-pattern
*/
component {

	public void function antipattern( required array arrayArg ) {

		// loop through the array in the arguments
		for( var element in arguments.arrayArg ) {

			// get each user from the database one by one
			qGetUser = queryExecute( '
				SELECT firstName, lastName 
				FROM Users
				WHERE userUid = :userUid',
				{
					userUid = element.userUid
				}
			);

			// do something with qGetUser 

		} // end looping through the array in the arguments

	}	
}