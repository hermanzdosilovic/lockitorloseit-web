function changeHeightOnResize(selector, navbarHeight) {
  $(window).resize(function() {
    $(selector).css("height", window.innerHeight - navbarHeight);
  });
  $(selector).css("height", window.innerHeight - navbarHeight);
}

function changeMinHeightOnResize(selector, navbarHeight) {
  $(window).resize(function() {
    $(selector).css("min-height", window.innerHeight - navbarHeight);
  });
  $(selector).css("min-height", window.innerHeight - navbarHeight);
}
