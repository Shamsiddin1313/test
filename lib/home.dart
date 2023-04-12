import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screen/request_page.dart';
import 'package:test_app/theme/style.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  /// --- Life-cycle ---

  @override
  void initState() {
    super.initState();
  }

  /// --- Listeners ---

  /// --- Methods ---

  /// --- Widgets ---

  Widget buildItem(int index) {
    switch (index) {
      case 0:
        return const SizedBox();
      case 1:
        return const RequestPage();

      case 2:
        return const SizedBox();
      case 3:
        return const SizedBox();

      case 4:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  List<BottomNavigationBarItem> get tabItems => [
        const BottomNavigationBarItem(icon: Icon(Icons.home)),
        const BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined)),
        const BottomNavigationBarItem(icon: Icon(Icons.add)),
        const BottomNavigationBarItem(icon: Icon(Icons.search)),
        const BottomNavigationBarItem(icon: Icon(Icons.person))
      ];

  Widget tabScaffold() => CupertinoTabScaffold(
      backgroundColor: Style.colors.white,
      tabBar: CupertinoTabBar(
          iconSize: 24.0,
          items: tabItems,
          activeColor: Style.colors.blue,
          inactiveColor: Style.colors.grey,
          backgroundColor: Style.colors.white),
      tabBuilder: (_, index) => buildItem(index));

  @override
  Widget build(BuildContext context) =>
      CupertinoPageScaffold(child: tabScaffold());
}
