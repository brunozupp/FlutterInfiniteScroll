import 'package:dio/dio.dart';
import 'package:flutter_infinite_scroll_with_getx/models/pagination_filter.dart';
import 'package:flutter_infinite_scroll_with_getx/models/user_model.dart';

class UserRepository {

  Dio _dio;

  UserRepository(this._dio);

  Future<List<UserModel>> findAll(PaginationFilter filter) async {
    var result = await _dio.get('/users', queryParameters: {
      "page": filter.page,
      "limit": filter.limit
    });

    return result?.data?.map<UserModel>((u) => UserModel.fromMap(u))?.toList();
  }
}