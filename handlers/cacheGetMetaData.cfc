/**
* I demonstrate statistics produced by cacheGetMetaData
*/
component {

	public function demoCacheGetMetaData( 
		required string cacheId,
		required string dataToCache,
		integer minutesToCache
	) {

		// get the cached data
		var cachedData = cacheGet( arguments.cacheId );

		// check if the data exists in the cache
		if( isNull( cachedData ) ) {

			// it doesn't, put the dataToCache into the cache 
			// as cacheId for minutesToCache
			cachePut( 
				arguments.cacheId, 
				arguments.dataToCache, 
				createTimeSpan( 0, 0, arguments.minutesToCache, 0 ) 
			);

			// get the cached data from the cache to turn up the hits
			var cachedData = cacheGet( arguments.cacheId );

		}

		// dump the cached data
		writeDump( cachedData );

		// then dump the meta data for this cacheId
		writeDump( cacheGetMetaData( arguments.cacheId ) );
	}
}