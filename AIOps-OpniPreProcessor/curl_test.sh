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
sleep 5

curl -XPUT localhost:9200/my_index \
-H "Content-Type: application/json" \
-d '{
    "settings": {
        "index.default_pipeline": "my_simple_pipeline"
    }
}'
echo '/n'
sleep 5

curl -XPOST localhost:9200/my_index/_doc \
-H "Content-Type: application/json" \
-d @example.txt
echo '/n'
sleep 5

curl -X GET localhost:9200/my_index/_search
