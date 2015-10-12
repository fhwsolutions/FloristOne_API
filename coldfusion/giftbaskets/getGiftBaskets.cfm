<cftry>

	<cfif isdefined("url.code")>
		<cfset resturl = 'code=' & url.code>
	<cfelseif  isdefined("url.category")>
		<cfset resturl = 'category=' & url.category>
	<cfelse>
		<cfset resturl = 'category=wg'>
	</cfif>

	<cfif NOT isdefined("url.code")>
		<cfif isdefined("url.count")>
			<cfset resturl = resturl & '&count=' & val(url.count)>
		</cfif>
		<cfif isdefined("url.start")>
			<cfset resturl = resturl & '&start=' & val(url.start)>
		</cfif>
	</cfif>
	
	<cfhttp url="#application.sitessl#/api/rest/giftbaskets/getproducts?#resturl#" method="get" result="getGB">
		<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
	</cfhttp>
	<cfset productinfo = deserializeJSON(getGB.filecontent.toString())>
	
	<cfoutput>
		<cfloop array="#productinfo.products#" index="item">
			<div style="float: left; margin: 10px; width: 250px; height: 450px; position: relative; border: 1px solid black; padding: 10px;">
				<table align="center">
					<tr>
						<td><img src="#item.small#" /></td>
					</tr>
					<tr>
						<td>#item.code#</td>
					</tr>
					<tr>
						<td>#dollarformat(item.price)#</td>
					</tr>
					<tr>
						<td>#item.name#</td>
					</tr>
					<tr>
						<td>#left(item.description,200)# &hellip;</td>
					</tr>
					<tr>
						<td>
							<select name="" id="">
								<option value="">Available Delivery Dates</option>
								<cfloop array="#item.availabledeliverydates#" index="dates">
									<option value="#dates.date#">#dates.date# #dollarformat(dates.shippingprice)# (#dates.shippingtype#)</option>
								</cfloop>
							</select>
						</td>
					</tr>
				</table>
			</div>
		</cfloop>
	</cfoutput>
	
	<cfcatch type="any">
		<!---<cfdump var="#cfcatch#">--->
		error loading products
	</cfcatch>
</cftry>
