import 'package:dashboard_table_master/dashboard_crud/button_widget.dart';
import 'package:dashboard_table_master/dashboard_table/table_logic.dart';

import 'package:fstudio/fstudio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class ButtonLogic extends FPageLogic<ButtonWidget> {
  void insertRow() async {
    await supabase.from('master_staking_period').insert({
      'country_code': countryCode.text,
      'period': period.text,
      'min_weight': minWeight.text,
      'max_weight': maxWeight.text,
      'penalty_percentage': penaltyPercentage.text,
      'reward_percentage': rewardPercentage.text
    });
    countryCode.clear();
    period.clear();
    minWeight.clear();
    maxWeight.clear();
    penaltyPercentage.clear();
    rewardPercentage.clear();
  }

  void updateRow() async {
    final tableLogic = TableLogic();

    await supabase.from('master_staking_period').update({
      'country_code': countryCodeUpdate.text,
      'period': periodUpdate.text,
      'min_weight': minWeightUpdate.text,
      'max_weight': maxWeightUpdate.text,
      'penalty_percentage': penaltyPercentageUpdate.text,
      'reward_percentage': rewardPercentageUpdate.text
    }).eq('uid', tableLogic.selectedRow!.uid);
  }

  void deleteRow() async {
    final tableLogic = TableLogic();

    await supabase
        .from('master_staking_period')
        .delete()
        .eq('uid', tableLogic.selectedRow!.uid);
  }

  void updateControllers() {
    countryCodeUpdate.text = tableLogic.selectedRow?.countryCode ?? '';
    periodUpdate.text = tableLogic.selectedRow?.period ?? '';
    minWeightUpdate.text = tableLogic.selectedRow?.minWeight.toString() ?? '';
    maxWeightUpdate.text = tableLogic.selectedRow?.maxWeight.toString() ?? '';
    penaltyPercentageUpdate.text =
        tableLogic.selectedRow?.penaltyPercentage.toString() ?? '';
    rewardPercentageUpdate.text =
        tableLogic.selectedRow?.rewardPercentage.toString() ?? '';
  }
}
