$(document).ready(function() {
  buildCalendar();

  $('.calendar_check_boxes_set').each(function(index,Element){
    showCalendar($(this).find("input[type=checkbox]").attr('id'));
  });
  
  $(".fc-header").remove();
  
  bindEventToCalendar();
});

function get_source(id){
  var cal_appointments = {
    url: "/calendars/" + id.toString() +"/appointments"
  };
  return cal_appointments;
}

function toggleSource(checkbox) {
  if(checkbox.checked == false ){
    hideCalendar(checkbox.id);
  }
  else{
    showCalendar(checkbox.id);
  }
}

function hideCalendar(id) {
  $('#calendar').fullCalendar('removeEventSource',get_source(id));
}

function showCalendar(id) {
  $('#calendar').fullCalendar('addEventSource',get_source(id));
}

function buildCalendar() {
  calObj = $('#calendar').fullCalendar({
    theme: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    editable: false,
    weekMode: 'liquid',
    eventSources: []
  });
}

function bindEventToCalendar(){

  //Custom Button Controls for the Calendar
  $('.fc-button-prev').click(function(){
     calObj.fullCalendar('prev');
  });
  $('.fc-button-next').click(function(){
    calObj.fullCalendar('next');
  });
  $('.fc-button-today').click(function() {
    calObj.fullCalendar('today');
  });
  $('.fc-button-month').click(function(){
    calObj.fullCalendar( 'changeView','month');
  });
  $('.fc-button-agendaWeek').click(function(){
     calObj.fullCalendar( 'changeView','agendaWeek');
  });
  $('.fc-button-agendaDay').click(function(){
     calObj.fullCalendar( 'changeView','agendaDay');
  });

  $('#calendar_title').text("ok");

  $('.calendar_title').click( function(){
    $('#calendar_title').text(calObj.fullCalendar('getView').title);
  });

}
