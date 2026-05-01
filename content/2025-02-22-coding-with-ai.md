---
title: Experimenting with AI Coding
---
I have been experimenting with AI coding, and am blown away by the results. Aider in particular is an incredible tool, and I cannot imagine ever going back to writing all my own code. The speed at which these tools are progressing is frightening.

As a firmware engineer, my coding habits are a little bit old school. I use `vim` as my text editor of choice (well, Neovim these days), am very comfortable on the command line, and write mostly C code with some Python sprinkled on top.

After a quick review of the AI coding landscape, I elected to try [Aider](https://aider.chat), because I felt it matched my workflow best. Aider is an opensource command line tool for pair-programming with AI. It supports many different models under the hood, and even lets you mix and match models (more on this later).

As of this writing, here is my Aider invocation: 
```
$ aider --architect --model o3-mini --reasoning-effort high --editor-model claude-3.5-sonnet
```

Aider works like most AI coding tools: you enter some prompts, and it responds and edits your code. I have settled into the "architect" mode workflow: I tell it what I want, it proposes a change, I confirm that it is what I want and asks it to implement it.

It feels - to me - like pair programming with a smart (and fast!) intern who knows the syntax and idioms of various languages much better than I do. However it regularly makes mistakes and if I give it too much to bite off in one prompt, it drowns.

It has transformed my relationship to code. What might have taken me a day or two of work now takes just an hour. As a result, I reach for code a lot more often! I write little utilities all the time, because it costs me so litte. Just tonight, I wrote a little script to push updates to this blog over WebDAV (instead of manual drag and drop). It took me 15 minutes.

What I have learned so far:
1. The models do best with Python and (Java|Type)-script, though they are reasonable at all mainstream languages.
3. It seems to me like it does better with backend than frontend. Most likely because it is not very good at looking at a screenshot and associating it with the code to understand what needs to be changed.
4. You have to own the overall design of the software. Technology choices, high level architecture, ...
5. Anything you can do to create a fast feedback loop on code quality will greatly improve the workflow. Use a compiler, type-checker, linter (e.g. Ruff), and a lot of tests (which the AI itself can generate). Feed errors back into the model and ask it to fix them. After a few failed attempts, step in and guide the model.
6. One prompt should be one ~200 LOC pull request (not a hard rule, just a good thing to keep in mind). You cannot give it a super high level goal. Think about how you might solve the problem yourself, and add some hints to the prompt (e.g. Wrap this in a new class and instantiate it here).
7. Assume it only has memorized the API for the MOST COMMON libraries, just like you would another engineer! Have a conversation with the model about what 3rd party library they might use to solve the problem, validate it is what you would do (or suggest something else). Then drop some example code in your prompt.
    1. In aider, you can have these conversations with `/ask`
    3. You can even pass it links to documentation. Aider will scrape them and add them to the prompt context.
8. When done with one feature, clear the history so it does not pollute the next. Sometimes the model will use previous guidance you gave it to try to do the next task, but that is rarely what you want. In aider, you can do this with `/clear`
9. When debugging something, ask the model what data it needs! Often times I'll run ripgrep and give it the output.
    1. E.g. `/ask What additional information might you need? Happy to run shell commands for you`
