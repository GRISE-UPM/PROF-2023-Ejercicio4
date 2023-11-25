# PROF-2023-Ejercicio4

## Creation of the webhook

``` terminal
curl -X POST "https://api.github.com/repos/GRISE-UPM/PROF-2023-Ejercicio4/hooks"      -H "Authorization: token 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" -d '{
           "name": "web",
           "config": {
             "url": "'http://3.84.70.70:8080/ghprbhook/'",
             "content_type": "json",
             "insecure_ssl": "1",
             "secret": "jenkins"
           },
           "events":["pull_request"],
           "active": true
         }'
```

## Jenkins

### Required

- Github Pull Request Builder (needed to configure credentials and secret)

IMPORTANT: configure in pipeline configuration "Build every pull request automatically..."

Use *jenkinsfile* for the database management
