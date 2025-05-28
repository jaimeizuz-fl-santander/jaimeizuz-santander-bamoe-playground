# Async issue
Steps to reproduce:

1. Install the patched libs following the instructions in "patched-libs/README.md"

2. Build the patched BAMOE app by executing ```mvn "-Dbamoe.fix=patched" "-Pbamoe-patched" "-Pbamoe-enterprise" "-Pbamoe-persistence-postgresql" "-Pbamoe-audit" "-Popentelemetry-traces-logs-metrics" "-Pcontainer" clean package```

3. Build the non patched BAMOE app by executing ```mvn "-Dbamoe.fix=non-patched" "-Pbamoe-enterprise" "-Pbamoe-persistence-postgresql" "-Pbamoe-audit" "-Popentelemetry-traces-logs-metrics" "-Pcontainer" clean package```

4. Start the compose: ```docker compose --profile full up -d```

5. Run the jmeter plan in "jmeter" folder
   
6. Install any of VisualVM, JMC... to see the JMX statistics. Memory in the patched BAMOE app will increase permanently when receiving requests.

## Additional tools:
- JaegerUI: [http://localhost:16686]()
- Grafana: [http://localhost:3000]()

## Ports exposed for JMX/JFR:
- 12346 for patched app.
- 12347 for non-patched app.