Idempotency: idempotent because applying it multiple times does not change the final outcome.
-> No, Jenkins itself is not an example of idempotency. Jenkins is an open-source automation server
-> However, the build and deployment processes defined within Jenkins can be designed to be idempotent. For example, if you set up a Jenkins job that builds a software application, you can configure it in such a way that running the build job multiple times will produce the same output or artifacts each time, assuming the codebase remains the same.


Q. The errors or bugs in jenkins and how to troubleshoot it?
-> There are many potential errors or bugs that can occur in Jenkins. Here are a few common issues that you might encounter:
1. Build failures: One of the most common issues in Jenkins is build failures. This can 
   occur for a variety of reasons, such as code issues, configuration errors, or problems with dependencies. 
2. Plugin conflicts: Jenkins relies heavily on plugins to extend its functionality. However, 
   sometimes plugin conflicts can occur, which can cause issues such as broken builds or problems with job execution.
3. Resource constraints: Depending on the size and complexity of your Jenkins setup, you may encounter 
   resource constraints, such as CPU or memory limitations, that can affect performance and lead to errors.
4. Security vulnerabilities: As with any software, there is always the risk of security vulnerabilities in Jenkins. 
   These can be caused by issues with the core software or by vulnerabilities in third-party plugins.
5. Networking issues: If your Jenkins instance is distributed across multiple servers or locations, 
   you may encounter networking issues that can affect connectivity and cause job failures.

-> To troubleshoot errors or bugs in Jenkins, it's important to gather as much information as possible about the issue. 
1. looking at logs, monitoring metrics, or consulting documentation and support resources. 
-> Once you have identified the issue, you can work to develop and test a solution, and then roll out the 
   fix carefully and with minimal disruption to end-users.

Q: Difference between http clone and ssh clone?  
-> ssh has the advantage that you can use public key authentication, while you must use a username and password with HTTPS.

tomcat: web depoyment, no automated deployment
jenkins: advanceent from tomcat, automation is there

Steps included in running an application
Manually,
1. Build the application ( Maven{java}, Ant{C,C++}, Gradle, GCC )
2. generating the artifacts ( .war , .jar , .zip )
3. Stroing the artifacts ( Nexus, Gitlab, S3 bucket )
4. Scan the artifacts ( SonarQube )
5. Deploy into non-prod (dev and Qa) environments/Configuration tools ( Ansible , chef , docker, Puppet )
6. testing ( Unit-test (Junit), loadtest, regression test, automation test(Selenium) )
7. deploy to prod environments ( Ansible, chef , docker )
8. tagging/versioning ( Nexus ) - optional

Q. An application is running in web with a port, how do u restart the application?
1. "systemctl restart [service-name]"
2. Kill and start the process: You can use command line tools like `ps` and `kill` to find the process ID of 
   the application and then stop and start the process.
3. you can use container orchestration tools like Kubernetes or Docker Compose to restart the application.

--------------------------------------------------------------------------------------------------------------------------
1. What is Jenkins?
-> Jenkins is a self-contained, open-source automation server that can be used to
automate all sorts of tasks related to building, testing, and delivering or deploying software. 

-> Jenkins can be installed through native system packages, Docker, or even run standalone by any machine with a Java Runtime Environment (JRE) installed.

Jenkins
 - It is a tool, that will automate the manual procedure.
 - It is called as CI/CD tool ; CI: Continous Integration ,  CD:Continous deployment

after changing, restart jenkins, 
1. $$ sudo systemctl restart jenkins
   $$ sudo /etc/init.d/jenkins restart
2. ip:8080/restart    close and start
3. ip:8080/saferestart   first finish all running jobs then stop and start
   This plugin allows you to restart Jenkins safely. Jenkins restarts once all running jobs are finished. 
   Pipeline builds may prevent Jenkins from restarting for a short period of time in some cases, but if so,  
   they will be paused at the next available opportunity and then resumed after Jenkins restarts.
4. Manage jenkins-->manage plugins-->available tab-->saferestart-->install without restart button to add the plugin-->restartsafely link one can see
5. From CLI. download jenkinsCLI .jar file from manage jenkins-->Tools and actions-->jnekins CLI-->download,
   after download, run this command.. java -jar [path to the jenkins-cli.jar file] -s [Jenkins URL] restart

6. Go to the Jenkins installation, open the cmd and run://To start Jenkins manually open Console/Command line, then go to your Jenkins installation directory. Over there you can use the below commands:
	To stop: jenkins.exe stop.
	To start: jenkins.exe start.
	To restart: jenkins.exe restart.

Q. how will you change the port no. of jenkins?
-> sudo nano /etc/default/jenkins-->Scroll down and change HTTP portnumber-->sudo systemctl restart jenkins
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/var/lib/jenkins : default home directory: home folder, log folder, port confgs, encrypting jenkins
/var/lib/jenkins/plugins: installed plugins will be there
/var/log/jenkins : services related logs
var/lib/jenkins : to retain password disable use security option in /var/lib/jenkins confg.xml & restart jenkins, disable the security(make it security to false from terminal), when user forgets password. jenkins UI omits the authentication after restart. 
/etc/default/jenkins   to change default port number of jenkins.
/usr/lib/jenkins   .war file of jenkins are located here.
vi /etc/sysconfig/jenkins :modify required changes & restart jenkins, modify jenkins related settings
sudo /etc/init.d/jenkins restart   to restart jenkins(another method)
/var/jenkins_home/secrets/initialAdminPassword	  location of intial password of jenkins
cd /var/jenkins/jobs or /workspace  : to retreive lost jobs due to jenkins not working

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
What are the advantages of Jenkins ?
*It is open source and it is user-friendly, easy to install.
*It is free of cost.
*Easily Configurable.
*Platform Independent. Jenkins is available for all platforms and different operating systems, whether OS X, Windows or Linux.
*Rich Plugin ecosystem.
*Easy support. Because it is open source and widely used, there is no shortage of support 
 from large online communities of agile teams.
*Developers write the tests to detect the errors of their code as soon as possible. So the developers don’t waste 
 time on large-scale error-ridden integrations.
*Issues are detected and resolved almost right away which keeps the software in a state where it can be released at any time safely.
*Most of the integration work is automated. Hence fewer integration issues. This saves both time and money over 
 the lifespan of a project.

Q. what is DSL in jenkins? (Domain Specific Language)
-> Jenkins job DSL is a plugin that allows us to define jobs in programmatic form with minimal effort.
-> You can describe your jobs in Jenkins using a Groovy Based Language. Jenkins job DSL plugin was designed to make it easier to manage jobs.

*Jenkinsfile: Jenkinsfile is just a text file where we write pipeline code to define the Jenkins pipeline. It can be checked into source control like Git along with our project source code. In most cases, every application will have its own Jenkinsfile to build, test & deploy.
-> There are two ways of writing a Jenkinsfile – One is called Scripted Pipeline, where syntax for pipeline is strictly Groovy. Another is a relatively new way of writing Jenkinsfile called Declarative Pipelines.
For starters,
-If Jenkinsfile starts with the word node, then it’s a Scripted pipeline.
-If Jenkinsfile starts with the word pipeline, then it’s a Declarative pipeline.
-It is recommended using Declarative Pipeline as it offers more advantages over Scripted Pipeline.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Jenkins Architecture?
-> The Jenkins CI server checks the repository at regular intervals and pulls any newly available code. The Build Server 
   builds the code into an executable file. In case the build fails, feedback is sent to the developers. Jenkins deploys the 
   build application to the test server.

Jenkins Architecture:
   Here's how Jenkins elements are put together and interact:
-> Developers commit changes to the source code, found in the repository.
-> The Jenkins CI server checks the repository at regular intervals and pulls any newly available code.
-> The Build Server builds the code into an executable file. In case the build fails, feedback is sent to the developers.
-> Jenkins deploys the build application to the test server. If the test fails, the developers are alerted.
-> If the code is error-free, the tested application is deployed on the production server.
-> The files can contain different code and be very large, requiring multiple builds. However, a single Jenkins server cannot 
   handle multiple files and builds simultaneously; for that, a distributed Jenkins architecture is necessary.

-> For example, 10 developers simultaneously, 10 commits per each hour. it is calculated per day, no of commits per day is huge and Server has to integrate the change continuously. it is not possible to do this with a single server, as the load on the single Jenkins server is more. 
-> For that reason, Jenkins uses master -slave architecture. whenever there is a new commit, master allocates/distribute the work among the slaves. master server assigns the slaves, distribute the work among the slaves. slave works on the work assigned by the master.

Q. What is Jenkins Distributed Architecture (Master Slave architecture)
Ans: Jenkins uses a Master-Slave architecture to manage distributed builds. In this architecture, Master and Slave communicate through TCP/IP protocol. (TCP/IP stands for Transmission Control Protocol/Internet Protocol)

