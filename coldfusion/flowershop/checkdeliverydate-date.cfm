<cfset apikey = '123456'>
<cfset apipassword = 'abcd'>
<cfhttp url="https://www.floristone.com/api/rest/flowershop/checkdeliverydate?zipcode=11779&date=2016-02-29" method="get">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64(apikey & ':' & apipassword)#">
</cfhttp>
<cfdump var="#deserializejson(cfhttp.FileContent.toString()).date_available#">
