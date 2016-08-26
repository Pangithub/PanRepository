/**
 * Created by Administrator on 2016/8/24.
 */
var data = [{
  img: "img/1.jpg",
  tit: "Bubble Witch Saga",
  url: "javascript:;"
},
  {
    img: "img/2.jpg",
    tit: "GolMania",
    url: "javascript:;"
  },
  {
    img: "img/3.jpg",
    tit: "Bug Village",
    url: "javascript:;"
  },
  {
    img: "img/4.jpg",
    tit: "Dragon Age Legends",
    url: "javascript:;"
  },
  {
    img: "img/5.jpg",
    tit: "Triple Town",
    url: "javascript:;"
  },
  {
    img: "img/6.jpg",
    tit: "GolMania",
    url: "javascript:;"
  },
  {
    img: "img/7.jpg",
    tit: "GT Racing: Motor Academy",
    url: "javascript:;"
  },
  {
    img: "img/8.jpg",
    tit: "Dragons of Atlantis",
    url: "javascript:;"
  },
  {
    img: "img/9.jpg",
    tit: "Edgeworld",
    url: "javascript:;"
  },
  {
    img: "img/10.jpg",
    tit: "Bejeweled Blitz",
    url: "javascript:;"
  },
  {
    img: "img/11.jpg",
    tit: "Backyard Monsters",
    url: "javascript:;"
  }];

var aImg = function() {
  for(var i = data.length, aResult = []; i--;) aResult = aResult.concat(data[i].img, data[i].img.replace(/(\d+)/g, "$1_"));
  return aResult
}();

var example = null;

new Loading("example", aImg, function() {
  example || (example = new Google("example", data).autoPlay(5000));
});