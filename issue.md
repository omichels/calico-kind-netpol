so, this was inspired by Q24 from killer.sh CKA exam simulator.
"block any access from backend to db1, if not on port 80".


## Expected Behavior
egress rule should respect the k8s svc port only. 
This np should allow access to port 80, but it still blocks.

```yaml
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
    - Egress                   
  egress:
    -                           
      to:                          
      - podSelector:
          matchLabels:
            app: db1
      ports:                        
      - protocol: TCP
        port: 80
```


## Current Behavior
exposed container port: 8080
k8s svc port: 80

access is blocked, we need to allow also port 8080 in the egress rule
```yaml
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
    - Egress                   
  egress:
    -                           
      to:                          
      - podSelector:
          matchLabels:
            app: db1
      ports:                        
      - protocol: TCP
        port: 80
      - protocol: TCP  # removing this port 
        port: 8080     # will wrongly disable access
```



## Possible Solution
workaround: use the same port for the exposed port and for the svc port.

## Steps to Reproduce (for bugs)



1. create a new k8s with kind and Calico as CNI (see git repo 'kind_with_calico')
2. create pod 'database_db1.yaml', create svc 'db1_service_yaml', svc port 80 is open
```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    app: db1
  name: db1
  namespace: snake
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 8080
  selector:
    app: db1
```
3. exec into backend pod and use curl to test 'curl db1'
4. now remove port 8080 from the networkpolicy
5. exec into backend pod and use curl to test 'curl db1', access is blocked

## Context 
I wanted to test, if my network policy was correct and installed calico on a kind k8s,
finding this issue. I think that issue this makes egress policies harder to read.


## Your Environment
* Calico version v3.26.1
* Orchestrator version: kind version 0.20.0
* Operating System and version: Ubuntu 22.04.2 LTS
* Link to your project (optional): https://github.com/omichels/calico-kind-netpol
