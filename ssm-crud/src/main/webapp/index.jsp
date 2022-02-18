<%--
  Created by IntelliJ IDEA.
  User: yyh
  Date: 2022/2/6
  Time: 2:46 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<jsp:forward page="/ems"/>--%>
<html>
<head>
    <title>index</title>
    <script src="${pageContext.request.contextPath}/static/js/jq.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 新增员工模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input"
                                   placeholder="empName">
                            <span id="helpBlock2" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input"
                                   placeholder="email@qq.com">
                            <span id="helpBlock3" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改员工模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input"
                                   placeholder="email@qq.com">
                            <span id="helpBlock5" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">Update Info</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_del_all_btn">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="ems_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info_area">
        </div>
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>
<script>
    var totalRecord,currentPage //总记录数
    $(function () {
        to_page(1)
    })

    function to_page(num) {
        $.ajax({
            url: "${pageContext.request.contextPath}/ems",
            data: "num=" + num,
            success: function (result) {
                build_emp_table(result)
                $("#check_all").prop('checked',false)
                build_page_info(result)
                build_page_nav(result)
            }
        })
    }

    function build_emp_table(result) {
        $('#ems_table tbody').empty()
        var ems = result.extend.pageInfo.list
        $.each(ems, function (index, item) {
            var checkBoxTd = $('<td><input type="checkbox" class="check_item"/></td>')
            var empIdTd = $('<td></td>').append(item.empId)
            var empNameTd = $('<td></td>').append(item.empName)
            var gender = item.gender == 'M' ? '男' : '女'
            var empGenderTd = $('<td></td>').append(gender)
            var empEmailTd = $('<td></td>').append(item.email)
            var deptNameId = $('<td></td>').append(item.department.deptName)
            var editBtn = $('<button></button>').addClass('btn btn-primary btn-sm edit_btn').append('<span></span>').addClass('glyphicon glyphicon-pencil').append('编辑')
            //为编辑按钮写一个自定义的属性用来表示id值
            editBtn.attr('emp-id',item.empId)
            var delBtn = $('<button></button>').addClass('btn btn-danger btn-sm del_btn').append('<span></span>').addClass('glyphicon glyphicon-trash').append('删除')
            delBtn.attr('emp_id',item.empId )
            var btn = $('<td></td>').append(editBtn).append(' ').append(delBtn)

            $('<tr></tr>').append(checkBoxTd).append(empIdTd).append(empNameTd).append(empGenderTd).append(empEmailTd).append(deptNameId).append(btn).appendTo('#ems_table tbody')

        })
    }

    function build_page_info(result) {
        $('#page_info_area').empty()
        $('#page_info_area').append('当前' + result.extend.pageInfo.pageNum + '页,总' + result.extend.pageInfo.pages + '页,总' + result.extend.pageInfo.total + '条记录')
        currentPage = result.extend.pageInfo.pageNum
        totalRecord = result.extend.pageInfo.total
    }

    function build_page_nav(result) {
        $('#page_nav_area').empty()
        var ul = $('<ul></ul>').addClass('pagination ')
        var firstPageLi = $('<li></li>').append($('<a></a>').append('首页'))
        var prePageLi = $('<li></li>').append($('<a></a>').append('&laquo;'))
        if (!result.extend.pageInfo.hasPreviousPage) {
            firstPageLi.addClass('disabled')
            prePageLi.addClass('disabled')
        } else {
            firstPageLi.click(function () {
                to_page(1)
            })
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1)
            })
        }
        var nextPageLi = $('<li></li>').append($('<a></a>').append('&raquo;'))
        var lastPageLi = $('<li></li>').append($('<a></a>').append('末页'))
        if (!result.extend.pageInfo.hasNextPage) {
            nextPageLi.addClass('disabled')
            lastPageLi.addClass('disabled')
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1)
            })
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages)
            })
        }
        ul.append(firstPageLi).append(prePageLi)
        var nums = result.extend.pageInfo.navigatepageNums
        $.each(nums, function (index, item) {
            var numLi = $('<li></li>').append($('<a></a>').append(item))
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass('active')
            }
            numLi.click(function () {
                to_page(item)
            })
            ul.append(numLi)
        })
        ul.append(nextPageLi).append(lastPageLi)
        var navEle = $('<nav></nav>').append(ul)
        navEle.appendTo('#page_nav_area')
    }

    function reset_form(ele){
        $(ele)[0].reset()
        $(ele).find('*').removeClass('has-error has-success')
        $(ele).find('.help-block').text('')
    }

    $('#emp_add_modal_btn').click(function () {
        //重置表单
        reset_form('#empAddModal form')
        //ajax查部门信息
        getDept('#dept_add_select')
        $('#empAddModal').modal({
            backdrop: 'static'
        })
    })
    function getDept(ele){
        $(ele).empty()
        //查出所有部门信息
        $.ajax({
            url : '${pageContext.request.contextPath}/deps',
            success : function(result){
                $.each(result.extend.deps,function(){
                    var optionEle = $('<option></option>').append(this.deptName).attr('value',this.deptId)
                    $(ele).append(optionEle)
                })
            }
        })
    }
    //校验表单数据
    function check_add_form(){
        var empName = $('#empName_add_input').val()
        var empNameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/
        if(!empNameReg.test(empName)){
            show_check_result('#empName_add_input','error','用户名必须是2-5位中文或者6-16英文和数字的组合')
            return false
        }else{
            show_check_result('#empName_add_input','success','')
        }
        var email = $('#email_add_input').val()
        var emailReg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
        if(!emailReg.test(email)){
            show_check_result('#email_add_input','error','邮箱格式不正确')
            return false
        }else{
            show_check_result('#email_add_input','success','')
        }
        return true
    }

    function show_check_result(ele,status,msg){
        $(ele).parent().removeClass('has-success has-error')
        $(ele).next('span').text('')
        if('success' === status){
            $(ele).parent().addClass('has-success')
            $(ele).next('span').text(msg)
        }else if('error' === status){
            $(ele).parent().addClass('has-error')
            $(ele).next('span').text(msg)
        }
    }

    $("#emp_save_btn").click(function(){
        if(!check_add_form())
            return false
        if($(this).attr('ajax-va')==='error')
            return false
        $.ajax({
            url : '${pageContext.request.contextPath}/emp',
            type : 'post',
            data : $('#empAddModal form').serialize(), //序列化表单请求数据
            success : function(result){
                if(result.code === 100){
                    //关闭模态框
                    $('#empAddModal').modal('hide')
                    //到最后一页
                    to_page(totalRecord)
                }else{
                    if(result.extend.errorFields.email){
                        show_check_result('#email_add_input','error',result.extend.errorFields.email)
                    }
                    if(result.extend.errorFields.empName){
                        show_check_result('#empName_add_input','error',result.extend.errorFields.empName)
                    }
                }
            }
        })
    })
    //检查用户名是否可用
    $('#empName_add_input').change(function (){
        var empName = this.value
        $.ajax({
            url : '${pageContext.request.contextPath}/checkName',
            data : 'empName='+empName,
            type : 'post',
            success : function(result){
                if(result.code === 100){
                    show_check_result('#empName_add_input','success','用户名可用')
                    $('#emp_save_btn').attr('ajax-va','success')
                }else{
                    show_check_result('#empName_add_input','error',result.extend.value)
                    $('#emp_save_btn').attr('ajax-va','error')
                }
            }
        })
    })

    //给在ajax请求后的按钮绑定事件用on
    $(document).on('click','.edit_btn',function (){
        getDept('#dept_update_select')
        getEms($(this).attr('emp-id'))
        //把员工id值给更新按钮
        $('#emp_update_btn').attr('emp-id',$(this).attr('emp-id') )
        $('#empUpdateModal').modal({
            backdrop : 'static'
        })
    })

    //查询员工信息
    function getEms(id){
        $.ajax({
            url : '${pageContext.request.contextPath}/emp/'+id,
            type : 'get',
            success : function (result){
                var empEle = result.extend.emp
                $('#empName_update_static').text(empEle.empName)
                $('#email_update_input').val(empEle.email)
                $('#empUpdateModal input[name=gender]').val([empEle.gender])
                $('#dept_update_select').val([empEle.dId])
            }
        })
    }

    //更新员工信息
    $('#emp_update_btn').click(function (){
        var email = $('#email_update_input').val()
        var emailReg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/
        if(!emailReg.test(email)){
            show_check_result('#email_update_input','error','邮箱格式不正确')
            return false
        }else{
            show_check_result('#email_update_input','success','')
        }
        $.ajax({
            url : '${pageContext.request.contextPath}/emp/'+$(this).attr('emp-id'),
            type : 'put',
            data : $('#empUpdateModal form').serialize(),//&_method=put  type : 'post'
            success : function (){
                $('#empUpdateModal').modal('hide')
                to_page(currentPage)
            }
        })
    })

    //给动态的删除按钮绑定单击事件  单个删除
    $(document).on('click','.del_btn',function (){
        var empName = $(this).parents('tr').find('td:eq(2)').text()
        var empId = $(this).attr('emp_id')
        if(confirm('确认删除='+empName+'吗?')){
            $.ajax({
                url : ' ${pageContext.request.contextPath}/emp/'+empId,
                type : 'delete',
                success : function (){
                    to_page(currentPage)
                }
            })
        }
    })

    //全选与全不选
    $('#check_all').click(function (){
        //获取原声属性的值prop,attr获取自定义的属性的值
        $('.check_item').prop('checked',$(this).prop('checked'))
    })

    //check_item
    $(document).on('click','.check_item',function (){
        var flag = $('.check_item:checked').length === $('.check_item').length
        $('#check_all').prop('checked',flag)
    })

    //批量删除
    $('#emp_del_all_btn').click(function (){
        var empNames = ''
        var ids = ''
        $.each($('.check_item:checked'),function (){
                empNames += $(this).parents('tr').find('td:eq(2)').text()+','
                ids += $(this).parents('tr').find('td:eq(1)').text()+'-'
        })
        empNames = empNames.substring(0,empNames.length-1)
        ids = ids.substring(0,ids.length-1)
        if(confirm('确认删除['+empNames+']吗')){
            $.ajax({
                url : '${pageContext.request.contextPath}/emp/'+ids,
                type : 'delete',
                success : function (result){
                    alert(result.message)
                    to_page(currentPage)
                }
            })
        }
    })
</script>
</body>
</html>
