<?php 
	$db_host = 'localhost';
	$db_user = 'id16301506_prana_flutter';
	$db_pass = 'Password123!@#';
	$db_name = 'id16301506_flutter_udacoding';
	
	$db =  mysqli_connect($db_host, $db_user, $db_pass, $db_name);
	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		$response = array();
		$username = $_POST['username'];
		$password = $_POST['password'];

		$sql = "SELECT * FROM mf_user WHERE mfu_username = '".$username."' AND mfu_password = '".$password."'";
		
		$query = mysqli_query($db,$sql);
		$count = mysqli_num_rows($query);
		$result = mysqli_fetch_array($query);

		if(isset($result)){
			$response['username'] = $result['mfu_username'];
			$response['firtname'] = $result['mfu_firstname'];
			$response['lastname'] = $result['mfu_lastname'];
			$response['status'] = 'success';
			$response['message'] = 'Hi '.$result['mfu_firstname'].' '.$result['mfu_lastname'];
		} else {
			$response['status'] = 'error';
			$response['message'] = 'Wrong Username and Password';
		}

		echo json_encode($response);
	}
	

?>