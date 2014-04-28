<?php
    require_once('functions.php');
    require_once "script/formvalidator.php";
    include 'library.php'; // include the library file
    include "classes/class.phpmailer.php"; // include the class name

$show_form=true;

    if(isset($_POST['submit']))
    {
        //Setup Validations
        $validator = new FormValidator();
        $validator->addValidation("fullname","req","Please fill in Name");

        $validator->addValidation("email","email","The input for Email should be a valid email value");
        $validator->addValidation("email","req","Please fill in Email");

        $validator->addValidation("username","minlen=5","Username cannot be less than 5 characters");
        $validator->addValidation("username","maxlen=25","Username cannot be more than 25 characters");
        //$validator->addValidation("username","alpha","Username must not contain spaces, numbers or strange characters");

        $validator->addValidation("password","req","Please enter a password");
        $validator->addValidation("password","minlen=5","Password must be at least 5 characters!");
        $validator->addValidation("password","maxlen=25","Password cannot be more than 25 characters");

        $validator->addValidation("confirm","eqelmnt=password","The confirmation password does not match");
        $validator->addValidation("confirm","req","Please enter the confirm password field");

        $validator->addValidation("contact","req","Please fill in Contact");
        $validator->addValidation("contact","numeric","Contact must contain numeric value");
        $validator->addValidation("company","req","Please fill in Company Name");

        //Now, validate the form
        if($validator->ValidateForm())
        {
            //Validation success.
            //Here we can proceed with processing the form
            //(like sending email, saving to Database etc)
            // In this example, we just display a message
            //echo "<h2>Validation Success!</h2>";
            $show_form=false;
            $fullname = $_POST['fullname'];
            $email = $_POST['email'];
            $username = $_POST['username'];
            $password = $_POST['password'];
            $company = $_POST['company'];
            $subdomain=$_POST['subdomain'];
            //$fullsubdomain=$subdomain.'.fixrisk.in';
            $fullsubdomain=$subdomain.'.fixrnix.net';
            //echo $fullsubdomain;
            $contact=$_POST['contact'];
            $countryid=$_POST['country'];
            $country=getCountryName($countryid);
            //echo $country;
            $reg_status=register_user($fullname, $email, $username, $password, $company,$fullsubdomain,$subdomain,$contact,$country);
            if($reg_status)
            {
                //echo('I am a hero');
                saas_initiate($subdomain);
                sendMailtoUser($fullname,$email,$fullsubdomain,$password);
                $url = 'complete.html';
                echo '<META HTTP-EQUIV=Refresh CONTENT="0; URL='.$url.'">';
            }
        }
        else
        {
            echo "<B>Validation Errors:</B>";

            $error_hash = $validator->GetErrors();
            foreach($error_hash as $inpname => $inp_err)
            {
                //echo "<p>$inpname : $inp_err</p>\n";
                echo "<h8 style='color:#971102;'><p>$inpname : $inp_err</p></h8>";
            }

        }//else
        //======================

    }


