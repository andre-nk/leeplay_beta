import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:leeplay/domain/auth/cubit/auth_cubit.dart';
import 'package:leeplay/presentation/screens/auth/onboarding.dart';
import 'package:leeplay/presentation/screens/home/home_wrapper.dart';
import 'package:leeplay/repository/auth/auth_repository.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final lineSDK = LineSDK.instance;
    lineSDK.setup('1657026187');

    final _authRepository = AuthRepository(lineSDK: lineSDK);

    final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory(),
    );
    HydratedBlocOverrides.runZoned(
      () => runApp(AppWrapper(
        authRepository: _authRepository,
      )),
      storage: storage,
    );

    runApp(AppWrapper(authRepository: _authRepository));
  });
}

class AppWrapper extends StatelessWidget {
  final AuthRepository _authRepository;

  const AppWrapper({Key? key, required authRepository})
      : _authRepository = authRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => AuthCubit(_authRepository))],
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Leeplay',
          theme: const CupertinoThemeData(
            brightness: Brightness.dark,
            primaryColor: Color(0xFF00B903),
            scaffoldBackgroundColor: CupertinoColors.black,
            textTheme: CupertinoTextThemeData(textStyle: TextStyle(fontFamily: "SFPro")),
          ),
          home: BlocConsumer<AuthCubit, AuthState>(
            buildWhen: (previous, current) {
              return previous.isAuthenticated != current.isAuthenticated;
            },
            listener: (context, state) {
              if (state.isAuthenticated == true && state.userProfile == null) {
                context.read<AuthCubit>().getCurrentUser();
              }
            },
            builder: (context, state) {
              if (state.isAuthenticated == true) {
                return const HomeWrapper();
              } else if (state.isAuthenticated == false) {
                return const OnboardingPage();
              } else {
                return const OnboardingPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