-In here single Jenkin master can handle as many as slaves we want.
Why: 
Jenkins Master:
-> Your main Jenkins server is the Master. The Master’s job is to handle:
* Scheduling build jobs.
* Dispatching builds to the slaves for the actual execution.
* Monitor the slaves (possibly taking them online and offline as required).
* Recording and presenting the build results.
* A Master instance of Jenkins can also execute build jobs directly.

Jenkins Slave:
-> A Slave is a Java executable that runs on a remote machine. Following are the characteristics of Jenkins Slaves:
* It hears requests from the Jenkins Master instance.
* Slaves can run on a variety of operating systems.
* The job of a Slave is to do as they are told to, which involves executing build jobs dispatched by the Master.
* You can configure a project to always run on a particular Slave machine or a particular type of Slave machine, or simply let 
  Jenkins pick the next available Slave.

----------------------------------------------------------------------------------------------------------------------------------------------
Setting Up worker node:
----------------------------------------

1. Cloud
2. Node

1. Cloud:
1.1 Install Amazon EC2 plugin (Manage Jenkins-plugin-Amazon EC2)
1.2 Setting up worker node: (Manage Jenkins-Cloud-New cloud-Cloud NAme{Demo}-Type{EC2})
1.3 Amazon EC2 Credentials: AWS IAM Access Key used to connect to EC2 {To provision instance}
1.4 EC2 Key Pair's Private Key: SSH private key value {For master to authenticate with agent}
1.5 AMI: AMI ID need to be provided, Security Gorup name, Remote FS root, Remote user: ubuntu, Remote ssh port:22
1.6 Labels: Provide label name so that we can use it in pipeline [Idle termination time:30min], provide inline script if you want.


** What are the ways to configure Jenkins node agent to communicate with Jenkins master?
   There are 2 ways to start the node agent –
-> Browser – if Jenkins node agent is launched from a browser, a JNLP (Java Web Start) file is downloaded.   
   This file launches a new process on the client machine to run jobs.
-> Command-line – to start the node agent using the command line, the client needs the executable agent.jar file.  
   When this file is run, it simply launches a process on the client to communicate with the Jenkins master to run build jobs.

** What is the use of JENKINS HOME directory?
-> All the settings, logs and configurations are stored in the JENKINS_HOME directory.
  /var/lib/jenkis

** What are the pre-requisites for using Jenkins?
-> The answer to this is pretty straightforward. To use Jenkins you require:
- Java is required
- A source code repository which is accessible, for instance, a Git repository.
- A working build script, e.g., a Maven script, checked into the repository.

** Mention what are the commands you can use to start Jenkins manually.
-- To start Jenkins manually open Console/Command line, then go to your Jenkins installation directory. Over there you can use the below commands:
-> Start Jenkins: jenkins.exe start
-> Stop Jenkins: jenkins.exe stop
-> Restart Jenkins: jenkins.exe restart

** How will you define Post step in Jenkins?
-> It is guaranteed to run at the end of a Pipeline's execution, we can add some notification or other steps to perform finalization, notification, or other end-of-Pipeline tasks. 
-> See Glossary - Build Status for the different build statuses: SUCCESS, UNSTABLE, and FAILED.
-> The condition block includes the following conditions – changed success, always, failure, unstable and aborted.
a. aggregate downstream test results
b. archive the artifacts, 
c. build other projects
d. deploy artifacts into maven
e. record fingerprints of files to track stagegit publisher
f. editable email notifications
g. set GitHub commit status
h. delete workspace when build is done
i. set build states on github commit

* What are Parameters in Jenkins?
-> Parameters are supported by Agent section and they are used to support various use-cases pipelines. Parameters are defined at the top-level of the pipeline or inside an individual stage directive.

Jenkins:
-> Dashboard-> (General, Source code management, Build triggers, Build environment, Pre-Steps, Build, Post steps. Build settings)

-----------------------------------------------------------------------------------------------------------------------------------------------
Q. Tell me something about Continuous Integration, Continuous Delivery, and Continuous Deployment (CI , CD)?
-> Continuous Integration: A software development process where the changes made
   to software are integrated into the main code as and when a patch is ready so that
   the software will be always ready to be - built, tested, deployed, monitored - continuously.
-> It is the integration btw SCM (Source Code Management) to Jenkins, whenever someone commits code into SCM Jenkins will pick 
   the latest code into pipeline and start building it. The process will be continuous with the help of GitHub webhook.

*  webhook: A webhook is an HTTP-based callback function that allows lightweight, event-driven communication between 2 application 
         programming interfaces (APIs).
*  API: API makes Jenkins even easier to use by providing an easy to use conventional python interface.

** Continuous Delivery: This is a software Development Process where the continuously integrated (CI) changes will be tested & deployed 
   continuously into a specific environment, generally through a manual release process, after all the quality checks are successful.
-> Once the artifact is build and deployed into UAT(User Acceptance Testing) or QA(Quality Assurance) servers, will to testing of the application on QA servers.
                                                                                               
** Continuous Deployment: A software Development practice where the continuously integrated (CI) changes are deployed automatically into the target environment after all the quality checks are successful.
-> Once testing is done, we deploy the application into prod servers where end user is using the application.

Based on the level of automation, the above three paradigms can be better represented as below -

CODE -> BUILD -> INTEGRATE -> RELEASE -> DEPLOY
<-CONT INTGn->
<- -   CONTINUOUS DELIVERY  - ->
<- - - - -    CONTINUOUS DEPLOYMENT   - - - ->

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. How to secure jenkins?
1. Authentication: who can access it
	a. LDAP (Lightweight Directory Access Protocol): who can do operation
*  So if we want to access jenkins with LDAP credentials we need to install LDAP plugin.
   ## manage jenkins -> confg global securty -> select LDAP Security realm -> fill server details & test LDAP setting -> save

2. Authorization:  what they can do, permission
	a. matrix based security: it will allow to give required permission for a user by checking the checkboxes. (To add users here, you need to add users under, {Manage jenkins-Users-Add user})
	b. Role based authorization strategy
   ## manage jenkins -> confg global securty -> select matrix based security-> select checkboxes

3. Enable CSRF Protection (Crumb Issuer: called a "crumb"):
-> CSRF (Cross-Site Request Forgery) is a type of attack where a malicious website or attacker tricks a user into performing actions on a web application without their knowledge or consent. In the context of Jenkins, CSRF can occur when an attacker makes authenticated requests on behalf of a user (for example, triggering builds, changing configurations, etc.).
-> Cross-Site Request Forgery (CSRF): also known as "one-click attack" or "session riding," is a type of web security vulnerability that allows an attacker   to execute unauthorized actions on behalf of an authenticated user. It occurs when a user unknowingly performs actions on a web application without their consent.

4. Markup Formatter:
-> security feature that controls how Jenkins processes and displays user-generated content (such as descriptions, job outputs, and other text-based inputs) that might contain HTML or other markup.
** Purpose:
a. The Markup Formatter is designed to prevent Cross-Site Scripting (XSS) attacks by ensuring that user input is either sanitized or restricted to prevent dangerous HTML or JavaScript from being executed.
b. XSS attacks occur when an attacker injects malicious code (such as JavaScript) into a web page viewed by others. In Jenkins, malicious code could be injected into fields like job descriptions, parameters, or console outputs.

4. Secure Jenkins Home Directory:
-> Restrict access to the Jenkins home directory (usually located at /var/lib/jenkins) to authorized users and processes.

5. Backup and Recovery:
-> Regularly backup your Jenkins configuration and data. Implement a disaster recovery plan to restore Jenkins in case of any security incidents or hardware failures.

6. Network Security:
-> Implement proper network security measures, such as firewall rules, to restrict access to Jenkins from specific IP addresses or networks.
	
Q. How do you store credentials in Jenkins securely?
-> Credentials can be stored securely in Jenkins using the Credentials plugin, which stores different types of credentials like - Username with a password,  SSH username with the private key, AWS Credentials, Jenkins Build Token, Secret File/Text, X509 & other certificates, Vault related credentials securely with proper encryption & decryption as and when required.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3. What are the common use cases Jenkins is used for?
-> Jenkins being open-source automation can be used for any kind of software-based
    automation. Some of the common use-cases include but not limited to -
* Software build jobs
* Sanity/Smoke/CI/Regression test jobs
* Web/Data Scraping related jobs
* Code coverage measurement jobs
* General-purpose automation
* Reverse Engineering jobs
* Key Decoding jobs & many other jobs where software automation will be applicable.

