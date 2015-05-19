# Install `npm` packages globally without sudo on OS X

> Adapted from [@sindresorhus](https://github.com/sindresorhus)' [guide](https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md)

`npm` installs packages locally within your projects by default. You can also install packages globally (e.g. `npm install -g <package>`) (useful for command-line apps). However the downside of this is that you need to be root (or use `sudo`) to be able to install globally.

Here is a way to install packages globally for a given user.

###### 1. Create a directory for your global packages

```sh
mkdir "${HOME}/.npm-packages"
```

###### 2. Reference this directory for future usage in your `.bashrc`/`.zshrc`:

```sh
NPM_PACKAGES="${HOME}/.npm-packages"
```

###### 3. Indicate to `npm` where to store your globally installed package. In your `$HOME/.npmrc` file add:

```sh
prefix=${HOME}/.npm-packages
```

###### 4. Ensure `node` will find them. Add the following to your `.bash_profile`:

```sh
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
```

###### 5. Ensure you'll find installed binaries and man pages. Add the following to your `.bash_profile`:

```sh
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
```

---

See also: `npm`'s documentation on
["Fixing `npm` permissions"](https://docs.npmjs.com/getting-started/fixing-npm-permissions).
