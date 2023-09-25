so, this was inspired by Q24 from killer.sh CKA exam simulator.
"block any access from backend to db1, if not on port 1111".


## Expected Behavior
egress rule should respect the k8s svc port only. 
This np should allow access to port 1111, but it still blocks.

´´´
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
        port: 1111
´´´


## Current Behavior
exposed container port: 80
k8s svc port: 1111

access is blocked, we need to allow also port 80 in the egress rule
´´´
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
        port: 1111
      - protocol: TCP
        port: 80
´´´



## Possible Solution
workaround: use the same port for the exposed port and for the svc port.

## Steps to Reproduce (for bugs)
1.
2.
3.
4.

## Context 
I wanted to test, if my network policy was correct and installed calico on a kind k8s,
finding this issue. I think that issue this makes egress policies harder to read.


## Your Environment
* Calico version v3.26.1
* Orchestrator version: kind version 0.20.0
* Operating System and version: Ubuntu 22.04.2 LTS
* Link to your project (optional):
