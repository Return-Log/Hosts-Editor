###### zh-cn

# hosts简介

**Hosts文件**是一个没有[扩展名](https://zh.wikipedia.org/wiki/扩展名)的[操作系统](https://zh.wikipedia.org/wiki/操作系统)[文件](https://zh.wikipedia.org/wiki/文件)，以[表](https://zh.wikipedia.org/wiki/表)的形式存储了[主机名](https://zh.wikipedia.org/wiki/主機名稱)和[IP地址](https://zh.wikipedia.org/wiki/IP地址)的[映射](https://zh.wikipedia.org/wiki/映射)关系[[1\]](https://zh.wikipedia.org/wiki/Hosts文件#cite_note-:0-1)。Hosts又称host table，译为“主机表”。现代系统中，虽然[DNS](https://zh.wikipedia.org/wiki/域名系统)取代了主机表，但主机表的应用依旧很广[[1\]](https://zh.wikipedia.org/wiki/Hosts文件#cite_note-:0-1)。和[DNS](https://zh.wikipedia.org/wiki/域名系统)不同的是，用户可以直接对Hosts文件进行控制。

### 用途

Hosts文件是大多数系统都存在的一个小型主机表。Hosts文件中包含了本地网络重要的主机名和地址信息，查询Hosts文件得到的结果比通过查询[DNS](https://zh.wikipedia.org/wiki/域名系统)得到的结果优先级更高。

**Hosts文件也可以用于其它情况**，例如可以将已知的广告服务器重定向到无广告的机器（通常是本地网络地址，如： [127.0.0.1](https://zh.wikipedia.org/wiki/Localhost)）以过滤[广告](https://zh.wikipedia.org/wiki/网络广告)。使用Hosts文件还可以减少对DNS服务器的查询次数以加快访问网站的速度。

Hosts文件的另一个重要用途就是用于拦截一些恶意网站的请求，从而防止访问欺诈网站、感染[病毒](https://zh.wikipedia.org/wiki/计算机病毒)或[恶意软件](https://zh.wikipedia.org/wiki/恶意软件)。

在面对[网络审查](https://zh.wikipedia.org/wiki/网络审查)的技术机制下，Hosts也被利用来处理因[域名服务器缓存污染](https://zh.wikipedia.org/wiki/域名服务器缓存污染)而对访问域名的地址解析进行修正，或者涉及域名与IP地址关系的技术调整等。

# 程序功能

1. 查看现存hosts规则

2. 添加hosts规则，规则重复则覆盖

3. 删除现存hosts规则

# 说明

程序会自动获取管理员权限，如更改hosts文件失败请手动以管理员权限运行程序



------

###### en-us 

# Introduction to hosts 

A **hosts file** is an [operating system](https://zh.wikipedia.org/wiki/操作系统)[file](https://zh.wikipedia.org/wiki/文件) with no [extension](https://zh.wikipedia.org/wiki/扩展名) that stores the [mapping](https://zh.wikipedia.org/wiki/映射) of [host names](https://zh.wikipedia.org/wiki/主機名稱) and [IP addresses](https://zh.wikipedia.org/wiki/IP地址) in the form of a [table](https://zh.wikipedia.org/wiki/表)[[1\].](https://zh.wikipedia.org/wiki/Hosts文件#cite_note-:0-1) In modern systems, host tables are still widely used, although [DNS](https://zh.wikipedia.org/wiki/域名系统) has replaced them [[1\].](https://zh.wikipedia.org/wiki/Hosts文件#cite_note-:0-1) Unlike [DNS](https://zh.wikipedia.org/wiki/域名系统), users have direct control over the Hosts file.

### **Uses** 

The Hosts file is a small host table that exists on most systems.The Hosts file contains important host name and address information for the local network.The results obtained by querying the Hosts file have a higher priority than the results obtained by querying [DNS](https://zh.wikipedia.org/wiki/域名系统).

The **Hosts file can also be used in other situations**, such as when known ad servers can be redirected to an ad-free machine (usually a local network address, e.g., [127.0.0.1](https://zh.wikipedia.org/wiki/Localhost)) in order to filter [ads](https://zh. wikipedia.org/wiki/web-ads). Using a Hosts file also reduces the number of queries to the DNS servers to speed up access to the site.

Another important use of the Hosts file is for blocking some malicious Web site requests, thus preventing access to fraudulent Web sites, infection with [viruses](https://zh.wikipedia.org/wiki/计算机病毒) or [malware](https://zh.wikipedia.org/wiki/恶意软件).

In the face of [web censorship](https://zh.wikipedia.org/wiki/网络审查) technical mechanisms, Hosts are also utilized to deal with address resolution of accessed domain names due to [domain name server cache pollution](https://zh.wikipedia.org/wiki/域名服务器缓存污染) (), or technical adjustments involving the relationship between domain names and IP addresses.

Translated with DeepL.com (free version)

# **Program Functions** 

1. view existing hosts rules

2. Add hosts rules, duplicate rules will be overwritten.

3. Delete existing hosts rules.



# **Description of the program** 

The program will automatically get administrator privileges, such as changing the hosts file fails, please manually run the program with administrator privileges.