----------------------------------------------------------------------------------------------------------------------
4. What are the ways to install Jenkins?
-> Jenkins can be installed using -
1. Native System Package Manager like - apt (Linux), brew (Mac), etc.
2. Docker (popular docker images for Jenkins is available for different platforms like Unix/Mac/Windows in the docker registry)
3. Kubernetes (available as a helm chart and can be installed on our Kubernetes clusters)
4. Standalone (on any machine with a Java Runtime Environment installed)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. What is a Jenkins job?
-> A Job/Project is the fundamental unit of a logical work (like a software build, an automation task, test execution, etc) using the Jenkins automation server and other required plugins, configurations & infrastructures.
*  Jobs can be of different types like - a freestyle project, a multi-configuration project, a pipeline project, a multi-branch project, etc.
*  common job: sotware build, maven, freestyle, multistazze jobs, sonarquube, nexus these are common jobs

-> Types of Jobs in Jenkin:
** Freestyle Project: Allows users to automate simple jobs, such as running tests, creating and packaging applications, producing reports, or executing commands. Freestyle projects are repeatable and contain both build steps and post-build actions.

** Pipeline: A DevOps pipeline is the set of automated processes and tools that the development and operations teams use to compile, construct, test, and deploy software code faster and easier. However, the term "pipeline" isn't an exact fit; it's more like an assembly line.

** Multibranch Pipeline: It enables you to implement different Jenkinsfiles for different branches of the same project. 
-> In a Multibranch Pipeline project, Jenkins automatically discovers, manages and executes Pipelines for branches which contain a Jenkinsfile in source control.
-> Jenkins uses the SCM plugin (such as the Git plugin) to scan the connected repository for branches. Jenkins then executes the pipeline defined in the Jenkinsfile for each branch.
-> Branch Discovery strategies: you can configure Jenkins to build only specific branches using Branch Discovery strategies

** Folder: allows users to create "folders" to organize jobs. Users can define custom taxonomies (e.g. by project type, organization type).
-> Folder Job is essentially a container or a way to organize and group jobs (projects) together within the Jenkins UI. It doesn't execute any builds by itself, but it helps in managing jobs in a structured, hierarchical manner. Folder jobs allow you to categorize Jenkins projects, making it easier to manage and navigate a large number of jobs.

** GitHub organization: The Github Organization project module handles creating Jenkins Github Organization jobs, which are made up of multibranch pipelines for all repositories containing the specified Jenkinsfile(s). You may specify githuborg in the project-type attribute of the Job definition. Plugins required: GitHub Branch Source Plugin.

** Multiconfiguration Projects/Matrix Projects or Multi-Branch Pipeline with Multiple Configurations: 
-> We can create only one job with many configurations. Each configuration will be executed as a separate job. This is exactly what we need to simplify our scheduled tests, which can be used in conjunction with TestComplete or TestExecute.
-> Allows you to run the same pipeline job across multiple configurations. This is useful when you need to test or build the same project under different conditions, such as multiple operating systems, JDK versions, or other environment variations.
Key Concepts
1. Matrix: In Jenkins, a matrix project allows you to define a set of axes (e.g., OS, JDK version) and run a job for each combination of those axes.
2. Axes: These are variables that Jenkins uses to determine how to split the job. For example, an axis could be different operating systems (Linux, Windows), or different versions of Java (JDK 8, JDK 11).
3. Configuration: A configuration is a specific combination of axis values, and Jenkins will run the pipeline with each configuration.

-> Difference between freestyle and pipeline:
1. The main aim of the freestyle project is implementing, developing, or running simple jobs such as enabling you to specify the version control system from where you need to extract code and build it and call tests.  Freestyle projects are for orchestration simple jobs for a project.
2. Pipeline Project is better either to set up a CD pipeline or to define the deployment pipeline as code. 
The pipeline project is suitable to build pipelines for complex jobs whereas the freestyle project is suitable for simple jobs.

** Triggering Stages while creating Jenkins job:
- Build Trigger: It is used to trigger the job based on time, based on commit or if previous job is completed.
- Build periodically: We have to mention time like crontab. It will trigger the build based on the time and also it is scheduler crontab.
  E.g: 1) we are deleting log file every tree hours.
       2) to purge log files to reduce the load on server Ex: eveery day or every monday at 10am.
- Poll SCM: This will trigger based on commits within the specified time, job will be triggered based on commit.
- Build Step: This is used to compile and make a target file and also compile and generate a binary.
  - Execute shell, if you use execute shell it will executes shell scripts.
- Post build-Action: this is used for post build activities like after deploying, you can run the test cases or sending an email notification or copying the shared path.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
6. What is a Jenkins Pipeline?
Ans: 
	START---------BUILD----------RUN TESTS----------DEPLOY----------END
				|		  |
				|  TEST ON LINUX  |
				|		  |
				--TEST ON WINDOWS--
-> The pipeline is a special type of Jenkins job - simply a sequence of steps controlled by a defined logic - which Orchestrates 
long-running activities that can span across multiple build agents. It is suitable for building pipelines (formerly known as 
workflows) and/or organizing complex activities that cannot be easily achieved using a freestyle job.

-> Uses of pipeline:
-  Divides jobs into parts (buidl/test/prod) & each part run in each agent.
-  Parallel execution of stages are easy to configure so that we can save time
-  Each stage can execute dif version of jdk/mvn versions
-  can trigger from failed stage
-  visualize build flow
-  version control, code review, pause and restart build
-  In multibranch script automatically creates sub branches.

Q. What are the types of Jenkins pipelines?
-> Jenkins Pipelines can be either
1. CI CD pipeline (Continuous Integration Continuous Delivery): Here we will configure upstream and downstream jobs.
2. Scripted pipeline: syntax for pipeline is strictly Groovy
3. Declarative pipeline

For starters,
- If Jenkinsfile starts with the word node, then it’s a Scripted pipeline.
- If Jenkinsfile starts with the word pipeline, then it’s a Declarative pipeline.
- It is recommended using Declarative Pipeline as it offers more advantages over Scripted Pipeline.

1. Scripted Pipeline: It uses the Groovy (JVM-based) language to create a pipeline as code. Some software developers prefer this pipeline because the use of Groovy code paves the way for making numerous APIs available. As a result, developers can orchestrate rather complex CD pipelines.
*  here node will be there, code defined in node block
*  the steps/stages can be custom-defined & used using a groovy syntax which provides better control & fine-tuned execution levels.
*  For creating scripted pipelines in Jenkins, developers must include a pipeline code within the UI(User Interface) and save it. 
*  if u install everything in single instance, Jenkins will crash.

** What is Groovy?
-> Groovy from Apache is a language designed for the Java platform. It is the native scripting language for Jenkins. 
Groovy-based plugins enhance Jenkins with great interfaces and build reports that are of dynamic and consistent nature.

Here’s the general syntax of a scripted pipeline:
node {  
    stage('Build') { 
       …….
    }
    stage('Test') { 
       …….
    }
    stage('Deploy') { 
      …….
    }
}

2. Declarative Pipeline: It follows a relatively newer syntax, which narrows the scope of the pipeline structure through a pre-defined “minimum necessary structure.” 
-> On the technical front, the declarative syntax follows a conditional statement logic that generates a series of stages, executed sequentially throughout the pipeline’s lifecycle. 

* Declarative Pipeline: It is the new way of witting jenkins pipeline with groovy declaratives.
	- It is written in a file and is checked into git repo.
