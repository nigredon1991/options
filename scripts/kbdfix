#!/usr/bin/expect

#Name this file as kbdfix and make it executable in your path
eval spawn -noecho $argv

interact {
 \177        {send "\010"}
 "\033\[3~"  {send "\177"}
}
