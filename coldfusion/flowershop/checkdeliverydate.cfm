<cfset apikey = '123456'>
<cfset apipassword = 'abcd'>
<cfhttp url="https://www.floristone.com/api/rest/flowershop/checkdeliverydate?zipcode=11779" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64(apikey & ':' & apipassword)#">
</cfhttp>
<cfloop array="#deserializejson(cfhttp.FileContent.toString()).dates#" index="date">
	<cfdump var="#date#"><br />
</cfloop>
