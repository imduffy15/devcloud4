### Start the vagrant boxes

```bash
vagrant up
```

This takes about 45 mins depending on your computer.

*** Common issues: ***

- 'Cannot forward the specified ports on this VM': There could be TomCat or some other
  service running on the host OS causing vagrant to fail setting up local port forwarding.
