import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leeplay/config/media_query.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/theme/cubit/theme_cubit.dart';

class AboutLeeplayBottomSheet extends StatelessWidget {
  const AboutLeeplayBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MQuery.height(0.45, context),
      child: CupertinoPageScaffold(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return SvgPicture.asset(
                    "assets/leeplay.svg",
                    color: state is LightTheme
                        ? CupertinoColors.black
                        : CupertinoColors.white,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Text(
                  "리플레이 LEEPLAY",
                  style: AppText.title1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: Text(
                  "Leeplay is a korean YouTube channel that regularly uploads a hand-picked playlist of independent musics from various genres. Moreover, you can find LEEPLAY's photography work (featured in every playlist video) in the official Grafolio site.",
                  style: AppText.body.copyWith(height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
