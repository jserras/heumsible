### aliases based on the following directory structure
## ~/.mutt/
## ~/.venv/
## ~/Documents/
## ~/Documents/self/
## ~/Documents/self/repos/
## ~/Documents/project(or employer)/
## ~/Documents/project(or employer)/repos/



### Document directory aliases
for i in $(find ~/Documents/ -mindepth 1 -maxdepth 1 -type d);
do
  alias w-$(basename ${i})="workspace ${i}"
done


### setup the workspace aliases you like
function workspace(){

  ### make sure workspaces don't mix
  for i in $(alias |grep -Po " r-.*?=") ; do
      unalias $(echo ${i} | sed "s/.$//");
  done;

  ### repository aliases
  for r in $(find $1/repos/ -mindepth 1 -maxdepth 1 -type d -or -type l 2>/dev/null);
  do
    alias r-$(basename ${r})="cd ${r}; if [[ -d ${r}/.git ]]; then git status; fi"
  done

  ### lets move to the workspace
  cd $1

  ### ansible configuration per workspace
  export ANSIBLE_VAULT_PASSWORD_FILE="$1/.ansible_vault.txt"

  alias gdrive="google-drive-ocamlfuse -label $(basename ${1}) $1/gdrive/"

}

### virtualenv aliases
for v in $(find ~/.venv/ -mindepth 1 -maxdepth 1 2>/dev/null);
do
  if [ -f ${v}/bin/activate ]; then
    alias v-$(basename ${v})="source ${v}/bin/activate ; if [[ $(basename ${v}) =~ ansible.* ]]; then ansible --version ;fi"
  fi
done

### mutt mailbox aliases
for m in $(find ~/.mutt/ -mindepth 1 -maxdepth 1 -type f -iname "*.acc" 2>/dev/null);
do
  alias m-$(basename ${m}| cut -d . -f 1 )="cd ~/.mutt; mutt -F ${m}; cd -; clear";
done


alias tg="~/Documents/self/tg/bin/telegram-cli"
alias mylast='last -s $(date -d "last-sunday" +%Y-%m-%d)'
alias pwvault='ansible-vault encrypt_string $(pwgen -Cyn 20 1)'  ## generate password and vault it

export -f workspace
