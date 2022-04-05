import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leeplay/domain/theme/cubit/theme_cubit.dart';
import 'package:leeplay/presentation/widgets/home/new_playlist.dart';
import 'package:leeplay/presentation/widgets/home/playlist_carousel.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return SvgPicture.asset(
                    "assets/leeplay.svg",
                    color: state is LightTheme
                        ? CupertinoColors.black
                        : CupertinoColors.white,
                  );
                },
              ),
            ),
            const NewPlaylist(),
            PlaylistCarousel(
              carouselTitle: "Just for you",
              seeAllOnTap: () {},
              itemCount: 5,
            ),
            PlaylistCarousel(
              carouselTitle: "Jump back in",
              seeAllOnTap: () {},
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
