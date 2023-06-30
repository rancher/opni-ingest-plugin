curl -XPUT localhost:9200/_ingest/pipeline/my_simple_pipeline \
-H "Content-Type: application/json" \
-d '{
    "processors": [
        {
            "opnipre": {}
        }
    ]
}'
echo '/n'
sleep 3

curl -XPUT localhost:9200/logs \
-H "Content-Type: application/json" \
-d '{
    "settings": {
        "index.default_pipeline": "my_simple_pipeline"
    }
}'
echo '/n'
sleep 3

curl -XPOST localhost:9200/logs/_doc \
-H "Content-Type: application/json" \
-d @example.txt
sleep 3

curl -X GET localhost:9200/logs/_search
