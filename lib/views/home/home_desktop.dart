part of home_view;

class _HomeDesktop extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeDesktop(this.viewModel);

  final formKey = GlobalKey<FormState>();
  TextEditingController regnoEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController companyEditingController = TextEditingController();
  TextEditingController packageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                              textStyle: kFOpenSansBold,
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/logo.png',
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text('GenIt'),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              // TextButton(
                              //   style: TextButton.styleFrom(
                              //     primary: Colors.black,
                              //     textStyle: kFOpenSans,
                              //   ),
                              //   onPressed: () {},
                              //   child: const Text("Already Placed"),
                              // ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFA958E9),
                                  textStyle: kFOpenSans,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                ),
                                onPressed: () {
                                  // var data = viewModel.getPlacedStudents;
                                  // print(data);
                                  printFunction();
                                },
                                child: const Text('Preview'),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFE50914),
                                  textStyle: kFOpenSans,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 20,
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text("Download PDF"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 500,
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextField(
                                  label: "Reg No",
                                  child: buildRegNo(
                                      viewModel, regnoEditingController),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                buildTextField(
                                  label: "Name",
                                  child: buildName(
                                      viewModel, nameEditingController),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                buildTextField(
                                  label: "Company",
                                  child: buildCompany(
                                      viewModel, companyEditingController),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                buildTextField(
                                  label: "Package",
                                  child: buildPackage(
                                      viewModel, packageEditingController),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFFA958E9),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                  ),
                                  onPressed: () {
                                    final isVaild =
                                        formKey.currentState.validate();
                                    if (isVaild) {
                                      formKey.currentState.save();
                                      viewModel.uploadDataToFirebase(context);
                                    }
                                  },
                                  child: viewModel.isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        )
                                      : Text(
                                          'Add',
                                          style: kFMontserrat,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFFEEEEEE),
              width: MediaQuery.of(context).size.width * .5,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text('PREVIEW'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Click'),
        onPressed: () async {
          //   FirebaseFirestore.instance
          //   .collection('placed')
          //   .orderBy("createdAt", descending: true)
          //   .get()
          //   .then((QuerySnapshot qsnapshot) {
          // for (var element in qsnapshot.docs) {
          //   print(element['name']);
          //   print(element['regno']);
          //   print(element['company']);
          //   print(element['package']);

          // }
          // });
          var data = await FirebaseFirestore.instance
              .collection('placed')
              .orderBy('createdAt', descending: false)
              .get()
              .then((QuerySnapshot querySnapshot) {
            var res = querySnapshot.docs.map((e) => e.data());
            print(res);
          });
        },
      ),
    );
  }
}
