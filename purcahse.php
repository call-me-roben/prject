<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <?php
mysql_connect("localhost","root","") or die("connection Impossible");
mysql_select_db("sitegames") or die("base de donner introuvable");
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $email =$_POST['email'];
    $phone =$_POST['phone'];
    $address =$_POST['address'];
    $product =$_POST['product'];

    if ($name=="" || $email=="" || $phone=="" || $address=="" || $product=="") {
        echo ('Please fill all the fields');
        exit;
    }
    $req = "SELECT idclient,nom , email , pass FROM client WHERE email='$email' and nom='$name' and phone_number='$phone'";
    $res = mysql_query($req);

    if (mysql_num_rows($res) == 0) {
      echo("<script> alert('one of this fields incorrect [email or name or phone number] ?')</script>");
    }
    $t=mysql_fetch_array($res);
    $req2 = "INSERT INTO purchases (idclient,name, email, phone, address, product) VALUES (' $t[0]  ',' $name  ', ' $email  ', '  $phone  ', ' $address ', ' $product')";

    if (!mysql_query($req2)) {
        die('Error: ' .  mysql_error());
    }else{
      echo"<script> window.location.href ='end.php'</script>";
    }

}

mysql_close();

?>
<style>form {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 30px;
  padding: 20px;
  background-color: #f5f5f5;
  border-radius: 10px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease-in-out;
}

form:hover {
  transform: translateY(-5px);
}

label {
  font-size: 18px;
  font-weight: bold;
  color: #333;
  margin-bottom: 10px;
  transition: color 0.3s ease-in-out;
}

input[type="text"], textarea {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border-radius: 5px;
  border: none;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease-in-out;
}

input[type="text"]:focus, textarea:focus {
  outline: none;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

input[type="submit"] {
  background-color: #333;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

input[type="submit"]:hover {
  background-color: #555;
}

::-webkit-input-placeholder { /* WebKit, Blink, Edge */
    color:    #999;
}

:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
   color:    #999;
   opacity:  1;
}

::-moz-placeholder { /* Mozilla Firefox 19+ */
   color:    #999;
   opacity:  1;
}

:-ms-input-placeholder { /* Internet Explorer 10-11 */
   color:    #999;
}

::-ms-input-placeholder { /* Microsoft Edge */
   color:    #999;
}

textarea {
  height: 100px;
  resize: none;
}

h1 {
  font-size: 36px;
  font-weight: bold;
  text-align: center;
  color: #333;
  margin-top: 50px;
  transition: color 0.3s ease-in-out;
}

h1:hover {
  color: #555;
}

</style>
<script>
  function validateForm() {
  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const phone = document.getElementById("phone").value;
  const address = document.getElementById("address").value;
  const product = document.getElementById("product").value;

  if (name === "") {
    alert("Please enter your name.");
    return false;
  }

+  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    alert("Please enter a valid email address.");
    return false;
  }

+  if (phone.length !== 8 || isNaN(phone)) {
    alert("Please enter a valid 8-digit phone number.");
    return false;
  }

  if (address === "") {
    alert("Please enter your address.");
    return false;
  }

  if (product === "") {
    alert("Please enter a product.");
    return false;
  }

  return true;
}
</script>
</head>
<body>
<form action="" method="POST" onsubmit="return validateForm()">
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name"><br><br>

    <label for="email">Email:</label><br>
    <input type="text" id="email" name="email"><br><br>

    <label for="phone">Phone:</label><br>
    <input type="text" id="phone" name="phone"><br><br>

    <label for="address">Address:</label><br>
    <textarea id="address" name="address"></textarea><br><br>

    <label for="product">Product:</label><br>
    <input type="text" id="product" name="product"><br><br>

    <input type="submit" value="Purchase">
</form>

</body>
</html>


