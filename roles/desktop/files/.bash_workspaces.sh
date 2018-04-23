### Document directory aliases
for i in $(find ~/Documents/ -mindepth 1 -maxdepth 1 -type d);
do
  alias w-$(basename ${i})="workspace ${i}"
done


### setup the workspace aliases you like
function workspace(){

  ### make sure workspaces don't mix
  for j in r m v; do
    for i in $(alias |grep -Po " ${j}-.*?=") ; do 
        unalias $(echo ${i} | sed "s/.$//");
    done;
  done;

  ### repository aliases
  for r in $(find $1/repos/ -mindepth 1 -maxdepth 1 -type d 2>/dev/null);
  do
    alias r-$(basename ${r})="cd ${r}; if [[ -d ${r}/.git ]]; then git status; fi"
  done

  ### mutt mailbox aliases
  for m in $(find $1/.mutt/ -mindepth 1 -maxdepth 1 -type f -iname "*.acc" 2>/dev/null);
  do
    alias m-$(basename ${m}| cut -d . -f 1 )="cd $1/.mutt; mutt -F ${m}; cd -; clear";
  done

  ### virtualenv aliases
  for v in $(find $1/.venv/ -mindepth 1 -maxdepth 1 2>/dev/null);
  do
    if [ -f ${v}/bin/activate ]; then
      alias v-$(basename ${v})="source ${v}/bin/activate ; if [[ $(basename ${v}) =~ ansible.* ]]; then ansible --version ;fi"
    fi
  done

  ### lets move to the workspace
  cd $1

}