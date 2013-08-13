/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is [Open Source Virtual Machine.].
 *
 * The Initial Developer of the Original Code is
 * Adobe System Incorporated.
 * Portions created by the Initial Developer are Copyright (C) 2005-2006
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Adobe AS3 Team
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */


package {
	import MultipleCatchBlocksWithTwoType.*;
	
	public class MultipleCatchBlocksWithTwoTypeTest extends BaseTest {
		public static function Main():int {
			var SECTION = "Definitions";           // provide a document reference (ie, ECMA section)
			var VERSION = "AS3";                   // Version of JavaScript or ECMA
			var TITLE   = "Testing try block with multiple catch blocks and using a catch block with parameter of type TypeError to catch the type error";  // Provide ECMA section title or a description
			var BUGNUMBER = "";
			
			startTest();                // leave this alone
			
			
			var z = new TypeErrors();
			thisError = "no error";
			thisError1 = "no error";
			try{
			   z.MyArgumentError(6);
			   }catch(e:ReferenceError){
			         thisError=e.toString();
			   }catch(e1:TypeError){
			         thisError=e1.toString();
			   }catch(e2:ArgumentError){
			         thisError=e2.toString();
			   }catch(e3:URIError){
			         thisError=e3.toString()
			   }catch(e4:UninitializedError){
			         thisError=e4.toString();
			   }catch(e5:EvalError){
			         thisError=e5.toString();
			   }catch(e6:RangeError){
			         thisError=e6.toString();
			   }catch(e7:DefinitionError){
			       thisError="This is Definition Error";
			   }catch(e8:SyntaxError){
			         thisError="This is Syntax Error";
			   }catch(e9:VerifyError){
			         thisError="This is Verify Error";
			   }catch(e10:Error){//print(e10.toString());
			         thisError1=e10.toString();
			   }finally{//print(thisError1);
			         AddTestCase( "Testing catch block with Type Error", "TypeError: Error #1009" ,typeError(thisError)+""  );
			         AddTestCase( "Testing catch block with Type Error", "no error" ,typeError(thisError1)+""  );
			    }
			
			
			
			
			test();       // leave this alone.  this executes the test cases and
			              // displays results.
			return results();
		}
	}
}
