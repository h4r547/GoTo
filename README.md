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
$ . ./goto.sh -s -> to Save the current working directory.<br>
$ . ./goto.sh -g -> to go to a saved bookmark.<br>
$ . ./goto.sh -l -> to list all the saved bookmarks.<br>
$ . ./goto.sh -r -> to delete a saved bookmark.<br>
$ . ./goto.sh -e -> to edit a saved bookmark.<br>
$ . ./goto.sh -h -> to get help on how to use the script.<br>

A Demo Run:<br>
$ pwd<br>
/home/prateek/GoTo<br>
$ . ./goto.sh -s<br>
Enter Bookmark Name:<br>
goto<br>
Saved<br>
$ . ./goto.sh -l<br>
goto : /home/prateek/GoTo<br>
$ . ./goto.sh -e<br>
Enter Bookmark Name:<br>
goto<br>
Enter new bookmark name.<br>
newgoto<br>
Edit Complete.<br>
$ . ./goto.sh -l<br>
newgoto : /home/prateek/GoTo<br>
$ cd ..<br>
$ pwd<br>
/home/prateek<br>
$ . ./GoTo/goto.sh -g<br>
Where to go?<br>
newgoto<br>
$ pwd<br>
/home/prateek/GoTo<br>
$ . ./goto.sh -r<br>
Enter Bookmark name<br>
newgoto<br>
$ . ./goto.sh -l<br>
$
