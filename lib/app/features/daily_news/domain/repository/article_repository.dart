import 'package:docss/app/core/resources/data_state.dart';
import 'package:docss/app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
