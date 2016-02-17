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
			"price" => 39.95,
			"recipient" => array("zipcode" => "11779")
		)
	);
$affiliateservicecharge = 0;
$masterservicecharge = 0; 

$products = json_encode($products);	
	
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/flowershop/gettotal?products=$products&affiliateservicecharge=$affiliateservicecharge&masterservicecharge=$masterservicecharge",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch));
curl_close($ch);

echo("Order No : ".$output->ORDERNO."<br />");
echo("Subtotal : ".$output->SUBTOTAL."<br />");
echo("Order total : ".$output->ORDERTOTAL."<br />");

?>
