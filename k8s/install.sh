

cd /tmp


# DELETE ENV
kubectl delete services lamp-php-fpm  lamp-apache  -n lamp-k8s
kubectl delete deployment lamp-php-fpm lamp-apache -n lamp-k8s
kubectl delete configmap php-content apache-conf   -n lamp-k8s
kubectl delete namespace lamp-k8s


# GET NEW SOURCES
rm -rf /tmp/Docaposte
git clone https://github.com/ahugla/Docaposte.git


# CREATE ENV
kubectl create -f /tmp/Docaposte/lamp-k8s-namespace.yaml
sleep 3
kubectl apply -f php-content-configmap.yaml
kubectl apply -f apache-configmap.yaml
kubectl apply -f php-fpm-deployment.yaml
kubectl apply -f apache-deployment.yaml
kubectl apply -f php-fpm-service.yaml
kubectl apply -f apache-service.yaml
