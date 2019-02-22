### Common commands

For more details look at the source code.

Glossary:

_mybash_ - simple wrapper to provide access to content stored in `~/.secrets/mybash/`

[dvim](https://github.com/mshytikov/dvim) - dockerised vim with [Janus](https://github.com/carlhuda/janus)


Some common command examples:

| Context | Command | Description |
| --------| ------- | ----------- |
| bash | `secuqure-it`| to secure directory(recursively) |
| bash | `own-it` | to own directory (recursively) |
| bash | `mybash-<tab>` | to see what is in mybash |
| bash | `mybash-hello-copy`| to copy content of `hello` file from mybash |
| bash (local) | `ssh-add` | adds private key identities to the authentication agent |
| bash (local) | `cloudbook-pro ip` | to see IP of the cloudbook-pro |
| bash (local) | `cloudbook-pro start` | to start cloudbook-pro |
| bash (local) | `cloudbook-pro ssh` | to ssh to cloudbook-pro |
| bash (local) | `cloudbook-pro stop` | to stop cloudbook-pro |
| bash (local) | `cloudbook-pro port 8888` | to forward port 8888 from cloudbook-pro |
| bash (local) | `cloudbook-pro copy` | to copy content from dvim |
| bash (local) | `cloudbook-pro mount <path on remote>` | to mount remote folder under ~/mnt/cloudbook-pro/ |
| bash (local) | `cloudbook-pro umount` | to unmount folder under ~/mnt/cloudbook-pro/ |
| bash (local) | `cloudbook-pro ssh attach` | to ssh and attach to cloudbook-pro |
| bash (local) | `cloudbook-pro scale-up n1-highcpu-16` | to scale up cloudbook-pro |
| bash (local) | `cloudbook-pro scale-default` | to scale down cloudbook-pro |
| tmux | `Ctrl-A t` | new tab in tmux |
| tmux | `Ctrl-A n` | new layer (session) or tabs  in tmux |
| tmux | `Ctrl-A <h|j|k|l>` | vim binding for navigation between tmux windows/sessions |
| tmux | `Ctrl-A d` | detach from cloudbook-pro |
| dvim | `\ y` | to copy to persistent buffer visually selected content |
| dvim | `\ p` | to paste from persistent buffer a content |
| docker | `d` | alias to docker |
| docker | `dbash <container_id>` | to exec bash in running container |
| docker-compose | `dc` | alias to docker-compose |
| docker-compose | `dc-bash` | alias to start _app_ container and attach to bash |
| docker-compose | `dc-run ./command` | to run command inside _app_ container |
| gcloud | `gci list` | list instances in GCP |
| gcloud | `gcd list` | list disks in GCP |
| gcloud | `gci ip <instance_name>` | shows IP of the instance |
