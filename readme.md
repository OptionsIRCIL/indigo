<table role="presentation" border="0" cellspacing="0" width="100%">
    <tr>
        <td>
            <img width=128 height=128 src="graphics/logo/display.svg" alt="Options Indigo logo"/>
        </td>
        <td>
            <h1>Indigo System Documentation</h1>
            <p><i>Daisy Codenys, Joseph Melancon, Jack Parrish, Angelina Toste, Cade Wasti</i></p>
            <p><i>University of North Dakota, Fall 2025 to Spring 2026</i></p>
        </td>
    </tr>
</table>
<hr/>

## Abstract

This repository is to be utilized for overarching documentation across
the Indigo system.

## Project Specifications

TODO: Write specs.

## System Diagrams

### End-User Workflow

[directServiceFlowchart.mmd](diagram/directServiceFlowchart.mmd)
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