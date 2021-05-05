# Identicon

A simple app for generating github-like default profile image based in a hashed string, which could be the name of the user or whatever.

## How to run?

Clone the repo, cd its folder, download the dependencies by running **mix deps.get**, start the interactive shell **iex -S mix** and then just call **Identicon.main("<your_string">)**.

If it returns **:ok**, the image is generated in the root folder of the app named **"your_string".png**.

## Dependencies

:egd (Erlang Graphical Drawer)

