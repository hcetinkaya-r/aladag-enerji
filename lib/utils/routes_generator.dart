import 'package:aladag_enerji/screens/contact_page.dart';
import 'package:aladag_enerji/screens/home_page.dart';
import 'package:aladag_enerji/screens/human_resources_page.dart';
import 'package:aladag_enerji/screens/news_page.dart';
import 'package:aladag_enerji/utils/routes_name.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.HUMAN_RESOURCES_PAGE:
        return _GeneratePageRoute(
            widget: HumanResourcesPage(), routeName: settings.name.toString());
      case RoutesName.NEWS_PAGE:
        return _GeneratePageRoute(
            widget: NewsPage(), routeName: settings.name.toString());
      case RoutesName.CONTACT_PAGE:
        return _GeneratePageRoute(
            widget: ContactPage(), routeName: settings.name.toString());
      default:
        return _GeneratePageRoute(
            widget: HomePage(), routeName: settings.name.toString());
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            },
            transitionDuration: Duration.zero,
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: Offset(0.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
