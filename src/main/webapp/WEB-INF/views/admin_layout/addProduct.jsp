<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Admin</title>
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/core.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/assets/css/components.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/icons.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/pages.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/assets/css/menu.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/assets/css/responsive.css"
	rel="stylesheet" type="text/css" />
<%-- <link
	href="${pageContext.request.contextPath}/assets/css/add-product.css"
	rel="stylesheet" type="text/css" /> --%>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="layout/left_sidebar.jsp" />
		<jsp:include page="layout/topbar.jsp" />
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="container">

					<div class="row">
						<div class="col-xs-12">
							<div class="page-title-box">
								<h4 class="page-title">Thêm sản phẩm</h4>
								<ol class="breadcrumb p-0 m-0">
									<li><a href="#">KIDFASHION</a></li>
									<li><a href="#">Quản lý</a></li>
									<li class="active">Thêm sản phẩm</li>
								</ol>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- end row -->

					<div class="row">
						<div class="col-lg-12">
							<form:form action="saveProduct" method="post"
								modelAttribute="PRODUCT" enctype="multipart/form-data">
								<div class="form-group">
									<label>Tên sản phẩm</label>
									<form:input path="title" type="text" class="form-control"
										placeholder="Tên sản phẩm" />
									<form:errors path="title"></form:errors>
								</div>
								<div class="form-group">
									<label>Giá:</label>
									<form:input path="price" type="number" class="form-control"
										placeholder="Giá" />
									<form:errors path="price"></form:errors>
								</div>
								<div class="form-group">
									<label>Mô tả</label>
									<form:textarea type="text" class="form-control" path="description"
										placeholder="Mô tả" />

								</div>

								<div class="form-group">
									<label>Ảnh</label> <input type="file" class="form-control"
										name="photo" accept="image/jpg; image/png">
										<span>${errorImage}</span>
								</div>
								<div class="form-group">
									<label>Loại</label><br>
									<form:select class="form-select" path="category.title"
										style="width: 90%; height: 30px">

										<form:option value="Quần áo bé gái">Quần áo bé gái</form:option>
										<form:option value="Quần áo bé trai">Quần áo bé trai</form:option>
										<form:option value="Quần áo sơ sinh">Quần áo sơ sinh</form:option>
										<form:option value="Phụ kiện">Phụ kiện</form:option>


									</form:select>
								</div>
								<form:button type="submit" class="btn btn-primary">Lưu</form:button>
								<form:button type="reset" class="btn btn-primary">
									<a href="/admin/listProduct" style="color: white;">Hủy</a>
								</form:button>
							</form:form>

						</div>
						<!-- end card-box -->
					</div>
					<!-- end col -->

				</div>
				<!-- end row -->

			</div>


		</div>
		<!-- content -->

		<footer class="footer text-right"> 2023 © Kidshop </footer>

	</div>





	</div>

	<!-- <script src="assets/js/modernizr.min.js"></script>
 -->
	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/metisMenu.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/waves.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.js"></script>

	<!-- Sweet-Alert  -->
	<script
		src="${pageContext.request.contextPath}../plugins/sweet-alert2/sweetalert2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/pages/jquery.sweet-alert.init.js"></script>

	<!-- App js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.core.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.app.js"></script>

</body>
</html>