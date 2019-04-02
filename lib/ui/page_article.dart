import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xu/http/api.dart';
import 'package:flutter_xu/ui/article_item.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ///滑动控制器
  ScrollController _controller = new ScrollController();

  ///控制正在加载的显示
  bool _isHide = true;

  ///请求到的文章数据
  List articles = [];

  ///banner图
  List banners = [];

  ///总文章数有多少
  var totalCount = 0;

  ///分页加载，当前页码
  var curPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      ///获得 SrollController 监听控件可以滚动的最大范围
      var maxScroll = _controller.position.maxScrollExtent;

      ///获得当前位置的像素值
      var pixels = _controller.position.pixels;

      ///当前滑动位置到达底部，同时还有更多数据
      if (maxScroll == pixels && curPage < totalCount) {
        ///加载更多
        _getArticlelist();
      }
    });

    /// 因为这一个方法就是去请求文章列表与banner图，下拉刷新需要重新请求
    /// 然而初始化数据也是请求相同的数据，所以在initState初始化数据的时候手动请求一次！
    _pullToRefresh();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _getArticlelist([bool update = true]) async {
    /// 请求成功是map，失败是null
    var data = await Api.getArticleList(curPage);
    if (data != null) {
      var map = data['data'];
      var datas = map['datas'];

      ///文章总数
      totalCount = map["pageCount"];

      if (curPage == 0) {
        articles.clear();
      }
      curPage++;
      articles.addAll(datas);

      ///更新ui
      if (update) {
        setState(() {});
      }
    }
  }

  _getBanner([bool update = true]) async {
    var data = await Api.getBanner();
    if (data != null) {
      banners.clear();
      banners.addAll(data['data']);
      if (update) {
        setState(() {});
      }
    }
  }

  ///下拉刷新
  Future<void> _pullToRefresh() async {
    curPage = 0;

    ///组合两个异步任务，创建一个都完成后的新的Future
    Iterable<Future> futures = [_getArticlelist(), _getBanner()];
    await Future.wait(futures);
    _isHide = false;
    setState(() {});
    return null;
  }

  ///布局
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///正在加载
        Offstage(
          offstage: !_isHide, //是否隐藏
          child: new Center(child: CircularProgressIndicator()),
        ),

        ///内容
        Offstage(
          offstage: _isHide,

          ///SwipeRefresh 下拉刷新组件
          child: new RefreshIndicator(
              child: ListView.builder(
                //条目数 +1代表了banner的条目
                itemCount: articles.length + 1,
                //adapter条目item 视图生成方法
                itemBuilder: (context, i) => _buildItem(i),

                controller: _controller,
              ),
              onRefresh: _pullToRefresh),
        ),
      ],
    );
  }

  Widget _buildItem(int i) {
    if (i == 0) {
      //Container ：容器
      return new Container(
        //MediaQuery.of(context).size.height: 全屏幕高度
        height: MediaQuery.of(context).size.height * 0.3,
        child: _bannerView(),
      );
    }
    var itemData = articles[i - 1];
    return new ArticleItem(itemData);
  }

  Widget _bannerView() {
    //map:转换 ,将List中的每一个条目执行 map方法参数接收的这个方法,这个方法返回T类型，
    //map方法最终会返回一个  Iterable<T>
    List<Widget> list = banners.map((item) {
      return Image.network(item['imagePath'], fit: BoxFit.cover); //fit 图片充满容器
    }).toList();
    return list.isNotEmpty
        ? BannerView(
            list,
            //控制轮播时间
            intervalDuration: const Duration(seconds: 3),
          )
        : null;
  }
}
