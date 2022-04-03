---
title: "Publish Webiste Using Hugo"
date: 2022-01-08T17:48:04+05:30
draft: true
tags:
  - website
  - portfolio
  - hugo
  - github
  - git
---

## About
Hello readers, Let's learn about creating and hosting a simple website using [hugo](https://gohugo.io).
This particular website is more of blogging one, but we can use it to make any website. Let's get straight to it

---

## Getting ready
So as always, I will list the stuff we require to get our website up and running, here it is:
1. Github account
2. Own domain name (Optional)
3. Hugo Binary ( more on that later )
4. Some knowledge of git/github ( I promise there is a blog coming for that )

---

## Setting up your github account
Just [Signup](https://github.com/signup) and then [login](https://github.com/login)  hehe simple.

----

## Downloading and installing hugo
Just download the binary from [here](https://github.com/gohugoio/hugo/releases) or, just install it using your package manager (i use apt) 

```shell
sudo apt install hugo
```

---

## Creating your first basic site
Now from here, it's going to get techy, just follow along

Let's say, our website name is 'my-first-website' , we can create it by

```shell
hugo new site my-first-website
```

![Site Creation](/images/publish-website-using-hugo/hugo-create-site.png)
<!-- Image of site creation -->

We will `cd` into the website's directory and will some some files already created for us

<!-- Image of directory contents -->
![Contents](/images/publish-website-using-hugo/default-contents.png)


---

## Adding theme to your site

We can make our website more engaging and beautiful by adding themes to our site. We can browse some themes [here](https://themes.gohugo.io).

![Search Themes](/images/publish-website-using-hugo/hugo-themes-site.png)
![Theme](/images/publish-website-using-hugo/hugo-coder-theme.png)
![Submodule](/images/publish-website-using-hugo/hugo-coder-submodule-add.png)
![hugo-code-config](/images/publish-website-using-hugo/hugo-code-config.png)
![Edit Config](/images/publish-website-using-hugo/config-params-social.png)
![Sample Website](/images/publish-website-using-hugo/sample-website.png)
![Hugo Server](/images/publish-website-using-hugo/hugo-server.png)

---

## Creating your first blog

To create your first blog

```shell
hugo new posts/my-first-blog.md
```
A new blog template will be created under `my-first-website/contents/posts/my-first-blog.md`

Now we will edit the file and add some tags (for future use) and some content in markdown.

![Edit blog](/images/publish-website-using-hugo/first-blog.png)

With this, we can save the file and deploy the website

```shell
hugo server

```
We can view the blog under "Blog" section

![First blog](/images/publish-website-using-hugo/first-blog-deployed.png)

---

## Builiding your site

Now that we have our content ready, we can easily build our website to publish it

`hugo -d docs`

> Note: Here we used the "docs" directory because, to publish on github pages, we have only two options, /docs or /publish

Now we have our ready to publish website in _docs_ directory. 

---

## Using git + github for version control
Now we have our site ready, let's add version control to this. `cd` into our website's directory and then:
1. Make our directory a git repo : `git init`
2. Add our changes and commit : `git add . && git commit -m  "Initial Commit"`

---

## Using github-pages to publish your site

1. Create a new repo on github, with the following name format _yourgithubusername_.github.io
2. Push code to the remote repo: `git remote add origin https://github.com/yourusername.github.io` then `git push remote origin`
3. After this you can wait sometime and then visit yourusername.github.io and there your site will be published

---


## Using your own domain name for your website (Optional)
Assuming you have purchased a domain name from any of the providers (ex: godaddy, google etc.), we just have to follow some steps to get it going

Firstly we have to maps these IPs () to our domain as "A record", I also prefer adding a "CNAME" just in case.

<!--Godaddy ss -->

Now visit our github repo and open the settings, scroll down to "Pages" section and then enter a custom domain (ex: yourdomain.com)

<-Custom domain ss-->

This will create a CNAME file in your github repo containing your domain name. We have to wait a few moments and then we can visit our domain
and it will open our website. Cool is'nt it 


---


## Conclusion

So finally we have our working website on which we can share our thoughts/research/cat pictures with the world. If you found this blog helpful, consider [buying me a beer](https://buymeacoffee/ev1lm0rty). Thanks. 

---

