<?php
mysql_connect("localhost","root","") or die("connection Impossible");
mysql_select_db("sitegames") or die("base de donner introuvable");
$tel=$_POST["tel"];
$email=$_POST["email"];
$req = "SELECT * FROM client WHERE phone_number='$tel' or email='$email'";
$res = mysql_query($req);
if (mysql_num_rows($res) > 0) {
    echo ("numero de telephone ou email ou le deux deja inscrit ");
} else {
    $name=$_POST["name"];
    $req2 = "SELECT * FROM client WHERE nom='$name' ";
    $res2 = mysql_query($req2);
    if (mysql_num_rows($res2)) {
      echo("<script>alert('le nom existe deja')</script>");
        echo ("le nom existe deja ");
    }else{
    $pass=$_POST["pass"];
    $req2 = "INSERT INTO client (nom,phone_number,email,pass) VALUES ('$name', '$tel', '$email','$pass')";
    if (mysql_query( $req2)) {
      echo("<script>  if (confirm('acount created')) {
        window.location.href ='singin.html'
      } </script>");
    } else {
        echo ("Erreur lors de l'insertion : "); 
    }
}
}
mysql_close();
?>
</html>
