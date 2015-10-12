Add One Item <br />
<!--- PUT --->
<!--- add item to cart --->
<cfset product = 'F1-509'>
<cfhttp url="https://www.floristone.com/api/rest/shoppingcart?sessionid=#cartname#&productcode=#product#&action=add" method="put">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">