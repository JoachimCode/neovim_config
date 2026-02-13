ln -s ~/dotfiles/nvim ~/.config/nvim


if already exist:
mv ~/.config/nvim ~/.config/nvim.bak
ln -s ~/dotfiles/nvim ~/.config/nvim

FOR CPP:
For real IntelliSense accuracy you need:

compile_commands.json


Generate via CMake:

cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -B build
ln -s build/compile_commands.json .y

