import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/auth/cubit/auth_cubit.dart';
import 'package:leeplay/presentation/screens/auth/onboarding.dart';
import 'package:leeplay/presentation/screens/home/homepage.dart';
import 'package:leeplay/repository/auth/auth_repository.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final lineSDK = LineSDK.instance;
    lineSDK.setup('1657026187');

    final _authRepository = AuthRepository(lineSDK: lineSDK);

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
        providers: [
          BlocProvider(create: (_) => AuthCubit(_authRepository))
        ],
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Leeplay',
          theme: CupertinoThemeData(
            brightness: Brightness.dark,
            primaryColor: CupertinoColors.systemPink,
            textTheme: CupertinoTextThemeData(textStyle: AppTheme.text.body),
          ),
          home: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (previous, current){
              return previous.isAuthenticated != current.isAuthenticated;
            },
            builder: (context, state) {
              if(state.isAuthenticated == true){
                return const Homepage();
              } else if (state.isAuthenticated == false){
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