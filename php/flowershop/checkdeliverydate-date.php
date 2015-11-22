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
$date = '11/30/2015';
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/flowershop/checkdeliverydate?zipcode=$zipcode&date=$date",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true
	)
);
$output = json_decode(curl_exec($ch));
curl_close($ch);

$dateavailable = $output->DATE_AVAILABLE;

echo("Delivery available on date ".$date." : ");
echo($dateavailable ? 'true' : 'false');

?>
</body>
</html>