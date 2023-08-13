import 'dart:developer' as developer;

import 'package:vm_service/vm_service.dart';
import 'package:vm_service/vm_service_io.dart';

class SystemUtil {
  static Future<String?> getCpuName() async {
    developer.ServiceProtocolInfo info = await developer.Service.getInfo();
    final service =
        await vmServiceConnectUri(info.serverWebSocketUri.toString());

    VM vm = await service.getVM();
    return vm.hostCPU;
  }
}
