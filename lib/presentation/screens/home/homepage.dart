import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leeplay/config/theme.dart';
import 'package:leeplay/domain/auth/cubit/auth_cubit.dart';
import 'package:leeplay/repository/auth/auth_repository.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(context.read<AuthRepository>()),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: state.isAuthenticated
                  ? Text(state.userProfile!.displayName)
                  : const Text("Woi"),
            ),
            child: Column(
              children: [
                Text("woi", style: AppTheme.text.body),
              ],
            ),
          );
        },
      ),
    );
  }
}
