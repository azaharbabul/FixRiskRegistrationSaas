<?php

require_once('config.php');

//Open Database Connection
function db_open()
{       
    try
    {
        $db = new PDO("mysql:dbname=".DB_DATABASE.";host=".DB_HOSTNAME.";port=".DB_PORT,DB_USERNAME,DB_PASSWORD, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
         return $db;
    }
    catch (PDOException $e)
    {
        echo("A fatal error has occurred.  Please contact support.");                
    }
    return null;
}

//Close Database Connection
function db_close($db)
{
    $db = null;
}

//Register User
function register_user($fullname, $email, $username, $password, $company,$fullsubdomain,$subdomain,$contact,$country)
{
    $db = db_open();
    //$last_insert_id = $db->lastInsertId();
    //echo $last_insert_id;
    echo $fullname;
    echo $email;
    echo $username;
    echo $password;
    echo $company;
    echo $fullsubdomain;
    echo $subdomain;
    echo $contact;
    echo $country;
    $stmt = $db->prepare("INSERT INTO risk_clients (`fullname`, `email`, `username`, `password`, `company`,`subdomain`,`domainname`,`contact`,`country`) VALUES (:fullname, :email, :username, :password, :company, :subdomain, :domainname, :contact, :country)");
    //$stmt->bindParam(":last_insert_id", $last_insert_id, PDO::PARAM_INT, 11);
    $stmt->bindParam(":fullname", $fullname, PDO::PARAM_STR, 45);
    $stmt->bindParam(":email", $email, PDO::PARAM_STR, 45);
    $stmt->bindParam(":username", $username, PDO::PARAM_STR, 45);
    $stmt->bindParam(":password", $password, PDO::PARAM_STR, 45);
    $stmt->bindParam(":company", $company, PDO::PARAM_STR, 45);
    $stmt->bindParam(":subdomain", $fullsubdomain, PDO::PARAM_STR, 45);
    $stmt->bindParam(":domainname", $subdomain, PDO::PARAM_STR, 45);
    $stmt->bindParam(":contact", $contact, PDO::PARAM_STR, 12);
    $stmt->bindParam(":country", $country, PDO::PARAM_STR, 15);
    $stmt->execute();
    db_close($db);    
    return true;
}

function create_country_dropdown()
{
    $db = db_open();
    $stmt = $db->prepare("select * from countries ORDER BY countryName");
    $stmt->execute();
    $array = $stmt->fetchAll();
    db_close($db);
    echo "<select name='country' id='country' class='form-control'>";
    echo "<option value=\"\">---Country---</option>\n";
    foreach($array as $country)
    {
        echo "<option value=\"".$country['idCountry']."\">".htmlspecialchars($country['countryName'])."</option>\n";
    }
    echo "</select>";
}

function stringcheck($variable, $allowedlen)
{
    $len = strlen($variable);
    if($variable == NULL || $len > $allowedlen)
        return false;
    else
        return true;
}

?>