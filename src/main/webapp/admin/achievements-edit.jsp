<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<title>新增文章 - 资讯管理 - H-ui.admin v3.1</title>
<meta name="keywords"
	content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
	<article class="page-container">
		<form class="form form-horizontal" id="form-article-add"
			action="/educationReformDetail3Action?type=editAchievement"
			method="post">
			<input type="hidden" name="id"
				value="${requestScope.achievement.achievement_id}" />
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>标题：</label>
				<div class="formControls col-xs-8 col-sm-9">

					<input type="text" name="title" class="input-text"
						value="${requestScope.achievement.title}" placeholder=""
						id="articletitle" name="articletitle">
				</div>
			</div>


			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>日期：</label>
				<div class="formControls col-xs-8 col-sm-9">
						${requestScope.achievement.publish_time}
					<input type="text" onfocus="WdatePicker()" id="publish_time"
						name="publish_time" class="input-text Wdate" value="${myDate}">
				</div>
			</div>


			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<button class="btn btn-primary radius" type="submit">
						<i class="Hui-iconfont">&#xe632;</i> 提交
					</button>
					<button onClick="removeIframe();" class="btn btn-default radius"
						type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
	</article>
	<div class="mt-20" style="width:80%;margin-left:10%;">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="80">ID</th>
					<th>标题</th>
					<th>第一作者</th>
					<th width="120">发表/出版时间</th>
					<th width="120">发表刊物/论文集</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
			   <c:forEach items="${requestScope.achievement.achievementItems}" var="row1" >
			   <tr>
				   <td>${row1.id}</td>
				   <td>${row1.title}</td>
				   <td>${row1.author}</td>
				   ${row1.publish_time}"
				   <td><fmt:formatDate pattern="yyyy-MM-dd" value="${row1.publish_time}" type="both"/></td>
				    <td>${row1.publication}</td>
					<td class="f-14 td-manage">
					
					<a style="text-decoration:none" class="ml-5" href="/admin/achievementItem-edit.jsp?achievement_id=${requestScope.achievement.achievement_id}&id=${row1.id}&title=${row1.title}&author=${row1.author}&publish_time=${myItemDate}&publication=${row1.publication}" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
					<a style="text-decoration:none" class="ml-5" href="/educationReformDetail3Action?type=deleteItem&id=${row1.id}&achievement_id=${row1.achievement_id}" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			   </c:forEach>
			</tbody>
		</table>
		<a href="/admin/achievementItem-add.jsp?achievement_id=${requestScope.achievement.achievement_id}"><button class="btn btn-secondary radius" type="button" style="margin-top:10px;"><i class="Hui-iconfont">&#xe632;</i> 添加成果项</button></a>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="/admin/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="/admin/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer /作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript"
		src="/admin/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript"
		src="/admin/lib/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript"
		src="/admin/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
	<script type="text/javascript"
		src="/admin/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script type="text/javascript">
	
		$(function() {
			$('.skin-minimal input').iCheck({
				checkboxClass : 'icheckbox-blue',
				radioClass : 'iradio-blue',
				increaseArea : '20%'
			});
	
			$list = $("#fileList"),
			$btn = $("#btn-star"),
			state = "pending",
			uploader;
	
			var uploader = WebUploader.create({
				auto : true,
				swf : 'lib/webuploader/0.1.5/Uploader.swf',
	
				// 文件接收服务端。
				server : 'fileupload.php',
	
				// 选择文件的按钮。可选。
				// 内部根据当前运行是创建，可能是input元素，也可能是flash.
				pick : '#filePicker',
	
				// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
				resize : false,
				// 只允许选择图片文件。
				accept : {
					title : 'Images',
					extensions : 'gif,jpg,jpeg,bmp,png',
					mimeTypes : 'image/*'
				}
			});
			uploader.on('fileQueued', function(file) {
				var $li = $(
						'<div id="' + file.id + '" class="item">' +
						'<div class="pic-box"><img></div>' +
						'<div class="info">' + file.name + '</div>' +
						'<p class="state">等待上传...</p>' +
						'</div>'
					),
					$img = $li.find('img');
				$list.append($li);
	
				// 创建缩略图
				// 如果为非图片文件，可以不用调用此方法。
				// thumbnailWidth x thumbnailHeight 为 100 x 100
				uploader.makeThumb(file, function(error, src) {
					if (error) {
						$img.replaceWith('<span>不能预览</span>');
						return;
					}
	
					$img.attr('src', src);
				}, thumbnailWidth, thumbnailHeight);
			});
			// 文件上传过程中创建进度条实时显示。
			uploader.on('uploadProgress', function(file, percentage) {
				var $li = $('#' + file.id),
					$percent = $li.find('.progress-box .sr-only');
	
				// 避免重复创建
				if (!$percent.length) {
					$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo($li).find('.sr-only');
				}
				$li.find(".state").text("上传中");
				$percent.css('width', percentage * 100 + '%');
			});
	
			// 文件上传成功，给item添加成功class, 用样式标记上传成功。
			uploader.on('uploadSuccess', function(file) {
				$('#' + file.id).addClass('upload-state-success').find(".state").text("已上传");
			});
	
			// 文件上传失败，显示上传出错。
			uploader.on('uploadError', function(file) {
				$('#' + file.id).addClass('upload-state-error').find(".state").text("上传出错");
			});
	
			// 完成上传完了，成功或者失败，先删除进度条。
			uploader.on('uploadComplete', function(file) {
				$('#' + file.id).find('.progress-box').fadeOut();
			});
			uploader.on('all', function(type) {
				if (type === 'startUpload') {
					state = 'uploading';
				} else if (type === 'stopUpload') {
					state = 'paused';
				} else if (type === 'uploadFinished') {
					state = 'done';
				}
	
				if (state === 'uploading') {
					$btn.text('暂停上传');
				} else {
					$btn.text('开始上传');
				}
			});
	
			$btn.on('click', function() {
				if (state === 'uploading') {
					uploader.stop();
				} else {
					uploader.upload();
				}
			});
	
			var ue = UE.getEditor('editor');
	
		});
	</script>
	<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>
