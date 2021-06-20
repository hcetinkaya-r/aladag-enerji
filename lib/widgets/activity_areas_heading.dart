import 'package:aladag_enerji/widgets/responsive.dart';
import 'package:flutter/material.dart';

class ActivityAreasHeading extends StatelessWidget {
  const ActivityAreasHeading({
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                Text(
                  'Faaliyet Alanlarımız',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Electrolize',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Firma İsmi',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontFamily: 'Electrolize',
                  ),
                ),
                SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Faaliyet Alanlarımız',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Electrolize',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Firma İsmi',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontFamily: 'Electrolize',
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
