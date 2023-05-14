# Run
```bash
docker run -p 3307:3306 mysql-honeypot
```
test:
```bash
mysql -root -h localhost -P 3307
```


```bash
curl -u $ncs_user:$ncs_pass\
    -d "Honeypot Access Detected"\
    -H "Priority: urgent"\
    -H "Tags: warning"\
    https://ntfy.teawide.xyz/ncs
```
