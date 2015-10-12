Create Cart<br />
<!--- POST --->
<!--- creates a new cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart" method="post">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
	<cfhttpparam type="formfield" name="sessionid" value="">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
<cfset cartname = deserializeJSON(cfhttp.filecontent.toString()).sessionID>