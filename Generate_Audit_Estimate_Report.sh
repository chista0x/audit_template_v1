#!/bin/bash

# Step 1: Check if solidity-code-metrics is installed
if npm list -g solidity-code-metrics > /dev/null 2>&1; then
    echo "solidity-code-metrics is already installed."
else
    echo "Installing solidity-code-metrics..."
    npm install -g solidity-code-metrics
fi

# Step 2: Set the current directory path
CURRENT_DIR=$(pwd)
SCOPE_FILE="$CURRENT_DIR/scope.txt"
OUTPUT_FILE="$CURRENT_DIR/audit_metrics/metrics.md"
OUTPUT_FILE_HTML="$CURRENT_DIR/audit_metrics/metrics.html"
AUDIT_OUTPUT_FILE="$CURRENT_DIR/audit_metrics/Audit_Estimate_Report.md"

# Check if the scope.txt file exists
if [ ! -f "$SCOPE_FILE" ]; then
    echo "ERROR: scope.txt not found in the current directory."
    exit 1
fi

# Step 3: Run solidity-code-metrics and save the report in metrics.md
echo "Generating metrics report..."
solidity-code-metrics --scope-file "$SCOPE_FILE" > "$OUTPUT_FILE"
solidity-code-metrics --html --scope-file "$SCOPE_FILE" > "$OUTPUT_FILE_HTML"

# Check if the metrics.md file was generated successfully
if [ ! -f "$OUTPUT_FILE" ]; then
    echo "ERROR: Failed to generate metrics.md."
    exit 1
fi

# Step 4: Extract the required information from the Totals line
echo "Extracting nSLOC and Complex. Score..."
LINE=$(grep " | \*\*Totals\*\* | " "$OUTPUT_FILE")

# Extract nSLOC and Complex. Score from the line
NSLOC=$(echo "$LINE" | awk -F "|" '{gsub(/\*\*/, "", $8); gsub(" ", "", $8); print $8}')
COMPLEX=$(echo "$LINE" | awk -F "|" '{gsub(/\*\*/, "", $10); gsub(" ", "", $10); print $10}')

echo "Calculating audit duration ..."

# Step 5: Calculate audit duration
BASE_DURATION=7
SCALING_FACTOR=2000

SCALED_DURATION=$(( (NSLOC + COMPLEX) * BASE_DURATION * 1000 / SCALING_FACTOR + BASE_DURATION * 1000 ))
AUDIT_DURATION=$(( SCALED_DURATION / 1000 ))

echo "Calculating audit cost ..."


# Step 6: Calculate audit cost
BASE_PRICE=4

SCALED_PRICE_RATIO=$(( BASE_PRICE * SCALING_FACTOR * 1000 / (SCALING_FACTOR + NSLOC) ))
SCALED_AUDIT_COST=$(( NSLOC * SCALED_PRICE_RATIO * (1000 + COMPLEX * 1000 / SCALING_FACTOR) / 1000 ))
AUDIT_COST=$(( SCALED_AUDIT_COST / 1000 ))


# Calculate payment milestones
UPFRONT_PAYMENT=$(( AUDIT_COST * 25 / 100 ))
INITIAL_REPORT_PAYMENT=$(( AUDIT_COST * 50 / 100 ))
FINAL_REPORT_PAYMENT=$(( AUDIT_COST * 25 / 100 ))


# Step 7: Write the results to Audit_Duration_Cost.md
cat > "$AUDIT_OUTPUT_FILE" <<EOL
# Audit Estimate Report

## Metrics Summary
- **nSLOC:** $NSLOC
- **Complexity Score:** $COMPLEX

## Audit Duration
The estimated duration of the audit is approximately **$AUDIT_DURATION days**.

## Audit Cost
The estimated cost of the audit is **\$${AUDIT_COST} USD**.

## Payment Schedule
Payments for this audit are structured as follows:
- **Upfront Payment (25%):** \$${UPFRONT_PAYMENT} USD
- **Initial Report Payment (50%):** \$${INITIAL_REPORT_PAYMENT} USD
- **Final Report Payment (25%):** \$${FINAL_REPORT_PAYMENT} USD

### Notes:
- The duration and cost are calculated based on the size and complexity of the codebase.
- If additional constraints or requirements exist, adjustments may be necessary.
EOL


echo "Audit Estimate Report generated: $AUDIT_OUTPUT_FILE"