function sendMailtoUser($fullname,$email,$fullsubdomain,$password)
{
    //$email = $_POST["email"];
    $mail	= new PHPMailer; // call the class
    $mail->IsSMTP();
    $mail->SMTPDebug = 1;
    //$mail->Host = SMTP_HOST; //Hostname of the mail server
    $mail->Host="ssl://smtp.gmail.com";
    //$mail->Port = SMTP_PORT; //Port of the SMTP like to be 25, 80, 465 or 587
    $mail->Port = 465;
    $mail->SMTPAuth = true; //Whether to use SMTP authentication
    //$mail->Username = SMTP_UNAME; //Username for SMTP authentication any valid email created in your domain
    $mail->Username ="abc@gmail.com";
    //$mail->Password = SMTP_PWORD; //Password for SMTP authentication
    $mail->Password ="your password";
    //$mail->AddReplyTo("blue.azahar@gmail.com", "Babul"); //reply-to address
    $mail->SetFrom("nixers@fixrnix.in", "FixRisk GRC Team"); //From address of the mail
    // put your while loop here like below,
    $mail->Subject = "FixRisk Registration Details"; //Subject od your mail
    $mail->AddAddress($email, $fullname); //To address who will receive this email
    $mail->MsgHTML('<b>Dear '.strtok($fullname, ' ').',</b>'.'<br> <h1>Welcome to FixNix Risk Management.</h1></br>'.'<br>Your Login credential are</br>'.'<ul><li>URL :-'.$fullsubdomain.'</li><li>Username:-'.$email.'</li> <li>Password:-'.$password.'</li></ul>'."<br/><br/>by <a href='httpd://fixrisk.cloudapp.net'>FixRisk Team</a>"); //Put your body of the message you can place html code here
    //$mail->AddAttachment("images/asif18-logo.png"); //Attach a file here if any or comment this line,
    $send = $mail->Send(); //Send the mails
    if($send){
        echo '<center><h3 style="color:#009933;">Mail sent successfully</h3></center>';
    }
    else
    {
        echo '<center><h3 style="color:#FF3300;">Mail error: </h3></center>'.$mail->ErrorInfo;
    }
}
function getCountryName($countryid)
{
    $db = db_open();
    $stmt = $db->prepare("select countryName from countries where idCountry=".$countryid);
    $stmt->execute();
    $array = $stmt->fetchAll();
    $country = $array[0]['countryName'];
    db_close($db);
    return $country;
}



