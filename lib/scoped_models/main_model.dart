import 'package:delve/scoped_models/posts_model.dart';
import 'package:scoped_model/scoped_model.dart';

import './register_scoped.dart';
import './login_model.dart';
import './posts_model.dart';

class MainModel extends Model with  RegisterModel,LoginModel,PostModel {
  
}