* makes use of numerous, generic, predefined build steps/stages (i.e. code snippets) to build our job according to our build/automation needs
Here’s the general syntax of a declarative pipeline: (even if build stage fails it should go to next stage i.e, test)
pipeline {
    agent any 
    stages {
        stage(‘git checkout’) { 
            steps {
               …….
            }
        }
    stages {
        stage(‘Build’) { 
            steps {
               …….
		try {			(to continue to next stage even after build fails)
                    sh './build.sh'
                } catch (err) {
                    catchError {
                        echo "Build failed, but we're continuing to the next stage anyway."
                    }
		}
            }
        }
        stage(‘Test’) { 
            steps {
               …….
            }
        }
        stage(‘Deploy’) { 
            steps {
                …….
            }
        }
    }
}
post {
        always {
            script {
                // Send email notification when build completes
                emailext body: 'Build has completed',
                subject: 'Build Notification',
                to: 'user@example.com',
                attachLog: true
            }
        }
        success {
            script {
                // Send email notification when artifacts are stored
                emailext body: 'Artifacts have been stored',
                subject: 'Artifacts Notification',
                to: 'user@example.com',
                attachLog: true
            }
        }
        failure {
            script {
                // Send email notification when deployment is completed
                emailext body: 'Deployment has failed',
                subject: 'Deployment Notification',
                to: 'user@example.com

** Upstream and downstream job:
-> An upstream job is a configured project that triggers a project as part of its execution. 
-> A downstream job is a configured project that is triggered as part of a execution of pipeline. 
  We can configure one or more projects as downstream jobs in Jenkins.

Q. where is agent in jenkins:
-> In Jenkins terminology, an agent is a machine that is set up to execute Jenkins jobs. 
-> The agent can be a physical or virtual machine, a container, or even a cloud instance.
-> It can be /var/jenkins/agent/e2e-pipeline , but it varies according to your environment. 
   It is the working directory of the agent. Enter e2e-pipeline in Label. Select Launch agents via SSH in Launch method.
-> In Jenkins, go to Manage Jenkins, then Manage Nodes, then click New Node. Here you can give your agent node a name, then select Permanent Agent and click OK.
   
*Agents:
1. Agent any: Runs pipeline/stage in any available agent.
2. Agent docker: It uses docker container as a executer to pipeline stage
3. Agent label: executes the stage on only labelled nodes, when you provide agent label each stage will mandatorily uses label node.
4. Agent none: indicates there is no global agent for entire pipeline & each stage must specify its own agent.
5. Agent parallel: It run stages parallelly at a time.

Stage: Defines particular stage (Build/test/deploy) of our job.
-At least one stage has to be there,
-Name will display on jenkins dashboard.
Step: we need to write steps inside the stage directive.
-Steps contains commands/scripts that use in the build.

*Hello world pipeline
pipeline {
	agent any {
		stages {
		stage ("Hello world") {
		steps {
		echo "Hello world"
			}
		}	
	     }
	  }
   
Q. can we run agent behind webproxy?
-> To enable the agent to run behind a web proxy, pass --proxyurl , --proxyusername and --proxypassword during agent configuration.
   
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
8. Explain Jenkins Multibranch Pipeline?
Ans:
	START---------BUILD----------TESTS----------Del for DEPLOY----------Deploy for Prodn------------END 

It is a pipeline job that can be configured to Create a set of Pipeline projects according to the detected branches in one 
SCM repository. This can be used to configure pipelines for all branches of a single repository e.g. if we maintain different 
branches (i.e. production code branches) for different configurations like locales, currencies, countries, etc.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
10. Name some of the plugin used in Jenkins and how to install it?
Ans: How to install a plugin:
A: Manage jenkins - manage plugins - 
* update :- it will update the plugins
* Available: List of available plugins.
* installed: list of installed plugins.
* Advance: the plugin which is not available.

Jenkins Plugins and Features: Installation Feature

* Docker Plugin: The Docker in Docker container allows the Jenkins controller to run jobs inside Docker images.
* Jira Plugin: Jenkins Jira Integration is to create a free, easy, and secure way to connect the servers running behind the firewall.
            ->  project management and issue tracking tool developed by Atlassian
* Slack Notification Plugin: This integration will post build notifications to a channel in Slack. It makes it easy to contact your colleagues – you can message anyone inside or outside your organisation and collaborate just as you would in person
* Maven Plugin: Maven is a project management and build tool that is driven by a pom.xml file. It has made the build process simple, easy, and consistent. It provides the capabilities to configure, build, and run Maven-based projects in Jenkins. This is a must 
             pre-requisite for the integration of Maven with Jenkins.
* Amazon EC2 Plugin: If Jenkins notices that your build cluster is overloaded, it'll start instances using the EC2 API and 
             automatically connect them as Jenkins agents. When the load goes down, excess EC2 instances will be terminated.
* JUnit Plugin: Jenkins can provide useful information about test results, such as historical test result trends, a web UI 
             for viewing test reports, tracking failures, and so on.
* Pipeline Plugin: Pipeline functionality helps Jenkins to support continuous delivery (CD). The Pipeline plugin was built 
             with requirements for a flexible, extensible, and script-based CD workflow capability in mind.
* Mailer Plugin: This plugin allows you to configure email notifications for build results. This is a break-out of the original 
             core based email component.
* Green Balls Plugin: Historically Jenkins has used the blue color to denote successful builds. If you prefer, you can change the 
             color to green with the Green Balls plugin.
* Blue Ocean plugin: Blue Ocean rethinks the Jenkins user experience, compatible with Freestyle jobs, Blue Ocean reduces clutter and increases clarity.
* Role Strategy plugin: It is meant to be used from Jenkins to add a new role-based mechanism to manage users' permissions.
* Gearman Plugin: This plugin uses Gearman to support multiple Jenkins controllers, designed to support extra slaves, allow load balancing of build jobs, and provide redundancy.
* Job Import plugin: In Jenkins, the Job Import Plugin allows us to migrate jobs from one server to another server.
* Credentials Binding - plugin: which stores different types of credentials like - Username with a password, SSH username with the private key, AWS Credentials, Jenkins Build Token, Secret File/Text, X509 & other certificates, Vault related credentials securely with proper encryption & decryption as and when required.
*JaCoCo, CodeCov: code coverage is measured/tracked using Jenkins in a CI environment
*Parameterized Trigger Plugin: This plugin lets you trigger new builds when your build has completed, with various ways of specifying parameters for the new build.
*DSL plugin: The Job DSL(Domain Specific Language) plugin is in principle a generator for these XML files, translating the DSL code into XML. If a configuration option is not available in the high-level DSL, it is possible to generate the XML directly using a Configure Block. Use the Job DSL Playground to create and test your configure blocks.

-> Jenkins job DSL is a plugin that allows us to define jobs in programmatic form with minimal effort.
build timeout
build pipeline
environment variable
git client
gerrit trgger
LDAP
Mailer
Matrix based authorization
maven plugin
maven integration
piepline groovy
pipeline syntax
maven comipler plugin

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
20. What is the Blue Ocean?
Ans: Blue Ocean is the redefined user experience for Jenkins. Designed from the ground up for Jenkins Pipeline, it is still compatible with freestyle jobs, Blue Ocean reduces clutter and increases clarity. 
* Blue Ocean rethinks the Jenkins user experience. Designed from the ground up for Jenkins Pipeline and compatible with Freestyle jobs
Blue Ocean’s main features include -
-Sophisticated visualizations of CD pipelines for fast and intuitive comprehension of software pipeline status.
-Pipeline editor that makes automating CD pipelines approachable by guiding the user through an intuitive and visual process to create a pipeline.
-Personalization of the Jenkins UI to suit the role-based needs of each member of the DevOps team.
-Pinpoint precision when intervention is needed and/or issues arise. The Blue Ocean UI shows where in the pipeline attention is needed, facilitating exception handling and increasing productivity.
-Native integration for branch and pull requests enables maximum developer productivity when collaborating on code with others in GitHub and Bitbucket.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. How can we stop a scheduled job from being executed temporarily?
Ans: Disable the job from the job details page to temporarily stop all scheduled executions & other factors/events from triggering the job and enable it back to resume the job schedules/triggers. If a job is not required permanently, we can delete the job from the jobs list view page.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. What are the credential types supported by Jenkins?
Ans: In Jenkins, credentials are a set of information used for authentication with internal/external services to accomplish an action. 
     Jenkins credentials are provisioned & managed by a built-in plugin called - Credentials Binding - plugin. Jenkins can handle different 
     credentials as follows -
*Secret text - A token such as an API token, JSON token, etc.
*Username and password - Basic Authentication can be stored as a credential as well.
*Secret file - A secret file used to authenticate some secure data services & security handshakes.
*SSH Username with a private key - An SSH public/private key pair for Machine to Machine authentication.
*Certificate - a PKCS#12 certificate file and an optional password.
*Git username and password
*Docker Host Certificate Authentication credentials.
And as we can guess, this can be extended to several other extensible credential types like - AWS credential, Azure secrets, etc. using 
    commonly available plugins.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. *What is a trigger? Give an example of how the repository is pulled when a new commit is detected.
Ans: Triggers are used to define when and how pipelines should be executed.  When Jenkins is integrated with an SCM tool, for example, Git, the repository can be pulled every time there is a commit.

->The Git plugin should be first installed and set up. 
->After this, you can build a trigger that specifies when a new build should be started. 
For example, you can create a job that pulls the repository and triggers a build when a change is committed.

What are the ways to trigger a Jenkins Job/Pipeline?
Ans: There are many ways we can trigger a job in Jenkins. Some of the common ways are as below -
*Trigger an API (POST) request to the target job URL with the required data.
*Trigger it manually from the Jenkins web application.
*Trigger it using Jenkins CLI from the master/slave nodes.
*Time-based Scheduled Triggers like a cron job.
*Event-based Triggers like SCM Actions (Git Commit, Pull Requests), WebHooks, etc.
*Upstream/Downstream triggers by other Jenkins jobs.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
12. What is Jenkins Build Cause?
Ans: Build Cause is a text attribute that represents what made a job's build to be triggered, say it could be a Jenkins User (from UI), Timer for Scheduled jobs, Upstream jobs for a job which was triggered by upstream job, etc. This is mainly used to identify the nature of the builds - be it nightly, manual, automated, etc.

13. How Jenkins knows when to execute a Scheduled job/pipeline and how it is triggered?
Ans: Jenkins master will have the cron entries set up for the jobs as per the scheduled Job's configurations. As and when the time for a particular job comes, it commands agents (based on the configuration of the job) to execute the job with required configurations.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
15. What are the Scopes of Jenkins Credentials?
Ans: Jenkins credentials can be of one of the two scopes - Global & System
* Global - the credential will be usable across all the jobs configured in the Jenkins instance (i.e. for all jobs). This is more suited for user Jobs (i.e. for the freestyle, pipeline, or other jobs) to authenticate itself with target services/infrastructures to accomplish the purpose of the job)
* System - This is a special scope that will allow the Jenkins itself (i.e. the core Jenkins functionalities & some installed plugins) to authenticate itself to external services/infrastructures to perform some defined tasks. E.g. sending emails, etc.

-> Reset password in jenkins: How to give security permission to new user?
** Navigate to "Manage Jenkins" -> "Security" -> "Configure Global Security" -> "Authentication"
*Select the "Security Realm" (e.g. "Jenkins’ own user database") and click on "Save"
*Go to "People" -> Click on a username for which you want to change the password (e.g. admin) -> "Configure" -> Enter a new password in the "Password" and "Confirm password" fields and click on "Save"

Q. If I forgot login password of my jenkins how do i reset?
Ans: 
Method 1:
-- Stop the Jenkins Server  "sudo systemctl stop jenkins
"
-- We can disable the user security option in   /var/lib/jenkins/
-- nfg.xml  & restart jenkins. 
-- sudo systemctl start jenkins

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
16. What is a Jenkins Shared Library and how it is useful?
Ans: As an organization starts using more and more pipeline jobs, there is a chance for more and more code being duplicated in every pipeline job, since a part of the build/automation processes will be the same for most of the jobs. In such a situation, every other new upcoming job should also duplicate the same piece of code. To avoid duplications, the Jenkins project brought in the concept of Shared Libraries, to code - DRY - Don't Repeat Yourself.
*Shared libraries are a set of code that can be common for more than one pipeline job and can be maintained separately. Such libraries improve the maintenance, modularity & readability of the pipeline code. And it also speeds up the automation for new jobs.

*Why Use Jenkins Shared Library?
-> Let’s say we have five different Spring Boot applications in our Microservice architecture. All of them need to be built using Maven, run Unit & Integration tests to ensure the integrity of code, packed as a JAR/WAR file & pushed to the artifactory.
Typically, all five applications need their own Jenkinsfile, but the content of the Jenkinsfiles is going to be mostly the same. 
Jenkins Shared Library avoids this repetition of pipeline code by creating a shared library.

*How to create and use the shared library?
-Create a separate git repo for the Jenkins pipeline library & push the shared library code to that repo.
-Integrate the shared library repo in Jenkins under the Manage Jenkins section.
-Create Jenkinsfile in the project. In that Jenkinsfile, Import & use the shared library.

E.g.
#!/urs/bin/env groovy
@Library('fs_jenkins_shared_library@v2.0.7')_

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
19. What happens when a Jenkins agent is offline and what is the best practice in that situation?
Ans: When a job is tied to a specific agent on a specific node, the job can only be run on that agent and no other agents can fulfill the job request. If the target node is offline or all the agents on that particular node are busy building other jobs, then the triggered job has to wait until the node comes online or an agent from that node becomes available to execute the triggered build request.
-> As a result, a triggered job may sometimes wait indefinitely without knowing that the target node is offline. So, it is always the best practice to tie the jobs to a group of nodes & agents, referred to with a 'Label'. Once a job is tied to a Label, instead of a specific node/agent, any of the nodes/agents falling under the label can fulfill a build request, when a job is triggered. This way we can reduce the overall turn-around time of the builds.
Even then if a job is waiting for more time for the nodes/agents, then it is time to consider adding more nodes/agents.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. How to do Global Tools Configuration in Jenkins?
Ans: Global Tools are tools that need to be installed outside the Jenkins environment and need to be controlled from within the Jenkins environment. 
    Hence it needs its corresponding Jenkins plugin as well. Steps to using a Global Tool generally include - 
*Install the tool Plugin into the Jenkins instance, to include the global tool into a list of global tools used by Jenkins.
*Install the tool in the Jenkins instance or provide away (maybe a command to download and) install the tool during runtime.
*Go to Manage Jenkins -> Global Tools Configuration and Scroll through the tool list and configure the global tool-specific configurations.
*Make use of the installed global Tool in your job/pipeline.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q: Where can we modify jenkins related settings?
A: If you want to modify home folder, log folder, port configuration. You need to go to /etc/sysconfig/jenkins. Edit your
   changes and then restart the jenkins. (systemctl restart jenkins)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*How do you integrate Git with Jenkins?
These are the steps to integrate Git with Jenkins –
1.Click on the Manage Jenkins button on your Jenkins dashboard:
2. Click on Manage Plugins.
3. In the Plugins Page
Select the GIT Plugin
Click on Install without restart. The plugin will take a few moments to finish downloading depending on your internet 
connection, and will be installed automatically.
You can also select the option Download now and Install after restart.
You will now see a “No updates available” message if you already have the Git plugin installed.
4. Once you install the plugins , go to Manage Jenkins on your Jenkins dashboard. You will see your plugins listed among the rest.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
What is post build step?
-> Image result for post build actions in jenkins

* The difference between Build and Post-build steps is based partially on logical separation, partially on workflow configuration.
aggregate the downstream test results, editable email notifications, archieve artifacts, deploy the artifacts, build other projects, set github commit, delte workspace etc.
From the logical perspective, when you build/compile a project, that's a "Build" step, whereas when you Archive Artifacts, since that happens after the build, 
that's a "Post-build" step.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
* Do you know any other Continuous Integration tools? How is Jenkins better than any of those?
There are many other CI tools, and the most prominent ones are –
TeamCity
Bamboo
Perforce
Circle CI
Go
ThoughtWorks
Integrity
Travis CI
There are many more. We cannot say if Jenkins is better than each because each has its own unique features. 
For example, TeamCity offers great .NET support but is complex and costly, 
Travis CI is free just like Jenkins and has good documentation too. 
Bamboo too offers efficient and faster builds but is not completely free and so on.

-----------------------------------------------------------------------------------------------------------------------------------------------------
*How do I set environmental variables in Jenkins?
Answer: The environmental variables in Jenkins can be set from the Configure screen. In the Build section, select Inject environment variables. There we need to provide the environment variable like VARIABLE_NAME=VALUE pattern.

Q. Default Environment Variables by Jenkins & How to introduce custom environment variables?
Ans: Jenkins provides several environment variables by default like - BRANCH_NAME, BUILD_NUMBER, BUILD_TAG, WORKSPACE, etc.

Q. Name a Jenkins environment variable you have used in a shell script or batch file.
There are numerous environment variables that are available by default in any Jenkins build job. A few commonly used ones include:
$BRANCH_NAME
$BUILD_NUMBER
$BUILD_TAG
$BUILD_ID
$BUILD_URL
$WORKSPACE
$JOB_NAME
$JOB_URL
$GIT_COMMIT
$GIT_URL
$GIT_BRANCH
$NODE_NAME
$EXECUTOR_NUMBER
$JENKINS_URL
$SVN_REVISION

Note that, as new Jenkins plug-ins are configured, more environment variables become available. 
For example, when the Jenkins Git plug-in is configured, new Jenkins Git environment variables, such as $GIT_COMMIT and $GIT_URL, become available to be 
used in scripts.

------------------------------------------------------------------------------------------------------------------------------------------------------------------
*How to set Jenkins settings XML?
Answer: In Jenkins, navigate to the Build section of the job, then click on Advanced. Settings File option will be visible there. 
        The location of the settings.xml is to be specified there.

---------------------------------------------------------------------------------------------------------------------------------------------------
*How can you temporarily turn off Jenkins security if the administrative users have locked themselves out of the admin console?
1) The JENKINS_HOME folder contains a file named config.xml. When you enable the security, this file contains an XML element named useSecurity that changes to true. 
2) If you change this setting to false, security will be disabled the next time Jenkins is restarted.
3)   <useSecurity>false</useSecurity>
However, we must understand that disabling security should always be both a last resort and a temporary measure. 
Once you resolve the authentication issues, make sure that you re-enable Jenkins security and reboot the CI server.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q) How to secure Jenkins?
Ans: We used matrix based security it will allow to give required permission for a user by checking the checkboxes.
*One more security option we have called as LDAP (Lightweight Directory Access Protocol). So if we want to access jenkins with LDAP credentials we need to install LDAP plugin.
manage jenkins -> confg global securty -> select LDAP Security realm -> fill server details & test LDAP setting -> save

