class DomainResponseModel {
  DomainResponseModel({
    required this.id,
    required this.type,
    required this.domain,
    required this.isActive,
    required this.isPrivate,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String type;
  late final String domain;
  late final bool isActive;
  late final bool isPrivate;
  late final String createdAt;
  late final String updatedAt;

  DomainResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    isActive = json['isActive'];
    isPrivate = json['isPrivate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['domain'] = domain;
    _data['isActive'] = isActive;
    _data['isPrivate'] = isPrivate;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}
