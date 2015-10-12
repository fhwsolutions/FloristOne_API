<cftry>
	<cfset resturl = 'code=' & 'WGX673'>
	<cfhttp url="https://www.floristone.com/api/rest/giftbaskets/getproducts?#resturl#" method="get" result="getGB">
		<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
	</cfhttp>
	<cfset productinfo = deserializeJSON(getGB.filecontent.toString())>
	<cfoutput>
		<cfloop array="#productinfo.products#" index="item">
			<div style="float: left; margin: 10px; width: 250px; height: 600px; position: relative; border: 1px solid black; padding: 10px;">
				<form action="" method="post">
					<table align="center">
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
							<td colspan="2">#item.name#</td>
						</tr>
						<tr>
							<td colspan="2">#left(item.description,200)# &hellip;</td>
						</tr>
						<tr>
							<td>Delivery Date</td>
							<td><select name="deldate" id="deldate">
									<option value="">Available Delivery Dates</option>
									<cfloop array="#item.availabledeliverydates#" index="dates">
										<option value="#dates.date#">#dates.date# #dollarformat(dates.shippingprice)# (#dates.shippingtype#)</option>
									</cfloop>
								</select></td>
						</tr>
						<tr>
							<td>RPA: </td>
							<td><input type="text" name="rpa" id="rpa" value="5" /></td>
						</tr>
						<tr>
							<td colspan="2"><input name="submitform" id="submitform" value="Get Total" type="submit" /></td>
						</tr>
						<input type="hidden" name="code" id="code" value="#item.code#" />
					</table>
				</form>
			</div>
		</cfloop>
	</cfoutput> 
	
	<cfif isdefined("form.submitform")>
	
	<cfset resturl = 'products=[{ "code":"' & trim(form.code) & '", "deliverydate":"' & trim(deldate) & '", "rpa":' & val(form.rpa) & ' }]'>
	<cfoutput>https://www.floristone.com/api/rest/giftbaskets/gettotal?#resturl#</cfoutput>
	<cfhttp url="https://www.floristone.com/api/rest/giftbaskets/gettotal?#resturl#" method="get" result="getTotalgb">
		<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
	</cfhttp>
	<cfset info = deserializeJSON(getTotalgb.filecontent.toString())>
	
	<cfdump var="#info#">
	
	</cfif>
	
	<cfcatch type="any">
		<cfdump var="#cfcatch#">
		<!---error loading products--->
	</cfcatch>
</cftry>
