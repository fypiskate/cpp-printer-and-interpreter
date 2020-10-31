int binPow(int a) {
  if (a > 32) {
    return 0;
  }
  int b = 1;
  while (a > 0) {
    b = b * 2;
    a = a - 1;
  }
  return b;
}

double multiply (double a, double b) {
  return a * b;
}

int main() {
  cout << "Write your name and some int";
  int a;
  string name;
  cin >> name >> a;
  string hello = "Hello, ";
  cout << hello << name << "!";
  cout << binPow(a);
  
  double b = 10.123;
  double c = b + b;
  cout << multiply(b, c);

  bool cond = true;
  for (int i = 0; i < a; i = i +     1){
      if (cond) {
          cout << i;
      } else {
          cout << "cond is false";
      }
  }
  return 0;
}
