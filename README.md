           .,;::::,..      ......      .,:llllc;'.
        .cxdolcccloddl;:looooddooool::xxdlc:::clddl.
       cxo;'',;;;,,,:ododkOOOOOOOOkdxxl:,';;;;,,,:odl
      od:,;,...x0c:c;;ldox00000000dxdc,,:;00...,:;;cdl
     'dc,;.    ..  .o;:odoOOOOOOOOodl,;;         ::;od.
     'ol';          :o;odlkkkkkkkxodl,d          .o;ld.
     .do,o..........docddoxxxxxxxxodo;x,.........:d;od'
     ;odlcl,......,odcdddodddddddddddl:d:.......:dcodl:.
    ;clodocllcccloolldddddddddddddddddoclllccclollddolc:

**How it can help a large company (Some use cases):**
- **Vulnerability management team:** Can use the result to feed into their known and unknown assets database to increase their vulnerability scanning coverage.
- **Threat intel team:** Can use the result to feed into their intel DB to prioritize proactive monitoring for critical assets.
- **Asset inventory team:** Can use the result to keep their asset inventory database up-to-date by adding new unknown assets facing Internet and finding contact information for the assets inside your organization.
- **SOC team:** Can use the result to identify what all assets they are monitoring vs. not monitoring and then increase their coverage slowly.
- **Patch management team:** Many large organizations are unaware of their legacy, abandoned assets facing the Internet; they can utilize this result to identify what assets need to be taken offline if they are not being used.<br/>

It has multiple use cases depending your organization's processes and technology landscpae.

## todo
# **Logic** <br/>
# <img src="" alt="Frogy" title="Frogy" />

**Features**
- :frog: Horizontal subdomain enumeration
- :frog: Vertical subdomain enumeration
- :frog: Resolving subdomains to IP
- :frog: Identifying live web applications
- :frog: Identifying all the contextual properties of the web application such as title, content lenght, server, IP, cname, etc. (through httpx tool)

+ **Requirements:** Go Language, Python 3.+, jq<br/>
    
+ **Installation**
    ```sh
  Login as root and run the below command.
  bash install.sh
    ```
+ **Usage**
    ```sh
    ./frogy.sh
    ```
	
##todo
+ **Demo**
    <br/><img src="" alt="Frogy" title="Frogy" height=600px />

+ **Output**
    ```
    Output file will be saved inside the output/company_name/outut.csv folder. Where company_name is any company name which you give as an input to 'Organization Name' at the start of the script.