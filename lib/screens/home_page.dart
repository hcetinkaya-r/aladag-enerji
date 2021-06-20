import 'dart:convert';

import 'package:aladag_enerji/models/activity_area.dart';
import 'package:aladag_enerji/models/project.dart';
import 'package:aladag_enerji/services/activity_area_api.dart';
import 'package:aladag_enerji/services/project_api.dart';
import 'package:aladag_enerji/widgets/activity_area_tiles.dart';
import 'package:aladag_enerji/widgets/activity_areas_heading.dart';
import 'package:aladag_enerji/widgets/bottom_bar.dart';
import 'package:aladag_enerji/widgets/explore_drawer.dart';
import 'package:aladag_enerji/widgets/floating_quick_access_bar.dart';
import 'package:aladag_enerji/widgets/projects_carousel.dart';
import 'package:aladag_enerji/widgets/projects_heading.dart';
import 'package:aladag_enerji/widgets/responsive.dart';
import 'package:aladag_enerji/widgets/top_bar_contents.dart';
import 'package:aladag_enerji/widgets/web_scrollbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String onSelectedTab = 'Kurumsal';
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  List<String> topBarContents = [
    'Kurumsal',
    'Faaliyet Alanlarımız',
    'Projelerimiz',
    'Referanslarımız',
    'İnsan Kaynakları',
    'Haberler',
    'İletişim'
  ];

  List<List> quickContents = [
    ["Hakkımızda", "Değerlerimiz", "Politikamız", "Çözüm Ortaklarımız"],
    [
      "Endüstriyel Çatı Güneş Enerji Santralleri",
      "Arazi Tipi Güneş Enerji Santralleri",
      "Uzaktan İzleme Sistemi - Bakım & Onarım",
      "Proje, Mühendislik ve Yatırım Danışmanlığı"
    ],
    [
      "YEDPA Çatı GES Uygulaması",
      "Second Project",
      "Third Project",
      "Fourth Project"
    ],
    [
      "Güneş Enerji Sistemleri",
      "İnşaat & Taahhüt",
      "Yazılım Uygulamaları",
      "İklim Soğutma"
    ]
  ];

  List<Widget> imageSliders = [];
  List<ActivityArea> activityAreas = [];
  List<Project> projects = [];

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  void getDataFromApi() {
    ActivityAreaApi.getActivityAreas().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);

        this.activityAreas = list
            .map((activityArea) => ActivityArea.fromJson(activityArea))
            .toList();
      });
    });

    ProjectApi.getProjects().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);

        this.projects =
            list.map((project) => Project.fromJson(project)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    getDataFromApi();
  }

  void onTap(String val) {
    setState(() {
      onSelectedTab = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    _opacity = _scrollPosition < screenSize.width * 0.40
        ? _scrollPosition / (screenSize.width * 0.40)
        : 1;

    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100.withOpacity(0.3),
        extendBodyBehindAppBar: true,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                backgroundColor:
                    Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Aladağ Enerji',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: screenSize.height / 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: screenSize.width / 200,
                  ),
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 1000),
                child: TopBarContents(
                    _opacity, _scrollPosition, onTap, topBarContents),
              ),
        drawer: ExploreDrawer(),
        body: WebScrollbar(
          color: Colors.blueGrey,
          backgroundColor: Colors.blueGrey.withOpacity(0.3),
          width: screenSize.width / 120,
          heightFraction: 0.3,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: SizedBox(
                        height: screenSize.height * 0.45,
                        width: screenSize.width,
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/aladag-enerji.appspot.com/o/web_images%2Fges.jpg?alt=media&token=1008054c-dbcc-4607-94ed-b701c8ee807c',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        FloatingQuickAccessBar(
                          screenSize: screenSize,
                          quickContents: onSelectedTab == 'Kurumsal'
                              ? quickContents[0]
                              : onSelectedTab == 'Faaliyetler'
                                  ? quickContents[1]
                                  : onSelectedTab == 'Projelerimiz'
                                      ? quickContents[2]
                                      : quickContents[3],
                          selectedTap: onSelectedTab,
                        ),
                        Container(
                          child: Column(
                            children: [
                              ActivityAreasHeading(
                                screenSize: screenSize,
                              ),
                              ActivityAreaTiles(
                                screenSize: screenSize,
                                activityAreas: activityAreas,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // SizedBox(height: screenSize.height / 8),
                OurProjectsHeading(screenSize: screenSize),
                ProjectsCarousel(projects),
                SizedBox(height: screenSize.height / 10),
                BottomBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
