import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_2/Cubits/addCubit.dart';
import 'package:flutter_application_2/Cubits/followers_cubit.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLang.dart';
import 'package:flutter_application_2/Cubits/lang_change/changeLangState.dart';
import 'package:flutter_application_2/Cubits/nav_Bar/navBarCubit.dart';
import 'package:flutter_application_2/Model/Shared_preference.dart';

import 'package:flutter_application_2/Model/routes.dart';
import 'package:flutter_application_2/firebase_options.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';

// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_application_2/routes.dart';
// import 'package:flutter_application_2/score_screen.dart';
// import 'package:flutter_application_2/Score_counter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();

  await SharedPref.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => NavBarCubit()),
    BlocProvider(create: (context) => ChangeLangCubit()),
    BlocProvider(create: (context) => FollowersCubit()),
  ], child: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    String? sharedPrefLang = SharedPref.getLang();
    if (sharedPrefLang != null) {
      ChangeLangCubit.get(context).changeLang();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLangCubit, ChangeLangState>(
      builder: (BuildContext context, state) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(ChangeLangCubit.get(context).lang.toString()),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routing.generateRoute,
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}





// import 'package:flutter/material.dart';
// // import 'package:flutter_application_2/Cubits/addCubit.dart';
// import 'package:flutter_application_2/Cubits/followers_cubit.dart';
// import 'package:flutter_application_2/Cubits/lang_change/changeLang.dart';
// import 'package:flutter_application_2/Cubits/lang_change/changeLangState.dart';
// import 'package:flutter_application_2/Cubits/nav_Bar/navBarCubit.dart';
// import 'package:flutter_application_2/Model/Shared_preference.dart';

// import 'package:flutter_application_2/Model/routes.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_gen/gen_l10n/app_localization.dart';

// // import 'package:path/path.dart';
// // import 'package:provider/provider.dart';
// // import 'package:flutter_application_2/routes.dart';
// // import 'package:flutter_application_2/score_screen.dart';
// // import 'package:flutter_application_2/Score_counter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SharedPref.init();
//   runApp(const App());
// }

// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   void initState() {
//     super.initState();
//     String? sharedPrefLang = SharedPref.getLang();
//     if (sharedPrefLang != null) {
//       ChangeLangCubit.get(context).changeLang();
//     }
//   }

//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => NavBarCubit()),
//         BlocProvider(create: (context) => ChangeLangCubit()),
//         BlocProvider(create: (context) => FollowersCubit()),
//         // BlocProvider(create: (context) => AddAmatchCubit())
//       ],
//       child: BlocBuilder<ChangeLangCubit, ChangeLangState>(
//         builder: (BuildContext context, state) {
//           return MaterialApp(
//             localizationsDelegates: AppLocalizations.localizationsDelegates,
//             supportedLocales: AppLocalizations.supportedLocales,
//             locale: Locale(ChangeLangCubit.get(context).lang.toString()),
//             debugShowCheckedModeBanner: false,
//             onGenerateRoute: Routing.generateRoute,
//           );
//         },
//       ),
//     );
//   }
// }






