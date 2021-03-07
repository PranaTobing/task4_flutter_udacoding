<?php 
	$db_host = 'localhost';
	$db_user = 'id16301506_prana_flutter';
	$db_pass = 'Password123!@#';
	$db_name = 'id16301506_flutter_udacoding';
	
	$db =  mysqli_connect($db_host, $db_user, $db_pass, $db_name);
	if($_SERVER['REQUEST_METHOD'] == 'GET'){
		$response = array();
		$myArray = array();
		$sql = "SELECT * FROM mf_news";
		
		$query = mysqli_query($db,$sql);
		$count = mysqli_num_rows($query);
		while($row = mysqli_fetch_array($query)) {
            $myArray[] = $row;
        }
		echo json_encode($myArray);
	}
	

?>