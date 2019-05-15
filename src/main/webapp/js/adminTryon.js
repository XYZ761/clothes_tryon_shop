$(document).ready(function (){

    $("[name='adminpay']").click(function () {
        // alert("safd");
        // var orderid = $(this).parents("[name='parent']").find("[name='orderid']").text();
        // var order = {};
        // order.orderid = orderid;
        var orderid=$(this).parents("[name='parent']").find("[name='orderid']").text();
        var order={};
        order.orderid= parseInt(orderid);

alert(orderid);
        $.ajax({
            url: "/shop/changeIsPay",
            type: "POST",
            data:order.orderid,
            dataType:"json",
            success: function () {
                swal("支付成功");
                location.reload();
            },
            error: function () {
                swal("支付成功");
                // location.reload();
            }
        });
    });

    $("[name='adminreject']").click(function () {

        // alert("safd");
        // var orderid = $(this).parents("[name='parent']").find("[name='orderid']").text();
        // var order = {};
        // order.orderid = orderid;
        var orderid=$(this).parents("[name='parent']").find("[name='orderid']").text();
        var order={};
        order.orderid= parseInt(orderid);

        $.ajax({
            url: "/shop/pay",
            type: "POST",
            data:order,
            dataType:"json",
            success: function () {
                swal("支付成功");
                // location.reload();
            },
            error: function () {
                swal("支付成功");
                // location.reload();
            }
        });
    });


});