manage jenkins->setup security button->enable security checkbox->allow users->see details in NavBar
manage jenkins->confg global security->security realm->uncheck the option Allow users to sign up (This will ensure that no new users can be created with your permission.)
 
*Now, we need to configure the authentication for the accounts. 
The 2 best options preferred are 
a) Matrix-based security & 
b) Project-base authorization strategy.
c) LDAP (Lightweight Directory Access Protocol) 
*Save the form. Logout and login again.
*A login page will be displayed and login with the created account.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. How do I add jenkins permission on a per job basis or give security permission to access jenkins?
-> You need Project-based Matrix Authorization Strategy in Global Configuration, and on the Job Configuration, use Enable Project-based Security.
-> If you have administrator status go to "Jenkins configuration" (picture 1) and then to "Manage and assign roles" (picture 2). 
   Here you will see "Manage roles" and "Assign roles".
-> Use "Manage roles" to create/update roles and assign permissions to determined projects and also to manage the restrictions of each job. Use "Manage and Assign roles" to assign roles to users or to other groups.

*In company they will store inernal portal of users.

Role-based Authorization Strategy:
The Role Strategy plugin is meant to be used from Jenkins to add a new role-based mechanism to manage users' permissions. Supported features
-Creating global roles, such as admin, job creator, anonymous, etc., allowing to set Overall, Agent, Job, Run, View and SCM permissions on a global basis.
-Creating item roles, allowing to set item specific permissions (e.g Job, Run or Credentials) on Jobs, Pipelines and Folders.
-Creating agent roles, allowing to set agent specific permissions.
-Assigning these roles to users and user groups
-Extending roles and permissions matching via Macro extensions

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q) What is the Challenging job in jenkins?
Ans: When I have installed Jenkins in first time in my server, after some time server failed, at that time we could not able to recover jenkins.
So i have searched for high availability of plugin and we found German plugin and installed it.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q) How do I parameterized a Jenkins file?
-> A parameterized pipeline allows us to set needed parameters dynamically at build time.

