import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:provider/provider.dart' as provider;
import '/screens/order_process/AddedToCartScreen.dart';
import '/screens/order_process/DeliveryAddressScreen.dart';
import '/screens/launch/HomeScreen.dart';
import '/screens/authentication/LoginScreen.dart';
import '/screens/order_process/MyCartScreen.dart';
import '/screens/products/AllCategoriesScreen.dart';
import '/screens/products/MyAttendanceScreen.dart';
import '/screens/products/MyTicketScreen.dart';
import '/screens/order_process/MyOrdersScreen.dart';
import '/screens/authentication/SignUpScreen.dart';
import '/screens/profile/UserProfileScreen.dart';
import 'colors/Colors.dart';
import 'notifier/dark_theme_provider.dart';
import 'screens/launch/SplashScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Hive.initFlutter(); //hive needs to be initialized before calling for boxes so it is better to initialize it in main
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp())); //initiating flutter riverpod (wajib iniialize providerscope on the most top of app architecture,,)
  
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.themePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return provider.ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: provider.Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(themeChangeProvider.darkTheme, context),
            initialRoute: '/',
            routes: <String, WidgetBuilder>{
              '/': (context) => SplashScreen(),
              '/LoginScreen': (BuildContext context) => LoginScreen(),
              '/SignUpScreen': (BuildContext context) => SignUpScreen(),
              HomeScreen.routeName: (BuildContext context) => HomeScreen(
                key: UniqueKey(), // replace with your key
                client: OdooClient("http://42.1.60.211:8069"), // replace with your client
                session: OdooSession(
                  companyId: 1, // replace with your company id
                  dbName: "sigmarectrix-11", // replace with your database name
                  id: "your-id", // replace with your id
                  isSystem: true, // replace with your boolean value
                  partnerId: 1, // replace with your partner id
                  serverVersion: "your-server-version", // replace with your server version
                  userId: 1, // replace with your user id
                  userLang: "your-user-language", // replace with your user language
                  userLogin: "your-user-login", // replace with your user login
                  userName: "your-user-name", // replace with your user name
                  userTz: "your-user-timezone", // replace with your user timezone
                  // database: "your-database", // replace with your database
                  // sessionId: "your-session-id", // replace with your session id
                  // uid: 1, // replace with your uid
                )

              ),
              '/MyTicketScreen': (BuildContext context) => MyTicketScreen(),
              '/AddedToCartScreen': (BuildContext context) =>
                  AddedToCartScreen(),
              '/MyCartScreen': (BuildContext context) => MyCartScreen(),
              UserProfileScreen.routeName: (BuildContext context) =>
                  UserProfileScreen(),
              AllCategoriesScreen.routeName: (BuildContext context) =>
                  AllCategoriesScreen(),
              '/DeliveryAddressScreen': (BuildContext context) =>
                  DeliveryAddressScreen(
                    key: UniqueKey(), // replace with your key
                    shouldDisplayPaymentButton: true, // replace with your boolean value
                  ),
              '/MyOrdersScreen': (BuildContext context) => MyOrdersScreen(),
            },
          );
        },
      ),
    );
  }
}

