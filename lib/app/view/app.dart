import 'package:docss/app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:docss/app/features/daily_news/presentation/bloc/article/remote/remote_article_events.dart';
import 'package:docss/app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:docss/app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // String apiKey = dotenv.get("API_KEY");

    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        home: const DailyNews(),
      ),
    );
  }
}