-> Parameterized Trigger Plugin: This plugin lets you trigger new builds when your build has completed, with various ways of specifying parameters for the new build.

-> It will prompt for : By adding below parameters to a job we can parameterized by below:
1. Boolean parameter: As name indicates to check status like true or false & we have option to check the box for default value if we check it then prints true else false
2. Choice parameter: This parameter is like dropdown
3. Credentials parameter
4. File parameter
5. Multi-line String paramter
6. Password parameter
7. Run parameter
8. String parameter
Then after chossing parameter go to build section & select execute shell & run
echo $SHELL

Q: How do you use parameters in jenkins?
A: jenkins UI-->new item-->select typeofproject-->general-->select ths project is parameterised. it prompt users one or more inputs that willbe passed into the buuld.
type of project can be: free style, maven, pipeline, multi branch pipeline, folder, multi-confiration pipeline.
in side maven--> general,SC mgmt, build trigeers, build environment, pre steps, build, post steps, post build action.

----------------------------------------------------------------------------------------------------------------------------------------------------
Q) how do we configure different jobs for different worker nodes using pipeine script?
Ans: We can give agent as none in pipeline script. Where agent none indicates there  is no global agent for entire pipeline & each stage must specify its own agent.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
23. What is Artifact Archival & how to do it in Pipelines?
Ans: Artifacts are the exportable/storable/archivable results of a specific job build. This can be configured using a plugin called - Copy artifact Plugin. Based on the configured pattern, the files/directories matching the configured patterns will be archived for a Jenkins build, which can be used for future references. In the pipeline, it can be configured as follows -
    For e.g.
archiveArtifacts artifacts: 'output/*.txt', excludes: 'output/specific_file.txt'
The above command will archive all the text files from the output folder except specific_file.txt

---------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. How do u safe restart jenkins?
-> Safe restart will allow to current running jobs to complete but it will not allow new jobs to be triggered it will restart the jenkins once the current running jobs are completed.
http://localhost:8080/safestart
systemctl jenkin saferestart

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. What is the reasons to build failure in jenkins?
Ans: 3 reasons
1) Normally build failure occurs due to diff in the versions if we are integrating maven project if the default version of maven installed in master or worker node is different from the maven version in the jenkins server page then we get build failure.
2) One more reason in case of plugins. Plugins should be installed correctly.
3) We can get build failure if the pom file not found.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Methods of jenkins backup?
There are multiple methods to back up the Jenkins configurations such as:
1. using thin backup
2. using the git repo
3. using disk snapshots

Steps:Using thin backup
Step 1: Manage Jenkins ->manage plugins -> click on available ->select “Thin Backup”->install without start.
Step 2: By clicking on the manage Jenkins from the Jenkins home page redirected to the next page which is having an option for Manage plugins. On the next page, we can see the available tab, now select Thin Backup plugin and click on Install without restart button.

Steps:Using git repo
Here we take backup of  /var/lib/jenkins
We create separate git repo for jenkins & we can push jenkins configurations files to git repo. The we can clone it whenever we need it. Or we can write shell script to automate the task & the script takes the backup * stores it in the repo.

Jenkins Backup Using Thin Backup Plugin:
-Full backup
-Differential backup
-File exclusions from Backup
-Backup build results
-Cleanup of differential backups


*Explain how you can move or copy Jenkins from one server to another?
I will approach this task by copying the jobs directory from the old server to the new one. There are multiple ways to do that, I have mentioned it below:
You can:
1) Move a job from one installation of Jenkins to another by simply copying the corresponding job directory.
2) Make a copy of an existing job by making a clone of a job directory by a different name.
3) Rename an existing job by renaming a directory. Note that if you change a job name you will need to change any other job that tries to call the renamed job.

Jenkins Backup Using Disk Snapshots
*Attach an external disk to your Jenkins server.
*Mount the disk to the server on a folder, say /jenkins_data
*If you have existing data, move all data from /var/lib/jenkins to /jenkins_data folder first.
*Symlink /var/lib/jenkins to /jenkins_data.
*Restart Jenkins and check if Jenkins is using the newly mounted disk.

--------------------------------------------------------------------------------------------------------
Q. What is updating mechanism in jenkins?
Ans: If we have downloaded jenkin version using yum install then we can use yum update jenkins.
-if you still fail to get latest version we can download the .war file & upgrade it manually.
*download jenkins.war from goolge, in command promt use wget 
*Before we copy new war file take backup of existing version of the jenkins.
*copy new version of jenkins.war file into /usr/lib/jenkins/ & after this we have to restart jenkins.
-systemctl stop jenkins
-systemctl start jenkins
To check whether service is running or not
-systemctl status jenkins

Q. How do u configure webhook for automatic build , when developers commits?
-> Webhooks can be used to configure automatic builds when developers commit code changes. 
-> Here are the general steps to configure a webhook for automatic builds:
1. Set up a webhook in your version control system: This typically involves configuring a webhook in the  
   settings of your repository on the version control system (e.g. GitHub, Bitbucket, GitLab). 
   The webhook should be configured to trigger a build when a commit is made to the repository.
2. Create a build pipeline: Create a build pipeline using a tool like Jenkins, Travis CI, or CircleCI. 
   The pipeline should be configured to build the code in the repository when triggered by the webhook.
3. Configure the webhook to trigger the build pipeline: This typically involves providing the URL of the 
   build pipeline to the webhook. When the webhook receives a commit event, it will send a request to the 
   build pipeline, which will then start a new build.
4. Test the webhook: After configuring the webhook, test it by making a commit to the repository and 
   checking to see if the build pipeline is triggered.

--------------------------------------------------------------------------------------------------------------------------------------------------------
Jenkins stores some of the related builds data like the following:
	The working directory is stored in the directory {JENKINS_HOME}/workspace/.
	Each job store its related temporal workspace folder in the directory {JENKINS_HOME}/workspace/{JOBNAME}
	The configuration for all jobs stored in the directory {JENKINS_HOME}/jobs/.
	Each job store its related builds data in the directory {JENKINS_HOME}/jobs/{JOBNAME}
	Each job folder contains:
		The job configuration file is {JENKINS_HOME}/jobs/{JOBNAME}/config.xml
			//if you forget jenkins password, disable security from above path. and restart jenkins.
		The job builds are stored in {JENKINS_HOME}/jobs/{JOBNAME}/builds/
	You can download the config file from a Jenkins node by running: curl http://<ip-address>:8080/job/<job-name>/config.xml > jenkins_config.xml
