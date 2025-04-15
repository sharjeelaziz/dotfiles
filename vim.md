# vim refresher

If you are spending too much time in insert mode while editing text you are not using vim to its full potential.

## Understanding modes

- **Command Mode**: Commands can be movements, deletions, or commands that do these things and then enter into Insert Mode.
- **Insert Mode** is where you make changes to your file.
- **Visual Mode** is a way to select text. It’s a lot like Normal Mode, except your movements change your highlighting. You can select text both character-wise or line-wise, and once in one of those modes your movements select more text. The purpose of Visual Mode is to then perform some operation on all the content you have highlighted, which makes it very powerful.
- **Ex Mode** is a mode where you drop down to the bottom, where you get a “:” prompt, and you can enter commands. More on that later. Just know that you can run some powerful command-line stuff from there.

Like most Unix programs vim can be suspended by pressing **CTRL-Z** . This stops vim and takes you back to the shell it was started in. You can then do any other commands until you are bored with them. Then bring back vim with the "fg" command.

## Configuration
**Remap the ESC Key**:  vim is about efficiency, and it’s hardly efficient to leave the home keys if you don’t have to. This changes it from `esc` to `jk`

`inoremap jk`

or this

```
" Map key chord `jk` to <Esc>.
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
```

**Change Your Leader Key**: The leader is an activation key for shortcuts.

`let mapleader = “‘“`

With these two quick mods you can move through all your major vim workflows without having to move your left or right pinkies from the home row.

```
syntax on # highlight syntax
set number # show line numbers
set noswapfile # disable the swapfile
set hlsearch # highlight all results
set ignorecase # ignore case in search
set incsearch # show search results as you type
set filetype # show the file type
```

#### Spellchecking

```
set spell spelllang=en_us
```

#### Fix spelling with f

```
nnoremap f 1z=
```

#### Toggle spelling visuals with s

```
nnoremap s :set spell!
```

## Talking to your editor

