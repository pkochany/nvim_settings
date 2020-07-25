Writing this I am using Ubuntu 20.04 LTS. GNOME 3.36.3.

Step 1:
Actually install neovim:

terminal:
sudo apt install neovim


Step 2:
Run ":checkhealth":

nvim:
:checkhealth

The output for me shows that I miss python 2, python 3, ruby and node.js.

Step 3:
By the time of writing this python 2 is already outdated but I will install it anyway just to check all the boxes.

terminal:
sudo apt install python2

check with:
python2 -V


Step 4:
Python alone is not enough. We have to install pip. To do so first we require curl

terminal:
sudo apt install curl

with curl installed we run in terminal:
curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py

and:
sudo python2 get-pip.py

check with:
pip2 --version


Now we have to install neovim package for pip2:

terminal:
pip2 install neovim


Now my version of Ubuntu already comes with pre-installed python 3 with pip and all the goodies.
If yours does not please repeat step 3 and step 4 but change python2 to python3 and pip2 to pip3.

After it's done when I run checkhealth I can see more green.


Step 5:
Now let's satisfy neovim's craving for ruby and gem.

terminal:
sudo apt install ruby

sudo apt install ruby-dev

sudo gem install neovim

Now when I run :checkhealth I get green ok next to ruby, great!


Step 6:
Last dependency to satisfy is npm.

terminal:
sudo apt install nodejs

sudo apt install npm

sudo npm install -g neovim

Now when I run :checkhealth everything is green, just as God intended. Now is time for some magic.

Step 7:
Now we have to install neovim plugin manager:
Credits to:
https://github.com/junegunn/vim-plug

terminal:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

Step 8:
Download my repo called nvim_settings.

Copy files to neovim config location.

terminal:
cp -r UltiSnips ~/.config/nvim/

cp init.vim ~/.config/nvim/init.vim


Step 9:
Now when we run neovim a lot of errors will show up. Just ignore them and Enter your way through.

When you finally get to see familiar neovim screen write command:

nvim:
:PlugInstall


With that spell and the power of my sheer will you can now exit vim, open it again and be reborn into the brotherhood of neovim users. All hail simplicity!


At this point you have your neovim setup running with all my plugins and the settings I use every day.

Here you can find detailed information about all the plugins:

You can find some more info in the comments in the file itself.
If you want you can check each plugin's documentation on its github pages.


Now I have to say something about ctags.
ctags is a keyword refering to the result of a magic spell which checks project and generates
a file. This file can than be used by neovim to make it very easy to move around inside the project
and even to serve as code completion!

You can read more about this power here:
https://andrew.stwrt.ca/posts/vim-ctags/

My plugin list already contains plugins to use this technology. First we have to install
software capable of casting the magic spell.

terminal:
sudo apt install ctags

Now in our project we can cast:
terminal:
ctags -R -f ./.git/tags .

This will create ctags file which will be used by vim to navigate and generate code completion.

I create this file inside git folder so it will not interfere with the project itself.


Now lets install autocomplete dependencies for nice auto complete feature:

terminal:
sudo apt install build-essential cmake vim python3-dev

sudo apt install mono-complete

sudo apt install golang-go

cd ~/nvim/plugged/YouCompleteMe

sudo python3 install.py --all






Tips:

Ctrl + arrow to move between windows inside vim.

Crtl + n to open autocomplete based text in opened file.

arrows to navigate autocomplete suggestions.

tab to insert suggestion.

tab again to move across fillable fields.

ctrl + p to open project view.

ctrl + f to find file in project.

ctrl + q to exit without saving.

ctrl + b to open buffer explorer.

ctrl + t to open tags explorer.

ctrl + s to save current file.

By default my neovim is saving every file after you leave insert mode.
You can stop this behavior by commenting out line
let g:auto_save = 1
in ~/.config/nvim





