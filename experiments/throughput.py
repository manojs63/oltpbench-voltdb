from subprocess import call
import os
import sys
import argparse
import time

# Throughput experiments
def run_experiment(load_only=False, execute_only=False):
  
  print 'Experiment Start:', time.strftime('%l:%M:%S%p %Z on %b %d, %Y')
  # Edit the Configs as needed
  benchmark_home_dir = '/home/mk2sharma/cs848/oltpbench-voltdb'
  client_counts = [1, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60]
  benchmark_name = "tatp"
  database_name = "voltdb"
  workload = "rw_80_20"
  sampling_period = 5

  # derive file paths
  config_file_base_path = benchmark_home_dir + '/config'
  database_connection_config = 'config/tatp/' + database_name + '/tatp_' + database_name + '_config.xml'

  # change working directory to root of benchmark
  os.chdir(benchmark_home_dir)

  if load_only and execute_only:
    print 'Bad arguments'
    sys.exit(1) 

  if not execute_only:
    print 'create and loading the database'
    call(["./oltpbenchmark", "-b", "tatp", "-c", database_connection_config, '--create=true', '--load=true'])
    if load_only:
      print 'Experiment Completed:', time.strftime('%l:%M:%S%p %Z on %b %d, %Y')
      sys.exit(0)

  for i in client_counts:
    test_run_config_file = config_file_base_path + '/' + \
                             benchmark_name + '/' + \
                             database_name + '/throughput/' + \
                             workload + '/' + str(i) + '.xml'
 
    # Check if config file exists
    if not os.path.isfile(test_run_config_file):
      print 'missing config file:', test_run_config_file 
      sys.exit(1)   
  
    # Create output directoy for results
    output_directory = "throughput/" + benchmark_name + '/' + database_name + '/' + workload + '/' + str(i)
    call(["mkdir", "-p", "results/" + output_directory])

    # Execute each run
    print 'Running', i, 'clients:'
    call(["./oltpbenchmark", "-b", "tatp", "-c", test_run_config_file, '--execute=true', '-s', str(sampling_period), '-o',output_directory])
    print i, 'clients run completed at:', time.strftime('%l:%M:%S%p %Z on %b %d, %Y')

  print 'Experiment Completed:', time.strftime('%l:%M:%S%p %Z on %b %d, %Y') 

if __name__ == '__main__':
  parser = argparse.ArgumentParser(description="CS848 Project Throughput Experiment Script")
  parser.add_argument("--load_only", help="only create and load the database", action="store_true")
  parser.add_argument("--execute_only", help="only execute the test runs", action="store_true")
  args=parser.parse_args()
  run_experiment(load_only=args.load_only, execute_only=args.execute_only)

  
