// var fields = [".X.", ".X.", "..."];
// var startFromBackend = {"x": 2, "y": 1};
// var endFromBackend = {"x": 0, "y": 2};

// var fields = ["XXX.", "X..X", "X..X", ".XXX"];
// var startFromBackend = {"x": 0, "y": 3};
// var endFromBackend = {"x": 3, "y": 0};

var allMatrixs = [];
var allFields = [];
var allStarts = [];
var allEnds = [];

var fields = [];
dynamic startFromBackend;
dynamic endFromBackend;

getLockedCells(fields) {
  List<List<int>> list = [];
  for (var i = 0; i < fields.length; i++) {
    var row = fields[i];
    if (row.contains("X")) {
      var x = i;
      var listOfLetters = row.split("");
      for (var y = 0; y < listOfLetters.length; y++) {
        if (listOfLetters[y] == "X") {
          var yPoint = y;
          list.add([x, yPoint]);
        }
      }
    }
  }
  return list;
}

List<List<String>> getFieldsPoint(fields) {
  List<List<String>> list = [];
  fields.forEach((element) {
    list.add(element.split(""));
  });
  return list;
}

List<int> getPoint(Map<String, int> start) {
  List<int> list = [];
  list.add(start["x"]!);
  list.add(start["y"]!);

  return list;
}

var matrix = getFieldsPoint(fields);

var start = getPoint(startFromBackend);
var end = getPoint(endFromBackend);

var curPath = [];
var results = [];

void findPath(x, y) {
  bool isOutOfBound(
    x,
    y,
  ) {
    if (x >= matrix[0].length || x < 0) return true;

    if (y >= matrix.length || y < 0) return true;

    return false;
  }

  curPath.add([x, y]);

  if (isOutOfBound(x, y) || matrix[x][y] == 'X' || matrix[x][y] == 'V') {
    curPath.removeLast();
    return;
  }

  matrix[x][y] = 'V';

  if (x == end[0] && y == end[1]) results.add([...curPath]);

  findPath(x + 1, y);
  findPath(x - 1, y);
  findPath(x, y + 1);
  findPath(x, y - 1);

  findPath(x + 1, y + 1);
  findPath(x + 1, y - 1);
  findPath(x - 1, y + 1);
  findPath(x - 1, y - 1);

  curPath.removeLast();
  if (matrix[x][y] == 'V') matrix[x][y] = '.';
}

getShortPath() {
  return results
      .reduce((curr, next) => curr.length < next.length ? curr : next);
}

getStartingCell() {
  return getShortPath().first;
}

getDestinationCell() {
  return getShortPath().last;
}

getShortestPathCells(List shortpath) {
  var list = [...shortpath];
  if (list.length != 0) {
    list.removeLast();
    list.removeAt(0);
  }

  return list;
}
