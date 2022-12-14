class StudentModel{
  String? _id;
  String? _name;
  String? _roll_no;
  String? _std_name;
  String? _dob;
  String? _gender;
  String? _fatherName;
  String? _motherName;
  String? _occupation;
  int? _income;
  String? _email;
  int? _phno;
  String? _currentAddress;
  String? _permanentAddress;
  String? _motherTongue;
  String? _bloodGroup;


  String? get id => _id;

  set id(String? value){
    _id = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get roll_no => _roll_no;

  String? get bloodGroup => _bloodGroup;

  set bloodGroup(String? value) {
    _bloodGroup = value;
  }

  String? get motherTongue => _motherTongue;

  set motherTongue(String? value) {
    _motherTongue = value;
  }

  String? get permanentAddress => _permanentAddress;

  set permanentAddress(String? value) {
    _permanentAddress = value;
  }

  String? get currentAddress => _currentAddress;

  set currentAddress(String? value) {
    _currentAddress = value;
  }

  int? get phno => _phno;

  set phno(int? value) {
    _phno = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  int? get income => _income;

  set income(int? value) {
    _income = value;
  }

  String? get occupation => _occupation;

  set occupation(String? value) {
    _occupation = value;
  }

  String? get motherName => _motherName;

  set motherName(String? value) {
    _motherName = value;
  }

  String? get fatherName => _fatherName;

  set fatherName(String? value) {
    _fatherName = value;
  }

  String? get gender => _gender;

  set gender(String? value) {
    _gender = value;
  }

  String? get dob => _dob;

  set dob(String? value) {
    _dob = value;
  }

  String? get std_id => _std_name;

  set std_id(String? value) {
    _std_name = value;
  }

  set roll_no(String? value) {
    _roll_no = value;
  }

  StudentModel(this._id,this._name, this._roll_no, this._std_name, this._dob, this._gender,
      this._fatherName, this._motherName, this._occupation, this._income,
      this._email, this._phno, this._currentAddress, this._permanentAddress,
      this._motherTongue, this._bloodGroup);

  StudentModel.empty();

  StudentModel.forChat(this._name);

  factory StudentModel.fromJson(Map<String, dynamic> json){
      return StudentModel(json["_id"],json["name"],json["roll_no"],json["std_id"]["std_name"],json["dob"],json["gender"],json["parent1name"],json["parent2name"],
        json["occupation"],json["income"],json["email"],json["phoneNo"],json["currentAddress"],json["permanentAddress"],json["motherTongue"],json["bloodGroup"]
      );
  }
}