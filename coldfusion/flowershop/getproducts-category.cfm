<cfset apikey = '123456'>
<cfset apipassword = 'abcd'>
<cfhttp url="#application.sitessl#/api/rest/flowershop/getproducts?category=lr" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64(apikey & ':' & apipassword)#">
</cfhttp>
<cfloop array="#deserializejson(cfhttp.FileContent.toString()).products#" index="product">
	<cfdump var="#product#">
</cfloop>
