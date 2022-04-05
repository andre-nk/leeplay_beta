import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/auth/cubit/auth_cubit.dart';
import 'package:leeplay/domain/theme/cubit/theme_cubit.dart';
import 'package:leeplay/presentation/widgets/home/about_leeplay_bottomsheet.dart';
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
            style: AppText.subheadline.copyWith(color: CupertinoColors.systemGrey),
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
              style: AppText.callout,
            ),
          ),
          contentWidget: CupertinoSwitch(
            value: false,
            onChanged: (bool value) {},
          ),
        ),
        CSButton(CSButtonType.DEFAULT, "About LEEPLAY", () {
          showCupertinoModalBottomSheet(
            context: context,
            builder: (context) => const AboutLeeplayBottomSheet()
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
