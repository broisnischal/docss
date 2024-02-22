import 'package:dio/dio.dart';
import 'package:docss/app/core/constants/constants.dart';
import 'package:docss/app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:docss/app/features/daily_news/data/repository/article_impl.dart';
import 'package:docss/app/features/daily_news/domain/repository/article_repository.dart';
import 'package:docss/app/features/daily_news/domain/usecases/get_article.dart';
import 'package:docss/app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDepdendencies() async {
  sl
    ..registerSingleton<Dio>(
      Dio(
        BaseOptions(baseUrl: newsBaseURL),
      ),
    )
    ..registerSingleton<NewsApiService>(NewsApiService(sl()))
    ..registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(newsApiService: sl()),
    )
    ..registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()))
    ..registerFactory(() => RemoteArticleBloc(sl()));
}
