<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ???? : http://getbootstrap.com/css/   ???? -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-datepicker.min.css" >
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"> 
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
	 -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"> 
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>  
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function fncAddProduct(){
		//Form ??ȿ?? ????
	 	var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if(name == null || name.length<1){
			alert("??ǰ???? ?ݵ??? ?Է??Ͽ??? ?մϴ?.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("??ǰ?????????? ?ݵ??? ?Է??Ͽ??? ?մϴ?.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("???????ڴ? ?ݵ??? ?Է??ϼž? ?մϴ?.");
			return;
		}
		if(price == null || price.length<1){
			alert("?????? ?ݵ??? ?Է??ϼž? ?մϴ?.");
			return;
		}

		/* document.detailForm.action='addProduct';
		document.detailForm.submit(); */
		
		$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
	}
	
		//============= "????"  Event ???? =============
		 $(function() {
			//==> DOM Object GET 3???? ???? ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddProduct();
			});
		});	
		
		
		//============= "????"  Event ó?? ??  ???? =============
		$(function() {
			//==> DOM Object GET 3???? ???? ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
	</script>		
    
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	<!--  ȭ?鱸?? div Start /////////////////////////////////////-->
	<br/><br/><br/><br/>
	
	<div class="container">
	
		<h1 class="bg-primary text-center">?? ǰ ?? ??</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">??ǰ??</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">??ǰ????????</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">????????</label>
		    <div class="col-sm-4">
		      <!-- <input type="text" class="form-control" id="datepicker" name="manuDate"> -->
		      <div class='input-group date' id='datetimepicker'>
               <input type='text' class="form-control" id="manuDate" name="manuDate"/>
               <span class="input-group-addon">
               <span class="glyphicon glyphicon-calendar"></span>
               </span> 
               
            </div>
		    </div>
		     <script type="text/javascript">
	           $(function () { 
	             /* $('#datetimepicker').datetimepicker().data('DateTimePicker').format('YYYY-MM-DD'); */
	        	   $('#datetimepicker').datetimepicker({
		         		format: 'YYYY-MM-DD'
		         	}); 
	          });
	         	
	      </script>
	      </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">????</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" >
		      
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">??ǰ?̹???</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >??&nbsp;??</button>
			  <a class="btn btn-primary btn" href="#" role="button">??&nbsp;??</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ?鱸?? div end /////////////////////////////////////-->
	
</body>

</html>