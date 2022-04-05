import 'package:flutter/cupertino.dart';
import 'package:leeplay/config/media_query.dart';
import 'package:leeplay/config/theme.dart';

class PlaylistCarousel extends StatelessWidget {
  const PlaylistCarousel(
      {Key? key, required carouselTitle, required seeAllOnTap, required itemCount})
      : _carouselTitle = carouselTitle,
        _itemCount = itemCount,
        _seeAllOnTap = seeAllOnTap,
        super(key: key);

  final String _carouselTitle;
  final VoidCallback _seeAllOnTap;
  final int _itemCount; //temporary

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(_carouselTitle, style: AppText.title3),
              ),
              CupertinoButton(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, right: 8.0),
                      child: Text(
                        "see all",
                        style: AppText.subheadline
                            .copyWith(color: CupertinoColors.systemGrey),
                      ),
                    ),
                    const Icon(
                      CupertinoIcons.chevron_right,
                      size: 20,
                      color: CupertinoColors.systemGrey,
                    )
                  ],
                ),
                onPressed: _seeAllOnTap,
              )
            ],
          ),
          SizedBox(
            height: MQuery.height(0.2, context),
            child: ListView.builder(
              itemCount: _itemCount,
              itemBuilder: ((context, index) {
                return Container(
                  margin: index == 0
                      ? const EdgeInsets.only(left: 24, right: 18)
                      : const EdgeInsets.only(right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MQuery.height(0.125, context),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.asset(
                            "assets/sample_thumb.png",
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 32,
                      //   width: 200,
                      //   child: Marquee(
                      //     text: "우리 나중에 파리 여행 가면 에펠탑 보면서 같이 듣자",
                      //     style: AppTheme.text.subheadline,
                      //     scrollAxis: Axis.horizontal,
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     blankSpace: 20.0,
                      //     velocity: 20.0,
                      //     startPadding: 10.0,
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: Text("abcdefghijklmnopqrstuvwx",
                            style: AppText.subheadline),
                      ),
                      Text(
                        "58 minutes",
                        style: AppText.footnote
                            .copyWith(color: CupertinoColors.systemGrey),
                      )
                    ],
                  ),
                );
              }),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