where can we see jenkins realted logs?   /var/log/jenkins

	JENKINS_HOME   /var/lib/jenkins
	+- config.xml     (jenkins root configuration)
 	+- *.xml          (other site-wide configuration files)
	+- userContent    (files in this directory will be served under your http://server/userContent/)
 	+- fingerprints   (stores fingerprint records)
 	+- nodes          (slave configurations)
 	+- plugins        (stores plugins)
 	+- secrets        (secretes needed when migrating credentials to other servers)
 	+- workspace (working directory for the version control system)
     		+- [JOBNAME] (sub directory for each job)
 	+- jobs
     		+- [JOBNAME]      (sub directory for each job)
         		+- config.xml     (job configuration file)
         		+- latest         (symbolic link to the last successful build)
         		+- builds
             			+- [BUILD_ID]     (for each build)
                 			+- build.xml      (build result summary)
                 			+- log            (log file)
                 			+- changelog.xml  (change log)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
17. How Jenkins jobs can be Triggered/Stopped/Controlled programmatically?
Ans: Jenkins Remote Access API can be used to do things like - 
*Retrieving information about jobs, views, nodes, builds, etc. from Jenkins for programmatic consumption. 
*Trigger a build (both parameterized & non-parameterized), stop/abort a build, enable/disable a Job, group/remove jobs into/from views, etc.
*Create/copy/modify/delete jobs. 
and many other programming language-specific functionalities. It has wrappers for main programming languages like - Python, Ruby & Java. 
It can be triggered via CURLas below -
-> Jobs without parameters
Simply an HTTP POST on JENKINS_URL/job/JOBNAME/build.

-> Jobs with parameters
Simple example - sending "String Parameters":
curl JENKINS_URL/job/JOB_NAME/buildWithParameters --user USER:TOKEN --dataid=123 --data verbosity=high

Q. How to trigger Jenkins job remotely?
Ans: We use this option when we want to trigger new builds by accessing a special predefined URL. 
In Jenkins, as soon as we select the "Trigger builds remotely"  option, we can see the suggested URL. 
Now our task is to build this URL and hit that URL in the browser. As part of it, we need to follow below steps:

Copy URL (JENKINS_URL/job/Simple_Java_Program/build?token=TOKEN_NAME) and paste this URL somewhere in notepad.
Put Jenkins URL like in case of mine it is http://localhost:8080/ in place of JENKINS_URL.
Put the token name in place of TOKEN_NAME like I put 1234 in this case. We need to put the same token name in the Authentication token text box.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
18. How to get the Jenkins version programmatically in Jobs/Pipelines or nodes other than master?
Ans: To check the version of Jenkins, load the top-level page or any top-level Remote Access API path like the '.../api/*' page and then check 
     for the 'X-Jenkins' response header. 
     This contains the version number of Jenkins, like "1.404". This is also a good way to check if an URL is a Jenkins URL.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. What is the Jenkins User Content service?
Ans: Jenkins has a mechanism known as "User Content", where administrators can place files inside the $JENKINS_HOME/userContent folder and these 
     files are served from yourhost/jenkins/userContent.
-This can be thought of as a mini HTTP server to serve images, stylesheets, and other static resources that you can use from various description 
 fields inside Jenkins.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. How can we share information between different build steps or stages in a Jenkins Job?
Ans: Every build step or stage will be running in its process and hence sharing information between two different build steps is not so direct. We can use either a File, a Database Entry, an Environment Variable, etc. to share info from one build step to another or a post-build action.

Q. How code coverage is measured/tracked using Jenkins in a CI environment?
Ans: Using language-specific code coverage plugins like JaCoCo, CodeCov, etc or generic tools/plugins like Sonarqube which will add the code coverage data to builds with some minor tweaks in the code and the same can be displayed as a graph in Jenkins.

Q. How can a job configuration be reset to an earlier version/state?
Ans: From the Job details page, we can use Job Config History to - See diff, Review & Revert the Job configs from the history of changes we have 
     made to a particular job.
This will be super useful when a job is misconfigured by someone by mistake, it can be reviewed and reverted easily to any of its earlier states.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. How to install a Custom Jenkins Plugin or a Version of Plugin Not available in Jenkins Update Center?
Generally, it is the best practice to use the latest version of a plugin. But there are ways to install custom plugins or outdated 
versions of a published plugin. Jenkins Plugins are exported using a .hpi file and the same can be installed in multiple ways -

Using the Jenkins CLI
java -jar jenkins-cli.jar -s http://localhost:8080/ install-plugin SOURCE ... [-deploy] [-name VAL] [-restart]

The above command Installs a plugin either from a file, an URL or from the update center.

SOURCE: If this points to a local file, that file will be installed. If this is an URL, Jenkins downloads the URL and installs that
as a plugin. Otherwise, the name is assumed to be the short name of the plugin in the existing update center (like "findbugs") and 
the plugin will be installed from the update center.
-deploy: Deploy plugins right away without postponing them until the reboot.
-name VAL: If specified, the plugin will be installed as this short name (whereas normally the name is inferred from the source name 
automatically).
-restart: Restart Jenkins upon successful installation.
Advanced Installation - via - Web UI

Assuming a .hpi file has been downloaded, a logged-in Jenkins administrator may upload the file from within the web UI:

Navigate to the Manage Jenkins > Manage Plugins page in the web UI.
Click on the Advanced tab.
Choose the .hpi file under the Upload Plugin section.
Upload the plugin file.
Restart the Jenkins instance
Advanced Installation - via - On the master

Assuming a .hpi file has been explicitly downloaded by a systems administrator, the administrator can manually place the .hpi file in 
a specific location on the file system.

Copy the downloaded .hpi file into the JENKINS_HOME/plugins directory on the Jenkins controller (for example, on Debian systems 
JENKINS_HOME is generally /var/lib/jenkins).

The master will need to be restarted before the plugin is loaded and made available in the Jenkins environment.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
32. How to download the Console log for a particular Jenkins build programmatically?
Using the Jenkins CLI - console - command

java -jar jenkins-cli.jar console JOB [BUILD] [-f] [-n N]

Produces the console output of a specific build to stdout, as if you are doing 'cat build.log'

JOB: Name of the job
BUILD: Build number or permalink to point to the build. Defaults to the last build
-f: If the build is in progress, append console output as it comes, like tail -f
-n N: Display the last N lines.
E.g.

ssh -l <ssh_username> -p <port_no> <Jenkins_URL> console <JOB_NAME>

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
33. What is Jenkins Remote Access API?
Jenkins provides remote access API to most of its functionalities (though some functionalities are programming language-dependent).
Currently, it comes in three flavors -

XML
JSON with JSONP support
Python
*Remote access API is offered in a REST-like style. That is, there is no single entry point for all features, and instead, they are 
available under the ".../api/" URL where the "..." portion is the data that it acts on.

*For example, if your Jenkins installation sits at interviewbit.com, visiting /api/ will show just the top-level API features 
available – primarily a listing of the configured jobs for this Jenkins instance.

*Or if we want to access information about a particular build, 
e.g. https://ci.jenkins.io/job/Infra/job/jenkins.io/job/master/lastSuccessfulBuild/, 
then go to https://ci.jenkins.io/job/Infra/job/jenkins.io/job/master/lastSuccessfulBuild/api/ and you’ll see the list of 
functionalities for that build.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. What is In-process Script Approval and how it works?
-> Jenkins, and several plugins, allow users to execute Groovy scripts in Jenkins. To protect Jenkins from the execution of malicious 
   scripts, these plugins execute user-provided scripts in a Groovy Sandbox that limits what internal APIs are accessible.
-> This protection is provided by the Script Security plugin. As soon as an unsafe method is used in any of the scripts, the 
   "In-process Script Approval" action should appear in "Manage Jenkins" to allow Administrators to make a decision about which unsafe 
    methods, if any, should be allowed in the Jenkins environment.
-> This in-process script approval inherently improves the security of the overall Jenkins ecosystem.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. Can we monitor Jenkins using common Observability tools?
Ans: Common monitoring platforms like DataDog, Prometheus, JavaMelody & few others - have their corresponding Jenkins plugin, which 
     when configured, sends Metrics to the corresponding Monitoring platform, which can then be Observed with the latest tools & 
     technologies. The same can be configured with Alarms & Notifications for immediate attention when something goes wrong.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Q. What is a Ping Thread in Jenkins and how it works?
Ans: Jenkins installs "ping thread" on every remote connection, such as Controller/Agent connections, regardless of its transport 
     mechanism (such as SSH, JNLP, etc.). The lower level of the Jenkins Remoting Protocol is a message-oriented protocol, and a ping 
     thread periodically sends a ping message that the receiving end will reply to. The ping thread measures the time it takes for the 
     reply to arrive, and if it’s taking excessive time (currently 4 minutes and configurable), then it assumes that the connection was 
     lost and initiates the formal close down.

*This is to avoid an infinite hang, as some of the failure modes in the network cannot be detected otherwise. The timeout is also set 
 to a long enough value so that a temporary surge in the load or a long garbage collection pause will not trip off the close-down.

*Ping thread is installed on both controller & agent; each side pings the other and tries to detect the problem from their sides.

*The ping thread time out is reported through java.util.logging. Besides, the controller will also report this exception in the agent 
 launch log. Note that some agent launchers, most notably SSH agents, writes all stdout/stderr outputs from the agent JVM into this
 same log file, so you need to be careful.

--------------------------------------------------------------------------------------------------------------------------------
Java installation for slaves
Step1: sudo apt update
Step2: sudo apt install default-jre
Step3: java -version

Jenkins Agent/Slave Prerequisites
For Jenkins agent configuration, you need to have the following in the slave machines before adding it to the master.

*Java should be installed on your agent server.
*A valid Linux user account that can perform the required tasks on the agent server. (preferably a sudo user if your job requires elevated privileges)
*Git should be installed as most build job requires git specific actions.
Lets get started with the Jenkins agent node configuration. (Pre-installed)

Create a Jenkins User
Step 1: Create a jenkins user and a password using the following command.
sudo adduser jenkins --shell /bin/bash

Step 2: Now, login as jenkins user.
su jenkins

Step 3: Create a “jenkins_slave” directory under /home/jenkins
mkdir /home/jenkins/jenkins_slave


Setting up Jenkins slaves using ssh keys
Step 1: Login to the slave server as a jenkins user.

Step 2: Create a .ssh directory and cd into the directory.
mkdir ~/.ssh && cd ~/.ssh

Step 3: Create an ssh key pair using the following command. Press enter for all the defaults when prompted.
ssh-keygen -t rsa -C "The access key for Jenkins slaves"

Step 4: Add the public to authorized_keys file using the following command.
cat id_rsa.pub > ~/.ssh/authorized_keys

Step 5: Now, copy the contents of the private key to the clipboard.
cat id_rsa

------------------------------------------------------------------------------------------------------------------------------------------------

Q. how to write pipeline even if one stage fails it should go to next stage ?
-> In Jenkins, you can configure a pipeline to continue to the next stage even if one stage fails by using the "try-catch" block 
   and the "catchError" step. The "try-catch" block allows you to specify a block of code that should be executed, 
   and a block of code that should be executed if an exception is thrown. The "catchError" step can be used inside 
   the "catch" block to handle the exception and continue the pipeline.
-> Here is an example of a pipeline that continues to the next stage even if one stage fails:
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                try {
                    sh './build.sh'
                } catch (err) {
                    catchError {
                        echo "Build failed, but we're continuing to the next stage anyway."
                    }
                }
            }
        }
        stage('Test') {
            steps {
                sh './test.sh'
            }
        }
        stage('Deploy') {
            steps {
                sh './deploy.sh'
            }
        }
    }
}
-> In this example, the pipeline starts with the "Build" stage, which runs the "./build.sh" script. 
   If this script fails and throws an exception, the pipeline will enter the "catch" block and execute the "catchError" step, 
   which simply echoes a message to the console. After that, the pipeline continues to the next stage, "Test" and "Deploy".
