link_func()
{
	#check if the link target exsist
	if ! [ -f $1 ]; then
		echo >&2 $1 does not exsist
		return 1
	fi

	#remove the old link if it already exsist
	if [ -L ~/$1 ]; then
	    rm -d ~/$1
	fi

	#rename file if simbolic link destination is occupied
	if [ -f ~/$1 ]; then
	    mv ~/$1 ~/$1_legacy
	fi

	ln -s `pwd`/$1 ~/$1
}

link_func  .vimrc
link_func  .profile
link_func  .bashrc
link_func  .screenrc
link_func  .bash_profile
