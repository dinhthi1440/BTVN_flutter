class District{
  final String id;
  final String districtName;
  final String provinceID;

  District({required this.id, required this.districtName, required this.provinceID});
  factory District.fromJson(Map<String, dynamic> json){
    return District(
        id: json['district_id'],
        districtName: json['district_name'],
        provinceID: json['province_id']
    );
  }
}