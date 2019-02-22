## cloudbook-pro

This is my repository of personal configuration for development env.
I named it 'CloudBook-Pro'.  Feel free to look around.

Some intro slides: [here](https://www.slideshare.net/MaxShytikov/cloudbook-pro)

### Setup steps.
Please review the source code before.

The setup will replace dotfiles like `.bashrc` `.gitconfig` etc.
The backup of original dotfiles files stored in `git stash`.

#### Local machine

Make sure you have Docker installed.

Checkout project
```
git clone https://github.com/mshytikov/cloudbook-pro.git
```

Setup instance
```
 cd ~/cloudbook-pro && make instance-setup
```

Restart terminal
```
 cd ~/cloudbook-pro && make secrets-setup
```

Activate gcloud
```
dgcp gcloud auth login
```

Update ssh keys and ips in
`~/cloudbook-pro/gcloud/infrastructure/cloudbook-pro.yml`

Update author name in
`~/cloudbook-pro/dotfiles/git/.gitconfig`


#### Create cloudbook-pro
Create `cloudbook-pro`:
```
cd ~/cloudbook-pro && make cloudbook-pro-create
```

ssh to the instance
```
cloudbook-pro ssh
```

install make
```
sudo apt-get update && sudo apt-get install make
```

checkout project
```
git clone https://github.com/mshytikov/cloudbook-pro.git
```

Setup instance
```
  cd ~/cloudbook-pro && make instance-setup
```

It will fail after docker installation due to permission issue.
Just restart terminal
```
  cloudbook ssh
  cd ~/cloudbook-pro && make instance-setup
  cd ~/cloudbook-pro && make secrets-setup
```

### Delete cloudbook-pro

Delete the infrastructure
```
  make cloudbook-pro-delete
```
