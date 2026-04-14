# Welcome to CroXe

A relational database of cross-sections and rate coefficients for atomic
processes and alike.

## Why CroXe

Though similar databases already exist, I decided to develop CroXe because none
among the alternatives could satisfy me: IAEA's ALADDIN seems to be abandoned
and not working properly anymore, ADAS is closed source and OPEN-ADAS is as
"open" as OpenAI.

When I first conceived CroXe, I wanted it to be completely open source, based on
standard and consolidated technologies, versionable with git and, most of all, I
didn't want it hardcoded into any specific programming language library, or
module, but, instead, it should have been divided into a true database and the
various programming languages APIs.

So, here it is, a database of cross-sections and rate coefficients that is under
git version control through its SQL dumps. And that's not even the best part:
since it is open source, you are free to contribute to it and host a copy
wherever you want!

## Installation

This section will teach you how to install [MariaDB](https://mariadb.com/),
the [RDBMS](https://en.wikipedia.org/wiki/Relational_database#RDBMS) I chose to
develop and test CroXe, and how to import CroXe itself in it. If you have
installed already MySQL, since MariaDB has been developed to be a drop-in
replacement for it, you can skip directly to the [Adding a MariaDB CroXe admin](#adding-a-mariadb-croxe-admin)
or [Importing CroXe](#importing-croxe) sections, taking into account that
whenever you see the command `mariadb`, you should use `mysql` instead.

### Installing MariaDB

MariaDB comes divided into two components: a server and a client. Some Linux
distros, such as Ubuntu and Debian, provide two separate packages for them,
while, on the other hand, Windows, macOS and some other Linux distros, such as
Arch, Fedora or Void Linux (my main distro), have just one package.

#### Installing MariaDB on Linux

Installing MariaDB on Linux, usually comes down to 3 steps:

1. Installing the relevant packages
2. Enabling the service
3. Securing the installation

To install the package on Debian and Ubuntu run:

```bash
sudo apt update
sudo apt install mariadb-server mariadb-client
```

On Arch you should run:

```bash
sudo pacman -S mariadb
```

On Fedora:

```bash
sudo dnf install mariadb-server
```

On Void Linux:

```bash
sudo xbps-install mariadb
```

If you use systemd as init daemon (if you don't know what systemd is, chances
are that you are using it), to start and enable the MariaDB service, run:

```bash
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

If you don't use systemd, I'm pretty confident that you know already how to
manage services on your distro...

After installing and enabling MariaDB, whether you are on Debian, Arch or any
other distro, you should **ALWAYS** run:

```bash
sudo mariadb-secure-installation
```

You will be guided through the security hardening of your MariaDB installation.

> [!TIP]
> The Unix Socket authentication, provided you create MariaDB users in the
> correct way, allows for passwordless login, if and only if MariaDB and OS
> users have the same username.
> If, during the execution of the security hardening script, you chose to enable
> Unix Socket authentication, this would be the default authentication method
> for the `root` user.
> More information can be found [in the official docs](https://mariadb.com/docs/server/reference/plugins/authentication-plugins/authentication-plugin-unix-socket)

#### Installing MariaDB on macOS

If you don't have Homebrew, please [install it](https://brew.sh/)! In the Year
of our Lord 2026, package managers are the simplest and most secure way of
installing stuff (except for npm...).

To install MariaDB, in your terminal run:

```bash
brew install mariadb
```

After that, you can enable the MariaDB service with:

```bash
brew services start mariadb
```

I'm not sure about this, since I don't have any running macOS installation on
which to test it, but you should be able to run the security hardening script:

```bash
sudo mariadb-secure-installation
```

If it doesn't work, it means that your installation is already security hardened
and that `root` login is enabled through Unix Socket:

```bash
sudo mariadb -u root
```

> [!IMPORTANT]
> Since, as previously stated, I don't have a running instance of macOS, it is
> highly advised to have always at reach, during the installation, the [official
> installation guide](https://mariadb.com/docs/server/server-management/install-and-upgrade-mariadb/installing-mariadb/binary-packages/installing-mariadb-on-macos-using-homebrew)

#### Installing MariaDB on Windows

What's true about package managers and macOS, is true also for package managers
and Windows: you should use them, they are extremely convenient! On the contrary
to macOS, though, Windows comes shipped already with WinGet, its own package
manager.

To begin the installation process, run:

```bash
winget install -i mariadb
```

Configure the installation as you are prompted to do and, if in doubt, just
go on with the default options, except for the root password that should always
be changed.

> [!IMPORTANT]
> The `-i` flag, short for `--interactive`, is mandatory if you want to
> configure your MariaDB installation (and you really want to configure it,
> otherwise you won't have a password for the root account login).

> [!IMPORTANT]
> On Windows, MariaDB executable is called `mysql.exe` and is not automatically
> added to the `Path` variable, so executing something like `mysql -u root -p`
> will fail. To circumvent this problem you can either try adding the MariaDB
> bin directory (usually `C:\Progrm Files\MariaDB X.Y\bin`) to the `Path`
> variable, or use the Start Menu Entry `MySQL Client`, which will launch a cmd
> instance, located in `C:\Progrm Files\MariaDB X.Y\bin`, and execute
> `mysql.exe -u root -p` automatically.

> [!IMPORTANT]
> As with macOS, I don't have a running instance of Windows, so it is highly
> advised to go through the [official installation guide](https://mariadb.com/docs/server/server-management/install-and-upgrade-mariadb/installing-mariadb/binary-packages/installing-mariadb-msi-packages-on-windows)

### Adding a MariaDB CroXe admin

Now that MariaDB has been successfully installed, and the server is up and
running, we can import CroXe, right?

**WRONG!**

If we stopped here and jumped straight to the [Importing
CroXe](#importing-croxe) section, we would need to log in as the `root` account
every time we would have to modify CroXe, and the cybersecurity officer would be
at us...

It is always good practice to avoid usage of the `root` user as much as
possible, limiting its role solely to users creation and management. Hence, in
this subsection, I will guide you through the creation of an _ad hoc_ user for
CroXe that will take on the duty of administrating the database itself.

Login as `root` by running `mariadb -u root -p`, if you have set up a
`root` user password, or `sudo mariadb -u root`, if you have set up Unix
Socket authentication. Afterward, to create a `croxe-admin` user authenticated
by password, run:

```sql
CREATE USER 'croxe-admin'@'localhost' IDENTIFIED BY 'super-strong-password';
```

If you want to authenticate via Unix Socket, instead, first you must create an
OS user with the same name of the MariaDB user you will be creating, in this
case `croxe-admin`. Then, in MariaDB, log in as `root` and run:

```sql
CREATE USER 'croxe-admin'@'localhost' IDENTIFIED VIA unix_socket;
```

> [!TIP]
> Other authentication methods are listed [in the official docs](https://mariadb.com/docs/server/reference/sql-statements/account-management-sql-statements/create-user#authentication-options)

Once the `croxe-admin` user is created, grant them all privileges on the CroXe
database. It is possible to do so even if CroXe doesn't exist yet:

```sql
GRANT ALL PRIVILEGES ON CroXe.* TO 'croxe-admin'@'localhost';
```

### Importing CroXe

Finally, it is time to import CroXe! You can choose whether to import the full
database, just the schema, or just the data.

Assuming that the `croxe-admin` user is authenticated by password and your shell
working directory is this git repo, to import the full database, run:

```bash
mariadb -u croxe-admin -p < croxe_full_dump.sql
```

To import just the schema, instead, run:

```bash
mariadb -u croxe-admin -p < croxe_schema.sql
```

If you want just the data, first you need at least an up to date CroXe schema,
then you can run:

```bash
mariadb -u croxe-admin -p CroXe < croxe_data.sql
```

### Adding a MariaDB CroXe guest

If your goal is to let people have free access to the data stored in CroXe,
without, at the same time, giving them write permissions, I suggest creating an
additional user with just `SELECT` privileges:

```sql
CREATE USER 'croxe-guest'@'%';
GRANT SELECT ON CroXe.* TO 'croxe-guest'@'%';
```

> [!WARNING]
> Note that `'%'` is the wildcard character that, in this case, will match all
> the possible IPs and hostnames. Using plain `'%'` as the hostname **is**, in
> general, **strongly discouraged**, especially with passwordless users.
> Neverthelss, since the objective here is to give free access to the data to
> whoever can reach the database server, and assuming that such server is on the
> internet, we don't have any better viable option. If you want to grant access
> only from the local network, or from one of its subnets, note that you can
> also use netmasks to match a range of IP addresses, as reported [in the
> official docs](https://mariadb.com/docs/server/reference/sql-statements/account-management-sql-statements/create-user#host-name-component)

## Contribuiting

Right now you can suggest changes through
[e-mail](mailto:luca.cinnirella@protonmail.com), but soon some more standard
ways of contributing will be available

## License

CroXe is free as in freedom and licensed under the [GPL v3](./LICENSE)
