import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studi_kasus_mandiri/resto/menu_resto_page.dart';
import 'package:studi_kasus_mandiri/resto/nota_pesanan_page.dart';
import 'package:studi_kasus_mandiri/resto/resto_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RestoProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/menu-resto': (context) => const MenuRestoPage(),
        '/pesanan-resto': (context) => const NotaPesananPage(),
      },
      initialRoute: '/menu-resto',
    );
  }
}
