<html>
<head>
<title>Florist One - REST API - Flowershop/getOrderInfo</title>
</head>
<body>
<?php
$ch = curl_init();
$username = '123456';
$password = 'abcd';
$auth = base64_encode("{$username}:{$password}");
$orderno = 108424007;
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/flowershop/getorderinfo?orderno=$orderno",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch));
curl_close($ch);

echo("Orderno : ".$output->ORDERNO."<br />");
echo("<br />");

echo("Customer<br />");
echo("<br />");

echo("Name : ".$output->CUSTOMER->NAME."<br />");
echo("Address1 : ".$output->CUSTOMER->ADDRESS1."<br />");
echo("Address2 : ".$output->CUSTOMER->ADDRESS2."<br />");
echo("City : ".$output->CUSTOMER->CITY."<br />");
echo("State : ".$output->CUSTOMER->STATE."<br />");
echo("Zipcode : ".$output->CUSTOMER->ZIPCODE."<br />");
echo("Country : ".$output->CUSTOMER->COUNTRY."<br />");
echo("Phone : ".$output->CUSTOMER->PHONE."<br />");
echo("Email : ".$output->CUSTOMER->EMAIL."<br />");

echo("<br />");
echo("Products<br />");
echo("<br />");

for ($x = 0; $x < count($output->ITEMS); $x++) {
	echo("Code : ".$output->ITEMS[$x]->CODE."<br />");
	echo("Product Name : ".$output->ITEMS[$x]->NAME."<br />");
	echo("Description : ".$output->ITEMS[$x]->DESCRIPTION."<br />");
	echo("Price : ".$output->ITEMS[$x]->PRICE."<br />");
	echo("Thumbnail : ".$output->ITEMS[$x]->THUMBNAIL."<br />");
	echo("Full Size Image : ".$output->ITEMS[$x]->IMAGE."<br />");
	echo("Name : ".$output->ITEMS[$x]->RECIPIENT->NAME."<br />");
	echo("Address1 : ".$output->ITEMS[$x]->RECIPIENT->INSTITUTION."<br />");
	echo("Address1 : ".$output->ITEMS[$x]->RECIPIENT->ADDRESS1."<br />");
	echo("Address2 : ".$output->ITEMS[$x]->RECIPIENT->ADDRESS2."<br />");
	echo("City : ".$output->ITEMS[$x]->RECIPIENT->CITY."<br />");
	echo("State : ".$output->ITEMS[$x]->RECIPIENT->STATE."<br />");
	echo("Zipcode : ".$output->ITEMS[$x]->RECIPIENT->ZIPCODE."<br />");
	echo("Country : ".$output->ITEMS[$x]->RECIPIENT->COUNTRY."<br />");
	echo("Phone : ".$output->ITEMS[$x]->RECIPIENT->PHONE."<br />");
	echo("Card Msg : ".$output->ITEMS[$x]->CARDMSG."<br />");
	echo("Delivery Date : ".$output->ITEMS[$x]->DELIVERYDATE."<br />");
	echo("Special Instructions : ".$output->ITEMS[$x]->INSTRUCTIONS."<br />");
	echo("<br />");
}

echo("Subtotal : ".$output->SUBTOTAL."<br />");
echo("Tax : ".$output->TAX."<br />");
echo("Service Charge : ".$output->SERVICECHARGE."<br />");
echo("Discount : ".$output->DISCOUNT."<br />");
echo("Total : ".$output->TOTAL."<br />");


?>
</body>
</html>