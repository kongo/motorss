// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap


$(function() {
  $("button[type=reset]").click(function(event) {
    $(event.currentTarget).parents('form').find("input[type=checkbox]").removeAttr("checked");
  });

  $("#page-next").click(function(event) {
    var path = window.location.pathname;
    var connector = path.indexOf("?") == -1 ? "?" : "&";
    path = path + connector + "page=" + (window.page + 1)
    var btn = $(event.currentTarget);
    btn.attr("disabled", "disabled");

    $.get(path, function(data) {
      $('.proposals-container').append(data);
      window.page += 1;
      btn.removeAttr("disabled");
      if (data.length == 0) {
        btn.replaceWith('Конец');
      }
    });
  });
})

