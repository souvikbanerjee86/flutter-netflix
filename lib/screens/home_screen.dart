import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = new ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          child: CustomAppBar(
            scrollOffset: _scrollOffset,
          ),
          preferredSize: Size(screenSize.width, 60.0),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[850],
          onPressed: () => print("Pressed"),
          child: Icon(Icons.cast),
        ),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ContentHeader(featuredContent: sintelContent),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 20.0),
              sliver: SliverToBoxAdapter(
                child: Previews(
                  key: PageStorageKey('homeScreen'),
                  title: 'Previews',
                  contentList: previews,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('List'),
                  title: 'My List',
                  contentList: myList),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('Originals'),
                  title: 'NetFlix Originals',
                  contentList: originals,
                  isOriginal: true),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 10),
              sliver: SliverToBoxAdapter(
                child: ContentList(
                    key: PageStorageKey('Trending'),
                    title: 'Trending',
                    contentList: trending),
              ),
            ),
          ],
        ));
  }
}
