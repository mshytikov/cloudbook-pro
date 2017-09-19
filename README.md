## cloudbook-pro

This is my repository of personal configuration for development env.

I named it 'CloudBook-Pro'

### Setup steps.
Please review the source code before.

#### Local machine

Checkout project
```
git clone https://github.com/mshytikov/cloudbook-pro.git && cd cloudbook-pro
```

Setup instance
```
  make instance-setup
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
ssh -A $(cloudbook ip)
```

checkout project
```
git clone https://github.com/mshytikov/cloudbook-pro.git && cd cloudbook-pro
```

Setup instance
```
  make instance-setup
```

### Delete cloudbook-pro

Delete the infrastructure
```
  make cloudbook-pro-delete
```
