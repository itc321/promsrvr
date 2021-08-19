Solution for Part 1 :- 

Pull the docker images :-

docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0

Solution 1.1  Run the container image infracloudio/csvserver:latest in background and check if it's running.

docker container run -d infracloudio/csvserver:latest 

Solution 1.2 If it's failing then try to find the reason, once you find the reason, move to the next step.

To check all the running container :-
docker ps

To check all the containers [ running/not runinng ]
docker ps -a

To identify the issue , try running the below command to check the logs 

docker logs <container_id>
          
          error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

Issue :- The docker container needs input as "inputdata" to run.

Solution 1.3 Write a bash script gencsv.sh to generate a file named inputFile .

Solution 1.3.1 Running the script without any arguments, should generate the file inputFile with 10 such entries in current directory.

Created a bash script gencsv.sh which will generate a comma separated values with index and a random number. Used date as "seed" to generate Random number so that the same sequence is not generated when you build the image and run the container. Also used a variable "limit" so that number of entries can be controlled.
When you run the script in your local system :- sh gencsv.sh , it will generate a file inputFile with 10 entries.

Solution 1.3.2 You should be able to extend this script to generate any number of entries, for example 100000 entries.

Change the number of entries (set limit value) to any value as per your requirement and the gencsv.sh script will generate the numbers accordingly.

Solution 1.3.3 Run the script to generate the inputFile. Make sure that the generated file is readable by other users.

Run the script gencsv.sh and inputFile is generated . This inputFile will not be same when you build a image using gencsv.sh with the "Dockerfile" .
Please make a note the inputFile uploaded will not be same with the one that the container is running as the script is getting executed at image build level.

Created the script gencsv.sh and created a Dockerfile to build the image so that the new image contains the inputdata . 

docker build . -t infracloudio/csvserver:1.0

Solution 1.4 Run the container again in the background with file generated in (3) available inside the container

docker container run -d infracloudio/csvserver:1.0

Solution 1.5 Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.

docker container exec -it <container_id> bash 

          netstat -plant

          Active Internet connections (servers and established)
          Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
          tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver    

Stop the container & Delete the container

docker stop <container_id>
docker rm <container_id>
OR

docker rm -f <container_id>

Solution 1.6 Same as (4), run the container and make sure,

    The application is accessible on the host at http://localhost:9393
    Set the environment variable CSVSERVER_BORDER to have value Orange.


docker container run -d -e CSVSERVER_BORDER=Orange -p 9393:9300 infracloudio/csvserver:1.0


--> Write the docker run command you executed for (6) in a file named part-1-cmd

Uploaded the file part-1-cmd .

--> Run one of the following commands which will generate a file with name part-1-output

curl -o ./part-1-output http://localhost:9393/raw

Uploaded the file part-1-output

--> Run the following command which will generate a file with name part-1-logs.

Uploaded the file part-1-logs


