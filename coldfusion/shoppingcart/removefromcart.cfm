Add One Item <br />
<!--- PUT --->
<!--- remove item from cart --->
<cfset product = 'F1-509'>
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#&productcode=#product#&action=remove" method="put">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">