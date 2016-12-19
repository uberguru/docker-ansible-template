## Template for Runing ansible role inside of docker container 

role created via ansible-galaxy init template-role

- Delete the template role 
- Use galaxy init to create your role

```
  ansible-galaxy init $ROLE_NAME
```

- update playbook.yml with your role name
- update Dockerfile file with your role details 

You can create as many roles as your need but remember if building MSA (micro service architecture avoid making moniliths)

build the container with 
```
  ./build-docker-image docker-ansible-template latest
```

this translates
``` 
  ./build-docker-image $IMAGE_NAME $VERSION
```


