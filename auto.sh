# #!/bin/bash

# # Check if at least one argument (the script name) is provided
# if [ $# -eq 0 ]; then
#     echo "Usage: $0 <script_name> [parameters...]"
#     exit 1
# fi

# # Extract the script name from the first argument
# script_name="$1"

# # Check if the specified script exists
# if [ ! -f "$script_name" ]; then
#     echo "Error: Script '$script_name' not found."
#     exit 1
# fi

# # Shift the first argument (script_name) out, so $@ contains only the parameters
# shift

# # Run the specified script with the remaining parameters
# scripts/"$script_name" "$@"
#read -p "Enter the version to delete:" VERSION
#!/bin/bash

# Initialize an associative array to map flags to script names
declare -A flag_to_script
flag_to_script["-d"]="delete.sh"
flag_to_script["--delete"]="delete.sh"
flag_to_script["-i"]="init.sh"
flag_to_script["--init"]="init.sh"
flag_to_script["-p"]="prune.sh"
flag_to_script["--prune"]="prune.sh"
flag_to_script["-in"]="info.sh"
flag_to_script["--info"]="info.sh"
flag_to_script["-dep"]="deploy.sh"
flag_to_script["--deploy"]="deploy.sh"

# Check if the flag is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 [-d|--delete|-i|--init|-p|--prune|-in|--info|-dep|--deploy]"
  # exit 1
fi

# Check if the provided flag is in the associative array
if [ "${flag_to_script[$1]}" ]; then
  script_to_run="${flag_to_script[$1]}"
  ./scripts/"$script_to_run"
else
  echo "Invalid flag: $1"
  echo "Usage: $0 [-d|--delete|-i|--init|-p|--prune|-in|--info]"
  # exit 1
fi

exit 0
