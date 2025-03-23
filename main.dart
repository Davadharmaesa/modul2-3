import 'mahasiswa.dart';
void main() {
  List<Mahasiswa> arr = [
    Mahasiswa("02", "Budi"),
    Mahasiswa("01", "Andi"),
    Mahasiswa("04", "Udin"),
    Mahasiswa("03", "Candra")
  ];

  print("Data Sebelum Pengurutan:");
  display(arr);

  var stopwatch = Stopwatch()..start();
  selectionSort(arr);
  stopwatch.stop();

  print("Data Setelah Pengurutan:");
  display(arr);
  print("Waktu: ${stopwatch.elapsedMilliseconds} ms");
}