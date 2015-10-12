<cfhttp url="#application.site#/api/rest/affiliate/legalagreement" method="get" result="object">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>

<cfoutput>#deserializeJSON(object.FileContent).content#</cfoutput>