<html>
<head>
<title>Florist One - REST API - GiftBaskets/getTotal</title>
</head>
<body>
<?php
$ch = curl_init();
$username = '123456';
$password = 'abcd';
$auth = base64_encode("{$username}:{$password}");
$products = array(array('code' => 'WGX673', 'deliverydate' => '10/29/2015', 'rpa' => 0)); //one item
//$products = array(array('code' => 'WGX673', 'deliverydate' => '10/29/2015', 'rpa' => 5), array('code' => 'WGCDNGM53', 'deliverydate' => '10/30/2015', 'rpa' => 4)); //two items
$products = json_encode($products);
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/giftbaskets/gettotal?products=$products",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch)); // return obj
curl_close($ch);

$products = $output->PRODUCTS;

echo("<table>");

for ($x = 0; $x < count($products); $x++) {
	echo("<tr><td>Product Code: ".$products[$x]->CODE."</td></tr>");
	echo("<tr><td>Shipping Type: ".$products[$x]->SHIPPINGTYPE."</td></tr>");
	echo("<tr><td>Delivery Date: ".$products[$x]->DELIVERYDATE."</td></tr>");
    echo("<tr><td>Base price: $".money_format('%.2n', $products[$x]->BASEPRICE)."</td></tr>");
	echo("<tr><td>Shipping price: $".money_format('%.2n', $products[$x]->SHIPPINGPRICE)."</td></tr>");
	echo("<tr><td><hr /></tr></td>");
}
echo("<tr><td>Order No: ".$output->ORDERNO."</td></tr>"); //will always be 0 because getTotal is not placing an order.
echo("<tr><td>Subtotal: $".money_format('%.2n', $output->SUBTOTAL)."</td></tr>");
echo("<tr><td>Shipping Total: $".money_format('%.2n', $output->SHIPPINGTOTAL)."</td></tr>");
echo("<tr><td>Order Total: $".money_format('%.2n', $output->ORDERTOTAL)."</td></tr>");
echo("</table>");

?>
</body>
</html>