<table role="presentation" border="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <img width=128 height=128 src="graphics/logo/display.svg" alt="Options Indigo logo"/>
        </td>
        <td>
            <h1>Indigo Community Navigation Software</h1>
            <p><i>Daisy Codenys, Joseph Melancon, Jack Parrish, Angelina Toste, Cade Wasti</i></p>
            <p><i>University of North Dakota, Fall 2025 to Spring 2026</i></p>
        </td>
    </tr>
</table>
<hr/>

## Abstract

This repository is to be utilized for overarching documentation across
the Indigo system, a Community Navigation Software designed in line with the
[Inform USA Standards v10.1](https://www.informusa.org/standards).

## Project Specifications

Required by appendix 2 of the Inform USA spec, the following data elements
are required to be present in the resource component of the database:

<!-- Heads up! This is best viewed either on github.com or in a markdown renderer. -->
<table>
    <colgroup>
        <col/>
        <col/>
        <col/>
        <col/>
    </colgroup>
    <thead>
        <tr>
            <th rowspan="2">Data Element</th>
            <th colspan="3">Resource Data Structure</th>
        </tr>
        <tr>
            <th>Organization/Agency Level</th>
            <th>Location/Site Level</th>
            <th>Service/Program Level</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>Name</th>
            <td>Mandatory</td>
            <td>Mandatory</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>AKA (Also Known As) Names</th>
            <td>Mandatory</td>
            <td>Mandatory</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Legal Status</th>
            <td>Mandatory</td>
            <td>x</td>
            <td>x</td>
        </tr>
        <tr>
            <th>Federal Employer Identification Number (EIN/FEIN)</th>
            <td>Recommended</td>
            <td>x</td>
            <td>x</td>
        </tr>
        <tr>
            <th>Licenses or Accreditation</th>
            <td>Recommended</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Address(es)</th>
            <td>Recommended</td>
            <td>Mandatory</td>
            <td>x</td>
        </tr>
        <tr>
            <th>Mailing Address(es)</th>
            <td>Recommended</td>
            <td>Mandatory</td>
            <td>x</td>
        </tr>
        <tr>
            <th>Phone Number(s) and Types</th>
            <td>Mandatory</td>
            <td>Mandatory</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Website URL(s) including Social Media</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Email Address(es)</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Name and Title of Director/Manager</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Description</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Days/Hours of Operation</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Physical /Programmatic Access for People with Disabilities</th>
            <td>x</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Eligibility</th>
            <td>x</td>
            <td>x</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Geographic Area Served</th>
            <td>x</td>
            <td>x</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Languages Consistently Available</th>
            <td>x</td>
            <td>x</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Documents Required</th>
            <td>x</td>
            <td>x</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Application/Intake Process</th>
            <td>x</td>
            <td>x</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Fees/Payment Options</th>
            <td>x</td>
            <td>x</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Classification System/Taxonomy Term(s) for Services/Targets</th>
            <td>Recommended</td>
            <td>Recommended</td>
            <td>Mandatory</td>
        </tr>
    </tbody>
</table>

Additionally, the following information is required to be visible for admin users:

<!-- Heads up! This is best viewed either on github.com or in a markdown renderer. -->
<table>
    <colgroup>
        <col/>
        <col/>
        <col/>
        <col/>
    </colgroup>
    <thead>
        <tr>
            <th rowspan="2">Data Element</th>
            <th colspan="3">Resource Data Structure</th>
        </tr>
        <tr>
            <th>Organization/Agency Level</th>
            <th>Location/Site Level</th>
            <th>Service/Program Level</th>
        </tr>
    </thead>
        <tr>
            <th>Unique ID Number</th>
            <td>Mandatory</td>
            <td>Mandatory</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Record Ownership Code</th>
            <td>Mandatory</td>
            <td>x</td>
            <td>x</td>
        </tr>
        <tr>
            <th>Date of Last Annual Verification</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Date of Last Interim Change</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Contact for Last Change</th>
            <td>Recommended</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Resource Database Curator for Last Change</th>
            <td>Recommended</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
        <tr>
            <th>Record Status (Active/Inactive)</th>
            <td>Mandatory</td>
            <td>Mandatory</td>
            <td>Mandatory</td>
        </tr>
        <tr>
            <th>Record Inclusion (e.g. displayed online, in specific portals, directories, etc.)</th>
            <td>Mandatory</td>
            <td>Recommended</td>
            <td>Recommended</td>
        </tr>
    <tbody>
    </tbody>
</table>

## System Diagrams

### End-User Workflows

[directServiceWorkflow.mmd](diagram/directServiceWorkflow.mmd)
details an example workflow for how an end user may provide direct service to an individual consumer, illustrated in flowchart format.

[uiWorkflow.mmd](diagram/uiWorkflow.mmd)
details the process by which end users typically interact with the
system, illustrated in flowchart format.

### UML Class Diagram

[class.mmd](diagram/class.mmd) details the expected structure for
all entities in the system. This model is to be applied to both client
and server.

### Authentication

[authVend.mmd](diagram/authVend.mmd) details the exchange between
client, server, and Active Directory instance for initial client
login.  
[authCheck.mmd](diagram/authCheck.mmd) details the process of 
verifying users via cookies issued by the former process.
