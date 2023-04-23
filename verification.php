
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="phpstyle.css">
<?php
mysql_connect("localhost","root","") or die("connection Impossible");
mysql_select_db("sitegames") or die("base de donner introuvable");

$email = $_POST["mail"];
$req = "SELECT nom , email , pass FROM client WHERE email='$email'";
$res = mysql_query($req);

if (mysql_num_rows($res) == 0) {
    echo "<script> if(confirm('Email introuvable U_U U_U  Verifier si vous avez un compte ?')){
        window.location.href ='singup.html'
     }else{
        window.location.href ='singin.html'
     }</script>";
} else {
    $t = mysql_fetch_array($res);
    $nom = $_POST["name"];
    $pass = $_POST["pass"];
    
    if ($nom == $t["nom"] && $pass == $t["pass"]) {
        echo("<script>  if (confirm('Login successful!')) {
            window.location.href ='shop.html'
          } </script>");
    } else {
        echo ("Invalid username or password.");
    }
}

mysql_close();
?>
</head>
<body>
    
</body>
</html>