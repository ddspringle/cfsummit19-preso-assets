/**
* I demonstrate a query caching pattern
*/
component {
	public void function pattern( 
		required array arrayArg, 
		boolean clearCache = false 
	) {

		// get all the stable (non changing) users from the cache
		var qGetStableUserData = cacheGet( 'stableUserData' );

		// check if we have user data in the cache
		// or if we're forcing this function to reload the data
		if( isNull( qGetStableUserData ) || arguments.clearCache ) {

			// we don't, make a query to get all users data
			qGetStableUserData = queryExecute( '
				SELECT userUid, firstName, lastName 
				FROM Users
				WHERE isActive = :isActive',
				{
					isActive = true
				}
			);

			// remove it from the cache (not *really* needed 2016+)
			cacheRemove( 'stableUserData' );

			// put it in the cache for an hour
			cachePut( 'stableUserData', qGetStableUserData, createTimespan( 0, 1, 0, 0 ) );

		} // end checking if we have user data in the cache

		// loop through the array in the arguments
		for( var element in arguments.arrayArg ) {

			// get each user from the qGetStableUsers query
			qGetUser = queryFilter( duplicate( qGetStableUserData ), 
				function( _row ) {
					return _row.userUid is element.userUid;
				} 
			);

			// do something with qGetUser 

		} // end looping through the array in the arguments

	}

	public void function clearCache() {

		// clear the user data from the cache
		cacheRemove( 'stableUserData' );

	}

}