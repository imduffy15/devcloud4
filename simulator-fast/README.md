### Start the vagrant boxes

```bash
vagrant up
```

### Reset the box

```bash
vagrant provision
```

*** Common issues: ***

- 'Cannot forward the specified ports on this VM': There could be Tomcat, Mysql or some other
  service running on the host OS causing vagrant to fail setting up local port forwarding.
