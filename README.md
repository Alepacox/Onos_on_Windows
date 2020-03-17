# Onos_on_Windows
This works with Docker on Windows 10 Pro/Enterprise and Docker Toolbox on Windows 10 Home.

Due to the fact that Onos is not able to run on Windows, I've added some dependencies (like Maven) and scripts that still enables you to recall its main functionalities from within the docker:
- Recall Onos CLI (```onos```)
- Recall Onos apps creation script (```onos-create-app```)
- Recall Onos services to install/manage apps (```onos-app```) 

The docker will have a shared folder, called _onos-app_, where you can develop the application (from Windows) that you built with the onos-create-app script from the container.

**How to configure it?**

Clone this repository with the following command:
```
git clone https://github.com/Alepacox/Onos_on_Windows.git
```
After that, move into the cloned folder and run 
```
docker pull onosproject/onos
docker run -t -d -p 8181:8181 -p 8101:8101 -p 5005:5005 -p 830:830 -p 6653:6653 -v ./onos-apps:/root/onos/onos-apps --name onos-c onosproject/onos
```
This will download and run the container.

Once it is running, run the following commands to attach to the ONOS container's bash:
```
docker exec -it onos-c bash
```
And run:
```
./onos-apps/WindowsSetup.sh
```
Once it finished, type _exit_.

- Access to Onos's shell (password= karaf):
```
[Windows]: docker exec -it onos-c onos
```
 - Create a new app:
```
[Windows]: 
     $ docker exec -it onos-c bash
     $ cd onos-apps
     $ onos-create-app app org.foo foo-app 1.0-SNAPSHOT org.foo.app
 
(In this way the app will be in the shared folder, where you can modify it on Windows with any IDE)
```
 - Install an app:
 ```
 [Windows]: 
     $ docker exec -it onos-c bash
     $ cd onos-apps/foo-app
     $ onos-app -u root -p karaf localhost install! target/foo-app-1.0-SNAPSHOT.oar
 ```
So basically from Windows you can give direct commands to the container with ```docker exec -it onos-c [command]```
or you can access to the container's bash with ```docker exec -it onos-c bash``` and call commands directly in there.
The second option is preferred when you have to build apps. 

See this example --> [How to create/build/install an app on Windows](https://github.com/Alepacox/Onos_on_Windows/blob/master/%5BSample%5DCreateApp_Windows.md)

[Mininet]
--------------------------------------------
Then, if you wish to create a mininet topology, you can download the mininet vm from [this page](https://github.com/mininet/mininet/wiki/Mininet-VM-Images).
