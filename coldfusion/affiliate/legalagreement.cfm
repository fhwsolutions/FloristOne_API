<cfhttp url="https://www.floristone.com/api/rest/affiliate/legalagreement" method="get" result="object">
	<cfhttpparam type="header" name="Authorization" value="Basic #toBase64('123456:abcd')#">
</cfhttp>

<cfoutput>#deserializeJSON(object.FileContent).content#</cfoutput>