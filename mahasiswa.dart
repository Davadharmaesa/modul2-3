class Mahasiswa implements Comparable<Mahasiswa> {
  String nrp;
  String nama;

  Mahasiswa(this.nrp, this.nama);

  @override
  int compareTo(Mahasiswa other) {
    return nrp.compareTo(other.nrp);
  }

  @override
  String toString() {
    return 'Mahasiswa{nrp: $nrp, nama: $nama}';
  }
}

void selectionSort<T extends Comparable<T>>(List<T> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j].compareTo(arr[minIndex]) < 0) {
        minIndex = j;
      }
    }
    if (minIndex != i) {
      T temp = arr[i];
      arr[i] = arr[minIndex];
      arr[minIndex] = temp;
    }
  }
}

void display<T>(List<T> data) {
  for (var item in data) {
    print(item);
  }
}
