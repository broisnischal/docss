import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    String apiKey = dotenv.get("API_KEY");

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Hello, World asdf!',
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
