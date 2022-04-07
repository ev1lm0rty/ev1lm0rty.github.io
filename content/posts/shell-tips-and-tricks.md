---
title: "Shell Tips and Tricks"
date: 2022-04-05T14:05:55+05:30
tags:
  - shell
  - linux
---

## About
Hi readers, it's been a long time since my last blog. I'm not used to blogging regularly, but anyways, I'm trying to keep up. So today I'll share some shell tips and tricks that I discoverd/read/picked-up-from-the-internet/learned-from-my-friends so that you can make your life easier too.


## Tips

### 1. Copy text from your shell to your clipboard.
Hate to select text manually from the terminal ? I feel you, here's how you can do it.

```bash
# Echo stuff and pipe it into your cliboard
echo "Hello" | xsel -ib

# Or you can cat a file and copy it to your clip-board
cat /etc/passwd | xsel -ib
```

To install  `xsel` :
```bash
sudo apt install xsel
```

---

### 2. Pipe text straight to vim to edit
So I used to usually pipe the out put to a file first and then `vim` it , but turns out you can directly pass stuff to it

```bash
curl <some-website> | grep <some regex> | vim -
```

Now you can edit your output and then save it to any file by going to command mode and `:w filename.txt`

---

### 3. Split terminals
For doing this I used `tmux` , and properly using tmux requires it's own blog , or multiple blogs tbh, so i'll just share the basics. 

Install tmux
```bash
sudo apt install tmux
```

Use my dotfile for tmux, that would make it really easy for you to use

```bash
git clone https://github.com/ev1lm0rty/DotFiles
mv ~/.tmux.conf ~/.tmux.conf.bak
cp DotFiles/tmux.conf ~/.tmux.conf
```

Now open your terminal and start tmux by simply typing `tmux`
It would look something like this :

![](//images/shell-tips/Pasted%20image%2020220405124605.png)


Now to split terminal
1. Vertically - `Ctrl + b v`
2. Horizontally - `Ctrl + b h`


![](/images/shell-tips/Pasted%20image%2020220405124834.png)

To move between terminals
`Alt + Up/Down/Left/Right`

To exit tmux `Ctrl + d` or simply type `exit`

---

### 4. Find files easily
This a tool that I discovered recently, and it has changed my whole work flow. fzf or fuzzy finder dynamically find files as you type. Obviously we can use it for so many different things, but for context of this blog, I'll just show you how to find files using fzf.

Install
```bash
sudo apt install fzf
```

Run
```bash
fzf
```

Example

![](/images/shell-tips/Pasted%20image%2020220405125350.png)

To exit, simply press `ESC`

You can pipe fzf to some other tool for example `cat` or `rm ` 

Example

![](/images/shell-tips/Pasted%20image%2020220405125504.png)

![](/images/shell-tips/Pasted%20image%2020220405125532.png)

![](/images/shell-tips/Pasted%20image%2020220405125616.png)



Now you might be wondering, why the output from my last command ` cat ` looks so beautiful ? for that, let's go to our next tip

---

### 5. Turn your boring cat to a beautiful cat 

Install
```bash
sudo apt install bat
```

Run 
```bash
batcat README.md

# or you can add an alias to your .bashrc/zshrc file to run batcat when cat is run
## like this:  alias cat='batcat'
## Restart your shell and then batcat will run whenever you will type cat

cat README.md
```

This will beautify and print your file as per it's format and it will also work like ` less `


---
### 6. Do you often forget command syntax ? Me too
And I found the best tool for it

Install

```bash
go get -u github.com/cheat/cheat/cmd/cheat
```

or download it from their [releases](https://github.com/cheat/cheat/releases)

Then just run it for any command you're forgetting, for example - ` tar `

```bash
cheat tar 
```

and it will output

![](/images/shell-tips/Pasted%20image%2020220405130757.png)

Pretty cool right ?

---

### 7. Want to send file from your laptop to your phone quickly ?
Say, both your phone and laptop are on the same network
We can use a python module to create a webserver quickly and then we can download the file on our moblie phones using any browser

* Step 1
```bash
cd /the-folder-in-which-the-file-is/

python3 -m http.server

## Find the ip of your laptop

hostname -I
```

* Step 2

On your phone, open up a browser and head to `http://<your-laptop-ip>:8000`

it will look something like

![phone](/images/shell-tips/new-phone.jpeg)

Just click on it and it will download it on your phone. Sweet isn't it ?


---

### 8.  Open temporary editor to run command
We have all faced this problem when writing long one-liners in bash. So here's what I do,
I press ` Ctrl+X Ctrl+E` and this opens an editor, then you can type your commands here and exit the editor, this will run your command as soon as you exit.

Example
![](/images/shell-tips/Pasted%20image%2020220405134939.png)

![](/images/shell-tips/Pasted%20image%2020220405135121.png)

![](/images/shell-tips/Pasted%20image%2020220405135141.png)

Now you can type bash programs, without worrying to make a mistake

---

### 9. Remove bloated directories and clean clutter

We all have some bloated directories, that are taking up too much space, we can clear them out with this tool 

```bash
sudo apt install ncdu
```

Now you  can choose your directory (let's say Work) and then run this command, this will show your the space that is being taken by each directory and you can delete files from inside this interactive command

```bash
cd /your-cluttered-directory

ncdu .

# the '.' specifies current directory
```

It will open up an interactive environment like this:

![](/images/shell-tips/Pasted%20image%2020220405135533.png)

You can move in and out of directories by using arrow keys and then you can delete the files by pressing the key ` d `.
*Be careful !! Don't delete any important files*

More options are also available

![](/images/shell-tips/Pasted%20image%2020220405135756.png)


---

### 10. Now wrapping up with some one-liners that I use

```bash
# Useful one-liners

## Find your public ip from the command line

curl ifconfig.me

## View contents while simultaneously writing it to a file

bash some-script-that-will-give-output.sh | tee file-to-write.txt

## Run previous command by using two exclaimation marks in the next line

echo "I want to print this twice"

!! # This will rerun the last command
```

---

## Conclusion
So these were (a few of so many) shell tips and tricks I used in my day to day work flow. I will try to make a part two for some advance shell/linux tips and tricks
in the future. If you find these helpful you can [buy me a beer](https://buymeacoffee.com/ev1lm0rty) ;)

Thank you
