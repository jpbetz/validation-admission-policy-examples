mimetype=$(xdg-mime query filetype $1 | sed -r 's/x-//g')
if [ $mimetype = 'application/yaml' ]
then
  mimetype='application/json'
  curl -v -d "$(cat $1 | yq -o=json)" -X POST -H "Content-Type: $mimetype" localhost:8001/apis/apps/v1/namespaces/default/deployments
else
  curl -v -d@$1 -X POST -H "Content-Type: $mimetype" localhost:8001/apis/apps/v1/namespaces/default/deployments
fi

