<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="login">
	<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light myNavbar">
			<a class="navbar-brand" href="#">JWAT</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
				</ul>
				<div>
					<form class="form-inline my-2 my-lg-0" action="/jwat/signin"
						method="post">
						<c:choose>
							<c:when test="${email != null }">
								<input name="email" class="form-control mr-sm-2" type="email"
									placeholder="Email" aria-label="Email" value="${email}" />
							</c:when>
							<c:otherwise>
								<input name="email" class="form-control mr-sm-2" type="email"
									placeholder="Email" aria-label="Email" />
							</c:otherwise>
						</c:choose>
						<input name="password" class="form-control mr-sm-2"
							type="password" placeholder="Password" aria-label="Password" />
						<button class="btn btn-primary" type="submit">Đăng nhập</button>
					</form>
					<c:if test="${result == 'false'}">
						<div style="color: red; width: 100%; margin-top: 5px">
							<span>Email hoặc password chưa đúng!</span>
						</div>
					</c:if>
				</div>
			</div>
		</nav>
	</div>

	<div id="login-div-content" class="container-fluid">
		<div class="row" style="height: 100%">
			<div class="col-md-8">
				<div id="login-div-gioithieu">giới thiệu</div>
			</div>

			<div class="col-md-4 col-sm-12">
				<div id="login-div-dangki">
					<div id="login-text-dangki">
						<span class="font-text-dangki"> ĐĂNG KÝ </span>
					</div>

					<c:choose>
						<c:when test="${user != null}">
							<form action="/jwat/dangky" method="post">
								<div>
									<table style="width: 100%" class="table-responsive">
										<tr>
											<td class="text-align-right font-text-dangki">Tên:</td>
											<td><input type="text" name="username"
												value="${user.getUsername()}" /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Emai:</td>
											<td><input type="email" name="email"
												value="${user.getEmail()}" /></td>
										</tr>
										<c:if test="${taiKhoanTonTai == 'true'}">
											<tr>
												<td></td>
												<td><span style="color: red;">Email đã tồn tại</span></td>
											</tr>
										</c:if>
										<tr>
											<td class="text-align-right font-text-dangki">Mật khẩu:</td>
											<td><input type="password" name="password" /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Ngày sinh:</td>
											<td><input type="date" name="dob"
												value="${user.getDob()}" /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Trường:</td>
											<td><input type="text" name="university"
												value="${user.getUniversity()}" /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Điện
												thoại:</td>
											<td><input type="text" name="avatar" value=""></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Địa chỉ:</td>
											<td><input type="text" name="avatar" value=""></td>
										</tr>
									</table>
								</div>

								<div id="div-btn-dang-ky">
									<button id="btnDangKy" class="btn btn-primary font-text-dangki"
										type="submit">Đăng kí</button>
								</div>
							</form>
						</c:when>

						<c:otherwise>
							<form action="/jwat/dangky" method="post">
								<div>
									<table style="width: 100%" class="table-responsive">
										<tr>
											<td class="text-align-right font-text-dangki" >Tên:</td>
											<td><input type="text" name="username"  /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Emai:</td>
											<td><input type="email" name="email" /></td>
										</tr>
										<c:if test="${taiKhoanTonTai == 'true'}">
											<tr>
												<td></td>
												<td><span style="color: red;">Email đã tồn tại</span></td>
											</tr>
										</c:if>
										<tr>
											<td class="text-align-right font-text-dangki">Mật khẩu:</td>
											<td><input type="password" name="password"  /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Ngày sinh:</td>
											<td><input type="date" name="dob" /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Trường:</td>
											<td><input type="text" name="university" /></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Điện
												thoại:</td>
											<td><input type="text" name="avatar" value="" ></td>
										</tr>
										<tr>
											<td class="text-align-right font-text-dangki">Địa chỉ:</td>
											<td><input type="text" name="avatar" value="" ></td>
										</tr>
									</table>
								</div>

								<div id="div-btn-dang-ky">
									<button id="btnDangKy" class="btn btn-primary font-text-dangki"
										type="submit">Đăng kí</button>
								</div>
							</form>
						</c:otherwise>
					</c:choose>



				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>