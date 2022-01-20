import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(BlocOverrides.runZoned(
    () {
      return MyApp();
    },
    blocObserver: SimpleBlocObserver(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mahej',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomeScreen(title: 'Tabata trener'),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
