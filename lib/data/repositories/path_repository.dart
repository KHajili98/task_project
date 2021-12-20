import 'package:task_project/data/contractors/i_path_contractor.dart';
import 'package:task_project/data/data_sources/path_data_source.dart';
import 'package:task_project/data/models/response/post_path_res_model.dart';
import 'package:task_project/data/models/response/get_path_model.dart';
import 'package:task_project/data/models/request/post_path_model.dart';

import '../core/injection.dart';

class PathRepository implements IPathRepository {
  var pathDataSource = getIt.get<PathDataSource>();

  @override
  Future<GetPathModel> getPaths({required String url}) async {
    return await pathDataSource.getPathService(url: url);
  }

  @override
  Future<PostPathResponseModel> postPath(
      {required String url, required List<PostPathModel> paths}) async {
    return await pathDataSource.postPathService(url: url, body: paths);
  }
}
