import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:leeplay/presentation/widgets/player/play_pause_button.dart';
import 'package:leeplay/presentation/widgets/player/player_progress_bar.dart';
import 'package:marquee/marquee.dart';

import 'package:leeplay/config/media_query.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/theme/cubit/theme_cubit.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _audioPlayer
        .setAudioSource(
          AudioSource.uri(Uri.parse(
              "https://rr3---sn-2uuxa3vh-ngbz.googlevideo.com/videoplayback?expire=1649322954&ei=aldOYs_sFsvK4-EPmuKCgAo&ip=36.73.133.58&id=o-AGgflC9pyc0v4ga3H0gCFEqAonJS5YVAdUvrUqkuRJvt&itag=251&source=youtube&requiressl=yes&mh=e8&mm=31%2C29&mn=sn-2uuxa3vh-ngbz%2Csn-npoe7n76&ms=au%2Crdu&mv=m&mvi=3&pcm2cms=yes&pl=20&initcwndbps=483750&spc=4ocVC3ydoyPY8XgS1q322q6ICQEj&vprv=1&mime=audio%2Fwebm&ns=pOlCg9ha2ymPnxUeuvSw1YkG&gir=yes&clen=60004826&dur=3501.621&lmt=1604861569195236&mt=1649300937&fvip=2&keepalive=yes&fexp=24001373%2C24007246&c=WEB&txp=5511222&n=0aN04c0DVWAWhBQPN&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpcm2cms%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRQIhAIpNoleBnApnY3L9rFOtGbu2iZzWvidLzKEh1JggbKw_AiAqRi_-U1NromuTaiqx7_nkiFAJVT8ZDp9s5ZH_6QfItg%3D%3D&sig=AOq0QJ8wRQIgSzrO93SFvrH4hPZWqvyjsdUtx39hAV_bWA58Tio3jOwCIQDTKQ-uKjqOL-ohaDTzwK8EIoIWkgzOKLNVhoYSsah0OQ==")),
        )
        .catchError(
          (error) {},
        );
    
    _audioPlayer.playerStateStream.listen((event) {
      if(event.processingState == ProcessingState.ready){
        print("I listened!");
        _audioPlayer.play();
      }
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(CupertinoIcons.back, size: 22),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 2.0),
              child: CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(CupertinoIcons.heart, size: 24),
              ),
            ),
            CupertinoButton(
              minSize: 0,
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(CupertinoIcons.share, size: 22),
            ),
          ],
        ),
      ),
      child: ListView(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset("assets/sample_thumb.png",
                fit: BoxFit.cover,
                width: MQuery.width(1, context),
                alignment: Alignment.center),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0)
                .copyWith(bottom: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: SizedBox(
                      height: 36,
                      child: Marquee(
                        text: "우리 나중에 파리 여행 가면 에펠탑 보면서 같이 듣자",
                        style: AppText.title3,
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        blankSpace: 20.0,
                        velocity: 20.0,
                        startPadding: 10.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 36,
                  child: Center(
                    child: CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(CupertinoIcons.info, size: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PlayerProgressBar(audioPlayer: _audioPlayer),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          CupertinoIcons.backward_fill,
                          size: 32,
                          color: state is LightTheme
                              ? CupertinoColors.black
                              : CupertinoColors.white,
                        ),
                      ),
                      StreamBuilder<PlayerState>(
                        stream: _audioPlayer.playerStateStream,
                        builder: (_, snapshot) {
                          return PlayPauseButton(
                            audioPlayer: _audioPlayer,
                            themeState: state,
                            playerState: snapshot.data,
                          );
                        },
                      ),
                      CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          CupertinoIcons.forward_fill,
                          size: 32,
                          color: state is LightTheme
                              ? CupertinoColors.black
                              : CupertinoColors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
