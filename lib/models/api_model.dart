class ApiModel {
  Map<String, dynamic> data;
  List<dynamic> dataList;
  bool success;
  List<String> errors;

  ApiModel({this.success, this.errors});

  ApiModel.fromJson(List<dynamic> json) {
    dataList = json;
  }

  _filterType(Map<String, dynamic> json) {
    dataList = json['data'];
  }

  Future<ApiModel> fromJsonAsync(Map<String, dynamic> json) async {
    _filterType(json);
    var lst = await _returnErrosListAsync(json);
    return ApiModel(success: json['success'], errors: lst);
  }

  Future<List<String>> _returnErrosListAsync(Map<String, dynamic> json) async {
    var externalList = json['errors'] as List;
    var currentErros = List<String>();

    await Future.forEach(externalList, (item) async {
      currentErros.add(item);
    });

    return currentErros;
  }
}