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
//= require froala_editor.min.js
//= require bootstrap-sprockets
//= require rails-ujs
//= require_tree .
//

$(function() {
    $('.navToggle').click(function() {
        $(this).toggleClass('active');

        if ($(this).hasClass('active')) {
            $('.globalMenuSp').addClass('active');
        } else {
            $('.globalMenuSp').removeClass('active');
        }
    });
});


window.onload = function() {
    // select変更時
    document.getElementById('select').onchange = function() {
        // 遷移先URL取得
        var url = this.options[this.selectedIndex].value;
        // URLが取得できていればページ遷移
        if(url != '') {
            location.href = url;
        }
    };
};


$(function() {
  $('td')
  .filter((_, td) => $(td).text().match(/(\b|\D)([12][0-9]?|3[0-8]?|[4-9])(\b|\D)/))
  .css("color", "black")
  .css("font-weight", "normal")
});
