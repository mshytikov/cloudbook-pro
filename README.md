## cloudbook-pro

This is my repository of personal configuration for development env.
I named it 'CloudBook-Pro'.  Feel free to look around.

Some intro slides: [here](https://www.slideshare.net/MaxShytikov/cloudbook-pro)

### Setup steps.
Please review the source code before.
The setup will replace dotfiles like `.bashrc` `.gitconfig` etc.

#### Local machine

Checkout project
```
git clone https://github.com/mshytikov/cloudbook-pro.git && cd cloudbook-pro
```

Setup instance
```
  make instance-setup
```

Restart terminal
```
  make secrets-setup
```

Activate gcloud
```
dgcp gcloud auth login
```

Update ssh keys and ips in
`cloudbook-pro/gcloud/infrastructure/cloudbook-pro.yml`


#### Create cloudbook-pro
Create `cloudbook-pro`:
```
make cloudbook-pro-create
```

ssh to the instance
```
cloudbook-pro ssh
```

checkout project
```
git clone https://github.com/mshytikov/cloudbook-pro.git && cd cloudbook-pro
```

Setup instance
```
  make instance-setup
```

Restart terminal
```
  make secrets-setup
```

### Delete cloudbook-pro

Delete the infrastructure
```
  make cloudbook-pro-delete
```
