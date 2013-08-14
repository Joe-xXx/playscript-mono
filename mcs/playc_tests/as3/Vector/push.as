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
 * Portions created by the Initial Developer are Copyright (C) 2007-2008
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
/**
   File Name:    push.es
   Description:  push(object,...items)
     push method adds elements to the end of the vector and increases the length of the vector
   *
   */
package {
	public class pushTest extends BaseTest {
		public static function Main():int {
			var SECTION:*="";
			var VERSION:* = "ECMA_1";
			
			startTest();
			
			writeHeaderToLog( " Vector.push()");
			
			var v1:*=new Vector.<int>();
			v1.push();
			AddTestCase(
					"push empty vector",
					"",
					v1.toString());
			
			var v1:*=new Vector.<int>();
			v1.push(1)
			AddTestCase(
			                "push single item to item vector",
			                "1",
			                v1.toString());
			
			var v1:*=new Vector.<int>();
			for (var i:*=0;i<3;i++) v1[i]=i;
			v1.push()
			AddTestCase(
			                "push nothing to small vector",
			                "0,1,2",
			                v1.toString());
			
			/*
			var v1:*=new Vector.<int>();
			for (var i:*=0;i<3;i++) v1[i]=i;
			v1.push(4,5,6);
			AddTestCase(
			                "push several elements to small vector",
			                "0,1,2,3,4,5,6",
			                v1.toString());
			*/
			test();
			return results();
		}
	}
}
