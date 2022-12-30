library smb_module;

import 'package:libdsm/libdsm.dart';


class SmbFunctions{
  
  bool testConnection(String usernmae, String password, String host){
    final Dsm dsm = Dsm();
    
    Future<int> flag = dsm.login(host, usernmae, password);
    return true;
  }
}