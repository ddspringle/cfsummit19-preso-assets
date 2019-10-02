/**
* I demonstrate the fast exit strategy
*/
component {

	property name="securityService" inject="models.services.SecurityService";

	public struct function update( event, rc, prc ) {

		// check if the key: fastExitUid exists in
		// the request context and isn't empty
		if( !structKeyExists( rc, 'fastExitUid' )
			|| !len( trim( rc.fastExitUid ) )
		) {
			// it doesn't, redirect back to the index view
			relocate( event = 'fastExit.index', queryString = 'msg=404a' );
		}

		// check if the key: requiredField exists in 
		// the request context and isn't empty
		if( !structKeyExists( rc, 'requiredField' )
			|| !len( trim( rc.requiredField ) )
		) {
			// it doesn't, redirect back to the index view
			relocate( event = 'fastExit.index', queryString = 'msg=404b' );
		}

		// try
		try {

			// to decrypt the fastExitUid
			rc.fastExitUid = variables.securityService.dataDec( rc.fastExitUid, 'form' );

		// catch any errors
		} catch( any e ) {

			// decryption error, redirect back to the index view
			relocate( event = 'fastExit.index', queryString = 'msg=503a' );

		}

		/* 
			we have all the required data, 
			now we can start to process it 
		*/

	}

}
