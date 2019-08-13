import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plute/api/book_api.dart';
import 'package:plute/tools/app_pref.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BookApi bookApi = BookApi();

  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var lastSearch = AppPref.getSearch();
    print(lastSearch);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        allowFontScaling: true);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(290),
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Plute',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil().setSp(35),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        height: ScreenUtil().setHeight(87),
                        width: ScreenUtil().setWidth(600),
                        decoration: BoxDecoration(color: Colors.white),
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              filled: true,
                              contentPadding: const EdgeInsets.all(12)),
                          maxLines: 1,
                          textInputAction: TextInputAction.search,
                          onFieldSubmitted: (term) {
                            _lookUp();
                          },
                        )),
                  )
                ],
              ),
            ),
            Align(
                    heightFactor: ScreenUtil().setHeight(10),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.bookOpen,
                          color: Colors.blueAccent,
                          size: 50,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(45)),
                        Text('New Here!'),
                        Text('Click on the search bar to begin')
                      ],
                    ),
                  )
          ],
        ),
      ),
    ));
  }

  _lookUp() {
    if (searchController.text.trim().isEmpty) {
      print('empty');
    }

    if (searchController.text.trim().isNotEmpty) {
      AppPref.setSearch(searchController.text);
      bookApi.search(searchController.text);
    }
  }
}
