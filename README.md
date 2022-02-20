Creating a Treasure Trail Application with Ruby on Rails,

Tensorflow and ONNX.

Instructions for use:

Use a Terminal to clone into a local repository with:
“git clone –branch main https://github.com/alex-whitehouse/Hiddnworld.git”

Ruby and Rails dependencies work best on Linux and therefore Windows installa-
tions are recommended to be conducted on a Windows Subsystem for Linux (WSL)

Instructions for local installation of the application server
The following Dependencies should be installed on your system

• Install Ruby with rbenv
• Rails, NodeJS and Yarn
• PostgreSQL
Once you have initialised PostgreSQL, navigate to the directory the git repository
cloned to and run

1. ‘Bundle Install’ (Bundle will prompt if sudo/admin is required.)
2. ‘Rails db:migrate’ (Ensure that your credentials are listed correctly within the
database configuration file in the source code.
3. ‘Rails server’ to initialise Puma Web Server
4. Navigate to 127.0.0.1:3000 / localhost:3000
