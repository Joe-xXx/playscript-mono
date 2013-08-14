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
	import testdynfinalClassWithStringParamCons.*;
	
	public class dynfinClassWithStrParamConsTest extends BaseTest {
		public static function Main():int {
			var SECTION:* = "Definitions";           // provide a document reference (ie, ECMA section)
			var VERSION:* = "AS3";                   // Version of JavaScript or ECMA
			var TITLE:*   = "Constructors with parameters of a Dynamic class";  // Provide ECMA section                                                                   //title or a description
			var BUGNUMBER:* = "";
			
			startTest();                // leave this alone
			
			
			var x:* = "test"; 
			var y:Boolean = true;
			var myArray:Array = new Array(4,6,5);
			
			/*public class publicClassCons{
			
			      private var x:Number=4;
			      private var y:Number=5;
			
			
			      public function publicClassCons(){
			      }
			
			      public function Add(){
			             private var z:* = x+y;
			             return z;
			
			                           
			      }
			}*/
			import testdynfinalClassWithStringParamCons.publicClassCons;
			var pbClCons:publicClassCons = new publicClassCons();
			
			var MyDefaultClass:DefaultClass;               
			var dynWithStrParamCons:*=new dynfinClassWithStrParamCons(x,y,myArray,pbClCons,MyDefaultClass);
			//print (dynWithStrParamCons.myString());
			//print(x);
			//print (dynWithStrParamCons.myBoolean());
			//print(y);
			//print (dynWithStrParamCons.myarray());
			//print (myArray);
			//print(dynWithStrParamCons.myAdd());
			
			AddTestCase("calling public Instance method","test",dynWithStrParamCons.myString());
			AddTestCase("calling public Instance method", true,dynWithStrParamCons.myBoolean());
			
			AddTestCase("Array", myArray,dynWithStrParamCons.myarray());
			AddTestCase("Calling public Instance method Add",9,dynWithStrParamCons.myAdd());
			
			
			
			
			test();       // leave this alone.  this executes the test cases and
			              // displays results.
			return results();
		}
	}
}
