$('#slider1, #slider2, #slider3').owlCarousel({
    loop: true,
    margin: 20,
    responsiveClass: true,
    responsive: {
        0: {
            items: 1,
            nav: false,
            autoplay: true,
        },
        600: {
            items: 3,
            nav: true,
            autoplay: true,
        },
        1000: {
            items: 5,
            nav: true,
            loop: true,
            autoplay: true,
        }
    }
})

$('.plus-cart').click(function () {
    var id = $(this).attr("pid").toString();
    var eml = this.parentNode.children[2];
    console.log(id);

    $.ajax(
        {
            type: "GET",
            url: "/pluscart",
            data: {
                prod_id: id
            },
            success: function (data) {
                console.log(data);
                eml.innerText = data.quantity;
                
                document.getElementById("amount").innerText = data.amount.toFixed(2);
                document.getElementById("totalamount").innerText = data.totalamount.toFixed(2);
            }
        })
});

$('.minus-cart').click(function () {
    var id = $(this).attr("pid").toString();
    var eml = this.parentNode.children[2];
    $.ajax(
        {
            type: "GET",
            url: "/minuscart",
            data: {
                prod_id: id
            },
            success: function (data) {
                console.log(data)
                eml.innerText = data.quantity;
                document.getElementById("amount").innerText = data.amount.toFixed(2);
                document.getElementById("totalamount").innerText = data.totalamount.toFixed(2);
            }
        })
});

$('.remove-cart').click(function () {
    var id = $(this).attr("pid").toString();
    var elm = this;
    $.ajax(
        {
            type: "GET",
            url: "/removecart",
            data: {
                prod_id: id
            },
            success: function (data) {
                console.log(data)
                document.getElementById("amount").innerText = data.amount;
                document.getElementById("totalamount").innerText = data.totalamount;
                elm.parentNode.parentNode.parentNode.parentNode.remove()
            }
        })
});

$('.mobiless').click(function(){
    console.log("running before")
    var id = $(this).attr("id").toString();
    $(".mobiless").removeClass("active")
    $(this).addClass("active");
    
    var urls="/mobile/"+id;
    console.log(urls)
    console.log("Running")
    $.ajax(
        {
            type: "GET",
            url: urls,
            
            success: function (data) {
                console.log(data.mobiles)
                $("#mobile-row").empty()

                data.mobiles.map(item=>{$("#mobile-row").append('<div class="col-sm-4 text-center mb-4"><a href="/product-detail/'+item.id +'"'+'class="btn"><div class="item"><img src='+item.product_image+' alt="" height="300" class=""><div class="fw-bold">'+item.title+'</div><div class="fw-bold">Rs.'+item.discounted_price+'<small class="fw-light text-decoration-line-through">'+item.selling_price+'</small></div></div></a></div>')})
                //document.getElementById("amount").innerText = data.amount;
                //document.getElementById("totalamount").innerText = data.totalamount;
                //selm.parentNode.parentNode.parentNode.parentNode.remove()
            },
            error: function(data){
                console.log(data);
            }
        })


})
