import 'package:challenge_tyba/features/universities/presentation/bloc/list_type/list_type_bloc.dart';
import 'package:challenge_tyba/features/universities/presentation/bloc/universities/universities_bloc.dart';
import 'package:challenge_tyba/features/universities/presentation/ui/list_page.dart';
import 'package:challenge_tyba/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:challenge_tyba/injection.dart' as di;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UniversityBloc>()),
        BlocProvider(create: (context) => sl<ListTypeBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple
        ),
        home: ListPage(),
      ),
    );
  }
}

