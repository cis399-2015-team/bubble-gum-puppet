<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>student information</title>
</head>
<body>
<h3><center>Student information </center></h3>
<table align="center" border="1" width="70%">
        <tr>
                <th>ID</th>
                <th>Name</th>
        </tr>
<?php

$con = mysql_connect("localhost:3306","webuser","123000");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }
   
 
     


// some code

mysql_select_db("webdb",$con);


$sql="select id,name from student";

$result = mysql_query($sql,$con);

while($row=mysql_fetch_array($result)){
?>
        <tr>
                <td><?php echo $row[id] ?></td>
                <td><?php echo $row[name] ?></td>
        </tr>
<?php
}

mysql_close($con);
?>

</table>
</body>
</html>
