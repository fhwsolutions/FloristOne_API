<cfset apikey = '123456'>
<cfset apipassword = 'abcd'>

<cfset customer = StructNew()>
<cfset customer.name = 'John Doe'>
<cfset customer.email = 'phil@floristone.com'>
<cfset customer.address1 = '123 Big St'>
<cfset customer.address2 = ''>
<cfset customer.city = 'Wilmington'>
<cfset customer.state = 'DE'>
<cfset customer.country = 'US'>
<cfset customer.phone = '1234567890'>
<cfset customer.zipcode = '11779'>
<cfset customer.ip = cgi.REMOTE_HOST>
<cfset customer = serializejson(customer)>

<cfset product = StructNew()>
<cfset product.code = 'F1-509'>
<cfset product.price = 39.95>
<cfset product.deliverydate = dateformat(now(),"yyyy-mm-dd")>
<cfset product.cardmessage = 'This is a card message'>
<cfset product.specialinstructions = 'Special delivery instructions go here'>
<cfset product.recipient = StructNew()>
<cfset product.recipient.name = 'Phil'>
<cfset product.recipient.institution = 'House'>
<cfset product.recipient.address1 = '123 Big St'>
<cfset product.recipient.address2 = ''>
<cfset product.recipient.city = 'Wilmington'>
<cfset product.recipient.state = 'DE'>
<cfset product.recipient.country = 'US'>
<cfset product.recipient.phone = '1234567890'>
<cfset product.recipient.zipcode = '19801'>

<cfset products = ArrayNew(1)>
<cfset arrayappend(products, product)>
<cfset products = serializejson(products)>

<cfset ccinfo = StructNew()>
<cfset ccinfo.type = "vi">
<cfset ccinfo.ccnum = 1234512345123455>
<cfset ccinfo.cvv2 = 123>
<cfset ccinfo.expmonth = 03>
<cfset ccinfo.expyear = 16>
<cfset ccinfo = serializejson(ccinfo)>

<cfset allowsubstitutions = 1>

<cfhttp url="#application.sitessl#/api/rest/flowershop/placeorder" method="post">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64(apikey & ':' & apipassword)#">
    <cfhttpparam type="formfield" name="customer" value='#customer#'>
	<cfhttpparam type="formfield" name="products" value='#products#'>
	<cfhttpparam type="formfield" name="ccinfo" value='#ccinfo#'>
    <cfhttpparam type="formfield" name="ordertotal" value='52.94'>
</cfhttp>

<cfdump var="#cfhttp.FileContent.toString()#">
