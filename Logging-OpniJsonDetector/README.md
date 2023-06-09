# Opni Preprocessing Opensearch Plugin

### Prerequisites
1. the first step is to build the project, generate jar and zip file:
```
./gradlew build
```

`build/distributions/opnijsondetector.zip` is generated.

2. (For Dev): Install OpenSearch and build a local artifact for the integration tests and build tools ([Learn more here](https://github.com/opensearch-project/opensearch-plugins/blob/main/BUILDING.md)):

``` 
git clone https://github.com/opensearch-project/OpenSearch.git
cd OpenSearch

~/OpenSearch (main)> git checkout 1.3 -b 1.3beta1
~/OpenSearch (1.3beta1)> ./gradlew publishToMavenLocal -Dbuild.version_qualifier=beta1 -Dbuild.snapshot=false
```

## Usage
#### Development: 
this command runs a test opensearch cluster with plugin isntalled
```
./gradlew run
```

you can verify that your plugin has been installed by running: 
```
curl -XGET 'localhost:9200/_cat/plugins'
```

#### Testing:
this command runs all the tests
```
./gradlew check
```

#### Create/Update licenses for dependencys
```
./gradlew updateSHAs
```

### Install the pipeline in Opensearch
create the pipeline
``` 
PUT _ingest/pipeline/opni-ingest-pipeline
{
    "processors": [
        {
            "opni-logging-processor": {
                "field": "log",
                "target_field": "masked_log"
            }
        }
    ]
}
```
attached the pipeline to an index
``` 
PUT /logs/_settings
{
 "settings": {
      "index.default_pipeline": "opni-ingest-pipeline"
  }
}
```
Similarly you can also attach the pipeline to an index_template.

To create a pipeline with 2 plugins:
```
PUT _ingest/pipeline/opni-ingest-pipeline
{
    "processors": [
        {
            "opni-logging-processor": {
                "field": "log",
                "target_field": "masked_log"
            }
        },
        {
            "opnipre": {
                "field": "log",
                "target_field": "masked_log"
            }
        }
    ]
}
```


## License
This code is licensed under the Apache 2.0 License. See [LICENSE.txt](LICENSE.txt).

## Copyright
Copyright OpenSearch Contributors. See [NOTICE](NOTICE.txt) for details.
