## Template for Runing ansible role inside of docker container 

role created via ansible-galaxy init template-role

- Delete the template role 
- Use galaxy init to create your role

```
  ansible-galaxy init $ROLE_NAME
```

- update playbook.yml with your role name
- update Dockerfile file with your role details 

You can create as many roles as your need but remember if building MSA (micro service architecture avoid making monaliths)

build the container with 
```
  ./build-docker-image docker-ansible-template latest
```

this translates
``` 
  ./build-docker-image $IMAGE_NAME $VERSION
```

### Automatic builds with Travis CI 

Github provides free travis CI integration with to public open source projects.

We cheat a little here and just run a simple hello world style app to build, and the post build steps just build our ansible-role in the docker container and push to docker hub, we will update this later to actuall test the role steps outside of the container before running them in the container. 

Add travis CI integration 

setting > integrations & services 

![Alt text](images/settings1.png?raw=true "add travis")

click on the integration to add your token... the token can be obtained from travis-ci.org it will most likely prompt to authorise if adding integration for the first time. 

![Alt text](images/settings2.png?raw=true "update token")

Go to https://travis-ci.org/

![Alt text](images/traviscitoken.png?raw=true "get token")

to trigger a build you only now need to commit a change to the repo it will start the build and push the final image to dockerhub with the branch tags. 

![Alt text](images/buildstatus.png?raw=true "build status")


### Encrypting environment variables for travis CI builds 

your going to need to install the travis rubygem

gem install travis

this might install to your home folder the binary so just update your path if necessary in your .bashrc or .bash_profile

```
PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

```

to encrypt the credentials that used in the build process 

```
travis encrypt $DOCKER_USER=USERNAMEGOESHERE  --add
travis encrypt $DOCKER_PASS=DOCKERHUBPASSWORD --add

```

thats it! 

the final built image should appear in dockerhub 

![Alt text](images/dockerhub.png?raw=true "dockerhub")


### if this all looks like klingon 

Then perhaps today is a good day to die after all .... or then I suggest reading 

####Docker

https://docs.docker.com/engine/getstarted/step_four/
https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images

####Ansible

http://docs.ansible.com/ansible/intro.html