- learn important verbs: **v** (visual, capital V for line), **c** (change), **d** (delete), **y** (yank/copy)
- learn some modifiers: **i** (inside), **a** (around), **t** (till..finds a character), **f**(find..like till except including the char), **/** (search..find a string/regex)
- learn some text objects: **w** (word), **s** (sentence) **p** (paragraph) **b**(block/parentheses), **t** (tag, works for html/xml) there are others

**To move efficiently in vim,** don’t try to do anything by pressing keys many times, instead speak to the editor in sentences

- delete the current word: **diw** (delete inside word)
- change current sentence: **cis** (change inside sentence)
- change a string inside quotes: **ci”** (change inside quote)
- change until next occurrence of ‘foo’: **c/foo** (change search foo)
- change everything from here to the letter X: **ctX**
- visually select this paragraph: **vap** (visual around paragraph)
- delete two words: d2w
- join lines and adding spaces between the joined lines: **J** 
- join lines without adding spaces: **gJ** 
- change inside sentence (delete the current one and enter insert mode): **cis**

- yank inside paragraph (copy the paragraph you’re in): **yip**

- change to open bracket (change the text from where you are **to** the next open bracket): **ct<**
- delete to the next period: **dt.**
- copy to the next semicolon: **yt;**

## Working with files
Some quick basics on working with your file.

- open your file in vim: **vi file**
- write your changes to the file: **:w**
- get out of vim (quit), but without saving your changes (!): **:q!**
- write your changes and exit vim: **:wq**
- save your file to that location: **:saveas ~/some/path/**

While **:wq** works, you  can also use **ZZ** that does not require a **:** or **:x**

- **ZZ**: a faster way to do :wq


### Navigation

#### Basic motions

- move down one line: **j**
- move up one line: **k**
- move left one character: **h**
- move right one character: **l**

#### Moving within the line
You can easily move within the line you’re on.

- move to the beginning of the line: **0**
- move to the end of the line: **$**
- move to the first non-blank character in the line: **^**
- jump to right before the next quotes: **t"** (, to repeat)
- jump and land on the next quotes: **f"** (; to repeat)

#### Moving by word
You can also move by word:

- move forward one word: **w**
- move back one word: **b**
- move to the end of your word: **e**

Use upper case to ignore delimiters in a word.

- move forward one big word: **W**   
- move back one big word: **B**

#### Moving by sentence or paragraph

- move forward one sentence: **)**
- move forward one paragraph: **}**

#### Moving within the screen

- move to the top of the screen: **H**  
- move to the middle of the screen: **M**
- move to the bottom of the screen: **L**
- go to the top of the file: **gg**
- go to the bottom of the file: **G**
- move up half a screen: **^U**
- move down half a screen: **^D**
- page down: **^F**
- page up: **^B**
- move to a given line number: **:line_number**
- scroll up one line: **^E**
- scroll down one line: **^Y**

#### Jumping back and forth

- jump to your previous navigation location: **Ctrl-i**
- jump back to where you were: **Ctrl-o**

### Changing text

#### Remembering your language

We can **change (c)**, **insert (i)**, or **append (a)**, and we can do variations on these, as seen below.

#### Basic change/insert options

- insert before the cursor: **i**
- append after the cursor: **a**
- insert at the beginning of the line: **I** 
- append at the end of the line: **A**
- open a new line below the current one: **o** 
- open a new line above the current one: **O** 
- replace the one character under your cursor: **r**
- replace the character under your cursor, but just keep typing afterwards: **R** 
- change whatever you define as a _movement_, e.g. a word, or a sentence, or a paragraph: **cm**
- change the current line from where you’re at: **C**
- change up to the question mark: **ct?**
- substitute from where you are to the next command (noun): **s**
- substitute the entire current line: **S**

- change inside sentence: **cis**
- go to the beginning of the line and enter insert mode: **I**
- start typing right after the cursor: **a**
- delete the line from where you’re at, and enter insert mode: **C**
- delete the entire line you’re on, and enter insert mode: **S**
- delete from the current line to the end of file: **dG**

#### Changing case
You can change the case of text using the tilde (~) command. It works as you’d imagine—either on the letter under the cursor, or on a selection.

#### Formatting text
It’s sometimes helpful to format text quickly, such as paragraphs, and this can easily be done with the following command:

- format the current paragraph: **gq ap** (gq works based on your text width setting, which means it’ll true up whatever you invoke it on to be nice and neat within those boundaries.  The “ap” piece is the standard “around paragraph” text object.)

#### Finding misspelled words

- enable or disable this by running **:set spell** and **:set nospell**
- go to the next misspelled word: **]s**
- go to the last misspelled word: **\[s**
- when on a misspelled word, get some suggestions:  **z=**
- mark a misspelled word as correct: **zg**
- mark a good word as misspelled: **zw**

## Searching your text

#### Searching by string
One of most basic  ways to search in vim is to enter the **/** command, which takes you to the bottom of your window, and then type what you’re looking for and press ENTER.

You can press “n” to go to the next instance of the result, or “N” to go to the previous one. You can also start searching backward by using “?” instead of “/”.

#### Jumping to certain characters

- jump forward and land on the < character: **f<**
- jump forward and land right before the < character: **t<**

- change sentence up to the comma: **ct,**


#### A search reference

- search for string: **/{string}**
- jump up to a character: **t**
- jump onto a character: **f** 
- search for other instances of the word under your cursor: **\***
- go to the next instance when you’ve searched for a string: **n**
- go to the previous instance when you’ve searched for a string: **N**
- go to the next instance when you’ve jumped to a character: **;**
- go to the previous instance when you’ve jumped to a character: **,**
 
### Deleting text

#### Basic deletion options

- exterminate (delete) the character under the cursor: **x**
- exterminate (delete) the character before the cursor: **X**
- delete whatever you define as a _movement_, e.g. a word, or a sentence, or a paragraph: **dm**
- delete the current line: **dd**
- delete from where you are to the period: **dt.**
- delete to the end of the line: **D**
- join the current line with the next one (delete what’s between): **J**
- delete surrounding tags:  **yitvatp** ( yank inside tag visual select entire tag and paste over it)

#### Undo and Redo

- undo your last action: **u**
- redo the last action: **Ctrl-r**

### Repeating actions

- using the “.” to repeat your last action
- delete a word: **dw**
- delete five more words: **5.**

Another really powerful repeat command is &, which repeats your last ex command

### Copy and paste

#### Copying text

- yank (copy) whatever’s selected: **y**
- yank the current line: **yy**

#### Cutting text
Cutting text is simple: it’s the same as deleting. 

#### Pasting text
If you delete a line using dd, you can paste it back using p.

Registers save the previous deletes, etc. You can look at register: **:reg**

#### A copy and paste reference

