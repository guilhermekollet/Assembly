# Vectors of integers in the assembly for the mips processor
<p>This repository has the objective of storing the work developed during the discipline of fundamentals in digital systems.</p>

# Register Table
<div align="center"><img src="https://user-images.githubusercontent.com/40221574/176965044-f31d50b1-6fb9-4012-9568-2282f324b789.png" /></div>

# Objective
<p>The problem of the work, is to go through three vectors</p>
- A [] = { 810 ,100, 560, 380, 600, 87 };
- B [] = { 800, 555, 817, 124, 890, 456 };
- C [] = { 345, 200, 700, 180, 600, 490 };
 <p>Perform the summation of each vector and then calculate its average. According to the specification, our goal was to take the minimum average value among the vectors. After registering the minimum value, all vectors are loaded again, registering in a new vector D, the values smaller than the minimum value contained.</p>
 

# Solve assembly.cpp // C++
<div align="center"><img src="https://user-images.githubusercontent.com/40221574/176967605-e1f8b240-acdf-4174-a371-1371b0a38108.png" /></div>

# Solve mips.asm //asembly

<h2>Before</h2>
<div align="center"><img src="https://user-images.githubusercontent.com/40221574/176967523-56ea6700-819c-4f42-a322-3f147412b970.png" /></div>

<h2>After</h2>
<div align="center"><img src="https://user-images.githubusercontent.com/40221574/176967499-961b5187-0d28-42df-a5e2-660f62b7e81d.png" /></div>
