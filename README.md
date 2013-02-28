# highcharts-image-api

Rails API for generating highchart charts on the server side.  Useful for embedding highcharts into emails or anywhere else where
javascript is not an option. Leverages the highchart-convert.js script as outlined developed [here](http://www.highcharts.com/component/content/article/2-news/52-serverside-generated-charts).

Requires ruby 1.9.3 and phantomjs.

== Getting Started Locally

1. Clone the project

    git clone git://github.com/kbaum/highchart-image-api.git

2. Install dependencies

    cd highchart-image-api
    gem install bundler
    bundle

    gem install brew
    brew install phantomjs

3. Start up the server

    rails server

4. Generate a chart using curl

    HIGHCHART_OBJECT=`cat ./spec/fixtures/input.json`
    curl -X POST -d "input=$HIGHCHART_OBJECT" http://localhost:3000/chart_images -o ./chart.png

  Or optionally with width:

    curl -X POST -d "input=$HIGHCHART_OBJECT&width=900" http://localhost:3000/chart_images -o ./chart.png


== Deploying to Heroku
  
  This project is made to deploy to heroku.  It is using the awesome multi-buildpack
  depending including both phantomjs and ruby.  Just create a new project within heroku 
  and push to it.

== Calling API from ruby

Using the HTTParty:

```ruby
HTTParty.post('http://localhost:3000/chart_images', body: {input: chart_object_js, width:550})
```

Where chart_object_js is anything that can be passed into the Highcharts.Chart constructor.



