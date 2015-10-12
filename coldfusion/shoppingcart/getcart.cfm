Get Cart <br />
<!--- GET --->
<!--- gets shopping cart --->
<cfhttp url="https://www.floristone.com/api/rest/shoppingcart?sessionid=#cartname#" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>
<cfdump var="#deserializeJSON(cfhttp.filecontent.toString())#">