//===========================================
function db_open1($host,$port,$user,$pwd,$db)
{
    // Connect to the database
    try
    {

        $db = new PDO("mysql:dbname=".$db.";host=".$host.";port=".$port,$user,$pwd, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        //echo 'Connected successfully root_saas db';
        return $db;
    }
    catch (PDOException $e)
    {
        printf("A fatal error has occurred.  Please contact support.");
        //die("Database Connection Failed: " . $e->getMessage());
    }

    return null;
}

/*********************************
 * FUNCTION: DATABASE DISCONNECT *
 *********************************/
function db_close1($db)
{
    // Close the DB connection
    $db = null;
}
/*==========================================*/
/*********************************
 * FUNCTION:Domain DATABASE CONNECT *
 *********************************/

function domain_db_open($domainhost,$domainuser,$domainpwd)
{
    $link = mysql_connect($domainhost, $domainuser, $domainpwd);
    if (!$link)
    {
        die("Could not connect: " . mysql_error()."\n");
    }
    else
    {
        echo "Connected successfully\n";
        return $link;

    }
}
/*********************************
 * FUNCTION:Domain DATABASE DISCONNECT *
 *********************************/
function domain_db_close($link)
{
    mysql_close($link);
    $link=null;
}
/*==========================================*/

/*********************************
 * FUNCTION:Domain DATABASE CREATE*
 *********************************/

function create_domain_db($domain_db)
{
    //$domain_db=trim($domain.'_riskdb');
    $host='localhost';
    $user='root';
    $pwd='mysql';
    $domain_dbconnect=domain_db_open($host,$user,$pwd);
    $create_domaindbsql = "CREATE Database ".$domain_db;
    // echo $sql;
    $db_create = mysql_query( $create_domaindbsql, $domain_dbconnect );
    if(! $db_create )
    {
        die("Could not create database: " . mysql_error()."\n");
        domain_db_close($domain_dbconnect);
        return false;
    }
    else
    {
        echo "Database " .$domain_db. " created successfully\n";
        domain_db_close($domain_dbconnect);
        return true;
    }

}
/*********************************
 * FUNCTION:Run Sql Script file*
 *********************************/
function runsql_script($domain_db,$SqlScriptFile)
{
    $host='localhost';
    $port='3306';
    $user='root';
    $pwd='mysql';
    $domain_dbconnect=db_open1($host,$port,$user,$pwd,$domain_db);
    if (empty($domain_dbconnect))
    {
        //return 0;
        echo "Not Connected to ".$domain_db. " database\n";
        db_close1($domain_dbconnect);
    }
    else
    {
        //echo "hi";
        $sql=file_get_contents($SqlScriptFile);
        $qr = $domain_dbconnect->exec($sql);
        db_close($domain_dbconnect);
       // echo "End";
    }

}
/*=================================*/
function saas_initiate($subdomain)
{

    //create db for new domain
    $domain_db=trim($subdomain.'_riskdb');
    $db_create_result=create_domain_db($domain_db);
    if($db_create_result)
    {
        //Run the script.sql file (domaintable.sql)
        $SqlScriptFile='script.sql';
        runsql_script($domain_db,$SqlScriptFile);
    }
    else
    {
        echo "Domain db create error!!!!!\n";
    }
}
//======================= Start Ajax UserName Check====================
//if(isSet($_POST['username']))
//{
//    $username = $_POST['username'];
//    $dbHost = 'localhost'; // usually localhost
//    $dbUsername = 'root';
//    $dbPassword = 'mysql';
//    $dbDatabase = 'root_riskdb';
//
//    $db = mysql_connect($dbHost, $dbUsername, $dbPassword) or die ("Unable to connect to Database Server.");
//    mysql_select_db ($dbDatabase, $db) or die ("Could not select database.");
//
//    $sql_check = mysql_query("select id from risk_clients where username='".$username."'") or die(mysql_error());
//
//    if(mysql_num_rows($sql_check))
//    {
//        echo '<font color="red">The nickname <STRONG>'.$username.'</STRONG> is already in use.</font>';
//    }
//    else
//    {
//        echo 'OK';
//    }
//}

//================End Ajax UserName Check===============================
?>

<html lang="en">
    <head>

      <!--  Start Ajax OnText Change Username checker     -->

        <TITLE>Registration Page</TITLE>
        <META NAME="Keywords" CONTENT="form, username, checker">
        <META NAME="Description" CONTENT="An AJAX Username Verification Script">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.css">

        <script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css" />

        <SCRIPT type="text/javascript">
            pic1 = new Image(16, 16);
            pic1.src = "image/loader.gif";

            $(document).ready(function(){

                $("#username").change(function() {

                    var usr = $("#username").val();

                    if(usr.length >= 4)
                    {
                        $("#status1").html('<img src="image/loader.gif" align="absmiddle">&nbsp;Checking availability...');

                        $.ajax({
                            type: "POST",
                            url: "check.php",
                            data: "username="+ usr,
                            success: function(msg){

                                $("#status1").ajaxComplete(function(event, request, settings){

                                    if(msg == 'OK')
                                    {
                                        $("#username").removeClass('object_error'); // if necessary
                                        $("#username").addClass("object_ok");
                                        $(this).html('&nbsp;<img src="image/tick.gif" align="absmiddle">');
                                    }
                                    else
                                    {
                                        $("#username").removeClass('object_ok'); // if necessary
                                        $("#username").addClass("object_error");
                                        $(this).html(msg);
                                    }

                                });

                            }

                        });

                    }
                    else
                    {
                        $("#status1").html('<font color="red">The username should have at least <strong>4</strong> characters.</font>');
                        $("#username").removeClass('object_ok'); // if necessary
                        $("#username").addClass("object_error");
                    }

                });

            });

            //-->
        </SCRIPT>

        <SCRIPT type="text/javascript">
            pic1 = new Image(16, 16);
            pic1.src = "image/loader.gif";

            $(document).ready(function(){

                $("#subdomain").change(function() {

                    var subd = $("#subdomain").val();

                    if(subd.length >= 2)
                    {
                        $("#status2").html('<img src="image/loader.gif" align="absmiddle">&nbsp;Checking availability...');

                        $.ajax({
                            type: "POST",
                            url: "check.php",
                            data: "subdomain="+ subd,
                            success: function(msg){

                                $("#status2").ajaxComplete(function(event, request, settings){

                                    if(msg == 'OK')
                                    {
                                        $("#subdomain").removeClass('object_error'); // if necessary
                                        $("#subdomain").addClass("object_ok");
                                        $(this).html('&nbsp;<img src="image/tick.gif" align="absmiddle">');
                                    }
                                    else
                                    {
                                        $("#subdomain").removeClass('object_ok'); // if necessary
                                        $("#subdomain").addClass("object_error");
                                        $(this).html(msg);
                                    }

                                });

                            }

                        });

                    }
                    else
                    {
                        $("#status2").html('<font color="red">The subdomain should have at least <strong>2</strong> characters.</font>');
                        $("#subdomain").removeClass('object_ok'); // if necessary
                        $("#subdomain").addClass("object_error");
                    }

                });

            });

            //-->
        </SCRIPT>

      <!--  End Ajax OnText Change Username checker       -->
    </head>
    <body>        
        <script src="js/main.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/jquery-2.1.0.min.js"></script>
        <script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
<!--        <script src="js/paypal-button.min.js"></script>-->
<!--        <script>-->
<!--            $(document).ready(function(){-->
<!--                $(document).mousemove(function(e){-->
<!--                    TweenLite.to($('body'), -->
<!--                    .5, -->
<!--                    { css: -->
<!--                        {-->
<!--                            'background-position':parseInt(event.pageX/8) + "px "+parseInt(event.pageY/12)+"px, "+parseInt(event.pageX/15)+"px "+parseInt(event.pageY/15)+"px, "+parseInt(event.pageX/30)+"px "+parseInt(event.pageY/30)+"px"-->
<!--                        }-->
<!--                    });-->
<!--                });-->
<!--            });-->
<!--        </script>-->
<!--        <script src="paypal-button.min.js?merchant=shan@fixrnix.in" data-button="buynow" data-name="My product" data-amount="1.00"></script>-->
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.css">
        <div class="container">
            <div class="row vertical-offset-100">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><b>Register for FixNix GRC</b></h3>
                        </div>
                        <div class="panel-body">
                            <?php
                            if(true == $show_form)
                            {
                            ?>
                            <form name="submit" method="post" action="">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Full Name" name="fullname" id="fullname" type="text" maxlength="25">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" name="email" id="email" type="text" maxlength="50">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Username" name="username" id="username" type="text" maxlength="16">
                                    <div id="status1"></div>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" id="password" type="password" value="" maxlength="16">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Confirm Password" name="confirm" id="confirm" type="password" value="" maxlength="16">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Company Name" name="company" id="company" type="text" maxlength="25">
                                </div>
<!--                                <div class="form-group">-->
<!--                                    <input class="form-control" placeholder="Subdomain.fixrisk.in" name="subdomain" id="subdomain" type="text" maxlength="10">-->
<!---->
<!--                                </div>-->
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon " style="width: 45px;height: ;">http://</span>
                                        <input class="form-control" data-val="true" data-val-regex="Please enter valid SubDomain,no special characters allowed. " data-val-regex-pattern="^[0-9a-zA-Z]+$" data-val-required="Please enter unique subdomain address." id="subdomain" name="subdomain" placeholder="FixNix domain name" type="text" value="" style="width: 179px;">
                                        <span class="input-group-addon" style="width: 83px;">.fixrnix.net</span>
                                    </div>
                                    <div id="status2"></div>
                                </div>

                                <div class="form-group">
                                    <input class="form-control" placeholder="Contact No" name="contact" id="contact" type="text" maxlength="15">
                                </div>
                                <div class="form-group">
                                    <?php create_country_dropdown(); ?>
                                </div>
                                <input class="btn btn-lg btn-success btn-block" type="submit" name="submit" value="Register">
<!--                                <a href="login.php" class="btn btn-lg btn-info btn-block">Already a Member?</a>-->
                            </fieldset>
                            </form>
                            <?php
                            }//true == $show_form
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>