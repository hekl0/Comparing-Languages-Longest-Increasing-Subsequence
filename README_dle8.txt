Name: Dung Le
NetID: dle8
StudentID: 30677753

Partner: Loc Bui (lbui3)

Extra Credit Work:
- Try other language: C++
- Use dynamic programming (Complexity O(N*logN)): Go, C++, Ada, Python
- Modify one program to print all LIS: C++
- Modify Prolog, Python, and Ocaml programs to read from standard input, rather than the interpreter prompt.

Ada:
- Complexity: O(n*logn) using fenwick tree
- Idea: 
    - In order to have O(nlogn) complexity for this problem, we use fenwick tree data structure.
    Denote f[i]: the max leng of the sequence that ends with number i. For each number x, use 
    fenwick tree get max(f[j]) to get the maximum value of the length a sequence from all j < x,
    and update f[x] = max(f[j] + 1) back to the fenwick tree data structure.
- Limitation: 
    - maximun number is 10^5 due to fenwick tree
- Compare & contrast: 
    - Ada is similar to Pascal so it is pretty easy for me to implement the algorithm.
- Run:
    + With Makefile: enter the list in file input.txt and run make Ada
    + Manually: gnatmake a1.adb to compile, and run with ./a1, input the list in the terminal

Go:
- Complexity: O(n*logn) 
- Idea:
    - Using the same idea with Ada
- Limitation: 
    - maximun number is 10^5 due to fenwick tree
- Compare & contrast: 
    - Golang is fairly easy to implemented & debugged.
- Run:
    + With Makefile: enter the list in file input.txt and run make Go
    + Manually: go run a1.go and then input the list in the terminal

C++:
- Complexity: O(n* logn *number of LIS) 
- Will print out all possible LIS
- Idea: 
    - This implementation use the fenwickt tree again. Let's f[i] be the tuple of max leng 
    of the sequence that ends with number i and the list of all the sequence with leng equal 
    max leng that ends with number i, for each number x, use fenwick tree to get max(f[j]) 
    with j=1->x-1, and update f[x] according to f[j]
- Limitation: 
    - maximun number is 10^5 due to fenwick tree
- Compare & contrast: 
    - C++ version is easiest to implemented compared to other languages.
- Run:
    + With Makefile: enter the list in file input.txt and run make C++
    + Manually: g++ -o a1.out a1.cpp to compile, and run with ./a1.out, input the list in the terminal


Python:
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

Ocaml:
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
    
Prolog:
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