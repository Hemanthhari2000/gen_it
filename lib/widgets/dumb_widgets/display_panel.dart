import 'package:pdf/widgets.dart' as pw;
import 'package:gen_it/theme/constants.dart';

class Displaycontainer extends pw.StatelessWidget {
  final String data;

  Displaycontainer(this.data);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Container(
      // height: kContainerHeight,
      // width: kContainerWidth,
      color: kPrimaryColor,
      padding: const pw.EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: kVerticalPadding),
      child: pw.Text(data,
          textScaleFactor: 0.2,
          style: pw.Theme.of(context).defaultTextStyle.copyWith(
                fontWeight: pw.FontWeight.bold,
                color: kVoidColor,
                fontSize: kTextSize,
              )),
    );
  }
}

class Displaypanel extends pw.StatelessWidget {
  final String name;
  final String no;
  final String comp;
  final String pack;

  Displaypanel(this.name, this.no, this.comp, this.pack);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: <pw.Widget>[
        Displaycontainer(name),
        Displaycontainer(no),
        Displaycontainer(comp),
        Displaycontainer(pack),
      ],
    );
  }
}
