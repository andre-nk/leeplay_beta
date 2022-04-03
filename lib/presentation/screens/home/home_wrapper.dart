import 'package:flutter/cupertino.dart';
import 'package:leeplay/presentation/screens/home/homepage.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.music_note_2, size: 22),
            label: "Play"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search, size: 24),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_stack, size: 22),
            label: "Library"
          )
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            if(index == 0){
              return const Homepage();
            } else if (index == 1){
              return const Homepage();
            } else {
              return const Homepage();
            }
          },
        );
      },
    );
  }
}
