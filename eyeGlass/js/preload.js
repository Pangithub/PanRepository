/**
 * Created by Administrator on 2016/8/24.
 */
//图片预加载
;(function() {
  var oLayer = fgm.$("overlay");
  oLoad = fgm.$("load"),
    oSpan = fgm.$$("span", oLoad)[0],
    oP = fgm.$$("p", oLoad)[0],
    aData = [],
    iImgcount = 0,
    iLoaded = 0,
    aImg = [].concat("btn.gif", "ico.gif", "search.png", "loading.gif");
  for(i = 1; i <= 12; i++) aImg = aImg.concat("model_" + i + ".jpg", "big_" + i + ".jpg", "glass_" + i + ".jpg", "glass_" + i + ".png");
  for(i = 0, iImgCount = aImg.length; i < iImgCount; i++) {
    (function(i) {
      var oImg = new Image();
      oImg.onload = function() {
        oSpan.innerHTML = oP.style.width = Math.ceil(++iLoaded / iImgCount * 100) + "%";
        this.onload = null;
        var aTmp = document.createElement("img");
        aTmp.src = this.src;
        aData[i] = aTmp;
        if(aData[i] && aData.length == iImgCount) {
          fgm.animate(oLayer, {opacity:0}, {
            callback: function() {
              fgm.css(this, {display:"none"})
            }
          });
          complete()
        }
      }
      oImg.src = "img/" + aImg[i];
    })(i);
  }
})();