import 'package:aladag_enerji/models/activity_area.dart';
import 'package:aladag_enerji/widgets/responsive.dart';
import 'package:flutter/material.dart';

class ActivityAreaTiles extends StatefulWidget {
  final Size screenSize;
  final List<ActivityArea> activityAreas;

  ActivityAreaTiles({required this.screenSize, required this.activityAreas});

  @override
  _ActivityAreaTilesState createState() => _ActivityAreaTilesState();
}

class _ActivityAreaTilesState extends State<ActivityAreaTiles> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: widget.screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: widget.screenSize.width / 15),
                  ...Iterable<int>.generate(widget.activityAreas.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: widget.screenSize.width / 2.5,
                              width: widget.screenSize.width / 1.5,
                              margin: EdgeInsets.symmetric(
                                  horizontal: widget.screenSize.width / 80),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.network(
                                  widget.activityAreas[pageIndex].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: widget.screenSize.height / 70,
                              ),
                              child: Text(
                                widget.activityAreas[pageIndex].name!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .primaryTextTheme
                                      .subtitle1!
                                      .color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.06,
              left: widget.screenSize.width / 25,
              right: widget.screenSize.width / 25,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...Iterable<int>.generate(widget.activityAreas.length).map(
                    (int pageIndex) => Column(
                      children: [
                        Container(
                          height: widget.screenSize.width / 6,
                          width: widget.screenSize.width / 3.8,
                          margin: EdgeInsets.symmetric(
                              horizontal: widget.screenSize.width / 80),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              widget.activityAreas[pageIndex].image!,
                              fit: BoxFit.cover,
                              scale: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: widget.screenSize.height / 70,
                          ),
                          child: Text(
                            widget.activityAreas[pageIndex].name!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
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
