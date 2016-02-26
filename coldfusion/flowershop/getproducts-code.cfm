<cfset apikey = '123456'>
<cfset apipassword = 'abcd'>
<cfhttp url="#application.sitessl#/api/rest/flowershop/getproducts?code=B23-4386" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64(apikey & ':' & apipassword)#">
</cfhttp>
<cfdump var="#deserializejson(cfhttp.FileContent.toString()).products[1]#">
