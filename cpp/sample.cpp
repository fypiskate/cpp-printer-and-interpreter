int binPow(int a1) {
  if (a1 > 32) {
    return 0;
  }
  int b = 1;
  while (a1 > 0) {
    b = b * 2;
    a1 = a1 - 1;
  }
  return b;
}

int simplePrinter(string a2) {
  cout << a2;
  return 0;
}

double multiply (double a, double b) {
  return a * b;
}

int main() {
  int a;
  string name;
  cin >> a >> name;
  cout << binPow(a) ;
  string a2 = "Hello ";
  cout << a2 << name;
  double b = 10.0;
  double c = b + b;
  cout << multiply(b, c);
  bool j = true;
  for (int i = 0; i < a; i = i +     1){
      if (j) {
          cout << i;
      } else {
          cout << "j is false";
      }
  }
  return 0;
}
