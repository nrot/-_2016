function getCookie(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
};

function initCookie(){
  if (getCookie('nick_name') == ""){
    document.cookie = "nick_name=anon";
  };
  document.cookie = "path=/";
  document.cookie = "last_message=0";
};