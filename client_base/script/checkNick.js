function checkNickName(){
  console.log(getCookie('nick_name'))
  if (getCookie('nick_name') !== undefined && getCookie('nick_name') !== "anon" && getCookie('nick_name') !== ""){
    setTimeout('window.location="chat_main"',500);
  }
};

function createNick(){
  nick = in_nick.value;
  document.cookie = "nick_name="+escape(nick);
  setTimeout('window.location="chat_main"',500);
}

function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
};