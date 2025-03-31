<h2 align="center">Nixvim</h2>

> This repository contains my Neovim configuration, which is declaratively written in Nix.

**Configuring/editting**

To start configuring, just add or modify the Nix files in `./config`.

If you add a new configuration file, remember to add it to the [`config/default.nix`](./config/default.nix) file

**Testing your new configuration**

To test your configuration simply run the following command

```sh
nix run .
```

To test the config without first cloning the repo simply run the following command

```sh
nix run github:Ahwxorg/nixvim-config
```

**Add to flake:**

I have the following in flake.nix

```nix
{
....
inputs = {
  nixvim.url = "github:ahwxorg/nixvim-config";
}
....
};
```

And then I have a `packages.nix` file that contains:

```nix
{ inputs, pkgs, ... }: 
{
  home.packages = with pkgs; [
    ...
    inputs.nixvim.packages.${pkgs.system}.default
  ];
}
```

Or you can always [take a look yourself](https://github.com/Ahwxorg/nixos-config)

## Credits

Huge amount of credits to [elythh](https://github.com/elythh/nixvim)! I've ~~taken~~ shamelessly stolen quite a lot of their configuration.
