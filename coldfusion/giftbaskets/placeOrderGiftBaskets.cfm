<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<cftry>
	<cfset resturl = 'code=' & 'WGX673'>
	<cfhttp url="https://www.floristone.com/api/rest/giftbaskets/getproducts?#resturl#" method="get" result="getGB">
		<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
	</cfhttp>
	<cfset productinfo = deserializeJSON(getGB.filecontent.toString())>
	<cfoutput>
		<cfloop array="#productinfo.products#" index="item">
			<form action="" method="post">
				<div style="float: left; margin: 10px; width: 250px; position: relative; border: 1px solid black; padding: 10px;">
					<table align="center">
						<tr>
							<td colspan="2">Customer</td>
						</tr>
						<tr>
							<td>Name</td>
							<td><input name="customer_name" id="customer_name" type="text" value="Test Customer" /></td>
						</tr>
						<tr>
							<td>Address1</td>
							<td><input name="customer_address1" id="customer_address1" type="text" value="123 Main St" /></td>
						</tr>
						<tr>
							<td>Address2</td>
							<td><input name="customer_address2" id="customer_address2" type="text" value="" /></td>
						</tr>
						<tr>
							<td>City</td>
							<td><input name="customer_city" id="customer_city" type="text" value="Town" /></td>
						</tr>
						<tr>
							<td>State</td>
							<td><input name="customer_state" id="customer_state" type="text" value="NY" /></td>
						</tr>
						<tr>
							<td>Zipcode</td>
							<td><input name="customer_zipcode" id="customer_zipcode" type="text" value="11779" /></td>
						</tr>
						<tr>
							<td>Country</td>
							<td><input name="customer_country" id="customer_country" type="text" value="US" /></td>
						</tr>
						<tr>
							<td>Phone</td>
							<td><input name="customer_phone" id="customer_phone" type="text" value="US" /></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input name="customer_email" id="customer_email" type="text" value="US" /></td>
						</tr>
						<tr>
							<td>IP</td>
							<td><input name="customer_ip" id="customer_ip" type="text" value="0.0.0.0" /></td>
						</tr>
					</table>
				</div>
				<div style="float: left; margin: 10px; width: 250px; position: relative; border: 1px solid black; padding: 10px;">
					<table align="center">
						<tr>
							<td colspan="2">Products</td>
						</tr>
						<tr>
							<td colspan="2"><img src="#item.small#" /></td>
						</tr>
						<tr>
							<td colspan="2">#item.code#</td>
						</tr>
						<tr>
							<td colspan="2">#dollarformat(item.price)#</td>
						</tr>
						<tr>
							<td>Delivery Date</td>
							<td><select name="deldate" id="deldate">
									<!---<option value="">Available Delivery Dates</option>--->
									<cfloop array="#item.availabledeliverydates#" index="dates">
										<option value="#dates.date#" data-price="#dates.shippingprice#">#dates.date# #dollarformat(dates.shippingprice)# (#dates.shippingtype#)</option>
									</cfloop>
								</select></td>
						</tr>
						<tr>
							<td>RPA: </td>
							<td><input type="text" name="rpa" id="rpa" value="5" /></td>
						</tr>
						<tr>
							<td>Card Message: </td>
							<td><input type="text" name="cardmsg" id="cardmsg" value="Happy Birthday!" /></td>
						</tr>
						<tr>
							<td colspan="2">Recipient: </td>
						</tr>
						<tr>
							<td>Name</td>
							<td><input name="recipient_name" id="recipient_name" type="text" value="Test recipient" /></td>
						</tr>
						<tr>
							<td>Institution</td>
							<td><input name="recipient_institution" id="recipient_institution" type="text" value="" /></td>
						</tr>
						<tr>
							<td>Address1</td>
							<td><input name="recipient_address1" id="recipient_address1" type="text" value="123 Main St" /></td>
						</tr>
						<tr>
							<td>Address2</td>
							<td><input name="recipient_address2" id="recipient_address2" type="text" value="" /></td>
						</tr>
						<tr>
							<td>City</td>
							<td><input name="recipient_city" id="recipient_city" type="text" value="Town" /></td>
						</tr>
						<tr>
							<td>State</td>
							<td><input name="recipient_state" id="recipient_state" type="text" value="NY" /></td>
						</tr>
						<tr>
							<td>Zipcode</td>
							<td><input name="recipient_zipcode" id="recipient_zipcode" type="text" value="11779" /></td>
						</tr>
						<tr>
							<td>Country</td>
							<td><input name="recipient_country" id="recipient_country" type="text" value="US" /></td>
						</tr>
						<tr>
							<td>Phone</td>
							<td><input name="recipient_phone" id="recipient_phone" type="text" value="US" /></td>
						</tr>
						
						
						
						
					</table>
				</div>
				<div style="float: left; margin: 10px; width: 250px; position: relative; border: 1px solid black; padding: 10px;">
					<table align="center">
						<tr>
							<td colspan="2">CCInfo</td>
						</tr>
						<tr>
							<td>Type</td>
							<td><input name="ccinfo_type" id="ccinfo_type" type="text" value="VI" /></td>
						</tr>
						<tr>
							<td>Expmonth</td>
							<td><input name="ccinfo_expmonth" id="ccinfo_expmonth" type="text" value="03" /></td>
						</tr>
						<tr>
							<td>Expyear</td>
							<td><input name="ccinfo_expyear" id="ccinfo_expyear" type="text" value="16" /></td>
						</tr>
						<tr>
							<td>Ccnum</td>
							<td><input name="ccinfo_ccnum" id="ccinfo_ccnum" type="text" value="1234512345123456" /></td>
						</tr>
						<tr>
							<td>Cvv2</td>
							<td><input name="ccinfo_cvv2" id="ccinfo_cvv2" type="text" value="123" /></td>
						</tr>
					</table>
				</div>
				<div style="float: left; margin: 10px; width: 250px; position: relative; border: 1px solid black; padding: 10px;">
				<table align="center">
						<tr>
							<td colspan="2">Ordertotal</td>
						</tr>
						<tr>
							<td>Ordertotal</td>
							<td><input name="order_total" id="order_total" type="text" value="" /></td>
						</tr>
					</table>
				</div>
				<input name="product_price" id="product_price" type="hidden" value="#item.price#" />
				<input name="product_code" id="product_code" type="hidden" value="#item.code#" />
				
				<input name="submitform" id="submitform" value="Place Order" type="submit" /></td>
			</form>
		</cfloop>
	</cfoutput>
	
	<script>
		var updateTotal = function(){
			total = parseFloat($("#rpa").val()) + parseFloat($("#deldate option:selected").attr("data-price")) + parseFloat($("#product_price").val());
			$("#order_total").val(total.toFixed(2));
			
		}
		$("#rpa").change(function(){
			updateTotal();
		});
		$("#deldate").change(function(){
			updateTotal();
		});
		$(document).ready(function(){
			$("#rpa").trigger("change");
		});
	</script>
	
	<cfif isdefined("form.submitform")>
		<!---<cfset resturl = 'products=[{ "code":"' & trim(form.code) & '", "deliverydate":"' & trim(deldate) & '", "rpa":' & val(form.rpa) & ' }]'>
		<cfhttp url="https://www.floristone.com/api/rest/giftbaskets/getgiftbasketstotal?#resturl#" method="get" result="getTotal">
			<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
		</cfhttp>
		<cfset info = deserializeJSON(getTotal.filecontent.toString())>
		<cfdump var="#info#">--->
		
		
		<cfset customer = structnew()>
		<cfset customer.name = form.customer_name>
		<cfset customer.address1 = form.customer_address1>
		<cfset customer.address2 = form.customer_address2>
		<cfset customer.city = form.customer_city>
		<cfset customer.state = form.customer_state>
		<cfset customer.zipcode = form.customer_zipcode>
		<cfset customer.country = form.customer_country>
		<cfset customer.phone = form.customer_phone>
		<cfset customer.email = form.customer_email>
		<cfset customer.ip = form.customer_ip>
		<cfset customer = serializejson(customer)>
		
		<cfset ordertotal = val(form.order_total)>
		<cfset ordertotal = serializejson(ordertotal)>
		
		<cfset ccinfo = structnew()>
		<cfset ccinfo.type = form.ccinfo_type>
		<cfset ccinfo.expmonth = form.ccinfo_expmonth>
		<cfset ccinfo.expyear = form.ccinfo_expyear>
		<cfset ccinfo.ccnum = form.ccinfo_ccnum>
		<cfset ccinfo.cvv2 = form.ccinfo_cvv2>
		<cfset ccinfo = serializejson(ccinfo)>
		
		<cfset products = arraynew(1)>
		<cfset product = structnew()>
		<cfset product.code = form.product_code>
		<cfset product.deliverydate = form.deldate>
		<cfset product.rpa = val(form.rpa)>
		<cfset product.cardmsg = form.cardmsg>
		<cfset recipient = structnew()>
		<cfset recipient.name = form.recipient_name>
		<cfset recipient.institution = form.recipient_institution>
		<cfset recipient.address1 = form.recipient_address1>
		<cfset recipient.address2 = form.recipient_address2>
		<cfset recipient.city = form.recipient_city>
		<cfset recipient.state = form.recipient_state>
		<cfset recipient.zipcode = form.recipient_zipcode>
		<cfset recipient.country = form.recipient_country>
		<cfset recipient.phone = form.recipient_phone>
		<cfset product.recipient = recipient>
		<cfset arrayappend(products, product)>
		<cfset products = serializejson(products)>
		
		<cfhttp url="https://www.floristone.com/api/rest/giftbaskets/placeorder" method="post">
			<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
			<cfhttpparam type="formfield" name="customer" value='#customer#'>
			<cfhttpparam type="formfield" name="products" value='#products#'>
			<cfhttpparam type="formfield" name="ccinfo" value='#ccinfo#'>
			<cfhttpparam type="formfield" name="ordertotal" value='#ordertotal#'>
		</cfhttp>
		
		<cfdump var="#deserializejson(cfhttp.FileContent.toString())#">
		
	</cfif>
	
	
	
	<cfcatch type="any">
		<cfdump var="#cfcatch#">
		<!---error loading products--->
	</cfcatch>
</cftry>
