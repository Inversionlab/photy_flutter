class phmodel{
  String src;
  int id;
  phmodel(
  {required this.src,required this.id});
  static fromapitoapp(Map<String,dynamic> phmap){
    return phmodel(src: (phmap["src"])["portrait"], id:phmap["id"] );

  }
}