//= require jquery-1.12.3.min
//= require bootstrap.min
//= require custom
//= require_tree .

$(document).ready(function() {
  changeMinHeightOnResize(".greeting", 0);
  changeMinHeightOnResize(".lock-it-wallet", 0);
  changeMinHeightOnResize(".lock-it-ring", 0);

  var $window = $(window);
  var $navbar = $(".navbar-default");

  $("a.scroll").click(function() {
    $('.navbar-collapse').collapse('hide');
    $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top
    }, 500);
    return false;
  });

  if ($window.width() <= 767) {
    $navbar.addClass("navbar-fixed-top");
  } else {
    $navbar.removeClass("navbar-fixed-top");
  }
  $window.resize(function() {
    if ($window.width() <= 767) {
      $navbar.addClass("navbar-fixed-top");
    } else {
      $navbar.removeClass("navbar-fixed-top");
    }
  });

  $('body').scrollspy({
    target: '.navbar-default'
  });
});
