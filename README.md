#### Neo Vim configuration to make it work like IDE.

*Writing this I am using Ubuntu 20.04 LTS. GNOME 3.36.3.*

##### Step 1:

Actually install neovim. In terminal:

```
sudo apt install neovim
```

##### Step 2:

Run ":checkhealth". In neovim:

```
:checkhealth
```

The output for me shows that I miss python 2, python 3, ruby and node.js.

##### Step 3:

Install python2 and python3. In terminal:

```
sudo apt install python2
```

Check with:

```
python2 -V
```

##### Step 4:

Python alone is not enough. We have to install pip. To do so first we require curl. In terminal:

```
sudo apt install curl
```

With curl installed we run in terminal:

```
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
```

Finally we install pip. In terminal:

```
sudo python2 get-pip.py
```

Check with:

```
pip2 --version
```

##### Step 5:

Now we have to install neovim package for pip2. In terminal:

```
pip2 install neovim
```

As I said previously my version of Ubuntu already comes with pre-installed python 3 and pip. If yours does not please repeat step 3 and step 4 but change python2 to python3 and pip2 to pip3.

After it's done when I run :checkhealth I can see more OK fields, which is always good.

##### Step 6:

Now let's satisfy neovim's craving for ruby and gem. In terminal:

```
sudo apt install ruby
sudo apt install ruby-dev
sudo gem install neovim
```

Now when I run :checkhealth I get green OK next to ruby. Awesome!

##### Step 7:

Last dependency to satisfy is npm. In terminal:

```
sudo apt install nodejs
sudo apt install npm
sudo npm install -g neovim
```

Now when I run :checkhealth everything is green, just as God intended. Time for some magic.

##### Step 8:

Now we have to install neovim's plugin manager Vim-Plug. In terminal:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

##### Step 9:

Now download my repository called nvim_settings and copy files to neovim's config location. In terminal:

```
cd ~/
git clone https://github.com/pkochany/nvim_settings.git
cd nvim_settings
cp -r UltiSnips ~/.config/nvim/
cp init.vim ~/.config/nvim/init.vim
```

**Step 10:**
Now when we run neovim a lot of errors will show up. Just ignore them and Enter your way through. When you finally get to see familiar neovim screen write command (in nvim):

```
:PlugInstall
```


With that spell and the power of my sheer will you can now exit vim, open it again and be reborn into the brotherhood of neovim users.

You can find some more info regarding plugins in the comments in the init.vim file.
If you want you can check each plugin's documentation on its github page.

Now I have to say something about ctags.
ctags is a keyword refering to the result of a magic spell which checks project and generates
a file. This file can than be used by neovim to make it easier to move around inside the project.

You can read more about this power here:
https://andrew.stwrt.ca/posts/vim-ctags/

My plugin list already contains plugins to use this technology but it is missing some more software on the system itself. First we have to install software capable of casting the magic spell. In terminal:

```
sudo apt install ctags
```

Now in our project we can cast in terminal:

```
ctags -R -f ./.git/tags .
```

This will create ctags file which will be used by vim to navigate. Press **Ctrl + t** after you open some project file in neovim to see a tab with some helpful information.

As you can see in code above I create this tags file inside git folder so it will not interfere with the project itself but it can be in any location inside the project, neovim will find it and read it anyway.

Now lets install autocomplete dependencies for nice auto complete feature. In terminal:

```
sudo apt update
sudo apt install npm
sudo apt install build-essential cmake python3-dev
sudo apt install mono-complete
sudo apt install golang-go
cd ~/nvim/plugged/YouCompleteMe
python3 install.py --all
```

Now when you open neovim you will have some awesome autocompletion!

Now I want to figure out how to connect to DB and make autocomplete based on data in database work. This is still pending but for now this is enough for me.



##### Tips and tricks:

**Ctrl + arrow** to move between windows inside vim.

**arrows** to navigate autocomplete suggestions.

**tab** to insert suggestion.

**tab** again to move across editable fields.

**ctrl + p** to open project view.

**ctrl + f** to find a file in project.

**ctrl + q** to exit without saving.

**ctrl + b** to open buffer explorer.

**ctrl + t** to open tags explorer.

**ctrl + s** to save current file.



##### Info:

Because I'm lazy by default my neovim is saving every file after you leave insert mode. You can stop this behavior by commenting out line

```
let g:auto_save = 1
```

in

```
cd ~/.config/nvim
```

