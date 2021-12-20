part of 'path_cubit.dart';

class PathState {
  final GetPathModel? path;
  final bool isProgress;
  final bool isPostProgress;
  final bool isFailure;
  final bool isPostFailure;
  final String isFailureMessage;
  final bool isSuccess;
  final bool isPostSuccess;
  final PostPathResponseModel? postResponse;

  PathState({
    this.path,
    this.postResponse,
    this.isProgress = false,
    this.isPostProgress = false,
    this.isFailure = false,
    this.isPostFailure = false,
    this.isFailureMessage = 'Unknown error has occurred',
    this.isSuccess = false,
    this.isPostSuccess = false,
  });

  PathState copyWith({
    final GetPathModel? path,
    final bool? isProgress,
    final bool? isPostProgress,
    final bool? isFailure,
    final bool? isPostFailure,
    final String? isFailureMessage,
    final PostPathResponseModel? postResponse,
    final bool? isSuccess,
    final bool? isPostSuccess,
  }) {
    return PathState(
      path: path ?? this.path,
      postResponse: postResponse ?? this.postResponse,
      isProgress: isProgress ?? false,
      isPostProgress: isPostProgress ?? false,
      isFailure: isFailure ?? false,
      isPostFailure: isPostFailure ?? false,
      isFailureMessage: isFailureMessage ?? 'Unknown error has occurred',
      isSuccess: isSuccess ?? false,
      isPostSuccess: isPostSuccess ?? this.isPostSuccess,
    );
  }
}
