<cfset apikey = '123456'>
<cfset apipassword = 'abcd'>
<cfset product = StructNew()>
<cfset product.code = 'F1-509'>
<cfset product.price = 39.95>
<cfset product.recipient = StructNew()>
<cfset product.recipient.zipcode = '11779'>
<cfset products = ArrayNew(1)>
<cfset arrayappend(products, product)>
<cfset products = serializejson(products)>
<cfhttp url="#application.sitessl#/api/rest/flowershop/gettotal?products=#products#&affiliateservicecharge=0&masterservicecharge=0" method="get">
  <cfhttpparam type="header" name="Authorization" value="Basic #toBase64(apikey & ':' & apipassword)#">
</cfhttp>
<cfdump var="#cfhttp.FileContent.toString()#">
