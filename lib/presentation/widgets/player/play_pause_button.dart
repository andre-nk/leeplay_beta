import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:leeplay/domain/theme/cubit/theme_cubit.dart';

class PlayPauseButton extends StatelessWidget {
  final AudioPlayer _audioPlayer;
  final ThemeState _themeState;
  final PlayerState? _playerState;

  const PlayPauseButton({
    Key? key,
    required audioPlayer,
    required themeState,
    required playerState,
  })  : _themeState = themeState,
        _playerState = playerState,
        _audioPlayer = audioPlayer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final processingState = _playerState?.processingState;

    if (processingState == ProcessingState.loading) {
      return Container(
        margin: const EdgeInsets.all(8.0),
        width: 72.0,
        height: 72.0,
        child: const CupertinoActivityIndicator(
          radius: 16.0,
        ),
      );
    } else if (_audioPlayer.playing != true) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {
            _audioPlayer.play();
          },
          child: Icon(
            CupertinoIcons.play_circle_fill,
            size: 72,
            color:
                _themeState is LightTheme ? CupertinoColors.black : CupertinoColors.white,
          ),
        ),
      );
    } else if (_audioPlayer.playing) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {
            _audioPlayer.pause();
          },
          child: Icon(
            CupertinoIcons.pause_circle_fill,
            size: 72,
            color:
                _themeState is LightTheme ? CupertinoColors.black : CupertinoColors.white,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {
            _audioPlayer.pause();
          },
          child: Icon(
            CupertinoIcons.pause_circle_fill,
            size: 72,
            color:
                _themeState is LightTheme ? CupertinoColors.black : CupertinoColors.white,
          ),
        ),
      );
    }
  }
}
