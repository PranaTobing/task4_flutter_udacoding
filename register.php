<?php 
	$db_host = 'localhost';
	$db_user = 'id16301506_prana_flutter';
	$db_pass = 'Password123!@#';
	$db_name = 'id16301506_flutter_udacoding';
	
	$db =  mysqli_connect($db_host, $db_user, $db_pass, $db_name);
	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		$response = array();
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$username = $_POST['username'];
		$password = $_POST['password'];

		$sql = "SELECT * FROM mf_user WHERE mfu_username = '".$username."' ";
		
		$query = mysqli_query($db,$sql);
		$count = mysqli_num_rows($query);
		$result = mysqli_fetch_array($query);

		if(isset($result)){
			$response['status'] = 'error';
			$response['message'] = 'Please choose other username';
		} else {
			$sql_ins = "INSERT INTO mf_user(mfu_username,mfu_firstname,mfu_lastname,mfu_password,mfu_createddate)
						VALUES('$username','$firstname','$lastname','$password',now())";
			var_dump($sql_ins);
			if(mysqli_query($db,$sql_ins)){
				$response['status'] = 'success';
				$response['message'] = 'Welcome '.$firstname.' '.$lastname;
			} else {
				$response['status'] = 'error';
				$response['message'] = 'Failed Sign Up';
				// die(mysqli_error)
			}
		}
		echo json_encode($response);
	}
?>