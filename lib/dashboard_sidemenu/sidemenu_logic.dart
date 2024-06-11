import 'package:dashboard_table_master/dashboard_sidemenu/sidemenu_widget.dart';
import 'package:fstudio/fstudio.dart';

class SidemenuLogic extends FPageLogic<SidemenuWidget> {
  late final FPipe<bool> selectedIndexPipe =
      FPipe(initValue: false, disposer: disposer);

  void onTapSidemenu() {
    bool value = selectedIndexPipe.value;
    selectedIndexPipe.update(!value);
  }
}
