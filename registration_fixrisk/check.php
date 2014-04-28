<?php
//if(isSet($_POST['username']))
//{
//$usernames = array('john','michael','terry', 'steve', 'donald');
//
//$username = $_POST['username'];
//
//if(in_array($username, $usernames))
//	{
//	echo '<font color="red">The nickname <STRONG>'.$username.'</STRONG> is already in use.</font>';
//	}
//	else
//	{
//	echo 'OK';
//	}
//}


// This is a sample code in case you wish to check the username from a mysql db table

if(isSet($_POST['username']))
{
$username = $_POST['username'];

    $dbHost = 'localhost'; // usually localhost
    $dbUsername = 'root';
    $dbPassword = 'mysql';
    $dbDatabase = 'root_riskdb';

$db = mysql_connect($dbHost, $dbUsername, $dbPassword) or die ("Unable to connect to Database Server.");
mysql_select_db ($dbDatabase, $db) or die ("Could not select database.");

$sql_check = mysql_query("select id from risk_clients where username='".$username."'") or die(mysql_error());

if(mysql_num_rows($sql_check))
{
echo '<font color="red">The nickname <STRONG>'.$username.'</STRONG> is already in use.</font>';
}
else
{
  echo 'OK';
}

}

if(isSet($_POST['subdomain']))
{
    $subdomain = $_POST['subdomain'];
    $fullsubdomain=$subdomain.'.fixrnix.net';
    $dbHost = 'localhost'; // usually localhost
    $dbUsername = 'root';
    $dbPassword = 'mysql';
    $dbDatabase = 'root_riskdb';

    $db = mysql_connect($dbHost, $dbUsername, $dbPassword) or die ("Unable to connect to Database Server.");
    mysql_select_db ($dbDatabase, $db) or die ("Could not select database.");

    $sql_check = mysql_query("select id from risk_clients where subdomain='".$fullsubdomain."'") or die(mysql_error());

    if(mysql_num_rows($sql_check))
    {
        echo '<font color="red">SubDomain <STRONG>'.$fullsubdomain.'</STRONG> is already in use.</font>';
    }
    else
    {
        echo 'OK';
    }

}
?>