$(document).on 'page:load ready', ->
  $('#datetimepicker').datetimepicker({
    autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left",
    format: 'mm-dd-yyyy hh:ii'
  });