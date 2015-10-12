Destroy Cart <br />
<!--- DELETE --->
<!--- destroys an existing cart --->
<cfhttp url="https://www.floristone.com/api/rest/shoppingcart?sessionid=#cartname#" method="delete">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">