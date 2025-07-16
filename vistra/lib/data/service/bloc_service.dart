import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vistra/bloc/sing%20in/sing_in_bloc.dart';
import 'package:vistra/data/repository/implements/sing_in_repo.dart';

class BlocService {
  BlocService._privateConstructor();

  static final BlocService instance = BlocService._privateConstructor();

  List<SingleChildWidget> getProviders() {
    return [
      BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(signInRepo: SignInRepo()),
      ),
    ];
  }
}
