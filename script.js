//shop script
s = 0;
x = 0;
c = 0;
max = 300;
n = 1;
function add(ch1, ch) {
  b = "td" + n;
  p = "p" + n;
  if (n > 10) {
    alert("panier plaine");
  } else {
    c = parseInt(ch);
    s = s + c;
    table = document.getElementById("tab");
    cell1 = document.getElementById(b);
    cell2 = document.getElementById(p);
    cell1.innerHTML = ch1;
    cell2.innerHTML = Number(ch);
    document.getElementById("total").innerHTML = s;
    x = x + 1;
    document.getElementById("quantity").innerHTML = x;
    n = n + 1;
  }
}
function change(a, b, c, d, e, f) {
  if (document.getElementById(a).hidden == true) {
    document.getElementById(a).hidden = false;
  } else {
    document.getElementById(a).hidden = true;
  }
  if (document.getElementById(b).hidden == false) {
    document.getElementById(b).hidden = true;
  } else {
    document.getElementById(b).hidden = true;
  }
  if (document.getElementById(c).hidden == false) {
    document.getElementById(c).hidden = true;
  } else {
    document.getElementById(c).hidden = true;
  }
  if (document.getElementById(d).hidden == false) {
    document.getElementById(d).hidden = true;
  } else {
    document.getElementById(d).hidden = true;
  }
  if (document.getElementById(e).hidden == false) {
    document.getElementById(e).hidden = true;
  } else {
    document.getElementById(e).hidden = true;
  }
  if (document.getElementById(f).hidden == false) {
    document.getElementById(f).hidden = true;
  } else {
    document.getElementById(f).hidden = true;
  }
  if (
    document.getElementById(a).hidden == true &&
    document.getElementById(b).hidden == true &&
    document.getElementById(c).hidden == true &&
    document.getElementById(d).hidden == true &&
    document.getElementById(e).hidden == true &&
    document.getElementById(f).hidden == true
  ) {
    document.getElementById("card").hidden = false;
  } else {
    document.getElementById("card").hidden = true;
  }
}
function delet() {
  con = confirm("are you sure that you wont to delete your last order");
  b1 = "td" + (n - 1);
  p1 = "p" + (n - 1);
  if (con == true) {
    document.getElementById(b1).innerHTML = null;
    document.getElementById(p1).innerHTML = null;
    n = n - 1;
    x = x - 1;
    s = somme();
    document.getElementById("quantity").innerHTML = x;
    document.getElementById("total").innerHTML = s;
    if (x == 0 || s < 0) {
      document.getElementById("total").innerHTML = null;
    }
  }
}

function somme() {
  k = 0;
  for (i = 1; i < x + 1; i++) {
    f = "p" + i;
    g = document.getElementById(f).innerHTML;
    k = k + parseInt(g);
  }
  return k;
}
