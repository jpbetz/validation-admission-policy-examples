mimetype="$(xdg-mime query filetype $1 | sed -r 's/x-//g')"
url="localhost:8001/apis/admissionregistration.k8s.io/v1alpha1/validatingadmissionpolicies"

if [ $mimetype = 'application/yaml' ]
then
  mimetype='application/json'
  curl -v -d "$(cat $1 | yq -o=json)" -X POST -H "Content-Type: $mimetype" "$url"
else
  curl -v -d@$1 -X POST -H "Content-Type: $mimetype" "$url"
fi

