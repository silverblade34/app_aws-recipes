import 'package:app_aws_recipes/core/dtos/response.dto.dart';
import 'package:dio/dio.dart';

Future<ApiResponse<List<T>>> fetchData<T>(
  Future<Response> Function() apiCall,
  T Function(Map<String, dynamic>) fromJson,
) async {
  final response = await apiCall();

  final body = response.data;
  final List<dynamic> dataList = body;
  final List<T> items = dataList.map((item) => fromJson(item)).toList();

  return ApiResponse<List<T>>(
    status: true,
    message: "",
    data: items,
  );
}

Future<ApiResponse<T>> fetchEntity<T>(
  Future<Response> Function() apiCall,
  T Function(Map<String, dynamic>) fromJson,
) async {
  final response = await apiCall();

  if (response.statusCode == 400) {
    throw Exception(response.data['message']);
  }

  if (response.data['data'] == null) {
    throw Exception(response.data['message']);
  }
  final body = response.data;

  if (body['status'] == false) {
    throw Exception(body['message']);
  }
  final T item = fromJson(body['data']);

  return ApiResponse<T>(
    status: body['status'],
    message: body['message'],
    data: item,
  );
}
