part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                // viewModel.test();
                // printFunction(viewModel.getPlacedStudents);
                // for (var studs in viewModel.getPlacedStudents) {
                //   print(studs);
                //   print(studs.regno);
                // }
              },
              child: const Text("Click"),
            ),
            // viewModel.getImageBytes != null
            //     ? Image(image: MemoryImage(viewModel.getImageBytes))
            //     : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
