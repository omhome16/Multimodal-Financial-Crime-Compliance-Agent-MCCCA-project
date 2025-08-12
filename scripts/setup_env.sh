 #!/bin/bash
set -e  

# Create venv only if it doesn't exist
if [ ! -d "MCCCA" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .MCCCA
else
    echo "Virtual environment already exists. Skipping creation."
fi

source MCCCA/scripts/activate

if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
fi

echo "Environment setup complete."
