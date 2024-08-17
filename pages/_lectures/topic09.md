---
layout: module
title: UX / UI Design Patterns
type: module
num: 9
draft: 1
due_date: 2024-11-07
---

## UX / UI Readings & Resources

### Great Websites & Designs
* [dribbble.com](https://dribbble.com/)
* [Bright Design](https://www.brightdesign.co.uk/5-of-the-best-website-designs-according-to-the-internet)
* [Webby Awards](https://winners.webbyawards.com/winners/websites?years=0)
* There are many resources. Google around...

### Style Guides and Guidelines
As you instantiate your frameworks, keep in mind that most companies have standardized widgets, stylesheets, and guidelines to ensure an integrated look-an-feel. Here are some style guides. Please use them to get ideas!

{:.medium}
| Organization | Name of Design Brand |
|--|--|
| Salesforce | [Lightning Design System](https://www.lightningdesignsystem.com) |
| Alibaba | [Ant Design](https://ant.design) |
| Atlassian | [Design Guidelines](https://atlassian.design/) |
| Firefox | [Acorn Design](https://acorn.firefox.com/latest/acorn-aRSAh0Sp) |
| IBM | [Carbon Design](http://carbondesignsystem.com) |
| Intuit | [Harmony Design](http://harmony.intuit.com) |
| Shopify | [Polaris](https://polaris.shopify.com) |
| US Federal Government | [Web Design Standards](https://designsystem.digital.gov/) |
| Accessibility Resources | [Web Accessibility](https://turretcss.com/) |


### Color Tools
* [https://coolors.co/](https://coolors.co/) 
* [https://www.colourlovers.com/](https://www.colourlovers.com/) 
* [https://uigradients.com](https://uigradients.com)
* [https://color.adobe.com](https://color.adobe.com)

### Fonts & Icons
* [https://fontawesome.com/icons](https://fontawesome.com/icons) 
* [https://material.io/tools/icons/?style=baseline](https://material.io/tools/icons/?style=baseline) 
* [https://fonts.google.com/](https://fonts.google.com/) 

### Material Design
* Google's [Material UI](https://material.io/guidelines/)
* Libraries that instantiate Material Design: [https://tutorialzine.com/2016/03/the-15-best-material-design-frameworks-and-libraries](https://tutorialzine.com/2016/03/the-15-best-material-design-frameworks-and-libraries)

### Email Lists
For web dev trends / news:
* [https://wdrl.info/](https://wdrl.info/)
* [http://sidebar.io/](http://sidebar.io/)

### Podcasts
* For design thinking and general inspiration, [99% Invisible](http://99percentinvisible.org/) can't be passed up. Many designers love it, saying that it's one of the highlights of their week.
* If you like short podcasts, [Immutable](https://spec.fm/podcasts/immutable) is good. It's very tangible - they talk about specific things, not huge ideas. There's also [Developer Tea](https://spec.fm/podcasts/developer-tea) which is also pretty short, and has solid content for all types of people interested in development.
* If you're willing to deal with some longer stuff, consider checking out [Design Details](https://spec.fm/podcasts/design-details) (which is a lot of designers talking about how they got into the industry). 

## Activity
Today, we will exploring React Component Libraries.
### 1. Clone the demo repo
From the command line:
1. Navigate to your csci338 folder (make sure you're not in a directory that's already under version control).
2. Clone this repository: <a href="https://github.com/csci338/csci338-components-routes" target="_blank">https://github.com/csci338/csci338-components-routes</a>:<br>`git clone https://github.com/csci338/csci338-components-routes`
3. Navigate into the `csci338-components-routes` directory on the command line.
4. Install the node dependencies: `npm install`
5. Start your react app: `npm start`. A react app should open in the browser: <a href="http://localhost:3000" target="_blank">http://localhost:3000</a>

### 2. Open the folder in your code editor
1. Open the folder in your code editor
2. Take a look at the sample code
3. Open `App.js` and notice that there are routes. What do you think these routes do? A nice explanation can be found here <a href="https://www.w3schools.com/react/react_router.asp" target="_blank">https://www.w3schools.com/react/react_router.asp</a>

[Code walkthrough...]

### 3. Installing the Ant Design component library
Now, we're going to install the Ant Design component library (developed by Alibaba). 

1. Stop your react app.
2. Install the `antd` package and save it to your `package.json` file: `npm install antd --save`

After installing this package, take a look at your `package.json` file and notice that a new dependency has been added.

### 4. Adding Components

#### Getting Started
Let's take a look at the introductory documentation for Ant: <a href="https://ant.design/docs/react/introduce" target="_blank">https://ant.design/docs/react/introduce</a>. Try adding the DatePicker Component to `pages/Explore.js`, just for practice. 

#### Explore
Now let's look at the component documentation for all of the components: <a href="https://ant.design/components/overview" target="_blank">https://ant.design/components/overview</a>. Note that there are a set of components that are common to all app development, including:
* Form control components
* Layout components
* Navigation componets
* And More!

#### Experiment
Let's try incorporating some Ant components into our UI...

> When you're done experimenting, checkout out the `ant-widgets` branch to see some sample Ant components in action.