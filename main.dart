import 'package:memoiresunday/modules/signup/signup_screen.dart';
import 'package:memoiresunday/modules/welcome_screen.dart';
import 'package:memoiresunday/shared/components/constants.dart';
import 'package:memoiresunday/shared/network/cache_helper.dart';
import 'package:memoiresunday/shared/style/theme.dart';
import 'layout/cubit/appcubit.dart';
import 'layout/cubit/appstates.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var isDark = CacheHelper.getDAta(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            AppCubit()..changeAppMode(Dark: isDark),
        child: BlocConsumer<AppCubit, AppStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                  floatingActionButtonTheme:
                      const FloatingActionButtonThemeData(
                          backgroundColor: Colors.blueAccent),
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.blueAccent,
                      elevation: 20.0),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                      titleSpacing: 20.0,
                      iconTheme: IconThemeData(color: Colors.black),
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarBrightness: Brightness.dark,
                      ),
                      color: Colors.white,
                      elevation: 0.0)),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: HexColor('333739'),
                  primarySwatch: Colors.blue,
                  floatingActionButtonTheme:
                      const FloatingActionButtonThemeData(
                    backgroundColor: Colors.blueAccent,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      backgroundColor: HexColor('333739'),
                      type: BottomNavigationBarType.fixed,
                      unselectedItemColor: Colors.grey,
                      selectedItemColor: Colors.blueAccent,
                      elevation: 20.0),
                  appBarTheme: AppBarTheme(
                      iconTheme: const IconThemeData(color: Colors.white),
                      titleTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      backwardsCompatibility: false,
                      systemOverlayStyle: const SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarBrightness: Brightness.light,
                      ),
                      textTheme: const TextTheme(
                          bodyText1: TextStyle(color: Colors.white)),
                      backgroundColor: HexColor('333739'),
                      elevation: 0.0)),
              debugShowCheckedModeBanner: false,
              home: WelcomeScreen(),
            );
          },
          listener: (context, state) {},
        ));
  }
}
