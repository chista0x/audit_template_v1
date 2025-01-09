# About
Chista0x, the auditor, is dedicated to providing the best possible audit experience. While 100% security can never be guaranteed, I commit to delivering the highest level of effort and expertise to secure your blockchain protocol. You can view my previous work [here](https://github.com/chista0x/audits) or connect with me on Twitter [@chista0x](https://twitter.com/chista0x).

# Disclaimer
A smart contract security review cannot fully guarantee the absence of vulnerabilities. This process is bound by time, resources, and expertise, and focuses on identifying as many vulnerabilities as possible within those constraints. I cannot guarantee complete security after the review or even that all issues will be detected. It is strongly recommended to follow up with additional security reviews, bug bounty programs, and on-chain monitoring for comprehensive security.

# Introduction
This repository documents a time-boxed security review conducted by **Chista0x**, with a focus on assessing the security of the project's smart contract implementation.

# Risk Classification

| Severity               | **Impact: High** | **Impact: Medium** | **Impact: Low** |
| ---------------------- | ---------------- | ------------------ | --------------- |
| **Likelihood: High**   | Critical         | High               | Medium          |
| **Likelihood: Medium** | High             | Medium             | Low             |
| **Likelihood: Low**    | Medium           | Low                | Low             |

## Impact
- **High:** Results in the loss of a significant portion of assets in the protocol or causes severe harm to the majority of users. Core protocol functionality is compromised, and funds may be permanently locked.
- **Medium:** Causes losses to a subset of users but remains unacceptable. May result in a denial of service (DoS) for funds lasting days or longer.
- **Low:** Leads to minor, bearable inconveniences, such as griefing attacks that can be easily resolved.

## Likelihood
- **High:** The attack path is feasible under reasonable assumptions that mimic on-chain conditions, and the cost of the attack is low relative to the potential value at risk.
- **Medium:** The attack vector is conditionally incentivized but remains relatively likely.
- **Low:** The attack depends on rare events that are theoretically possible under extreme but realistic market conditions.

## Action required for severity levels
- **Critical:** Must be fixed immediately (if already deployed).
- **High:** Must be addressed (before deployment, if not already deployed).
- **Medium:** Should be resolved.
- **Low:** Could be resolved.

## The Auditing Process and How to Use This Template
1. **Request an Audit:**
   - Create a new **`private`** repository from this template.
   - Add your project’s codebase and documentation to the repository.
   - Carefully add all file relative paths that are within the audit scope to the `scope.txt` file.
   - Run the `sh Generate_Audit_Estimate_Report.sh` command.
   - Check and review the generated `audit_metrics/Audit_Estimate_Report.md` file for the duration and cost of the audit.
   - Complete the **`Sponsor: Answers to Questions`** issue to provide essential information about the project.
   - Add action tags to the **`Sponsor: Answers to Questions`** issue:
     - Use the `Sponsor: Accepted Audit Rules` tag to indicate that the sponsor has selected all options and accepted the audit rules, pricing, and timeline.<br>
      
      OR
      
     - Use the `Sponsor: Need Discussion with Auditor` tag to indicate that the sponsor needs to discuss the rules, pricing, and timeline further.
      
      > [!NOTE] When the `Sponsor: Accepted Audit Rules` tag is used, the project must enter a code freeze, and no changes should be made during the audit process.
      
   - Assign the auditor (**Chista0x**) as a collaborator to grant access for the audit.

2. **Review Information by Auditor:**
   - Contact the sponsor if clarification is needed.
   - If all terms are agreed upon, accept the deal by adding the `Auditor: Accepted Audit` tag and start the audit process.

3. **Audit Begins**

4. **Initial Report by Auditor**

5. **Fix the Code by Sponsor**

6. **Review the Fixed Code by Auditor**
    > [!NOTE] If bugs are found in the fixed code, return to phase 4.

7. **Final Report by Auditor**


# Code of Conduct
- **Confidentiality of Repository and Communication:** All information contained within the audit repository, including project details, code, and communications during and after the audit process, will remain confidential unless explicitly agreed otherwise.
- **Public Release of Final Report:** The final audit report will be publicly available upon completion of the audit unless explicitly agreed otherwise.  
- **Respect:** Both parties are expected to maintain professional and respectful communication throughout the audit process.
- **Responsiveness:** Timely responses to issues or requests for clarification are appreciated to ensure an efficient audit process.

# Deliverables
The audit process will result in the following deliverables:
1. A comprehensive audit report in Markdown and PDF formats.
2. A list of identified vulnerabilities with severity levels and suggested fixes.
3. Follow-up verification of fixes.
4. Optional: Suggestions for gas optimization or best practices (if included in the scope with additional cost).


# Timeline and Auditing process
1. **Initial Review:** Analysis of documentation and initial scoping.
2. **In-Depth Review:** Comprehensive security review of the codebase.
3. **Issue Reporting:** Documentation of findings in GitHub issues.
4. **Fix Verification:** Validation of fixes provided by the sponsor.

The estimated duration of the audit is calculated based on the size of the codebase (**nSLOC**) and its complexity (**Complexity Score**). The formula ensures that every audit takes a minimum of **7 days**, with larger and more complex projects requiring additional time.

## Formula:
```javascript
var Base_Duration = 7; // Minimum audit duration in days
var Scaling_Factor = 2000; // Scaling factor to balance nSLOC and Complexity Score

var nSLOC = 2342; // Number of normalized lines of code
var Complexity_Score = 2137; // Complexity score of the project

var Calc_Audit_Duration = function(){
   return Base_Duration + ((nSLOC + Complexity_Score) / Scaling_Factor) * Base_Duration; 
}

var Audit_Duration = Calc_Audit_Duration();
```

### Example:
For the well-known project [Uniswap v3 Core](https://github.com/Uniswap/v3-core):
- **nSLOC = 2342**  
- **Complexity Score = 2137**  

Using the formula, the estimated duration is approximately **22.7 days**.

## Notes:
- The duration calculation ensures enough time is allocated for a thorough audit while considering the project’s size and complexity.  
- The formula adapts dynamically to provide a fair estimate for both small and large projects.  

> [!NOTE] If your project requires a specific timeline or has additional constraints, feel free to discuss this when requesting the audit.


# Pricing and Terms

The cost of the audit is calculated based on the following formula, which considers both the normalized Source Lines of Code (**nSLOC**) and the **Complexity Score** of the codebase. This ensures that the pricing scales reasonably with the size and complexity of the project.  

#### Pricing Formula:
```javascript
var Base_Price = 6; // Initial price per line of code for smaller projects
var Scaling_Factor = 2000; // Controls how the price decreases as nSLOC increases

var nSLOC = 2342; // Total normalized lines of code
var Complexity_Score = 2137; // Total complexity score (calculated using Solidity Metrics)

var Calc_nSLOC_Price_Ratio = function(){
   return Base_Price * (Scaling_Factor / (Scaling_Factor + nSLOC));
}

var nSLOC_Price_Ratio = Calc_nSLOC_Price_Ratio();

var Calc_Audit_Price  = function(){
   return nSLOC * nSLOC_Price_Ratio * (1 + (Complexity_Score / Scaling_Factor)); 
}

var Audit_Price = Calc_Audit_Price();
```

#### Example:
Using the well-known [Uniswap v3 Core](https://github.com/Uniswap/v3-core) repository as an example:  

- **nSLOC:** 2342  
- **Complexity Score:** 2137  
- **Base_Price:** $6  
- **Scaling_Factor:** 2000  

The calculations are as follows:  
1. **nSLOC_Price_Ratio:**  
   ```
   nSLOC_Price_Ratio = 6 * (2000 / (2000 + 2342))  
                     ≈ $2.76  
   ```
2. **Audit Price:**  
   ```
   Audit_Price = 2342 * 2.76 * (1 + (2137 / 2000))  
               ≈ $13,338 
   ```

#### Key Notes:
1. The **nSLOC_Price_Ratio** dynamically adjusts based on the size of the codebase. Larger projects receive a lower price per line.  
2. The **Complexity Score** further adjusts the price based on the intricacy of the code, ensuring that projects with more complex logic are priced appropriately.  

This method balances fairness and scalability while ensuring accurate pricing for projects of various sizes and complexities.

For more details on pricing or to discuss a custom quote, please contact me directly.

# Payment Terms

#### **Fixed Price Model**  
Payments for audits under the fixed price model are structured as follows:  
- **25%** upfront, prior to starting the audit.  
- **50%** after the delivery of the initial report.  
- **25%** upon submission of the final report.  

#### **Pay-As-Finding Model**  
For audits under the pay-as-finding model, payment terms will be determined through mutual agreement and discussion.


# Scope of the Audit
The audit focuses on:
- Smart contract functionality and adherence to specifications.
- Security vulnerabilities and attack vectors.
- Gas optimization (if specified).
- Adherence to best practices in Solidity development.

The following are **out of scope**, unless explicitly mentioned:
- Frontend or web application security.
- Backend infrastructure and off-chain systems.
- Economic or governance vulnerabilities unless they directly relate to the smart contracts.


# Contact
For any inquiries or clarifications, feel free to reach out:
- Email: [chista0x@gmail.com]
- Twitter: [@chista0x](https://twitter.com/chista0x)
- GitHub: [chista0x](https://github.com/chista0x)

# Glossary
- **nSLOC:** nSLOC stands for 'Normalized Source Lines of Code', a custom measurement we use (among other things) to evaluate the complexity of a codebase.<br>
    To get the NSLOC count of a file:
    1. For all functions, reduce any multiline function declarations to a single line.
    2. Remove all comments
    3. Remove all empty lines
    4. Count the remaining lines
- **PoC:** A proof of concept (PoC) is a demonstration or experiment that seeks to validate the feasibility, functionality, and potential of a particular idea, concept, or method. Typically used in the early stages of development, a PoC demonstrates that a concept or theory has practical potential for real-world application. It doesn't aim to represent a finished product or solution. Instead, verifying that a specific idea can be developed into a functional prototype or product is a foundational step.

- **Complexity:** The complexity of a code base or smart contract, calculated using [Solidity Core Metrics](https://github.com/Consensys/solidity-metrics), taking into consideration:
  - branches
  - loops
  - calls
  - external interfaces
  - ...

- **Sponsor:** Any protocol's team or developers willing to make their smart contracts more secure and their users safe by sponsoring a smart contract auditing.

