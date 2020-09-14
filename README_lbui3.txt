Name: Loc Bui
NetID: lbui3
StudentID: 31320986

Partner: Dung Le (dle8)

Extra Credit Work:
- Try other language: C++
- Use dynamic programming for imperative langs: Go, C++, Ada, Python
- Use dynamic programmingfor functional lang: Ocaml
- Modify one imprative program to print all LIS: C++
- Modify Python programs to read from standard input, rather than the interpreter prompt: python

Ada (My work):
- Complexity O(n*logn) using fenwick tree
- Idea: let's f[i] be the max leng of the sequence that ends with number i,
        for each number x, use fenwick tree to get max(f[j]) with j=1->x-1,
        and update f[x] = max(f[j])+1
- Limitation: maximun number is 10^5 due to fenwick tree
- Compare & contrast: Ada is similar to Pascal so it is pretty easy for me to implement the algorithm.
- Run:
    + With Makefile: enter the list in file input.txt and run make Ada
    + Manually: gnatmake a1.adb to compile, and run with ./a1, input the list in the terminal

Go (My work):
- Complexity O(n*logn) using fenwick tree
- Idea: let's f[i] be the max leng of the sequence that ends with number i,
        for each number x, use fenwick tree to get max(f[j]) with j=1->x-1,
        and update f[x] = max(f[j])+1
- Limitation: maximun number is 10^5 due to fenwick tree
- Compare & contrast: I have decent experience with Go so I can implement the algorithm easily
- Run:
    + With Makefile: enter the list in file input.txt and run make Go
    + Manually: go run a1.go and then input the list in the terminal

C++ (My work):
- Complexity: O(n*logn*number of LIS) using fenwick tree
- Will print out all possible LIS
- Idea: let's f[i] be the tuple of max leng of the sequence that ends with number i
        and the list of all the sequence with leng equal max leng that ends with number i,
        for each number x, use fenwick tree to get max(f[j]) with j=1->x-1,
        and update f[x] according to f[j]
- Limitation: maximun number is 10^5 due to fenwick tree
- Compare & contrast: I have decent experience with C++ so I can implement the algorithm easily
- Run:
    + With Makefile: enter the list in file input.txt and run make C++
    + Manually: g++ -o a1.out a1.cpp to compile, and run with ./a1.out, input the list in the terminal

Python (Partner's work):
- Complexity: O(n * logn)
- Idea:
    - We maintain an array bucket in the meaning that bucket[i] is the smallest element in which
    an longest increasing subsequence of length i ends with. For each element nums[i] in the array, 
    we will perform an binary search on the bucket array to see that position is fit for it. We can
    do this since, by our definition of the bucket array, the bucket array elements is sorted 
    in ascend. 
- Compare & contrast: 
    - In comparison to Ocaml and Prolog, this algorithm is fairly easy to implement and debug. Code is 
    very concise because of Python syntax and support of while and for loop.
- Run:
    - Modify the list directly in a1.py and compile & run with "python a1.py", assuming python version 3.

Ocaml (Partner's work):
- Complexity: O(n * n * log(n))
- Idea:
    - For Ocaml implementation, I use the same algorithm used for Python version. However, since
    accessing a certain index in a Ocaml list cost O(n), the complexity is larger. 
- Compare & contrast:
    - In comparison to Python, Ocaml version is a little bit harder to implement (mostly because of
    the unfamiliarity for the language). However, it's a good exercise to practice recursion thinking.
    - In comparison to Prolog, Ocaml version is easier to write since Ocaml still supports for and 
    while loop.
- Run:
    - Compile with ocaml a1.ml
    - Enter length of the array n, and subsequently on each line, enter an element of the array
    
Prolog (Partner's work):
- Complexity: O(2^n)
- Idea:
    - using brute force, with an idea that for each element, there's an option to include
    or not include that element in the list. Subsequent elements will be chosen accordingly based on
    the decision of previous elements.
- Compare & contrast:
    - In comparison to Python and Ocaml, this version is hardest to write (in my opinion), since 
    it requires a lot of recursion thinking and may cause some bugs if not thinking deeply about
    the base cases for the recursion function.
    - However, it's still a good practice for recursion thinking.
- Run:
    - Compile with swipl -q -l a1.pl
    - Enter: main.
    - Enter length n of the array n and a dot: n.
    - For each n subsequent lines, enter an element of an array in with a dot.
