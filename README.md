# [![CircleCI](https://dl.circleci.com/status-badge/img/gh/kusuma-ss/OperationalizeaMachineLearningMicroserviceAPI/tree/master.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/kusuma-ss/OperationalizeaMachineLearningMicroserviceAPI/tree/master)

## Project Overview

In this project, we are making use of CircleCI (for CI/CD), Dockers and Kubernetes tools to operationalize a Machine Learning (ML) model as a Microservice API

The ML regression model pre-trained on Kaggel dataset using `sklearn` python library.  It pedicts housing price in Boston based on certain features.

The ML model is wrapped as a python flask-app and uses REST API and allows interaction with RESTful web services. Therefore, the input features for ML model is represented in a json format. This is a client request to the app (ML model) which will be running on port 80 in Docker container. Port 80 of a docker is mapped to 8000 on the localhost.

Use the following steps to operationalize the ML model for inference.

## E. Create and Activate an Environment

### E.1. Git and version control

These instructions also assume you have `git` installed for working with Github from a terminal window, but if you do not, you can download that first from this [Github installation page](https://www.atlassian.com/git/tutorials/install-git).

**Now, you're ready to create your local environment!**

1. If you haven't already done so, clone the project repository, and navigate to the main project folder.

```bash
git clone https://github.com/udacity/DevOps_Microservices.git
cd DevOps_Microservices/project-ml-microservice-kubernetes
```

2. Create (and activate) a new environment, named `.devops` with Python 3. If prompted to proceed with the install `(Proceed [y]/n)` type y.

```bash
python3 -m venv ~/.devops
source ~/.devops/bin/activate
```
or

```bash
make setup
```

At this point your command line should look something like: `(.devops) <User>:project-ml-microservice-kubernetes<user>$`. The `(.devops)` indicates that your environment has been activated, and you can proceed with further package installations.

1. Installing dependencies via project `Makefile`. Many of the project dependencies are listed in the file `requirements.txt`; these can be installed using `pip` commands in the provided `Makefile`. While in your project directory, type the following command to install these dependencies.

```bash
make install
```

Now most of the `.devops` libraries are available to you. There are a couple of other libraries that we'll be using, which can be downloaded as specified, below.

---
### E.2. Other Libraries

While you still have your `.devops` environment activated, you will still need to install:
* Docker
* Hadolint
* Kubernetes ([Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) if you want to run Kubernetes locally)

#### E.2.1. Docker

You will need to use Docker to build and upload a containerized application. If you already have this installed and created a docker account, you may skip this step.

1. You’ll need to [create a free docker account](https://hub.docker.com/signup), where you’ll choose a unique username and link your email to a docker account. **Your username is your unique docker ID.**

2. To install the latest version of docker, choose the Community Edition (CE) for your operating system, [on docker’s installation site](https://docs.docker.com/v17.12/install/). It is also recommended that you install the latest, **stable** release:

3. After installation, you can verify that you’ve successfully installed docker by printing its version in your terminal: `docker --version`

#### E.2.2 Run Lint Checks

This project also must pass two lint checks; `hadolint` checks the Dockerfile for errors and `pylint` checks the `app.py` source code for errors.

1. Install `hadolint` following the instructions, [on hadolint's page]( https://github.com/hadolint/hadolint): 

**For Mac:**
```bash
brew install hadolint
```

**For Windows:**
```bash
scoop install hadolint
```

2. In your terminal, type: `make lint` to run lint checks on the project code. If you haven’t changed any code, all requirements should be satisfied, and you should see a printed statement that rates your code (and prints out any additional comments):

```bash
------------------------------------
Your code has been rated at 10.00/10
```

#### E.2.3 Installing Kubernetes locally
Follow [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) if you want to run Kubernetes locally

## R. Running ML app  

Before executing any following scripts below, it is necessary to preform above steps and required environment is prepared.
  
  1. Run [./run_docker.sh] script to build a image from Docker file and to start an flask app listening on port 80 within the docker container which is mapped to local port 8000.
  2. Run [./upload_docker.sh] script to upload previsously built docker image from step1 to Docker Hub.
  3. Execute [./make_prediction.sh] to verify flask-app response (The resonse provides prediction cost of the house with specific features).
  4. Use [./run_kubernetes.sh] to lauch app (listening on localhost 8000)with the help of Kubernetes.
  5. To test the ML app response (make prediction of house prices using certain features) use [./make_prediction.sh]. (To obtain detail log of app response, use `kubectl logs <podname>`. Find `<podname>` from run_kubernetes.sh )

# Directory/Files details in this repo

Directories   | Details
------------- | -------------
.circleci/config.file  | Using for CI/CD
output_txt_files/docker_out.txt | Copied the text output after calling run_docker.sh
output_txt_files/kubernetes_out.txt |Copied the text output after calling run_kubernetes.sh
app.py | falsk app python file
dockerfile| It conatines steps to build image
make_prediction.sh | It conatines prediction code
makefile| It is used to run python lint, hadolint,setup...etc
package-lock.json | It contains required packages for ML model
requirements | It contains python dependences
run_docker.sh|  This file is used to run dockerfile
run_kubernetes.sh| This file is used to run kubernetes
upload_docker.sh| This file contained commands to upload cdocker image to docker hub

