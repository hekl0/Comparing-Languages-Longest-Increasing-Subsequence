Name: Dung Le
NetID: dle8
StudentID: 30677753

Partner: Loc Bui (lbui3)

Work:
- Implement 3 languages: Python, Ocaml, Prolog
- Implement an O(nlogn) solution for Python

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
