import 'dart:math';

List<int> generateRandomList(int size) {
  Random random = Random();
  return List<int>.generate(size, (_) => random.nextInt(1000000));
}

void insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
}

void selectionSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    int minIdx = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
      }
    }
    int temp = arr[i];
    arr[i] = arr[minIdx];
    arr[minIdx] = temp;
  }
}

void bubbleSort(List<int> arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (int j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void shellSort(List<int> arr) {
  int n = arr.length;
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i++) {
      int temp = arr[i];
      int j;
      for (j = i; j >= gap && arr[j - gap] > temp; j -= gap) {
        arr[j] = arr[j - gap];
      }
      arr[j] = temp;
    }
  }
}

void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high];
  int i = (low - 1);
  for (int j = low; j < high; j++) {
    if (arr[j] < pivot) {
      i++;
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  return i + 1;
}

void mergeSort(List<int> arr) {
  if (arr.length <= 1) return;
  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);
  mergeSort(left);
  mergeSort(right);
  merge(arr, left, right);
}

void merge(List<int> arr, List<int> left, List<int> right) {
  int i = 0, j = 0, k = 0;
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      arr[k++] = left[i++];
    } else {
      arr[k++] = right[j++];
    }
  }
  while (i < left.length) {
    arr[k++] = left[i++];
  }
  while (j < right.length) {
    arr[k++] = right[j++];
  }
}

void main() {
  List<int> dataSizes = [50000, 100000, 150000, 200000, 250000, 300000, 350000, 400000, 450000, 500000];
  print("Jumlah Data | Insertion | Selection | Bubble | Shell | Quick | Merge");
  for (int size in dataSizes) {
    List<int> arr = generateRandomList(size);
    
    List<int> temp;
    Stopwatch stopwatch;
    
    stopwatch = Stopwatch()..start();
    temp = List<int>.from(arr);
    insertionSort(temp);
    int insertionTime = stopwatch.elapsedMilliseconds;
    
    stopwatch.reset();
    temp = List<int>.from(arr);
    selectionSort(temp);
    int selectionTime = stopwatch.elapsedMilliseconds;
    
    stopwatch.reset();
    temp = List<int>.from(arr);
    bubbleSort(temp);
    int bubbleTime = stopwatch.elapsedMilliseconds;
    
    stopwatch.reset();
    temp = List<int>.from(arr);
    shellSort(temp);
    int shellTime = stopwatch.elapsedMilliseconds;
    
    stopwatch.reset();
    temp = List<int>.from(arr);
    quickSort(temp, 0, temp.length - 1);
    int quickTime = stopwatch.elapsedMilliseconds;
    
    stopwatch.reset();
    temp = List<int>.from(arr);
    mergeSort(temp);
    int mergeTime = stopwatch.elapsedMilliseconds;
    
    print("$size | $insertionTime | $selectionTime | $bubbleTime | $shellTime | $quickTime | $mergeTime");
  }
}
