# GoTo
Quick Access bookmarks for terminal

# Tutorial
*BEFORE RUNNING THE SCRIPT*
Each shell script executes in its own sub-shell. So, commands such as "cd" won't
affect the parent-shell.
Since the script primarily depends on the 'cd' command, we need to ensure that
the command can be run in a shell-script, and performs the required task.
To avoid the problem, we source the script instead of running it.
Sourcing (done by. or source) causes the script to be executed in the same shell
 instead of running in its own sub-shell.
Sourcing the script does not create a new shell. All commands are run in the
current shell and changes to the environment take effect in the current shell.

Instead of running the script as ./script-name, use:
   . ./script-name.sh OR source ./scriptname.sh
************************************************************************
To run the script:
$ . ./goto.sh -s -> to Save the current working directory.
$ . ./goto.sh -g -> to go to a saved bookmark.
$ . ./goto.sh -l -> to list all the saved bookmarks.
$ . ./goto.sh -r -> to delete a saved bookmark.
$ . ./goto.sh -e -> to edit a saved bookmark.
$ . ./goto.sh -h -> to get help on how to use the script.

A Demo Run:
$ pwd
/home/prateek/GoTo
$ . ./goto.sh -s
Enter Bookmark Name:
goto
Saved
$ . ./goto.sh -l
goto : /home/prateek/GoTo
$ . ./goto.sh -e
Enter Bookmark Name:
goto
Enter new bookmark name.
newgoto
Edit Complete.
$ . ./goto.sh -l
newgoto : /home/prateek/GoTo
$ cd ..
$ pwd
/home/prateek
$ . ./GoTo/goto.sh -g
Where to go?
newgoto
$ pwd
/home/prateek/GoTo
$ . ./goto.sh -r
Enter Bookmark name
newgoto
$ . ./goto.sh -l
$
