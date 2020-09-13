C++:
	g++ -o a1.out a1.cpp && ./a1.out < input.txt

Go:
	go run a1.go < input.txt

Ada:
	gnatmake a1.adb && ./a1 < input.txt

Prolog:
	swipl -q -l a1.pl

clean:
	rm a1 a1.ali a1.o a1.out