- yank (copy) from where you are to the next command (noun): **y**
- copy the current line: **yy**
- paste the copied (or deleted) text after the current cursor position: **p**
- paste the copied (or deleted) text before the current cursor position: **P** 
- switching lines of text: **ddp**

### Substitution
The basic setup is the: **%s**

- change “foo” to “bar” on every line: **:%s /foo/bar/g**
- change “foo” to “bar” on just the current line: **:s /foo/bar/g**

#### Making things repeatable
So let’s say that you’re adding a bit of text to the end of multiple lines, but you’re only doing it where the line contains a certain string. You can accomplish that like so:

Search for the string: **/delinquent**
Append some text to the end of the line: **ADO NOT PAY**

n would continue the search and . would repeat the append at the end of the line command: **n.**

## Text objects

#### Word text objects

- inside word: **iw**
- around word: **aw**

These are targets (nouns), so we can delete against them, change against them, etc.

* delete around a word: **daw**

The difference between “inside” and “around” an object is whether it gets the spaces next to it as well.

#### Sentence text objects

- inside sentence: **is**
- around sentence: **as**

Those work pretty much the same as with word objects, so imagine you’re knee deep into a sentence that you decide suddenly you hate. Instead of moving to the beginning of it and figuring out how to delete to the end, you can simply:

* change inside a sentence: **cis**

This deletes the entire sentence and puts you in Insert Mode at the beginning of your new one.

#### More object types
There are also a number of other object types.

- paragraphs: **ip** and **ap**
- single quotes: **i'** and **a'**
- double quotes: **i"** and **a"**

The same works for a few other types of items, including parenthesis, brackets, braces, and tags (think HTML).

Think about editing an HTML link, where there is the URL within double quotes, and then the link text within tags; this is handled elegantly by vim by doing two commands: **ci"** and then **cit**.

#### A text object reference
Here a list of the objects for your reference:

- words: **iw** and **aw**
- sentences: **is** and **as**
- paragraphs: **ip** and **ap**
- single quotes: **i'** and **a'**
- double quotes: **i"** and **a"**
- back ticks: **i\`** and **a\`**
- parenthesis: i( and a(
- brackets: **i\[** and **a\[**
- braces: **i{** and **a{**
- tags: **it** and **at**

### Visual mode
Selecting items with visual mode. Visual mode allows you to apply commands to the text that’s currently highlighted.

You enter Visual Mode with the “v” key, and there are three different options.

- character-based: **v**
- line-based: **V**
- paragraphs: **Ctrl-v**

#### Selecting inside containers
Often time you’ll be inside some content that is surrounded on both sides by something, such as , . ( { \[. You can visually select these things by issuing commands like these:

* select inside of parenthesis: **vi(**
* select inside of brackets: **vi\[**

You can also add a number to that to select two levels out (if you’re inside a nested set)

* select everything inside the second tier braces:  **v2i{**

You can also use **va** to select _around_ instead of _inside_. 

#### Character-based visual select
Starting with character-based (using v to enter from Normal Mode), you can use this to select characters, sets of characters, words, etc. 

#### Line-based visual select
You enter this mode by pressing the V key from Normal Mode.

#### Column-based visual select
Another option is to select text vertically, which is great for pulling columns of data.

#### Actions you can perform on visually selected text
Most operations are deletion, copy, and paste. 

- enter visual mode, select two more words of text, and copy them and go where you want to put them and type p to paste them there: **vwwy**
- enter line-based visual mode and delete a couple of lines below. You can also use text objects, which is seriously sick:  **Vjjd**
- visually select an entire paragraph: **vip**
- visually select an entire paragraph then paste it down below: **vipyjjp**

### Macros

- start recording a macro named “a”: **qa**
- stop recording: **q**:
- play back the macro: **@a**

You can have multiple macros stored in multiple registers, e.g. “a”, “b”, “c”, whatever. And then you just play them back with @a or @c or whatever.

#### Why macros
Macros can do just about anything you can do, so check out this workflow:

1. Search within the line for “widget”
2. Go to the end of the word and add “-maker”
3. Go to the beginning of the line and add a colon
4. Go to the end of the line and add a period.
5. Delete any empty spaces at the end of the line.

You can actually replay a macro on a visual selection by executing :normal @a (or whatever your macro register is) which will temporarily switch you into normal mode, for each line, and then execute the macro there.

### Changing file type

set ft=unix
set ft=html
set ft=dos

* show the current filetype, run or put **:set filetype** into your ~/.vimrc
