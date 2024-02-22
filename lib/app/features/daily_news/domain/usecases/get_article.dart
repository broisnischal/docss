import 'package:docss/app/core/resources/data_state.dart';
import 'package:docss/app/core/usecase/usecase.dart';
import 'package:docss/app/features/daily_news/domain/entities/article.dart';
import 'package:docss/app/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  GetArticleUseCase(this._articleRepository);
  final ArticleRepository _articleRepository;

  @override
  Future<DataState<List<ArticleEntity>>> call({void param}) {
    return _articleRepository.getNewsArticles();
  }
}
