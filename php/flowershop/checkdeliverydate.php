<html>
<head>
<title>Florist One - REST API - Flowershop/checkDeliveryDate</title>
</head>
<body>
<?php
$ch = curl_init();
$username = '123456';
$password = 'abcd';
$auth = base64_encode("{$username}:{$password}");
$zipcode = '11779';
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/flowershop/checkdeliverydate?zipcode=$zipcode",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch));
curl_close($ch);

$dates = $output->DATES;

echo("Available Delivery Dates: ");
echo("<select>");

for ($x = 0; $x < count($dates); $x++) {
		echo("<option value='".$dates[$x]."'>".$dates[$x]."</option>");
}

echo("</select>");

?>
</body>
</html>