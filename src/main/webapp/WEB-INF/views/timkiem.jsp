<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KIDS FASION</title>
    
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"  rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/resources/css/style.css"  rel="stylesheet" type="text/css">
    <script src="<c:url value='/resources/js/jquery-3.5.0.min.js' />" ></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js' />" ></script>
    <script src="<c:url value='/resources/js/Baitaplon.min.js' />" ></script>
    <script src="<c:url value='/resources/js/kiemtraform.min.js' />" ></script>
    
    <link rel="icon" href="${pageContext.request.contextPath}/resources//images/logo/Screenshot 2023-04-24 062812.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>


    
    </style>
<body id="app">
     <jsp:include page="my_header.jsp"></jsp:include>
    <div class="container " style="margin-top: 4%;padding-top: 30px;">
        <div><i style="font-weight: bold;">Trang Chủ / Tìm kiếm</i></div>
        <section style="clear: both;">
            <div class="row">
                <div class="col-12 banner_category">
                    <div class="text-banner">
                      Các sản phẩm tìm thấy :
                    </div>

                </div>
                
                
                <c:forEach var="tempProduct" items="${products}">
                               
                        
                                <c:url var="chitietsanphamLink" value="/chitietsanpham">
                                        <c:param name="productId" value="${tempProduct.id}" />
                                </c:url>
                        <div class="col-lg-3 col-xs-12">
                    <div class="option_Category">
             
                        <img src="${tempProduct.image}" alt="" class="product_image">
                        <div class="option_Category_text">
                            <p><a href="${chitietsanphamLink}">${tempProduct.title}</a></p>
                            
                            <p class="product_image"><strong>${tempProduct.price} ₫</strong></p>
                           
                        </div>
                    </div>
                </div>
                <br>  
                        
                                
                                
                        </c:forEach>


        </section>

    </div>
    <div style="clear: both;"></div>
      <jsp:include page="my_footer.jsp"></jsp:include>
</body>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/Baitaplon.js"></script>

</html>