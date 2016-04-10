function callServer(){
    var text = in_text.value;
    var nick = getCookie("nick_name");
    if ((text == null) || (text == "")) return;
    if (nick == null || nick == "") return;
    in_text.value = "";
    var url = "/new_m/";
    var information ={type: "new_massage",
        chat: "id_1",
        nick: escape(nick),
        message: escape(text)}
    $.post(url, JSON.stringify(information))
};

function switchGlob_flag(){
  if (xmlHttp.readyState == 4){
    window.glob_flag = false;
    setTimeout(onBackUpdate, window.time_update);
  }
};

function renderMassage(data, status_text, jqXHR){
  // console.log(data);
  // console.log(status_text);
  if (status_text !== "success"){return}
  var message = JSON.parse(data);
  if (message.nothing){
    setTimeout(updateMessage(), 1000);
    return
  };
  n = message.amount;
  document.cookie = "last_message="+n;
  var nicks = message.nicks.slice();
  var mes = message.messages.slice();
  nicks.forEach(function(item, i, nicks){
    var m0 = document.createElement('div');
    m0.setAttribute('class', 'one_message')
    m0.innerHTML = '<div class="nick_in_one_message">'+message.nicks[i]+"</div>"+'<div class="text_in_one_message">'+unescape(message.messages[i])+"</div>";
    document.getElementById('messages_' + message.chat).appendChild(m0)
  });
  setTimeout(updateMessage(), 100);
  return
};

function updateMessage(){
  var url = "/update/";
  var amount = getCookie("last_message");
  var information = {
      type: "update",
      chat: "id_1",
      number: amount};
  var jqxhr = $.post(url, JSON.stringify(information))
  .done(renderMassage)
};

function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
};