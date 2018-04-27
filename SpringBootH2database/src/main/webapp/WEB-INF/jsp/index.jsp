<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Technical Test Webpage</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.1.0/dist/css/bootstrap.min.css">
<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.1.0/dist/js/bootstrap.min.js"></script>
<script>
	
	function nameValidCheck(name) {
		if(name.length < 5) { alert("The username length is no less than 5 characters"); $('#inputName3').focus(); return false; }
		
		var err = 0; 
		for (var i=0; i<name.length; i++)  { 
		    var chk = name.substring(i,i+1);
		    if(!chk.match(/[0-9]|[a-z]|[A-Z]/)) { err = err + 1; } 
		} 

		if (err > 0) { alert("The username field accepts alpha-numeric values only"); $('#inputName3').focus(); return false;} 
		
		return true;
	}
	
	function passwordValidCheck() {
		var form = document.form;
    	var name = form.name.value;
    	var password = form.password.value;
		
    	if(password.length < 8) { alert("The password length is no less than 8 characters"); $('#inputPassword3').focus(); return false; }
    	
    	var chk = 0; 
    	if(password.search(/[0-9]/g) != -1 ) { chk ++; }    	
    	if(password.search(/[a-z]/) != -1 )  { chk ++; }
    	if(password.search(/[A-Z]/) != -1 )  { chk ++; }
    	
    	if(chk < 3) { alert("The password contains at least 1 number, 1 uppercase, and 1 lowercase character"); $('#inputPassword3').focus(); return false; }
    	
    	return true;
	}
	
	

    function checkSubmit() {
    	var form = document.form;
    	var name = form.name.value;
    	
    	if(!nameValidCheck(name)) {
    		return false;
    	}
    	
    	checkId(name);
    }
    
    
    function checkId(name){
    	$.ajax({
    		method : "POST",
    		url : "/checkId",
    		dataType : "JSON",
    		data : {name : name},
    		async: false,
    		error : function(){alert('error');},
    		success : result
    		
    	})
    }

    function result(data) {
		if(data == true) {
			
			if(!passwordValidCheck()) {
	    		return false;
	    	}
			
			var form = document.form;
			form.submit();
			
			
		} else {
			alert('The username is already registered');
			$('#inputName3').focus();
		}
    }
</script>

</head>
<body>
	<div class="container">
		<h2>Member Insert</h2>
		<form class="form-horizontal" role="form" name="form" method="post" action="/write"> 
		<div class="form-group"> 
		<label for="inputName3" class="col-sm-2 control-label">Name</label> 
		<div class="col-sm-10"> 
		<input type="email" class="form-control" id="inputName3" name="name" placeholder="Name"> 
		</div> 
		</div> 
		<div class="form-group"> 
		<label for="inputPassword3" class="col-sm-2 control-label">Password</label> 
		<div class="col-sm-10"> <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="Password"> 
		</div> 
		</div> 
		<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10"> 
			<button type="button" class="btn btn-sm btn-primary" onclick="javascript:checkSubmit();">submit</button>
	        <button type="button" class="btn btn-sm btn-success" onclick="location.href='/list'">Member List</button>
		</div> 
		</div> 
		</form>
	</div>
</body>
</html>