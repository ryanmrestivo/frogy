           .,;::::,..      ......      .,:llllc;'.
        .cxdolcccloddl;:looooddooool::xxdlc:::clddl.
       cxo;'',;;;,,,:ododkOOOOOOOOkdxxl:,';;;;,,,:odl
      od:,;,...x0c:c;;ldox00000000dxdc,,:;00...,:;;cdl
     'dc,;.    ..  .o;:odoOOOOOOOOodl,;;         ::;od.
     'ol';          :o;odlkkkkkkkxodl,d          .o;ld.
     .do,o..........docddoxxxxxxxxodo;x,.........:d;od'
     ;odlcl,......,odcdddodddddddddddl:d:.......:dcodl:.
    ;clodocllcccloolldddddddddddddddddoclllccclollddolc:

**Use Cases:**

- **Vulnerability Management Team:** Enhance vulnerability scanning coverage by incorporating discovered subdomains into the asset database.
- **Threat Intel Team:** Prioritize proactive monitoring for critical assets by including subdomain enumeration results in the intelligence database.
- **Asset Inventory Team:** Keep the asset inventory up-to-date by adding newly discovered subdomains and finding contact information for internal assets.
- **SOC Team:** Identify monitored assets and expand coverage using subdomain enumeration results.
- **Patch Management Team:** Identify and manage legacy or abandoned assets by leveraging subdomain enumeration findings.<br/>

# **Logic** <br/>
![logical flow for collection](architecture.png)

**Features**
    :frog: Perform horizontal subdomain enumeration
    :frog: Conduct vertical subdomain enumeration
    :frog: Resolve subdomains to their corresponding IP addresses
    :frog: Identify live web applications
    :frog: Gather comprehensive contextual information about web applications, including title, content length, server, IP, CNAME, and more, using httpx.
	
+ **Requirements:** Go Language, Python 3.+, jq<br/>
To install Go
		 ```sudo apt update && sudo apt install -y golang ```
	Arch: 
		  ```sudo pacman -Syu go ```
	Mac: 
		  ```brew install go ```
		   ```port install go ```
	Windows: 
		  ```scoop install go ```
		  ```choco install golang ```
		  ```winget install golang ```
To install Python
		  ```Debian and Ubuntu: sudo apt install python3 ```
		  ```Arch: sudo pacman -S Python3 ```
To install jq:
	Debian and Ubuntu: 
		  ```sudo apt update && sudo apt install jq ```
	Arch: 
		  ```sudo pacman -S jq ```
	Mac: 
		  ```brew install jq ```
		  ```port install jq ```
	Windows: 
		  ```winget install jqlang.jq ```
		  ```scoop install jq ```
		  ```chocolatey install jq ```
    
+ **Installation**
    ```sh
  Login as root and run the below command.
  bash install.sh
    ```
+ **Usage**
    ```sh
    ./frogy.sh
    ```
	
+ **Demo**
![example of scan](demo.png)

+ **Output**
    ```
    Output file will be saved inside the output/company_name/outut.csv folder. Where company_name is any company name which you give as an input to 'Organization Name' at the start of the script.