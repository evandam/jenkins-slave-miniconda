# jenkins-slave-miniconda

This is a custom image from the [jenkins/jnlp-slave](https://hub.docker.com/r/jenkins/jnlp-slave/) Docker image, which installs [Miniconda](https://conda.io/miniconda.html) on top.

This allows Jenkins to run in Openshift to build Python applications with all the flexibility that Anaconda brings.

It can be deployed to Openshift with the following, assuming you have a project named `ci`:
```bash
$ oc project ci
$ oc new-app https://github.com/evandam/jenkins-slave-miniconda -l role=jenkins-slave
```
Restart your Jenkins instance for Openshift to recognize the new template. Your jobs in Jenkins should require then require the `jenkins-slave-miniconda` label.
