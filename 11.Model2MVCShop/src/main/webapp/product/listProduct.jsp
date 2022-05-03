<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    

<!-- <link rel="stylesheet" href="/css/admin.css" type="text/css"> -->

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		//=====����Code �ּ� ó�� ��  jQuery ���� ======//
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
		function fncGetList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
		}
	
			
		
		$(function() {

			<c:if test="${param.menu eq 'manage'}">
			$("#button").on("click" , function() {
						//Debug..
						//alert(  $( this ).text().trim() );
						self.location = "/product/updateProduct?prodNo="
								+ $(this).attr("prodNo");
					});
			</c:if>

			<c:if test="${param.menu == 'search'}">

			$("td:nth-child(2)").on(
					"click",
					function() {
						//Debug..
						//alert(  $( this ).text().trim() );

						
						var prodNo = $(this).attr("prodNo").trim();

						//alert(prodNo);
						$.ajax({
							url : "/product/json/getProduct/" + prodNo,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status) {

								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								//alert(JSON.stringify(JSONData));
								var displayValue = "<h3>" + "��ǰ��ȣ : "
										+ JSONData.prodNo + "<br/>"
										+ "�� ǰ �� : " + JSONData.prodName
										+ "<br/>" + "�� �� �� : "
										+ JSONData.fileName + "<br/>"
										+ "������ : " + JSONData.prodDetail
										+ "<br/>" + "�������� : "
										+ JSONData.regDate + "<br/>"
										+ "��  �� : " + JSONData.price + "<br/>"
										+ "</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$("#" + prodNo + "").html(displayValue);
							}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
						
					});
			
			</c:if>
		
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$("td:nth-child(2)").css("color", "red");
			$("h7").css("color", "red");

			//==> �Ʒ��� ���� ������ ������ ??
			//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
			$(".ct_list_pop:nth-child(4n+6)").css("background-color",
					"whitesmoke");
			//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
			//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		});
	</script>		
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">

		<div class="col-md-6 text-left">
			<p class="text-primary">
				<c:choose>
					<c:when test="${param.menu == 'manage'}">
						<h3>��ǰ ����</h3>
					</c:when>
					<c:when test="${param.menu == 'search'}">
						<h3>��ǰ �����ȸ</h3>
					</c:when>
				</c:choose>
			</p>
		</div>

		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">��ü ${resultPage.totalCount } �Ǽ�, ����
					${resultPage.currentPage} ������</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"
								${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
							<option value="2"
								${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
					</div>

					<button type="button" class="btn btn-default">�˻�</button>

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>
			</div>

		</div>

		<%-- <table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">��ǰ��</th>
					<th align="left">����</th>
					<th align="left">������</th>
					<th align="left">�������</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					<tr>
						<td align="center">${ i }</td>
						<td align="left" prodNo=${product.prodNo}>${product.prodName}</td>
						<td align="left">${product.price}</td>
						<td align="left">${product.prodDetail}</td>
						<td align="left"><i class="glyphicon glyphicon-ok"
							id="${product.prodNo}"></i> <input type="hidden"
							value="${product.prodNo}"></td>
					</tr>
				</c:forEach>

			</tbody>

		</table> --%>
		<!--  table End /////////////////////////////////////-->

		<div class="row">
			<c:set var="i" value="0" />
			<c:forEach var="product" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<div class="col-sm-6 col-md-4">

					<div class="thumbnail">
						<img src="..." alt="...">
						<div class="caption">

							<h3>${product.prodName}</h3>

							<%-- <tr>
						<td align="center">${ i }</td>
						<td align="left" prodNo=${product.prodNo}>${product.prodName}</td>
						<td align="left">${product.price}</td>
						<td align="left">${product.prodDetail}</td>
						<td align="left"><i class="glyphicon glyphicon-ok"
							id="${product.prodNo}"></i> <input type="hidden"
							value="${product.prodNo}"></td>
					</tr> --%>

							<p>
								<a href="#" class="btn btn-primary" id="button" role="button" prodNo="${product.prodNo}">Button</a>
							</p>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>


	</div>


	<jsp:include page="../common/pageNavigator_new.jsp" />




</body>
</html>
