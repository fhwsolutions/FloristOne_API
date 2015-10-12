<html>
<head>
<title>Florist One - REST API - ShoppingCart - POST</title>
</head>
<body>
<?php
$ch = curl_init();
$username = '123456';
$password = 'abcd';
$auth = base64_encode("{$username}:{$password}");

$cartname = 'abcdefg';

//$data = array('sessionid' => 'abcdefg');

curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/shoppingcart?sessionid=$cartname",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_CUSTOMREQUEST => "DELETE"
	)
);


$response = curl_exec($ch);
print_r($response);

// curl_exec returns either the result or boolean false if something went wrong
if ($response !== false) {
	$output = json_decode($response);
	print_r($output);
} else {
	echo "Something went wrong!!";
}
curl_close($ch);

?>
</body>
</html>