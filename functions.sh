# rq = rancher query
function rq() {
	local path=${1:?Must include path}
  local token=${RANCHER_TOKEN:?Rancher token must be present}
	curl -s \
  -X GET \
  -H 'Accept: application/json' \
  -u $token \
	"https://rancher.flowerwork.net/v3$path" | jq "${@:2}"
}
