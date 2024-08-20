import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/view/components/JSDrawerScreen.dart';
import 'package:job_search/view/components/JSReviewAndSaVeComponent.dart';
import 'package:job_search/data/model/JSPopularCompanyModel.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSDataGenerator.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';

class JSReviewAndSaveScreen extends StatefulWidget {
  const JSReviewAndSaveScreen({Key? key}) : super(key: key);

  @override
  _JSReviewAndSaveScreenState createState() => _JSReviewAndSaveScreenState();
}

class _JSReviewAndSaveScreenState extends State<JSReviewAndSaveScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<JSPopularCompanyModel> reviewDraftList = getReviewDraftList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: JSDrawerScreen(),
      appBar: jsAppBar(context,
          notifications: true,
          message: true,
          bottomSheet: true,
          backWidget: true,
          homeAction: true, callBack: () {
        setState(() {});
        scaffoldKey.currentState!.openDrawer();
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Container(
              color: appStore.isDarkModeOn
                  ? scaffoldDarkColor
                  : JPColors.js_backGroundColor,
              child:
                  Text("Review draft and save", style: boldTextStyle(size: 24)),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              alignment: Alignment.topLeft,
              width: context.width(),
            ),
            ListView.builder(
              itemCount: reviewDraftList.length,
              padding: EdgeInsets.all(8),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                JSPopularCompanyModel data = reviewDraftList[index];

                return JSReviewAndSaVeComponent(reviewDraftList: data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
