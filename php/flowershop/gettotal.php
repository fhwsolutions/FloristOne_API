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
$zipcode = 11779;
$products = 
	array(
		array(
			"code" => "F1-509",
			"price" => 39.95
		)
	);
$affiliateservicecharge = 0;
$affiliatetax = 0;
$masterservicecharge = 0; 

$products = json_encode($products);	
	
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/flowershop/gettotal?zipcode=$zipcode&products=$products&affiliateservicecharge=$affiliateservicecharge&masterservicecharge=$masterservicecharge&affiliatetax=$affiliatetax",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch));
curl_close($ch);

echo("Order No : ".$output->ORDERNO."<br />");

echo("Affiliate Tax : ".$output->AFFILIATETAX."<br />");
echo("Florist One Tax : ".$output->FLORISTONETAX."<br />");
echo("Tax Total : ".$output->TAXTOTAL."<br />");

echo("Affiliate Service Charge : ".$output->AFFILIATESERVICECHARGE."<br />");
echo("Master Service Charge : ".$output->MASTERSERVICECHARGE."<br />");
echo("Florist One Service Charge : ".$output->FLORISTONESERVICECHARGE."<br />");
echo("Service Charge Total : ".$output->SERVICECHARGETOTAL."<br />");

echo("Subtotal : ".$output->SUBTOTAL."<br />");

echo("Order total : ".$output->ORDERTOTAL."<br />");

?>
</body>
</html>