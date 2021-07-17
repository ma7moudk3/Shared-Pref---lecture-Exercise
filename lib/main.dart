import 'package:flutter/material.dart';
import 'package:lecture_exercise/forms/helpers/shared_preferences_helper.dart';
import 'package:lecture_exercise/forms/router/router.dart';
import 'package:lecture_exercise/forms/ui/home/ui/home_page.dart';
import 'package:lecture_exercise/forms/ui/register/main_register_screen.dart';
import 'package:lecture_exercise/forms/ui/register/splash_screen.dart';


 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await SpHelper.spHelper.initSharedPreferences();

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.router.navKey,
      home: splach(),
      /*routes: {
        '/': (context) => CachImageTest(),
        // 'home': (context) => HomePage(),
      },*/

      onGenerateRoute: (RouteSettings routeSettings) {
        String name = routeSettings.name;
        var arguments = routeSettings.arguments;
        switch (name) {
          case ('home'):
            return MaterialPageRoute(builder: (context) {
              return HomePage(arguments);
            });
          case ('register'):
            return MaterialPageRoute(builder: (context) {
              return FormUi();
            });
          default:
            return MaterialPageRoute(builder: (context) {
              return Scaffold(
                  backgroundColor: Colors.redAccent,
                  body: Center(child: Text('404 the page is not found')));
            });
        }
      },
      onUnknownRoute: (RouteSettings r) {},
    );
  }
}
