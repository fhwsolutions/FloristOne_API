<html>
<head>
<title>Florist One - REST API - Flowershop/getProducts - get multiple products</title>
</head>
<body>
<?php
$ch = curl_init();
$username = '123456';
$password = 'abcd';
$auth = base64_encode("{$username}:{$password}");
$category = 'fx';
$count = 6;
$start = 1;
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/flowershop/getproducts?category=$category&count=$count&start=$start",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch));
curl_close($ch);

$products = $output->PRODUCTS;

for ($x = 0; $x < count($products); $x++) {
	echo("<div style='float: left; width: 300px; position: relative;'>");
	echo("<table>");
	echo("<tr><td><img src='".$products[$x]->SMALL."'></td></tr>");
    echo("<tr><td>".$products[$x]->CODE."</td></tr>");
	echo("<tr><td>$".money_format('%.2n', $products[$x]->PRICE)."</td></tr>");
	echo("<tr><td>".$products[$x]->DESCRIPTION."</td></tr>");
	echo("</tr></td>");
	echo("</table>");
	echo("</div>");
} 

?>
</body>
</html>