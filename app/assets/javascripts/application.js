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
//= require jquery-ui
//= require_tree .


function fetch_search_query_data(sorting_json) {
    var search_field = $('#merchant_search').serializeJSON();
    var filter_field = $('#merchant_search_filters').serializeJSON().merchant;
    search_field.merchant['filters'] = filter_field;
    if (sorting_json != undefined) {
        search_field.merchant['sorting'] = sorting_json.merchant;
    }
    $.ajax({
        type: "POST",
        url: "/welcome/index.js",
        data: search_field
    });
    return false;
}
