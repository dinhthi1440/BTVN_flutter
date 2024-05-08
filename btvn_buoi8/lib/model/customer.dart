

class Customer{
  String? id;
  String? name;
  int? age;
  String? phoneNumber;
  bool? isCustomer;
  String? province;
  String? district;
  Customer({ this.id, this.name, this.age,
    this.phoneNumber, this.isCustomer,
    this.province, this.district});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    age = json["age"];
    phoneNumber = json["phone_number"];
    isCustomer = json["is_custommer"];
    province = json["provice"];
    district = json["district"];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['phone_number'] = phoneNumber;
    data['is_custommer'] = isCustomer;
    data['provice'] = province;
    data['district'] = district;
    return data;
  }
}