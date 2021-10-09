# Postmortem
![what just happened.(meme)](https://s3.memeshappen.com/memes/what-just-happened-.jpg)
## Issue Summary:
on 09-07-2021 6:00 pm PST, i was unble to ssh to my web-server_1 with service reinsteated at 6:30 pm both web-servers wear able to function properly  The root cause of the outage was when installing firwell i forgaot to allow connection on port 22/TCP and loged out 

## Timeline for 9/07/21 (PST):
**6:00 pm:** after installing firwall and loging out i tried to get back in and recived `Connection refused` message 
**6:20 pm:** i used the command `sudo lsof -i -P -n | grep LISTEN` to see if its listenning on port 22
**6:22 pm:** i discovered that it was not lestinning on port `22/tcp`
**6:30 pm:** i requested new web-server installed all the neccessary files again and redo all the tasks on web-01 that was lost

## Root cause and resolution:
The root cause is forgetting to allow connection on `port 22` while installing `firwall(ufw)` when i configure the new server i made sure that ssh connection was allowed by using the command `$ sudo ufw allow 22/tcp`
## Corrective and preventative measures:
To prevent such kind of issues from happening again i made sure to cheack all the time on what ports is the server listening to before running any command  


