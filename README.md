# Exercise for ORCA devops team

## _Details_
### Autor
Dima Rudnitsky, 054-5369633, dima.rudnitsky@gmail.com

### Exercise access
<a href="https://jenkins.orcandies.click"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWJNT1NtMjtt5N9oSeipgp28BhHyYn51nh9agFJ9Fbnk3tYyR4JWJD&usqp=CAU" width=50/> </a><a href="https://candie.orcandies.click"><img src="https://media-exp1.licdn.com/dms/image/C4D12AQGugns9WxnkDA/article-cover_image-shrink_600_2000/0/1618692075073?e=1661385600&v=beta&t=g_wvotb8mXQtULE1IslJRE1LqOfzKPHS8y0BfDEguio" width="100"/></a>


## _System description_

#### Componets
- AWS account
- EKS cluster
- AWS CodeCommit as GIT repository
- AWS ECR as artefacts registry
- AWS route53 hosted zone as DNS
- AWS Certificate Manager
- AWS RDS as external DB
- AWS EC2 instans for Jenkins

#### Deployment tools
- Ansible for templating the configuration files
- Terraform for creation project related AWS components
- Helm for applicaiton deployment

#### EKS cluster componets
- EKS cluster
- spot node group up to 3 nodes
- aws-load-balancer-controller for ingresses
- external-dns for creating ingress hosts in the route53 hosted zone
- candie namespace where application pod is deployed

#### Application repository structure
- _**candie**_ directory contains _**src**_ , _**helm**_ and _**terraform**_ directories which are resposible for deployment tools
- _**Dockerfile**_ is responsible for the container building
- _**Jenkinsfile**_ is responsible for Jenkins pipeline
- _**devosp-config.yml**_ contains all the relevant deployment parametes for helm and terraform tools

#### Build triggers
- Jenkins is connected to AWS SQS service and listens the queue.  
- AWS CodeCommit repository connected to SNS and updates the SQS wiht the status.

