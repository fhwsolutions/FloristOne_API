<cfset apikey = '123456'>
<cfset apipassword = 'abcd'>
<cfhttp url="https://www.floristone.com/api/rest/flowershop/getorderinfo?orderno=536180551" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64(apikey & ':' & apipassword)#">
</cfhttp>
<cfdump var="#cfhttp.FileContent.toString()#">
