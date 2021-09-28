part of home_view;

class _HomeTablet extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    final img = await networkImage(
        'https://upload.wikimedia.org/wikipedia/commons/5/57/Cumulus_Clouds_over_Yellow_Prairie2.jpg');
    final img2 = await networkImage(
        "https://firebasestorage.googleapis.com/v0/b/gen-it.appspot.com/o/students%2F4059.jpg?alt=media&token=05c365d4-0a63-40e5-98e0-bd22f129b1cc");
    // https://firebasestorage.googleapis.com/v0/b/gen-it.appspot.com/o/students%2F4059.jpg?alt=media&token=05c365d4-0a63-40e5-98e0-bd22f129b1cc
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.ClipRRect(
                horizontalRadius: 10,
                verticalRadius: 10,
                child: pw.Image(img2),
              ),
              // pw.Image(img2),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
