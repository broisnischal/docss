import 'package:dio/dio.dart';
import 'package:docss/app/core/constants/constants.dart';
import 'package:docss/app/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';

part "news_api_service.g.dart";

@RestApi(baseUrl: newsBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("country") String? country,
    @Query("apiKey") String? apiKey,
  });
}
