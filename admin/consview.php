<?php 
session_start();
if(isset($_SESSION['admusername']))
			{
				
			}
else
	{
		header('location:index.php');
	}			
require '../dbconfig/config.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title>Consignments</title>
	<link rel="stylesheet" type="text/css" href="../css/style2.css">
</head>
<body style="background-color: #deefde">

<?php 

			$query="SELECT * from consig, vcons ";
					$query_run=mysqli_query($con,$query);
				
					if($query_run)
					{
					echo "CONSIGNMENTS";		
							echo "<table>"; // start a table tag in the HTML
					while($row = mysqli_fetch_array($query_run)){   //Creates a loop to loop through results
					echo "<tr><td>" . $row['id'] . "</td><td>" . $row['ord_by'] . "</td><td>". $row['sc'] . "</td><td>". $row['cc'] . "</td><td>". $row['serv_type'] . "</td><td>" . $row['added_on'] . "</td><td>" . $row['price'] . "</td><td>" . $row['vby'] . "</td><td>" . $row['etd'] . "</td><tr>";  //$row['index'] the index here is a field name
					echo "</table>";
				}}
				else
					echo "the query was wrong ;)";
 ?>

 <br>
 <a href="index.php"><input type="button" id="back-button" value="<<Go Back" /></a>

	</body>
</html>