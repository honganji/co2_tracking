import 'package:co2_tracking/components/bar_element.dart';
import 'package:fl_chart/fl_chart.dart';

List<BarChartGroupData> getBarChartGroupDataList(List<List<double>> dataList, double barsSpace, double barsWidth) {
  return List<BarChartGroupData>.generate(dataList.length, (index){
    return BarChartGroupData(
    x: index,
    barsSpace: barsSpace,
    barRods: [
      getBarChartRodData(dataList[index], barsWidth)
    ],
  );
  });
}
