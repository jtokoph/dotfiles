ln -s $PWD/zsh/.zshrc ~/.zshrc
ln -s $PWD/slate/.slate ~/.slate
ln -s $PWD/ruby/.irbrc ~/.irbrc
ln -s $PWD/ruby/.gemrc ~/.gemrc
ln -s $PWD/psql/.psqlrc ~/.psqlrc
ln -s $PWD/git/.gitconfig ~/.gitconfig
ln -s $PWD/git/.gitignore ~/.gitignore
ln -s $PWD/linters/.rubocop.yml ~/.rubocop.yml
ln -s $PWD/linters/.eslintrc.json ~/.eslintrc.json

mkdir -p ~/.config/micro
ln -s $PWD/micro/bindings.json ~/.config/micro/bindings.json
