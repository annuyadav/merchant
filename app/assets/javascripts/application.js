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
        type: "get",
        url: "/merchants.js",
        data: search_field
    });
    return false;
}

function get_day(date_array, day_added) {
    $.each(date_array, function (i, v) {
        v.setDate(v.getDate() + day_added);
    })
}

function update_slots(first_day, second_day, slot_url, merchant_id) {
    $.get(slot_url, {day: first_day}, function (data) {
        $('#merchant_' + merchant_id + '_slots_first_day ul').html(slot_list_html(data.slots));
        $('#merchant_' + merchant_id + '_slots_first_day .day').html(data.date);
    });
    $.get(slot_url, {day: second_day}, function (data) {
        $('#merchant_' + merchant_id + '_slots_second_day ul').html(slot_list_html(data.slots));
        $('#merchant_' + merchant_id + '_slots_second_day .day').html(data.date);
    });
}

function slot_list_html(slots) {
    var _html = '';
    $.each(slots.slice(0, 3), function (i, v) {
        _html += '<li>' + v + '</li>'
    });
    if (slots.length < 1) {
        _html = '<li>No</li><li>Slots</li><li>Available</li>'
    }
    return _html;
}