// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery.min.js
//= require jquery.mask
//= require popper.min.js
//= require bootstrap-material-design.min.js
//= require select_all.js
//= require perfect-scrollbar.jquery.min.js
//= require moment.min.js
//= require sweetalert2.js
//= require jquery.validate.min.js
//= require jquery.bootstrap-wizard.js
//= require bootstrap-selectpicker.js
//= require bootstrap-datetimepicker.min.js
//= require jquery.dataTables.min.js
//= require bootstrap-tagsinput.js
//= require jasny-bootstrap.min.js
//= require fullcalendar.min.js
//= require jquery-jvectormap.js
//= require nouislider.min.js
//= require arrive.min.js
//= require chartist.min.js
//= require bootstrap-notify.js
//= require bootstrap-select.js

$(document).ready(function(){
  $("#selectAll").select_all({
    show_count: "checked_with_total",
    attach_count_to: "#showLangCount"
  });
});

if (document.querySelector('.dataBaseValue') !== null){
  var capacity = document.querySelector('.dataBaseValue');

  if (capacity.value == 250){
    capacity.innerHTML = "250ml";
  } else if (capacity.value == 600) {
    capacity.innerHTML = "600ml"
  } else {
    capacity.innerHTML = "1L";
  }

  $("form").submit(function(e){
    var valores = []; // array para guardar os valores
    for(var valor of $(this).serializeArray()){
      valores.push(valor.value);
    }

    if (valores[6] === "250ml"){
      valores[6] = 250;
      capacity.innerHTML = valores[6];
    } if (valores[6] === "600ml") {
      valores[6] = 600;
      capacity.innerHTML = valores[6];
    } if (valores[6] === "1L"){
      valores[6] = 1000;
      capacity.innerHTML = valores[6];
    }
  });
}

//= require material-dashboard.js
//= require demo.js

$(document).ready(function() {
  $().ready(function() {

    $('.money').mask('0000.00', {reverse: true});

    $sidebar = $('.sidebar');

    $sidebar_img_container = $sidebar.find('.sidebar-background');

    $full_page = $('.full-page');

    $sidebar_responsive = $('body > .navbar-collapse');

    window_width = $(window).width();

    fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

    if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
      if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
        $('.fixed-plugin .dropdown').addClass('open');
      }

    }

    $('.fixed-plugin a').click(function(event) {
      // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
      if ($(this).hasClass('switch-trigger')) {
        if (event.stopPropagation) {
          event.stopPropagation();
        } else if (window.event) {
          window.event.cancelBubble = true;
        }
      }
    });

    $('.fixed-plugin .active-color span').click(function() {
      $full_page_background = $('.full-page-background');

      $(this).siblings().removeClass('active');
      $(this).addClass('active');

      var new_color = $(this).data('color');

      if ($sidebar.length != 0) {
        $sidebar.attr('data-color', new_color);
      }

      if ($full_page.length != 0) {
        $full_page.attr('filter-color', new_color);
      }

      if ($sidebar_responsive.length != 0) {
        $sidebar_responsive.attr('data-color', new_color);
      }
    });

    $('.fixed-plugin .background-color .badge').click(function() {
      $(this).siblings().removeClass('active');
      $(this).addClass('active');

      var new_color = $(this).data('background-color');

      if ($sidebar.length != 0) {
        $sidebar.attr('data-background-color', new_color);
      }
    });

    $('.fixed-plugin .img-holder').click(function() {
      $full_page_background = $('.full-page-background');

      $(this).parent('li').siblings().removeClass('active');
      $(this).parent('li').addClass('active');


      var new_image = $(this).find("img").attr('src');

      if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
        $sidebar_img_container.fadeOut('fast', function() {
          $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
          $sidebar_img_container.fadeIn('fast');
        });
      }

      if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

        $full_page_background.fadeOut('fast', function() {
          $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          $full_page_background.fadeIn('fast');
        });
      }

      if ($('.switch-sidebar-image input:checked').length == 0) {
        var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
        var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

        $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
        $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
      }

      if ($sidebar_responsive.length != 0) {
        $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
      }
    });

    $('.switch-sidebar-image input').change(function() {
      $full_page_background = $('.full-page-background');

      $input = $(this);

      if ($input.is(':checked')) {
        if ($sidebar_img_container.length != 0) {
          $sidebar_img_container.fadeIn('fast');
          $sidebar.attr('data-image', '#');
        }

        if ($full_page_background.length != 0) {
          $full_page_background.fadeIn('fast');
          $full_page.attr('data-image', '#');
        }

        background_image = true;
      } else {
        if ($sidebar_img_container.length != 0) {
          $sidebar.removeAttr('data-image');
          $sidebar_img_container.fadeOut('fast');
        }

        if ($full_page_background.length != 0) {
          $full_page.removeAttr('data-image', '#');
          $full_page_background.fadeOut('fast');
        }

        background_image = false;
      }
    });

    $('.switch-sidebar-mini input').change(function() {
      $body = $('body');

      $input = $(this);

      if (md.misc.sidebar_mini_active == true) {
        $('body').removeClass('sidebar-mini');
        md.misc.sidebar_mini_active = false;

        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

      } else {

        $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

        setTimeout(function() {
          $('body').addClass('sidebar-mini');

          md.misc.sidebar_mini_active = true;
        }, 300);
      }

      // we simulate the window Resize so the charts will get updated in realtime.
      var simulateWindowResize = setInterval(function() {
        window.dispatchEvent(new Event('resize'));
      }, 180);

      // we stop the simulation of Window Resize after the animations are completed
      setTimeout(function() {
        clearInterval(simulateWindowResize);
      }, 1000);

    });
  });
});

function modify_up(typed_text) {
  modified_text = typed_text.value.toUpperCase();
  typed_text.value = modified_text;
}