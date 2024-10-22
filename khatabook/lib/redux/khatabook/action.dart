


import 'package:khatabook/models/khatabook_model.dart';

abstract class KhataBookAction{


} 

class CreateKhataAction extends KhataBookAction{

  KhatabookModel khatabookModel ;
  CreateKhataAction({required this.khatabookModel});
}

