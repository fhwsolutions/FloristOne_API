Create Cart<br />
<!--- POST --->
<!--- creates a new cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart" method="post">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
	<cfhttpparam type="formfield" name="sessionid" value="">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
<cfset cartname = deserializeJSON(cfhttp.filecontent.toString()).sessionID>
Add One Item <br />
<!--- PUT --->
<!--- add item to cart --->
<cfset product = 'F1-509'>
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#&productcode=#product#&action=add" method="put">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Get Cart <br />
<!--- GET --->
<!--- gets shopping cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Remove Item<br />
<!--- PUT --->
<!--- remove item from cart --->
<cfset product = 'F1-509'>
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#&productcode=#product#&action=remove" method="put">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Get Cart <br />
<!--- GET --->
<!--- gets shopping cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Add One Item<br />
<!--- PUT --->
<!--- add item to cart --->
<cfset product = 'F1-509'>
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#&productcode=#product#&action=add" method="put">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Get Cart <br />
<!--- GET --->
<!--- gets shopping cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Clear Cart <br />
<!--- PUT --->
<!--- clear cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#&action=clear" method="put">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Get Cart <br />
<!--- GET --->
<!--- gets shopping cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">
Destroy Cart <br />
<!--- DELETE --->
<!--- destroys an existing cart --->
<cfhttp url="#application.sitessl#/api/rest/shoppingcart?sessionid=#cartname#" method="delete">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">


<cfoutput>#toBase64('234567:bcde')#</cfoutput>