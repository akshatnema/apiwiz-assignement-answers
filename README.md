# apiwiz-assignment-answers

This repo contains answers of the all questions asked in apiwiz DevOps Internship assignment. Here are there solutions:

- ### Linux

  - **Provide steps to create a directory inside a directory where the parent directory does not exist:**

    Using -p option of mkdir command you can create a directory inside the another directory even if the parent directory doesn’t exist.

    Command:

    ```bash
    mkdir -p /path/to/parent/child
    ```

  - **How to install a package on a Linux server when there is no internet connection?**

    you can use `scp` (secure copy) or any other method you prefer to copy package to the desired directory on the server.

    For Debian-based systems (e.g., Ubuntu):

    ```bash
    sudo dpkg -i /path/on/server/package.deb
    sudo apt-get install -f
    ```

  - **How to access specific folders of Server A from Server B and Server C?**
  
     You can access specific folders on Server A from Server B and Server C using SSH (Secure Shell) and tools like sshfs or scp (secure copy).
  - **How to check all the running processes from a server?**

    You can check all the running processes on a server using the ps command in Linux. Commands to do this are:-

    ```bash
    ps -u <username> # List all processes for the current user
    ```

  - **Provide the command to delete all the files older than X days inside a specific directory.**

    Command:

    ```
    find /path/to/directory -type f -mtime +X -exec rm {} \;
    ```

  - **Create a shell script to identify the process ID
  a. script should as a user input for process ID
  b. If the process exists script should print the process ID and exit
  c. If the process doesn't exist script should print the process doesn't exist and asks for another input.**

    Bash file for the above script is [exit_process.bash](./exit_process.bash).

- ### Docker

  - **What is docker and why do we need it?**

    Docker is an application container platform. Containers allow one to create a standard unit containing an application and its dependencies and have a uniform environment where it can run despite being deployed from a different underlying system.

    Here are the following reasons why do we need it:-

    Docker allows for packaging of applications, together with all the dependences, in discrete units referred to as containers that are isolated. These containers allow similar behavior within any environment ranging from a developer’s local machine to production server. Docker also boosts server resources’ efficiency as fewer servers are occupied relative to its virtual counterpart. This facilitates transportation of applications. Also, it makes application transfer from one system to another or from a cloud platform to another. Microservice architecture aided by Docker enables splitting of complex apps into manageable independent deployment pieces.

  - **Write a docker file for a sample Java/python application.**

    I wrote the [Dockerfile](./Dockerfile) for a sample Python application.
  
  - **What is the docker lifecycle?**

    The Docker container lifecycle is the process of creating, running, and managing Docker containers. Containers are created from Docker images, run as isolated instances, can be stopped or paused, and can be removed when no longer needed. It consists of the following states:

    - Created
    - Running
    - Paused
    - Stopped
    - Removed

  - **What is the difference between an image and a container?**

    A docker **image** is an encapsulated unit containing everything required for running software application including the codes, dependent software, and settings it needs. A **container** instance will be run, and it acts as a template for generating one or more of these containers known as running instances. A container is an isolated portable environment which executes application according to an image. These enable more than one application to utilize a single host system without interference. Briefly, images are statistic printouts and container, the dynamic, runalbe instance generated via those printouts.
  - **How to check docker container logs? Provide the command for the same**

    To check the logs of a Docker container, you can use the docker logs command. Here's the command:

    ```bash
    docker logs <container_id_or_name>
    ```

- ### Kubernetes

  - **What are different types of services?**

    Different kinds of services in kubernetes address different networking needs. Internal communication is made easy among the pods because they can utilize the default ClusterIP service. NodePort exposes specific service on particular port across all nodes making them accessible externally. LoadBalancer allows seamless creation of an externally facing load balancer that distributes even traffic and is essential for public applications. ExternalName is an alias for external services; while Headless services provide DNS entries for direct pod communication. The load balancers with external traffic policy allow you to manage the flow of the traffic. Istio Linkerd provides advanced networking capabilities while managing of service external access route is based on rule set with use of Ingress.

  - **What is a pod?**

    A pod is, in essence, the smallest possible unit that can be controlled, in Kubernetes. A set of connected containers with shared networking namespace and shared storage volumes.

  - **Create a pod with the above created custom image when a pod dies k8s should automatically restart**

    I created a [create_pod.yaml](./create_pod.yaml) YAML file to create Pod.

  - **How to access the custom application with a specific port?**

    To access a custom application with a specific port in Kubernetes, you'll need to create a Service that exposes the application. Here are the steps I followed:

    - Create a Deployment to manage the pods running your custom application. I implemented this in [create_deployment.yaml](./create_deployment.yml) file.

      Apply this YAML using ```kubectl apply -f create_deployment.yaml```

    - I created a Service to expose your application and define a specific port for external access. I implemented this in [create_service.yml](./create_service.yml).

      Apply this YAML using ```kubectl apply -f create_service.yaml```.

    We can now access our custom application using the node's IP address and the chosen NodePort.

- ### CI/CD

  - **Set up a pipeline (Github actions/Gitlab runner/ Jenkins or any open source tool) to build, test, create a docker image, publish and deploy to k8s. Use the application present in this public repo <https://github.com/apiwizlabs/wizdesk>.**

    Github workflow file has been made inside `.github/workflows` and respected Dockerfiles are written in [Wizdesk](./wizdesk/) folder.

  - **Automate to spin up a network and virtual machines. Install the Nginx package and start the service(any cloud)**

    I wrote the [main.tf](./nginx-automation/main.tf) file to spin up the virtual machine in Microsoft Azure.
