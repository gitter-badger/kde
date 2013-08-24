<html>
<body>
<?php
require_once "google-api-php-client/src/Google_Client.php";
require_once "google-api-php-client/src/contrib/Google_PlusService.php";

const CLIENT_ID = '514660715260.apps.googleusercontent.com';
const SERVICE_ACCOUNT_NAME = '514660715260@developer.gserviceaccount.com';
const KEY_FILE = '/opt/KDE-Taiwan/kde/keys/18af4f8efaa63cf8d808fa82d4542870e5c9c53e-privatekey.p12';

$client = new Google_Client();
$key = file_get_contents(KEY_FILE);
$client->setClientId(CLIENT_ID);
$client->setAssertionCredentials(new Google_AssertionCredentials(
	SERVICE_ACCOUNT_NAME,
	array('https://www.googleapis.com/auth/plus.login'),
	$key)
);

$plus = new Google_PlusService($client);
$optParams = array('maxResults' => 10);

//$activities = $plus->activities->listActivities('114095232656344072201', 'public', $optParams);
$activities = $plus->activities->listActivities('111119662542192366270', 'public', $optParams);

foreach	($activities['items'] as $activity) {
	$url = filter_var($activity['url'], FILTER_VALIDATE_URL);
	//$title = filter_var($activity['object']['attachments']['0']['displayName'], FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
	//$content = filter_var($activity['object']['attachments']['0']['content'], FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
	$title = $activity['object']['attachments']['0']['displayName'];
	//$content = $activity['object']['attachments']['0']['content'];

	echo "<a href=\"$url\" target=\"_blank\">$title</a><br>\n";
}
?>
</body>
</html>
