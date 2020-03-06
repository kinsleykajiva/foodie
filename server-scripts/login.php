<?php 


if(isset($_POST['username'])){
	$con = mysqli_connect('localhost','topollo_travsim_com_','T3&uc7f1','topollo_travsim_com_');
	$password = $_POST['password'];
	$username = $_POST['username'];
		
	$res = mysqli_query($con , "SELECT password FROM users WHERE username = '$username'  LIMIT 1");

	if($res && mysqli_num_rows($res)){
		$data =  mysqli_fetch_assoc($res);
		$password_has = $data['password'];
		$password   = password_verify($password, $password_has) ;

		print json_encode(['status':$password ? 'ok':'fail']);
		exit;
	}

	print json_encode(['status':$password ? 'ok']);
	exit;
}



