import '../../models/comment_model.dart';
import '../jsonplaceholder_custon_dio.dart';
import '../comments_repository.dart';

class CommentDioReposiotory implements CommentsRepository {
  final JsonPlaceHolderCustonDio jsonPlaceHolderCustonDio;
  CommentDioReposiotory(this.jsonPlaceHolderCustonDio);

  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var response = await jsonPlaceHolderCustonDio.dio.get('/posts/$postId/comments');
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
