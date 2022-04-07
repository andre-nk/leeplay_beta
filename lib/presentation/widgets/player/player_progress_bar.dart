import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:leeplay/config/theme.dart';

class PlayerProgressBar extends StatelessWidget {
  final AudioPlayer _audioPlayer;

  const PlayerProgressBar({
    Key? key,
    required audioPlayer,
  })  : _audioPlayer = audioPlayer,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration?>(
      stream: _audioPlayer.positionStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && _audioPlayer.duration != null) {
          Duration playingDuration = snapshot.data!;
          String twoDigits(int n) => n.toString().padLeft(2, "0");

          String playingMinutes = twoDigits(playingDuration.inMinutes.remainder(60));
          String playingSeconds = twoDigits(playingDuration.inSeconds.remainder(60));

          Duration totalDuration = _audioPlayer.duration!;
          String totalMinutes = twoDigits(totalDuration.inMinutes.remainder(60));
          String totalSeconds = twoDigits(totalDuration.inSeconds.remainder(60));

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                width: double.infinity,
                child: ProgressBar(
                  progress: playingDuration,
                  total: totalDuration,
                  progressBarColor: const Color(0xFF00B903),
                  bufferedBarColor: const Color(0xFF00B903),
                  baseBarColor: CupertinoColors.systemGrey,
                  thumbColor: CupertinoColors.white,
                  barHeight: 3.0,
                  thumbRadius: 8.0,
                  timeLabelPadding: 12,
                  timeLabelLocation: TimeLabelLocation.none,
                  thumbGlowRadius: 12,
                  onSeek: (duration) {
                    _audioPlayer.seek(duration);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0).copyWith(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      playingMinutes + ":" + playingSeconds,
                      style: AppText.footnote.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      totalMinutes + ":" + totalSeconds,
                      style: AppText.footnote.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                width: double.infinity,
                child: ProgressBar(
                  progress: const Duration(seconds: 0),
                  total: const Duration(seconds: 1),
                  progressBarColor: const Color(0xFF00B903),
                  bufferedBarColor: const Color(0xFF00B903),
                  baseBarColor: CupertinoColors.systemGrey,
                  thumbColor: CupertinoColors.white,
                  barHeight: 3.0,
                  thumbRadius: 8.0,
                  timeLabelPadding: 12,
                  timeLabelLocation: TimeLabelLocation.none,
                  thumbGlowRadius: 12,
                  onSeek: (duration) {
                    _audioPlayer.seek(duration);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0).copyWith(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "00:00",
                      style: AppText.footnote.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "00:00",
                      style: AppText.footnote.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}