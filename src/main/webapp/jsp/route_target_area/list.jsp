<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>分配仓库配货区域</title>
<%@include file="/inc/inc.jsp"%>
<script type="text/javascript">
	var pager;
	(function() {
	seajs.use('app/jsp/route_target_area/list', function(ListPager) {
		pager = new ListPager({
			element : document.body
		});
		pager.render();
	});
	})();
</script>
</head>
<body>
	<div class="content-wrapper-iframe">
		<!--框架标签结束-->
		<div class="row">
			<!--外围框架-->
			<div class="col-lg-12">
				<!--删格化-->
				<div class="row">
					<!--内侧框架-->
					<div class="col-lg-12">
						<!--删格化-->
						<div class="main-box clearfix">
							<!--白色背景-->
							<!--查询条件-->
							<div class="form-label">
								<form id="queryForm">
									<input name="command.routeGroupId" type="hidden" value="${param.routeGroupId }"/>
									
									<!-- 查询销售商品可配货区域所用参数 -->
									<input name="command.tenantId" type="hidden" value="changhong"/>
									<input name="command.supplierId" type="hidden" value="-1"/>
									<input name="command.productId" type="hidden" value="${param.productId }"/>
									
									<!-- 传递routeItemId -->
									<input name="routeItemId" type="hidden" value=""/>
									<ul>
										<li class="col-md-6">
											<p class="word">商品ID:</p>
											<p>${param.standedProdId }</p>

										</li>
										<li class="col-md-6">
											<p class="word">商品名称:</p>
											<p>${param.standedProdName }</p>

										</li>

									</ul>

								</form>
							</div>
							<!--查询结束-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--框架标签结束-->
		<div class="row">
			<!--外围框架-->
			<div class="col-lg-12">
				<!--删格化-->
				<div class="row">
					<!--内侧框架-->
					<div class="col-lg-12">
						<!--删格化-->
						<div class="main-box clearfix">
							<!--白色背景-->
							<!--标题-->
							<header class="main-box-header clearfix">
								<h2 class="pull-left">组下仓库</h2>
							</header>
							<!--标题结束-->

							<div class="main-box-body clearfix">
								<div class="form-label">
									<form id="areaForm">
										
										<div id="table_info_id_pay_id"></div>
										<!-- 
										<ul>
											<li class="col-md-20">
												<p class="word">
													<input type="radio"  />
												</p>
												<p>第一仓库</p>
												<p>北京 上海  天津  <a href="#" data-toggle="modal"
												data-target="#editModal">编辑</a></p>
											</li>

										</ul> -->

									</form>
								</div>
								<div id="showMessageDiv"></div>
							</div>
							<!--分页-->
								<div class="paging">
									<ul id="pagination">
									</ul>

								</div>
								<div class="row">
									<!--删格化-->
									<p  class="center">
										<input type="button" onclick="javascript:location.href='${_base}/jsp/route_group/list.jsp'"
													class="biu-btn  btn-primary btn-blue btn-auto ml-5"
													value="返  回">
										
									</p>
								</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	
	<!-- 模态框（Modal） 开始 -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
			aria-labelledby="editModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 900px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">选择区域</h4>
					</div>
					<div class="modal-body" style="min-height: 220px;">
						<div class="form-label">
							<div class="panel panel-info">
								<!-- <div class="panel-heading">
									<h3 class="panel-title">选择区域</h3>
								</div> -->
								<div class="panel-body">
									<form id="targetAreaForm">
											<input type="hidden" name="tenantId" value="" />
											<input type="hidden" name="routeItemId" value="" />
											
											<table id="targetAreaId" class="table table-hover table-border table-bordered">
											</table>
											
									</form>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button"
							class="biu-btn  btn-primary btn-blue btn-medium ml-10"
							data-dismiss="modal" onclick="pager._addTargetAreaToList();">确认</button>
						<button type="button"
							class="biu-btn  btn-primary btn-blue btn-medium ml-10"
							data-dismiss="modal">取消</button>
						
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
		<!-- 模态框（Modal） 结束-->
</body>
<script id="pageSearchTmpl" type="text/x-jsrender">
					  	{{for}}
							<ul>
								<li class="col-md-20">
									<p class="word">
									<!--	<input type="radio"  />-->
									</p>
									<p>{{:routeName}}</p>
									<p> {{for area}}
											{{:provinceName}} [<a href="javascript:void(0);" onclick="pager._deleteAreaByRouteAreaId('changhong','{{:routeAreaId}}');">删除</a>]  
										{{/for}}
										<a href="#" onclick="pager._editTargetArea('changhong','{{:routeItemId}}');">编辑</a></p>
								</li>

							</ul>
						{{/for}}
					  </script>
</html>
</html>

