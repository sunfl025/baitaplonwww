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
    .inputId{
    background-color:white;
    border-color:white;
    border-style: solid;
    width: 40px;
    }
    </style>
<body>

<form:form action="muangay" modelAttribute="product" method="GET">
   <form:hidden path="id"/>
     <jsp:include page="my_header.jsp"></jsp:include>
      <form action="/dathangngay">
    <div class="container " style="margin-top: 4%;padding-top: 30px;">
   
        <div><i style="font-weight: bold;">Trang Chủ / Mua hàng</i></div>
        <section style="clear: both;">
            <div class="row">
                <div class="col-12 banner_category">
                    <div class="text-banner">
                        Danh sách giỏ hàng
                    </div>

                </div>
                <div class="col-12">
                    <table class="table table-light">
                        <thead class="thead-light">
                            <tr>
                                <th>#</th>
                                <th>Tên sản phẩm</th>
                                <th>Hình ảnh</th>
                                <th>Số lượng</th>
                                <th>Giá/1 sản phẩm</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input readonly name="theId" value ="${product.id}" class="inputId"> </td>
                                <td>${product.title}</td>
                                <td><img style="width: 100px;height: 100px;"
                                        src="${product.image}" />
                                </td>
                                
                                <td>
                                            <div >
                                                <input   type="number" class="form-control" 
                                                    aria-describedby="emailHelp" placeholder="0" name="quantity">     
                                                    <span class="text-danger" id="error_phone"></span>                                              
                                            </div>
                                </td>   
                                
                                <td>${product.price}₫ </td>
                                <td>${product.status}</td>
                            </tr>
                            
                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-7">
                             <div style="width: 100%;">
                                <div class="row">
                                    <div class="col-12">
            
                                        <br>
                                         <form class="col-12" >
                                            
                                         <!--   <div class="form-group col-12" >
                                                <input   type="number" class="form-control" 
                                                    aria-describedby="emailHelp" placeholder="0" name="quantity">     
                                                    <span class="text-danger" id="error_phone"></span>                                              
                                            </div> -->
                                            <br>
                                            <div class="form-group col-12" >
                                                <input id="txt_phone" type="text" class="form-control" 
                                                    aria-describedby="emailHelp" placeholder="Số điện thoại" name="phone">
                                                    <span class="text-danger" id="error_phone"></span>
                                            </div>
                                            <br>
                                            <div class="form-group col-12" >
                                                <input id="txt_address" type="text" class="form-control" 
                                                    aria-describedby="emailHelp" placeholder="Địa chỉ" name="address">
                                                    <span class="text-danger" id="error_address"></span>
                                            </div>
                                            <br>
                                            <div class="form-group col-12" >
                                                <input id="txt_note" type="text" class="form-control" 
                                                    aria-describedby="emailHelp" placeholder="Ghi chú">
                                                    <span class="text-danger" id="error_address"></span>
                                            </div>
                                            <br>
                                            <div class="form-check">
                                            </div>
                                            
                                            <button style="margin-left: 18px;" type="submit"   class="btn btn-primary" onclick="if(!(confirm('Bạn có xác nhận mua ?'))) return false; return alert('Mua thành công')" >Đặt hàng</button>
                                        </form>
            
                                          <br>
                                        <div id="thongbao_loi" style="display: none;"  class="alert alert-danger">
                                                Vui lòng kiểm tra lại
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                   
                </div>
            </div>


        </section>

    </div>
    <div style="clear: both;"></div>
    </form>
    <jsp:include page="my_footer.jsp"></jsp:include>
    </form:form>
</body>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/kiemtraform.js"></script>
</html>