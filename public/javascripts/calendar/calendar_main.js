$(document).ready(function() {
  buildCalendar();
  $('.calendar_check_boxes_set').each(function(index,Element){
    showCalendar($(this).find("input[type=checkbox]").attr('id'));
  });
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
  $('#calendar').fullCalendar({
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

