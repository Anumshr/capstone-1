# capstone-1

reference link:
https://medium.com/@andresaaap/simple-blue-green-deployment-in-kubernetes-using-minikube-b88907b2e267

Steps : 
1. Install jenkins , docker, aws cli, kubectl ,tidy 
2. Creation of jenkins file 
3. Creation of index.html file
4. Creation of docker file 
5. Set up a VPC from cloudformation script . 
6. create a EKS cluster from cloud formation script.
7. create worker nodes from cloudformation script
8. link to eks cluster
9. link nodes with cluster and run aws-auth-cm.yaml

Blue -green deployment ---
A Blue/Green deployment is a way of accomplishing a zero-downtime upgrade to an existing application. The “Blue” version is the currently running copy of the application and the “Green” version is the new version. Once the green version is ready, traffic is rerouted to the new version.

Blue/green folders - 
contains Blue/green index file . dockerfile to create a docker image for Blue/green deployment . 
contains dockerrun script to create docker image and upload script to push it to docker hub 
controller file for creating a replication controller that deploys pods . blue in one worker node , green in another. 

Blue-green loadbalancer: 
a service file that is deployed with blue , however in case of green roll out , can be modified . to green based deployment . 

