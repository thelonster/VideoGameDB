<html>
  <head>
	<link href="cs332.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-16">
  </head>
  
  <body>

	<?php
	
		$dbhost = "ecsmysql";
		$dbuser = "cs332g7";
		$dbpass = "meawireb";
		$dbname = "cs332g7";
		$dbconnection = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
	
		if (mysqli_connect_errno()) {
			die("Database connection failed: " . mysqli_connect_error() . " (" > mysqli_connect_errno() . ")" );
		}

		$table = $_POST['mydropdown'];
		$dbquery = "SELECT * FROM " . $table ;
		$result = mysqli_query($dbconnection, $dbquery);
		
		echo "<table align=\"center\">";
		
		$field_nums = mysqli_num_fields($result);
		
		for ($x = 0; $x < $field_nums; $x++) {
			$field = mysqli_fetch_field($result);
			echo "<th>{$field->name}</th>";
		}		
		
		$num_rows = mysqli_num_rows($result);
		
		for ($y = 0; $y < $num_rows; $y++)
		{
			$row = mysqli_fetch_row($result);
			echo "<tr><p>";
			$attributes = sizeof($row);
			for ($a = 0; $a < $attributes; $a++) {
				echo "<td>$row[$a]</td>";
			}

			echo "</p></tr>\n";
		}
		
		echo "</table>";
		
	
	?>
	
  </body>
</html>