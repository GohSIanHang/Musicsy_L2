<?php
error_reporting(0);
include_once ("dbconnect.php");
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password = sha1($_POST['password']);
$otp = rand(1000,9999);

$sqlinsert = "INSERT INTO USER(NAME,EMAIL,PASSWORD,PHONE,OTP) VALUES ('$name','$email','$password','$phone', '$otp')";

if ($conn->query($sqlinsert) === true)
{
    sendEmail($otp,$email);
    echo "success";
}else{
    echo "failed";
}

function sendEmail($otp,$useremail) {
    $to      = $useremail; 
    $subject = 'Verification for Musicsy'; 
    $message = 'Use the following link to verify your account : http://gohaction.com/GohSianHang262333/musicsy/php/verify.php?email='.$useremail."&key=".$otp; 
    $headers = 'From: norely@musicsy.com' . "\r\n" . 
    'Reply-To: '.$useremail . "\r\n" . 
    'X-Mailer: PHP/' . phpversion(); 
    mail($to, $subject, $message, $headers); 
}
?>
