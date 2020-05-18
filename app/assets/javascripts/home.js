var count = 10;
var url;
if (window.location.pathname == "/home/game"){
  setInterval(myTimer, 1000);
}

// Counter to change the images.
function myTimer() {
  var timer = document.getElementById("game-timer");
  timer.textContent = count;
  url = window.images[Math.floor(Math.random() * window.images.length)];
  document.getElementById("image").src = url;
  count -= 1;
  count = count == 0 ? 10 : count;
}

// Ajax call to save the round.
function saveImageInfo(){
  if(url){
    var xhr = new XMLHttpRequest();
    xhr.open("POST", '/home/game', true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
      if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
        bindTable(JSON.parse(this.responseText).play)
      }
    }
    xhr.send("counter="+count+"&url="+url);
    alert("Well Played!!")
  }else{
    alert("Please add some images or try again!");
  }
}

// bind table dynamically.
function bindTable(play){
    var x=document.getElementById('play-table').insertRow(1);
    var c1=x.insertCell(0);
    var c2=x.insertCell(1);
    c1.innerHTML = '<img width="200" height="150" src="' + play.url + '">';
    c2.innerHTML = "<h1>" + play.counter + "</h1>";
}