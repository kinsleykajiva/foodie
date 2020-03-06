class FoodRequests{
  String _id ;
  String _user_emplyee_name ;
  String _description ;
  String _dated_on ;

  FoodRequests(this._id, this._user_emplyee_name, this._description, this._dated_on);

  String get dated_on => _dated_on;

  set dated_on(String value) {
    _dated_on = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get user_emplyee_name => _user_emplyee_name;

  set user_emplyee_name(String value) {
    _user_emplyee_name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}