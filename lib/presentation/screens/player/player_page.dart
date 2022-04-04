import 'package:flutter/cupertino.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: const Icon(CupertinoIcons.back),
        trailing: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(CupertinoIcons.heart),
            ),
            Icon(CupertinoIcons.share)
          ],
        ),
      ),
      child: Column(
        children: const [
          
        ],
      ),
    );
  }
}