-> It's worth noting that in this example, even if the build step fails, it will be executed, but the pipeline will not stop 
   and will continue to the next stages, which are test and deploy.
-> You can also configure the pipeline to stop execution, in case of failure, by setting the "failFast" parameter to "true" 
   in catchError() step. This can be useful if you want to stop the pipeline execution in case of critical failure.

catchError(failFast: true) {
        echo "Build failed, pipeline is stopping."
}
-> This way, the pipeline will stop execution, and the next stages will not be executed, in case of failure.

------------------------------------------------------------------------------------------------------------------------------------------
Q. Set a pipeline, so that I should get a email notification, when build completes, when artifacts ares stored, when deployment is completed?
-> Using CI/CD tool Jenkins or GitLab CI
   Here are the general steps to set up a pipeline with email notifications:
1. Set up a CI/CD pipeline: Create a pipeline using Jenkins or GitLab CI that includes build, test, and 
   deploy stages. Configure the pipeline to run automatically when code is committed to the repository.
2. Set up email notifications: Configure Jenkins or GitLab CI to send email notifications when specific 
   events occur in the pipeline. For example, you can set up email notifications to be sent when a build 
   completes, when artifacts are stored, and when deployment is completed.
3. Configure email settings: Provide the necessary information for the CI/CD tool to send email notifications, 
   such as the email server, port, and credentials.
4. Test the pipeline: Test the pipeline by committing code changes to the repository and checking to see 
   if the pipeline runs correctly and sends email notifications when the specified events occur.

pipeline {
    agent any
    environment {
         NEW_VERSION = '1.3.0'
    stages {
        stage('Build') {
            steps {
                // Build steps here
            }
        }
        stage('Test') {
            steps {
                // Test steps here
            }
        }
        stage('Deploy') {
            steps {
                // Deployment steps here
            }
        }
    }
    post {
        always {
            script {
                // Send email notification when build completes
                emailext body: 'Build has completed',
                subject: 'Build Notification',
                to: 'user@example.com',
                attachLog: true
            }
        }
        success {
            script {
                // Send email notification when artifacts are stored
                emailext body: 'Artifacts have been stored',
                subject: 'Artifacts Notification',
                to: 'user@example.com',
                attachLog: true
            }
        }
        failure {
            script {
                // Send email notification when deployment is completed
                emailext body: 'Deployment has failed',
                subject: 'Deployment Notification',
                to: 'user@example.com

-----------------------------------------------------------------------------------------------------------------------------------------
Q. Pipeline is running and tasks are not completed, how u fix it
-> We have a Release pipeline to manage our releases. The pipeline has stages that run an agentless job, and the job performs 
   different tasks. I noticed that even though the tasks complete successfully, the job continues running until it eventually times out
   
------------------------------------------------------------------------------------------------------------------------------------------------
Q. example of declarative pipeline with all stages involved for an web appliction?

pipeline {
    agent any
    environment {
            NEW_Version == '1.3.0'
            Jenkins_credentials == credentials('name_given')
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            environment {				(Define env variable and use it in pipeline by providing $ behind it)
                NODE_VERSION = '14'
            }
            steps {
                sh 'nvm install $NODE_VERSION'
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
	    when {                                 (environment var  is branch name{available for jenkins} it only executes if current branch is dev)
                 expression {
                     BRANCH_NAME == 'dev' || BRANCH_NAME == 'master'          (or)
                     BRANCH_NAME == 'dev' && CODE_CHANGES == true 
                  }
            }
            steps {
                sh 'npm run test'
            }
        }
        stage('Deploy to Staging') {
            environment {
                STAGING_SERVER = 'example.com'
                STAGING_DIR = '/var/www/staging'
            }
            steps {
                sh "rsync -avz --delete ./ $STAGING_SERVER:$STAGING_DIR"
            }
        }
        stage('Deploy to Production') {
            environment {
                PRODUCTION_SERVER = 'example.com'
                PRODUCTION_DIR = '/var/www/html'
            }
            steps {
                sh "rsync -avz --delete ./ $PRODUCTION_SERVER:$PRODUCTION_DIR"
            }
        }
    }
}
   
->  This pipeline has five stages:
2. Checkout: This stage checks out the source code from the version control system. Build: This stage installs dependencies, builds the application, and packages it for deployment.
3. Test: This stage runs tests on the application to ensure that it is working as expected.
4. Deploy to Staging: This stage deploys the built application to a staging server for further testing and review.
5. Deploy to Production: This stage deploys the application to the production server once it has been tested and reviewed on the staging server.
-> Note that this pipeline has been defined using the declarative syntax, which makes it easy to read and 
   understand the different stages involved in building and deploying a web application. 


1. Tools attribute:
-> Build like maven or gradle build and jdk: Use tools attribite to use them 
   pipeline {
    agent any
    tools {
        maven  'Maven'

2. Parameters:
->  pipeline {
    agent any
    parameters {
        string(name: 'VERSION', defaultValue: '', description: 'version to deploy on prod')
         choice(name: 'version', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
   }
         booleanParam(name: 'executeTEsts', defaultvalue: true, description: '')
}
     stage('Test') {
	    when {                                 
                 expression {
                    params.executeTests == true (it will execute, if we give false it will skips)



3. If you have multiple scripts to be used inside your pipeline
-> Ex: groovy, where we have defined a small script
-> How to pull it in pipeline
   
 pipeline {
    agent any
    environment {
            NEW_Version == '1.3.0'
            Jenkins_credentials == credentials('name_given')
    stages {
        stage('init') {
            steps {
                script {
                    gv = load "script.groovy"
                   }
          

script.groovy:
   def funvtion() {
      echo 'buidling the application...'
   }
 return this


        
         