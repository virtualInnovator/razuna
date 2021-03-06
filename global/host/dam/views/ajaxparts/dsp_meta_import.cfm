<!---
*
* Copyright (C) 2005-2008 Razuna
*
* This file is part of Razuna - Enterprise Digital Asset Management.
*
* Razuna is free software: you can redistribute it and/or modify
* it under the terms of the GNU Affero Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* Razuna is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Affero Public License for more details.
*
* You should have received a copy of the GNU Affero Public License
* along with Razuna. If not, see <http://www.gnu.org/licenses/>.
*
* You may restribute this Program with a special exception to the terms
* and conditions of version 3.0 of the AGPL as described in Razuna's
* FLOSS exception. You should have received a copy of the FLOSS exception
* along with Razuna. If not, see <http://www.razuna.com/licenses/>.
*
--->

<cfoutput>	
<div>
	<form name="form_meta_imp" id="form_meta_imp" method="post" action="#self#" target="_blank">
	<input type="hidden" name="#theaction#" value="c.meta_imp_do">
	<input type="hidden" name="folder_id" value="#attributes.folder_id#">
	<input type="hidden" name="tempid" value="#attributes.tempid#">
	<!--- Desc --->
	<p>#myFusebox.getApplicationData().defaults.trans("import_metadata_desc")#</p>
	<p><hr></p>
	<div>
		<div style="float:left;width:150px;font-weight:bold;">#myFusebox.getApplicationData().defaults.trans("apply_to")#...</div>
		<div style="float:left;">
			<cfif Request.securityObj.CheckSystemAdminUser() OR Request.securityObj.CheckAdministratorUser()>
				#myFusebox.getApplicationData().defaults.trans("please_select")# <select name="expwhat" id="expwhat">
					<option value="folder" selected="selected">#myFusebox.getApplicationData().defaults.trans("all_assets_folder")#</option>
					<option value="all">#myFusebox.getApplicationData().defaults.trans("all_assets_razuna")#</option>
				</select>
			<cfelse>
				<input type="hidden" name="expwhat" id="expwhat" value="" />
				to all assets in the folder
			</cfif>
		</div>
		<!---
		<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">File Format</div>
		<div style="float:left;">
			<select name="file_format" id="file_format" style="width:150px;"<!---  onchange="enabletemplates();" --->>
				<option value="csv" selected="selected">CSV</option>
				<option value="xls">XLS</option>
				<option value="xlsx">XLSX</option>
			</select>
		</div>
		--->
		<!--- First Row --->
		<!---
<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">Header/Columns</div>
		<div style="float:left;width:300px;">Does the first row in the file contain the header/columns?<br /><input type="radio" name="imp_header" value="true" checked="checked" /> Yes <input type="radio" name="imp_header" value="false" /> No</div>
		<div style="clear:both;padding-bottom:10px;"></div>
--->
		<!--- Template --->
		<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">#myFusebox.getApplicationData().defaults.trans("choose_template")#</div>
		<div style="float:left;width:300px;">
			<select name="impp_template" id="impp_template" style="width:150px;"<!---  disabled="disabled" --->>
				<option value="" selected="selected">#myFusebox.getApplicationData().defaults.trans("no_template")#</option>
				<cfloop query="qry_imptemp">
					<option value="#imp_temp_id#">#imp_name#</option>
				</cfloop>
			</select>
			<br />
			<i>#myFusebox.getApplicationData().defaults.trans("template_select_help")#</i>
		</div>
		<!--- Add or append --->
		<div style="clear:both;padding-bottom:10px;"></div>
		<div style="float:left;width:150px;font-weight:bold;">#myFusebox.getApplicationData().defaults.trans("add_append")#</div>
		<div style="float:left;width:300px;">#myFusebox.getApplicationData().defaults.trans("replace_append_decision")#<br /><input type="radio" name="imp_write" value="replace" /> #myFusebox.getApplicationData().defaults.trans("replace")# <input type="radio" name="imp_write" value="add" checked="checked" /> #myFusebox.getApplicationData().defaults.trans("append")#</div>
		<div style="clear:both;padding-bottom:10px;"></div>
		<!--- Upload file --->
		<div style="float:left;width:150px;font-weight:bold;padding-top:7px;">#myFusebox.getApplicationData().defaults.trans("upload_file")#</div>
		<div style="float:left;"><iframe src="#myself#ajax.meta_imp_upload&folder_id=#attributes.folder_id#&tempid=#attributes.tempid#" frameborder="false" scrolling="false" style="border:0px;width:300px;height:55px;" id="metaupload"></iframe></div>
	</div>
	<div style="clear:both;padding-bottom:20px;"></div>
		<!--- Loading Bars --->
	<div style="float:left;padding:10px;color:green;font-weight:bold;display:none;" id="importstatus"></div>
	<div style="float:right;padding:10px;"><input type="submit" name="submitbutton" value="#myFusebox.getApplicationData().defaults.trans("header_import_metadata")#" class="button"></div>
	</form>
</div>
	<!--- JS --->
	<!---
/*
<script type="text/javascript">
		// Load the below when this page gets hit
		// Append to frame url
		function enabletemplates(){
			// Grab selected file format
			var u = $('##file_format :selected').val();
			// Enable Upload templates
			if (u == 'xml'){
				$('##impp_template').removeAttr('disabled');
				}
			else{
				$('##impp_template').attr('disabled','disabled');
			}
		}
	</script>
*/
--->	
</cfoutput>