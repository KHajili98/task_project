import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:task_project/data/core/string_constants.dart';
import 'package:task_project/data/models/request/post_path_model.dart';
import 'package:task_project/data/models/response/get_path_model.dart';
import 'package:task_project/data/models/response/post_path_res_model.dart';
import 'package:task_project/data/repositories/path_repository.dart';

part 'path_state.dart';

class PathCubit extends Cubit<PathState> {
  PathCubit() : super(new PathState());

  PathRepository repository = PathRepository();

  Future<void> getPaths({required String url}) async {
    emit(state.copyWith(isProgress: true));
    try {
      GetPathModel response = await repository.getPaths(url: url);
      if (!response.error! && response.data!.isNotEmpty) {}
      emit(state.copyWith(isSuccess: true, path: response));
    } on DioError catch (e) {
      emit(state.copyWith(
          isProgress: false,
          isFailure: true,
          isFailureMessage: e.error.message.toString()));
    } on SocketException catch (_) {
      emit(state.copyWith(
          isFailure: true, isFailureMessage: StringConstants.checkInternet));
    } catch (e) {
      emit(state.copyWith(
          isFailure: true, isFailureMessage: StringConstants.wrongUrl));
    }
  }

  Future<void> postPaths(
      {required String url, required List<PostPathModel> body}) async {
    emit(state.copyWith(isPostProgress: true));
    try {
      PostPathResponseModel response =
          await repository.postPath(url: url, paths: body);
      if (!response.error!) {
        emit(state.copyWith(isPostSuccess: true, postResponse: response));
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        var response = PostPathResponseModel.fromJson(e.response!.data);
        emit(state.copyWith(
            isPostFailure: true,
            postResponse: response,
            isFailureMessage: response.message!));
      } else if (e.response!.statusCode == 500) {
        emit(state.copyWith(
            isPostFailure: true,
            postResponse: null,
            isFailureMessage: e.response!.data["message"].toString()));
      } else {
        emit(state.copyWith(
            isPostFailure: true, isFailureMessage: e.message.toString()));
      }
    } on SocketException catch (_) {
      emit(state.copyWith(
          isFailure: true, isFailureMessage: StringConstants.checkInternet));
    } catch (e) {
      emit(state.copyWith(
        isFailure: true,
      ));
    }
  }
}
