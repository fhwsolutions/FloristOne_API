<html>
<head>
<title>Florist One - REST API - GiftBaskets/getProducts - get one product</title>
</head>
<body>
<?php
$ch = curl_init();
$username = '123456';
$password = 'abcd';
$auth = base64_encode("{$username}:{$password}");
$code = 'WGCT77';
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/giftbaskets/getproducts?code=$code",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch)); // return obj
curl_close($ch);

$products = $output->PRODUCTS;

for ($x = 0; $x < count($products); $x++) {
	echo("<div style='float: left; width: 300px; position: relative;'>");
	echo("<table>");
	echo("<tr><td><img src='".$products[$x]->SMALL."'></td></tr>");
    echo("<tr><td>".$products[$x]->CODE."</td></tr>");
	echo("<tr><td>$".money_format('%.2n', $products[$x]->PRICE)."</td></tr>");
	echo("<tr><td>".$products[$x]->DESCRIPTION."</td></tr>");
	$availabledeliverydates = $products[$x]->AVAILABLEDELIVERYDATES;
	echo("<tr><td>Available Delivery Dates<br /><br />");
	for ($y = 0; $y < count($availabledeliverydates); $y++) {
		echo("Date: ".$availabledeliverydates[$y]->DATE."<br />");
		echo("Shipping Type: ".$availabledeliverydates[$y]->SHIPPINGTYPE."<br />");
		echo("Shipping Price: ".$availabledeliverydates[$y]->SHIPPINGPRICE."<br /><br />");
	}
	echo("</tr></td>");
	echo("</table>");
	echo("</div>");
} 

?>
</body>
</html>