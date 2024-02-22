import 'dart:io';

import 'package:dio/dio.dart';
import 'package:docss/app/core/constants/constants.dart';
import 'package:docss/app/core/resources/data_state.dart';
import 'package:docss/app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:docss/app/features/daily_news/data/models/article.dart';
import 'package:docss/app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl({required NewsApiService newsApiService})
      : _newsApiService = newsApiService;
  final NewsApiService _newsApiService;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse =
          await _newsApiService.getNewsArticles(apiKey: APIKEY, country: "us");

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage,
            message: httpResponse.response.statusMessage,
          ),
        );
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
