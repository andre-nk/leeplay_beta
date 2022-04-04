import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leeplay/config/media_query.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/auth/cubit/auth_cubit.dart';
import 'package:leeplay/domain/theme/cubit/theme_cubit.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSettings(
      items: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8, top: 24),
          child: Text(
            "THEME",
            style: AppText.dark.subheadline.copyWith(color: CupertinoColors.systemGrey),
          ),
        ),
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return CSSelection<int>(
              items: const <CSSelectionItem<int>>[
                CSSelectionItem<int>(text: 'Light mode', value: 0),
                CSSelectionItem<int>(text: 'Dark mode', value: 1),
              ],
              onSelected: (index) {
                if (index == 0) {
                  context.read<ThemeCubit>().switchToLightMode();
                } else {
                  context.read<ThemeCubit>().switchToDarkMode();
                }
              },
              currentSelection: state is LightTheme ? 0 : 1,
            );
          },
        ),
        const CSHeader(''),
        CSControl(
          nameWidget: Container(
            height: 46,
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            alignment: Alignment.center,
            child: Text(
              'Auto translate playlist title',
              style: AppText.dark.callout,
            ),
          ),
          contentWidget: CupertinoSwitch(
            value: false,
            onChanged: (bool value) {},
          ),
        ),
        CSButton(CSButtonType.DEFAULT, "About LEEPLAY", () {
          showCupertinoModalBottomSheet(
            elevation: 100,
            context: context,
            builder: (context) => SizedBox(
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
                          style: AppText.dark.title1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Text(
                          "Leeplay is a korean YouTube channel that regularly uploads a hand-picked playlist of independent musics from various genres. Moreover, you can find LEEPLAY's photography work (featured in every playlist video) in the official Grafolio site.",
                          style: AppText.dark.body.copyWith(height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
        const CSHeader(''),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return CSButton(CSButtonType.DESTRUCTIVE, "Logout", () {
              context.read<AuthCubit>().logoutWithLine();
            });
          },
        )
      ],
    );
  }
}
