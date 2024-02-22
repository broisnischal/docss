import 'package:bloc/bloc.dart';
import 'package:docss/app/core/resources/data_state.dart';
import 'package:docss/app/features/daily_news/domain/usecases/get_article.dart';
import 'package:docss/app/features/daily_news/presentation/bloc/article/remote/remote_article_events.dart';
import 'package:docss/app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticlesUseCase;

  RemoteArticleBloc(this._getArticlesUseCase)
      : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  Future<void> onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleSuccess(articles: dataState.data!));
    }

    if (dataState is DataError) {
      print(dataState);
      emit(RemoteArticleError(error: dataState.error!));
    }
  }
}
