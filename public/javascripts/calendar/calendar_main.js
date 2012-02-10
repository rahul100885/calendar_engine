$(document).ready(function() {
  buildCalendar();

  $('.calendar_check_boxes_set').each(function(index,Element){
    showCalendar($(this).find("input[type=checkbox]").attr('id'));
  });

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
  $('#calendar_prev').click( function() {
    calObj.fullCalendar('prev');
  });

  $('#calendar_next').click( function() {
    calObj.fullCalendar('next');
  });

  $('#calendar_today').click( function() {
    calObj.fullCalendar('today');
  });

  $('#calendar_monthview').click( function() {
    calObj.fullCalendar('changeView', 'month');
  });

  $('#calendar_weekview').click( function() {
    calObj.fullCalendar('changeView', 'agendaWeek');
  });

  $('#calendar_dayview').click( function() {
    calObj.fullCalendar('changeView', 'agendaDay');
  });

  $('#calendar_title').text("ok");

  $('.calendar_title').click( function(){
    $('#calendar_title').text(calObj.fullCalendar('getView').title);
  });

}
