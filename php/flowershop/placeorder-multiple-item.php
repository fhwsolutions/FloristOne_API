<?php
$ch = curl_init();
$username = '123456';
$password = 'abcd';
$auth = base64_encode("{$username}:{$password}");
$customer = json_encode(array(
	'name' => 'John Doe', 
	'address1' => '123 Big Street', 
	'address2' => '   ', 
	'city' => 'Wilmington', 
	'state' => 'DE', 
	'zipcode' => '19801', 
	'country' => 'US', 
	'phone' => '123-123-1234',	
	'email' => 'phil@floristone.com',
	'ip' => $_SERVER['REMOTE_ADDR']
));
$ccinfo = json_encode(array(
	'type' => 'ax',
	'ccnum' => 378282246310005,
	'cvv2' => 1234,
	'expmonth' => 03,
	'expyear' => 16
));
$products = json_encode(
	array(
		array(
			'code' => 'F1-509',
			'price' => 39.95,
			'deliverydate' => '2016-03-26',
			'cardmessage' => 'This is a card message',
			'specialinstructions' => 'Special delivery instructions go here',
			'recipient' => array(
				'name' => 'Phil',
				'institution' => 'House',
				'address1' => '123 Big St',
				'address2' => '',
				'city' => 'Wilmington',
				'state' => 'DE',
				'country' => 'US',
				'phone' => '1234567890',
				'zipcode' => '19801'
			)
		),
		array(
			'code' => 'E9-4817',
			'price' => 49.95,
			'deliverydate' => '2016-03-29',
			'cardmessage' => 'This is a card message',
			'specialinstructions' => 'Special delivery instructions go here',
			'recipient' => array(
				'name' => 'Phil',
				'institution' => 'House',
				'address1' => '123 Big St',
				'address2' => '',
				'city' => 'Wilmington',
				'state' => 'DE',
				'country' => 'US',
				'phone' => '1234567890',
				'zipcode' => '19801'
			)
		)
	)
);
$ordertotal = 137.89;
$data = array('products' => $products, 'customer' => $customer, 'ccinfo' => $ccinfo, 'ordertotal' => $ordertotal);
print_r(json_encode($data));
curl_setopt_array(
	$ch,
	array(
		CURLOPT_URL => "https://www.floristone.com/api/rest/flowershop/placeorder",
		CURLOPT_HTTPHEADER => array("Authorization: {$auth}"),
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_POST => true,
		CURLOPT_POSTFIELDS => $data
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
