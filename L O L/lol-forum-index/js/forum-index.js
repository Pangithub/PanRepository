/**
 * Created by Administrator on 2016/7/21.
 */
var forum={
    currIndex:1,//当前页下标
    maxIndex:13,//最大页下标
    prevIndexList:[1],//存储所有访问过的下标
	init:function(){//页面加载初始化
      $('#pager-collapse-form>.form-group>span').html('/'+this.maxIndex+'页');//
	  this.updataView(1);//默认显示第一页
	  this.doEveryThing();//启动主控制台
	},
    updataView:function(curr,ifPush){//页面更新控制主件，核心部件，可实现所有的页面跳转
        if(curr<=this.maxIndex){//防止下一页传入的下标大于最大下标(并且防止了传入的下标为非数字)
          /*$.getJSON('forum.php',{index:curr},function(data){//向服务器请求相应数据并更新到页面上
              this.dealData(data);
          }.bind(this));*/
          if(ifPush!==false){//如果是返回键传入的下标则不存储
              this.prevIndexList.push(curr);//存储正在访问的下标
          };
          var arr=$('#pager-collapse-index>li>a');//获得操作目标
        /*如果当前页不是第一页，显示 [上一页] ,否则不显示*/
          if(curr!=1){
              $('#prevPage').removeClass('i-hide').addClass('i-show');
          }else{
              $('#prevPage').removeClass('i-show').addClass('i-hide');
          };
        /*如果当前页>=6，显示 [1...]，否则不显示*/
          if(curr>=6){
              $('#toIndex').removeClass('i-hide').addClass('i-show');
          }else{
              $('#toIndex').removeClass('i-show').addClass('i-hide');
          };
        /*如果当前页-4<=0,即当前页前面不足四页，则从第一页开始显示*/
          if(curr-4<=0){
              for(var i=2;i<arr.length-1;i++){//arr.length-1=>最后一个li单独考虑
                  $(arr[i]).html(i-1);
                  if(i-1==curr){//设置当前正在访问下标的样式
                    $(arr[i]).parent().addClass('i-index-active').siblings('li.i-index-active').removeClass('i-index-active');
                  };
              };
              arr.parent('.i-nosee').removeClass('i-nosee');//先将所有下标显示出来
          }else{//否则按照公式 curr-6+i 显示,从第5页开始
            for(var i= 2,now;i<arr.length-1;i++){
                $(arr[i]).html(curr-6+i);
            };
            $(arr[6]).parent().addClass('i-index-active').siblings('li.i-index-active').removeClass('i-index-active');//当前页的位置永远不变
            arr.parent('.i-nosee').removeClass('i-nosee');//先将所有下标显示出来
          };
          /*判断哪些下标要隐藏*/
          var distance=this.maxIndex-curr;//计算最大页数与当前页的差值
          if(distance<=5){//如果最大下标<=当前下标+5,即当前页之后的可显示页数<=5,则最大下标之后的所有下标不显示(先默认有11页)
              for(i=arr.length-1;i>=arr.length-6+distance;i--){
                  $(arr[i]).parent().addClass('i-nosee');//隐藏最大下标之后的所有下标
              };
          }else{
              $(arr[arr.length-1]).html('尾页');
          }
        }
    },
    doEveryThing:function(){//主控制台,控制页面跳转和发帖
        var me=this;
        $('#pager-collapse-index').on('click','li',function(e){
            e.preventDefault();
            if(!$(this).hasClass('i-index-active')&&!$(this).hasClass('i-show')&&$(this).attr('id')!=='toLast'){//如果将要跳转的页不是当前显示的页面并且 不是 [上一页] 和 [...1] 和 [尾页]
              me.currIndex=parseInt($(this).find('a').html());//获得将要访问的页面下标
              me.updataView(me.currIndex);
            }else{
                if($(this).attr('id')==='toIndex'){//如果是返回第一页
                    me.updataView(1);
                }else if($(this).attr('id')==='prevPage'){//如果是上一页
                    me.prevPage();
                }else if($(this).attr('id')==='toLast'){//如果是尾页
                    me.updataView(me.maxIndex);
                }
            }
        });
        $('#return').on('click',function(e){//绑定【返回】事件监听，取出prevIndexList的倒数第二个值
            e.preventDefault();
            if(me.prevIndexList.length!=1){//如果数组中只有1，则无法返回
                me.prevIndexList.pop();
                me.updataView(me.prevIndexList[me.prevIndexList.length-1],false);
            }
        });
        $('#next').on('click',function(e){//绑定下一页事件监听事件
            e.preventDefault();
            me.nextPage();
        });
        $('#page-jump-btn').on('click',function(){//绑定跳转到任意页事件监听
            var curr=parseInt($('#page-jump').val());
            me.updataView(curr);
        });
    },
    prevPage:function(){//下标更新控制辅件，返回上一页
        var curr=parseInt($('#pager-collapse-index>li.i-index-active>a').html());
        this.updataView(curr-1);
    },
    nextPage:function(){//下标更新控制辅件，下一页
        var curr=parseInt($('#pager-collapse-index>li.i-index-active>a').html());
        this.updataView(curr+1);
    },
    dealData:function(data){//处理服务器返回的数据并更新页面
        //this.maxIndex=data.totalPages;//最大页下标
		var gather=data.data;//当前页的帖子集合
        for(var i=0;i<data.currPosts;i++){
            var html=`<tr id=${gather[i].pid}>
                <td>
				  <img src="img/praise_01.png" alt="">
                  <p class="text-muted">${gather[i].zan}</p>
				</td>
                <td class="i-txt-middle"><a href="#" class="text-warning">${gather[i].theme}</a></td>
                <td class="i-txt-middle"><a href="#" class="text-danger">${gather[i].title}</a></td>
                <td>
                  <a href="#">${gather[i].uname}</a>
                  <p>${gather[i].ptime}</p>
                </td>
                <td class="i-txt-middle"><a href="#">${gather[i].follow}</a></td>
                <td>
                  <a href="#">${gather[i].rname}</a>
                  <p>${gather[i].rtime}</p>
                </td>
            </tr>`;
            $('#posts tbody').append(html);
        };

    },
};
var data={
  'totalPosts':1,//帖子总数
  'totalPages':1,//总页数
  'pageCount':5,//每页帖子数
  'currPosts':1,//当前页的帖子数
  'data':[//帖子集合
    {
	  'pid':'p3',//帖子id
      'zan':123,//点赞人数
      'theme':'[公告]',
	  'title':'【活动】免费领取12900点券和限定永久皮肤',//帖子标题
	  'uname':'爱萝莉',//作者名字
      'ptime':'2016-07-03 13:20', //发布时间
        'follow':666,//回复数量
        'rname':'厂长',//最后回复人名字
      'rtime':'2016-07-04 13:20'//回复时间
	}
  ]
};
//console.log(data);
forum.dealData(data);
//forum.doEveryThing();
forum.init();


