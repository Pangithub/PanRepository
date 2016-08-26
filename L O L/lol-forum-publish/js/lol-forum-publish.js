/**
 * Created by Administrator on 2016/8/9.
 */
var publish = {
  editor:null,//富文本编辑器对象
  init:function(){//初始化
   this.editor= this.richEditor();
    this.themeChoose();
    this.publishPost();
  },
  richEditor: function () {//富文本编辑器
    //创建
    var editor = new wangEditor('editor-trigger');
    //配置自定义菜单
    editor.config.menus = [
      'source',
      '|',
      'bold',
      'underline',
      'italic',
      'strikethrough',
      'eraser',
      'forecolor',
      'bgcolor',
      '|',
      'quote',
      'fontfamily',
      'fontsize',
      'head',
      'unorderlist',
      'orderlist',
      'alignleft',
      'aligncenter',
      'alignright',
      '|',
      'link',
      'unlink',
      'table',
      'emotion',
      '|',
      'img',
      'video',
      'location',
      'insertcode',
      '|',
      'undo',
      'redo',
      'fullscreen'
    ];
    editor.create();
    // 初始化编辑器的内容
    editor.$txt.html('');
    return editor;
  },
  themeChoose: function () {
    $('#write-post-dropdownMenu').children('li').click(function () {
      var theme = $(this).children('a').html();
      $('#write-post-dropdownBtn').children('span').first().html(theme);
    })
  },
  publishPost: function () {//绑定发帖事件
    var me=this;
    $('#publish-post').click(function () {
      var theme,
        title,
        html=me.editor.$txt.html(),
        uid;
      if ((theme=$('#write-post-dropdownBtn').children('span').first().html()) === '请选择主题分类') {//如果未选择主题
        me.errHint('err1');
      } else if ((title=$('#inputTitle').val()).length === 0) {//如果标题字数为0
        me.errHint('err2');
      } else if (me.editor.$txt.text().length<15) {//如果内容为空
        me.errHint('err3');
      } else {//否则
        var data = {//编写要发送给服务器端的数据
          uid:uid,//用户id
          theme: theme,//主题
          title: title,//标题
          content: html,//内容
          ptime:new Date().getTime(),//发布时间
        };
        /*$.post('sendPostData.php', data, function (data) {//发送给服务器端
          if (!data.msg) {
            alert('帖子发送失败，请再来一次！');//如果返回数据位false,则存储数据失败
          } else {//否则跳转到发帖成功页面
            $.get('sendSuccess.html', function () {
            });//跳转到发帖成功页面
            $.get('./forumIndex/forum.html', function () {
            });//返回论坛首页
          }
        })*/
      }
    })
  },
  errHint:function(err){
   $('#errHintBtn').click();
    if(err==='err1'){
      $('#errHintModal .modal-body').children('span').html('请选择主题分类')
    }else if(err==='err2'){
      $('#errHintModal .modal-body').children('span').html('帖子标题不能为空')
    }else if(err==='err3'){
      $('#errHintModal .modal-body').children('span').html('帖子内容不能少于15字')
    }
  },
  failHint:function(){

  },
}
publish.init();
