Resources

https://towardsdatascience.com/running-python-programs-in-your-browser/

https://realpython.com/python-ides-code-editors-guide/

https://thonny.org

https://codewith.mu/es/

https://www.youtube.com/watch?v=YYXdXT2l-Gg&list=PL-osiE80TeTskrapNbzXhwoFUiLCjGgY7


https://diveintopython3.net/index.html

https://books.trinket.io/pfe/



https://docs.python-guide.org/



https://pythonbasics.org/flask-static-files/
https://pychallenge.com/exercise/first-script



https://www.youtube.com/playlist?list=PLU8oAlHdN5BlvPxziopYZRd55pdqFwkeS



https://landing.runestone.academy/






https://tutorial.djangogirls.org/es/template_extending/



https://github.com/FilledStacks/flutter-tutorials



https://www.youtube.com/watch?v=yvn6I9hzsJs&list=PLdTodMosi-BzlPDJ4u16Uq9dNMAXXOcvN



https://www.youtube.com/@TheFlutterWay/playlists



https://docs.flutter.dev/ui/adaptive-responsive



https://www.atlassian.com/software/bitbucket





















https://www.spyder-ide.org/





![](https://mybinder.org/static/logo.svg?v=fe52c40adc69454ba7536393f76ebd715e5fb75f5feafe16a27c47483eabf3311c14ed9fda905c49915d6dbf369ae68fb855a40dd05489a7b9542a9ee532e92b)

##### Turn a Git repo into a collection of interactive notebooks

Have a repository full of Jupyter notebooks? With Binder, open those notebooks i

https://mybinder.org/

# Pyodide

Pyodide is a Python distribution for the browser and Node.js based on WebAssembly.

https://pyodide.org/en/stable/usage/quickstart.html

# HTML and CSS for Python Developers

https://realpython.com/html-css-python/

# Deepnote

Everything your team and agents need to explore data, automate insights, and make better decisions.

https://deepnote.com/pricing

Cursos

Java

https://runestone.academy/ns/books/published/csjava/Unit7-Arrays/topic-7-1-array-basics.html#initializer-lists

vite

# The Build Tool for the Web

Vite is a blazing fast frontend build tool powering the next generation of web applications.

# Announcing py2wasm: A Python to Wasm compiler

py2wasm converts your Python programs to WebAssembly, running them at 3x faster speeds

https://wasmer.io/posts/py2wasm-a-python-to-wasm-compiler

---

---

Focusing deeply on one "primary" language while learning only the core primitives of others is one of the most practical strategies in software engineering.

Once you truly master one language, learning others becomes a matter of mapping syntax to concepts you already understand. Variables, loops, conditionals, functions, and data structures are universal.

### The Strategy: "T-Shaped" Developer Approach

```
          DEEP SPECIALIZATION                  BROAD CORE CONCEPTS
   ┌───────────────────────────────┐     ┌───────────────────────────────┐
   │                               │     │                               │
   │            PYTHON             │     │      C / Rust / JS / Go       │
   │  • Memory model & GC          │     │  • Variables & Data Types     │
   │  • Async & Concurrency        │     │  • Loops & Conditionals       │
   │  • Object-Oriented Patterns   │     │  • Functions & Parameters     │
   │  • Data Structures & Algorithms│    │  • Basic I/O & Syntax         │
   │  • Ecosystem & Frameworks     │     │  • Specific "Superpower"      │
   │                               │     │                               │
   └───────────────┬───────────────┘     └───────────────┬───────────────┘
                   │                                     │
                   ▼                                     ▼
        Your Core Production Tool             Mental Map & Paradigm Awareness
```

### How to Execute This Effectively

Instead of learning syntax for its own sake in other languages, pick **1–2 key languages** that teach you a paradigm Python hides from you.

| **Language**        | **The "Core" Focus Area**                                            | **What It Teaches You That Python Doesn't**                                             |
| ------------------- | -------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| **C**               | Pointers, stack vs. heap, manual memory allocation (`malloc`/`free`) | How computer memory, pointers, and machine execution actually work under the hood.      |
| **Rust**            | Ownership model, borrow checker, struct methods                      | Memory safety without garbage collection, zero-cost abstractions, and true concurrency. |
| **JavaScript / TS** | Event loop, promises, DOM manipulation                               | Asynchronous event-driven execution and how web applications render on the frontend.    |
| **Go**              | Goroutines, channels, interfaces                                     | Lightweight concurrency and simplicity in building fast backend services/APIs.          |

### The 4-Step Learning Roadmap

1. **Master Python's Deep Mechanics**
   
   Don't just write Python—understand how Python works under the hood. Learn reference counting, garbage collection, dynamic typing overhead, dunder methods (`__init__`, `__call__`), list comprehensions, generators, and async execution (`asyncio`).

2. **Learn the "Universal 5" in Other Languages**
   
   When touching C, Rust, or JavaScript, limit your initial exposure to:
- How variables are declared and typed (static vs. dynamic).

- Control flow (`if`/`else`, `for`, `while`).

- Function syntax, argument passing, and return types.

- Basic data structures (arrays/vectors, key-value maps).

- Error handling patterns (`try/catch` vs. `Result`/error codes).
3. **Isolate the Language's "Superpower"**
   
   Spend just a day or two understanding *why* that language exists. For C, compile a program to a `.so` or `.dll` binary. For Rust, understand borrow rules. For JS, make a `fetch()` call in a browser console.

4. **Bridge Back to Python**
   
   Whenever you learn a core concept elsewhere, ask: *"How does Python handle this differently?"* (e.g., C requires specifying `int` or `float`, whereas Python wraps everything in PyObject pointer structs).

---

Applying this **T-Shaped strategy** keeps your main effort focused on Python while extracting the core mental models from other languages in a structured way.

### 1. Python Roadmap (Deep Specialization)

The goal here is total mastery—understanding Python's internals, garbage collection, dynamic memory allocation, and concurrency models.

**The Roadmap**

- **Core Fundamentals:** OOP (`__init__`, `@property`), Iterators, Generators, Decorators, Context Managers (`with`).

- **Deep Mechanics:** Reference counting, Garbage collection (`gc` module), `PyObject` structure, the GIL (Global Interpreter Lock).

- **Data & Performance:** NumPy/Pandas memory layout (contiguous memory C arrays vs. Python pointers), Cython/C-extensions.

- **Async & Concurrency:** `asyncio` event loop, Task scheduling, Multiprocessing vs. Multithreading.

**Top Resources**

- *Fluent Python* by Luciano Ramalho (The bible for deep Python mechanics).

- *Real Python* (Articles on memory management and async).

- Official Python C-API documentation (To see how Python bridges to low-level C).

### 2. C Roadmap (The Systems Core: Memory & Hardware)

You are only studying C to learn **what happens under the computer hood** that Python hides from you.

**The Roadmap (Focus on 4 Core Concepts)**

1. **Variables & Static Types:** How primitive data types (`int`, `char`, `float`) correspond to fixed memory byte allocations.

2. **Pointers & Arrays:** Address-of (`&`), Dereference (`*`), pointer arithmetic, and how arrays are contiguous blocks of memory.

3. **Manual Memory:** Heap allocation (`malloc`, `free`) vs. Stack allocation.

4. **Compilation Pipeline:** Source `.c` $\rightarrow$ Object `.o` $\rightarrow$ Dynamic Shared Libraries (`.so` / `.dll`).

**Top Resources**

- *Learn C The Hard Way* by Zed A. Shaw.

- *Beej's Guide to C Programming* (Free online guide).

- Compiler Explorer (`godbolt.org`): Type C code on the left and see the compiled assembly code on the right.

### 3. Rust Roadmap (The Safety Core: Ownership & Borrowing)

Rust gives you C-level performance, but teaches you a modern paradigm: **memory safety without a garbage collector.**

**The Roadmap (Focus on 3 Core Concepts)**

1. **Ownership Rules:** Value moving, stack copy vs. heap allocation, scope dropping.

2. **Borrow Checker:** References (`&T`), mutable references (`&mut T`), and strict compile-time rules.

3. **Error Handling:** `Result<T, E>` and `Option<T>` patterns (replacing `try/catch` and `null` pointers).

**Top Resources**

- *The Rust Programming Language* (Free official book, often called "The Book").

- *Rust by Example* (Interactive online code snippets).

- *Rustlings* (Official exercise suite to get used to compiler errors).

### 4. JavaScript / TypeScript Roadmap (The Web Core: Event Loops & DOM)

You are studying JS solely to understand **client-side web execution, asynchronous events, and DOM state.**

**The Roadmap (Focus on 3 Core Concepts)**

1. **Event Loop & Async:** Callbacks, Promises, and `async/await` execution queue.

2. **DOM Manipulation:** Querying elements, handling browser events, updating HTML nodes.

3. **TypeScript Types:** Interfaces, generics, and strict type checking over standard JS objects.

**Top Resources**

- *JavaScript.info* (The Modern JavaScript Tutorial - free).

- *MDN Web Docs* (Mozilla's official JavaScript & DOM guide).

### 5. Go Roadmap (The Concurrency Core: Goroutines & Channels)

Go is designed for simplicity. You study it to understand **lightweight backend services and message passing.**

**The Roadmap (Focus on 2 Core Concepts)**

1. **Goroutines:** Spawning lightweight threads using the `go` keyword.

2. **Channels:** Communicating and passing data between concurrent routines without locks.

**Top Resources**

- *A Tour of Go* (`tour.golang.org`) — Official interactive tutorial.

- *Go by Example* (`gobyexample.com`) — Concise code snippets demonstrating core features.
