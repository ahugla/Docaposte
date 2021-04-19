

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
kubectl create -f lamp-k8s-namespace.yaml
kubectl apply -f /tmp/Docaposte/k8s




