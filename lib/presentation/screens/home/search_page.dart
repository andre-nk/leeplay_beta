import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leeplay/config/media_query.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/theme/cubit/theme_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0.0).copyWith(right: 0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(24).copyWith(left: 28.0, bottom: 0),
                child: Text(
                  "Search playlist",
                  style: AppText.title1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(top: 16.0),
                child: CupertinoSearchTextField(
                  onChanged: ((value) {}),
                  placeholder: "Search Leeplay's playlists from YouTube",
                  padding: const EdgeInsets.all(12).copyWith(top: 10),
                  prefixInsets: const EdgeInsetsDirectional.only(start: 12),
                  suffixInsets: const EdgeInsetsDirectional.only(end: 12),
                ),
              ),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Container(
                    margin: const EdgeInsets.only(top: 28),
                    width: double.infinity,
                    height: 16,
                    color: state is LightTheme ? CupertinoColors.lightBackgroundGray :  CupertinoColors.black,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0)
                          .copyWith(bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Recent", style: AppText.title3),
                          const Icon(
                            CupertinoIcons.xmark_circle_fill,
                            color: CupertinoColors.systemGrey,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MQuery.height(0.15, context),
                      child: ListView.builder(
                        itemCount: 5,
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
                                  height: MQuery.height(0.1, context),
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
                                  child: Text(
                                    "abcdefghijklmnopxxxx",
                                    style: AppText.subheadline,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        scrollDirection: Axis.horizontal,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0).copyWith(top: 16.0),
                child: GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  shrinkWrap: true, // ˝
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 3 / 2,
                  ),
                  itemBuilder: (context, index) {
                    return BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (context, state) {
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(0.0),
                            ),
                            color: state is LightTheme
                                ? CupertinoColors.lightBackgroundGray
                                : CupertinoColors.black,
                          ),
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Image.network(
                                "https://source.unsplash.com/random/500x400/?" +
                                    index.toString(),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: CupertinoColors.black.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Grid Item $index',
                                    style: AppText.subheadline.copyWith(color: CupertinoColors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
