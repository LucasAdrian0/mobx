import 'package:pacotes/models/comment_model.dart';
import 'package:pacotes/repository/comments/comments_repository.dart';
import 'package:trilhaapp/repositories/jsonPlaceHolder_custon_repository.dart';

class CommentDioReposiotory implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response = await jsonPlaceHolderCustonDio.dio.get('/$postId/comments');
    return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
  }
}