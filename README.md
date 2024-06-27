# Welcome to my blog post for the Cloud Resume Challenge - Azure !  
For context please check out the original site [here](https://cloudresumechallenge.dev/docs/the-challenge/azure/) where you can take this challenge for yourself, with the option of other cloud providers such as AWS or GCP. 

The challenge is essentially to create and host a website and put your resume on it. So I gave this project a very unique name, 'billysite', purchased a domain, completed the challenge and published my website. My website wasn't anything that impressive (it mainly looked like a website straight from the 90's) which only at the end of this challenge i realised this website wasn't really serving me any purpose out there in the big world wide web besides charging some ongoing infrastructure costs (running costs were approximately 50c AU per month on Azure and $15 AU per year for the domain). I had learnt what i wanted to learn from completing the challenge which has given me the value i was after. I've written this blog to share some of my experiences below at each stage as a result.  

I currently work in the IT industry, but this challenge specifies anyone can attempt it. While this is true, i must say it's definitely was a challenge for me. I will also note i wasn't a cloud engineer when i completed this challenge but do have a technical background.  

There's an option to purchase the book on the original challenge website which I did purchase. I think it helps wrap a story around the challenge nicely, you can read about other experiences completing the challenge, and it provides some harder modifications if you wanted to focus on a particular aspect such as security. The book breaks down the components further into smaller steps which is helpgul but isn't in any way necessary to complete the challenge. It doesn't give you explicit answers as this challenge was created to replicate real world scenarios like you would face every day at work. If you don't understand something, you go out there and learn about it. So this really grows your skills when it comes to completing your own research, recognising what is and isn't a reliable source (the internet and gen ai can indeed be wrong.. and often..), and who/when to lean on people for help. I found it all falling under the umbrella of problem solving. If this isn't what you're after, then i wouldn't recommend this challenge for you.  

Below is each stage of the challenge broken into sections which i've added my comments, enjoy. 🙂  

# Context: 
1. Certification

I had actually completed the AZ-900 certification in my first year of working in IT. It's a good idea to get an overview of a cloud platform before using it so I would recommend this if you haven't done something similar before. It's also really helpful to look at the career paths on [Microsoft Learn](https://learn.microsoft.com/en-us/training/browse/?resource_type=course) and filter by role to see what other courses line up with your interests. The role path shows other recommended certifications to complete and give you a shiny badge to add to your LinkedIn profile once completed.

# Front End:
2. HTML
3. CSS
4. Static Website
5. HTTPS
6. DNS

I split my resource groups in Azure by Front End and Back End and would recommend the same. This front-end section was quite fun and a good place to start the challenge. Creating your own Azure storage static website reveals all the nuts and bolts required to display the front end and while the initial method of publishing a html file to your storage isn’t recommended for long term deployments it’s fine for now as we will improve on this later in the challenge. Installing visual studio code on your PC and setting up a python virtual environment are core skills used here that will be reused in other projects.  

For HTTPS this [site](https://learn.microsoft.com/en-us/azure/cdn/cdn-standard-rules-engine) helped. For DNS I used Cloudflare as the provider and had the CNAME setup as per below.
![Cloudflare](https://github.com/billyshub/billysite/assets/64965899/db8977ba-cd65-4556-8109-cc5ef69c8629)

# Back End API:
8. Database
9. API
10. Python
13. Source Control

I found this section to be the most challenging out of all, especially the Python function app API. I would recommend reading a lot of documentation to get this part working locally first before coding directly inside of the azure function app, one of my hard learnings was if there is a single issue in the function app, the whole program won’t run, and you might even have to redeploy this resource (I did a few times…). I think it’s common to hit a lull around this stage (well at least i did), but I found being consistent and doing little chunks at a time helped get through it. Those times where I spent hours looking at the same thing over and over were better spent having a break or even trying fresh the next day. I also did the free [Python Learn The Basics Tutorial]( https://www.learnpython.org/) prior which was fun and didn't take too much time.  

For the Python function app, I had to use the V1 programming model with bindings as I couldn’t achieve what the challenge was asking for using the V2 programming model. I feel the V2 would have been much easier to execute but had no luck getting this working for this scenario. If you managed to complete it using V2 feel free to let me know below in the comments.  
Once i got past the API hurdle, the rest of the Back End was pretty straight forward. Source control and git is another core skill that will be reused in other projects. For the database I setup a serverless cosmos database table with a partition key as it’s unique identifier, but I had to register some dummy data for the row key (e.g. 1) for it to initialise correctly.  

# Front End/Back End Integration:
7. JavaScript
11. Tests

CORS (cross-origin resource sharing) wasn’t much of an issue (especially relative to the python function app). Once you get this working just don’t forget to keep it up to date for other future modifications. I had a bit of fun here also playing around with the JavaScript code and adding elements like a LinkedIn and GitHub badge. At this point had my website looking something like the below.
![Billysite](https://github.com/billyshub/billysite/assets/64965899/617f6443-026d-4f6f-93da-f5bbcde68d7c)


# Automation/CI:
12. Infrastructure as Code
14. CI/CD (Back End)
15. CI/CD (Front End)

For IaC (Infrastructure as Code) I decided to do ARM + Bicep as well as Terraform just to see learn sides of the equation as there are definitely benefits to each. There was some useful tools and tutorials available which are worth checking out below. I didn’t know GitHub actions was so powerful so really learnt a lot during this section. [ARM](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-powershell), [Terraform export](https://learn.microsoft.com/en-us/azure/developer/terraform/azure-export-for-terraform/export-first-resources?tabs=azure-cli), [Terraform](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-vcs-change), [Terraform Github Actions](https://developer.hashicorp.com/terraform/tutorials/automation/github-actions)

# Blog:
16. Blog post

This short blog post was created to share my learnings and some helpful tips I couldn’t find myself when researching the project. I decided to use GitHub readme.md/Gists to publish my blogs as it's central to the repositories already published. While it might not be a common publication medium, it's very easy to use and there is some useful documentation for formatting syntax [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax). I also decided to create a high-level architecture using Miro of all the challenge sections which should help explain the overall design.
![Architecture](https://github.com/billyshub/billysite/assets/64965899/abbfd3c0-2732-43df-8816-6a1463af1421)

Lastly, this is a nice summary from the book of all the tasks completed during the challenge which makes a great overview of what you will accomplish if you decide to do this also.
- Pass a certification.
- Create an HTML site.
- Style it with CSS.
- Host it on Azure.
- Configure DNS correctly to get TLS working.
- Enable a counter with JavaScript that stores its data inside of a database.
- Build an API in Python for the previous two things to communicate.
- Testing for the aforementioned Python.
- Making sure all of this lives in GitHub, via "Infrastructure as Code".
- Putting in place CI/CD for both the frontend stuff as well as the backend.

I hope this blog has been able to provide some value and I am always keen to hear some feedback or improvements so don’t hesitate to reach out.  

Thank you!
