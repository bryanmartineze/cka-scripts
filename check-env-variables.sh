#Check if certain env variable accomplishes its purpose
kubectl -n alpha exec pods/alpha-mysql-5b7b8988c4-zckjs -- env | grep EMPTY
