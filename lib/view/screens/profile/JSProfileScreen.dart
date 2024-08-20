import 'package:flutter/material.dart';
import 'package:job_search/view/screens/edit_profile/EditProfileScreen.dart';
import 'package:job_search/view/widgets/profile/UserInfoItem.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:job_search/view/components/JSCvComponent.dart';
import 'package:job_search/view/components/JSDrawerScreen.dart';
import 'package:job_search/data/model/JSPopularCompanyModel.dart';
import 'package:job_search/core/utils/JSColors.dart';
import 'package:job_search/core/utils/JSDataGenerator.dart';
import 'package:job_search/core/utils/JSWidget.dart';
import 'package:job_search/main.dart';

class JSProfileScreen extends StatefulWidget {
  const JSProfileScreen({Key? key}) : super(key: key);

  @override
  _JSProfileScreenState createState() => _JSProfileScreenState();
}

class _JSProfileScreenState extends State<JSProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  List<JSPopularCompanyModel> skillList = getSkillList();

  TabController? controller;

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: JSDrawerScreen(),
        appBar: jsAppBar(context,
            backWidget: true,
            homeAction: true,
            message: false,
            notifications: false,
            bottomSheet: true, callBack: () {
              setState(() {});
              scaffoldKey.currentState!.openDrawer();
            }),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    boxShape: BoxShape.circle,
                    border: Border.all(color: JPColors.js_primaryColor, width: 4),
                    backgroundColor: context.scaffoldBackgroundColor,
                  ),
                  padding: EdgeInsets.all(24),
                  child: Text('SJ', style: boldTextStyle(size: 22)),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Smit Jhon', style: boldTextStyle(size: 22)),
                        IconButton(
                          onPressed: () {
                            // التنقل إلى صفحة EditProfileScreen عند النقر
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditProfileScreen()),
                            );
                          },
                          icon: Icon(Icons.edit, color: JPColors.js_primaryColor),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: context.iconColor),
                        8.width,
                        Text('London', style: boldTextStyle()),
                      ],
                    ),
                  ],
                ).expand()
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 16),
            TabBar(
              labelColor: appStore.isDarkModeOn ? white : black,
              unselectedLabelColor: gray,
              isScrollable: false,
              indicatorColor: JPColors.js_primaryColor,
              tabs: [
                Tab(
                  child: Text("CV", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                Tab(
                  child: Text("About me", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ],
              controller: controller,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  JSCvComponent(),
                  ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      UserInfoItem(label: "First Name", value: "Smit"),
                      UserInfoItem(label: "Last Name", value: "Jhon"),
                      UserInfoItem(label: "Father's Name", value: "John"),
                      UserInfoItem(label: "Email", value: "smit.jhon@example.com"),
                      UserInfoItem(label: "City", value: "London"),
                      UserInfoItem(label: "Phone", value: "+44 123 456 789"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
