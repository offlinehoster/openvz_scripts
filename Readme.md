# vzCTID_renumbering

If you have multiple openVZ hosts and you would like to migrate one openVZ Container between them, it´s necessary for your containers to have an own CTID. Because it´s not possible to move CTID 100 from HOST1 to HOST2 if there is another CTID running with CTID 100.


#### Installing
Just download the vzCTID_renumbering to your local /usr/local/bin or any other directory.

#### Bob has a question: Why don´t you just use -> 'vzctl chkpnt 100 --dumpfile /tmp/Dump.100' ?

The answer is easy, because it won't work if you have 'sysctl -w 'kernel.pid_ns_hide_child=1' enabled on your system to hide other CT's processes from your openVZ Host System (see also http://openvz.org/Processes_scope_and_visibility).


When you use 'vzctl --verbose chkpnt 100 --dumpfile /tmp/Dump.100' you will see the following lines

'Setting up checkpoint...
	suspend...
	dump...
Can not dump container: Invalid argument
Checkpointing failed'

And you should see something like this in your /var/log/messages

Jul 13 18:02:28 host4 kernel: [4512862.401722] CT: checkpointing not supported yet for hidden pid namespaces.

Have fun