import csv
import sys

with open(sys.argv[1]) as f:
  reader = csv.reader(f)
  next(reader) # skip header
  data = []
  throughput = 0.0
  avg_latency = 0.0
  p90_latency = 0.0
  for row in reader:
    throughput += float(row[1])
    avg_latency += float(row[2])
    p90_latency += float(row[7])
    data.append(row)

  n = len(data)
  print("Throughput = " + str(throughput/n) + " Latency_avg = " + str(avg_latency/n) + " Latency_p90 = " + str(p90_latency/n) )
