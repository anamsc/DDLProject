# Real Estate Database Management System

This project defines a relational database for a real estate management system. It includes tables to store information about people, properties, agencies, contracts, payment methods, and services. The goal is to manage and track real estate properties, the clients involved, and transactions between tenants, property owners, and agencies.

## Project Structure

The database consists of the following tables:

- **Persona**: Stores general information about individuals, including their ID, username, password, name, and contact details.
- **Cliente**: References a person who is a client and includes their budget.
- **Propietario**: References a person who owns a property.
- **Agencia**: Represents the real estate agency managing the properties.
- **Propiedad**: Contains details about the properties, including property type, owner, and the agency managing it.
- **Contrato**: Represents rental contracts between tenants and property owners.
- **Tipotarjetas**: Lists the types of payment cards (debit, credit) accepted.
- **Tarjeta**: Stores payment information for contracts, including card details.
- **Interesados**: Tracks potential clients interested in renting or buying a property.
- **Servicio**: Represents services related to properties, such as cleaning or maintenance.

### Prerequisites

To run this project, you will need:
- A relational database management system (RDBMS), such as **Oracle Database** or **MySQL**.
- SQL tools to execute the provided SQL scripts, like **SQL*Plus**, **MySQL Workbench**, or similar.


### Database Structure

Here is an overview of the key tables and their relationships:

- **persona**: The core table holding data about individuals (both clients and property owners).
- **cliente** and **propietario**: Subcategories of `persona`, representing people who are clients or property owners.
- **Agencia**: Stores information about real estate agencies managing properties.
- **Propiedad**: Links to `persona` and `Agencia` to indicate property ownership and management.
- **Contrato**: Records details about rental agreements between a client (tenant) and a property owner.
- **Tarjeta**: Stores payment information tied to rental contracts.

### Entity Relationships

- **One-to-many**: One agency manages multiple properties.
- **Many-to-one**: Multiple properties can belong to the same owner.
- **One-to-one**: Each rental contract is associated with one tenant and one property.
