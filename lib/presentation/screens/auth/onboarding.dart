import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/auth/cubit/auth_cubit.dart';
import 'package:leeplay/repository/auth/auth_repository.dart';

import '../../../config/media_query.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: MQuery.height(1, context),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                "assets/onboarding_bg.png",
                fit: BoxFit.cover,
                width: MQuery.width(1, context),
                alignment: Alignment.center,
                filterQuality: FilterQuality.high,
              ),
              Container(
                margin: EdgeInsets.only(top: MQuery.width(0.75, context)),
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [
                      0,
                      0.4,
                      0.8,
                      1,
                    ],
                    colors: [
                      CupertinoColors.darkBackgroundGray,
                      CupertinoColors.darkBackgroundGray,
                      CupertinoColors.darkBackgroundGray.withOpacity(0.3),
                      CupertinoColors.darkBackgroundGray.withOpacity(0)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 56,
                child: Container(
                  width: MQuery.width(1, context),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/leeplay.svg"),
                      Padding(
                        padding: const EdgeInsets.only(top: 22.0),
                        child: Text(
                          "Unofficial music player for Leeplay's playlists.",
                          style: AppText.title1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Text(
                          "Bringing hours of curated playlist for your ever-changing moods and life phases.",
                          style: AppText.body,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: BlocProvider<AuthCubit>(
                          create: (context) => AuthCubit(context.read<AuthRepository>()),
                          child: CupertinoButton.filled(
                            child: Center(
                              child: Text(
                                "Get started using NAVER",
                                style: AppText.body.copyWith(
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                  color: CupertinoColors.white,
                                ),
                              ),
                            ),
                            pressedOpacity: 0.8,
                            onPressed: () async {
                              context.read<AuthCubit>().loginWithLine();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
