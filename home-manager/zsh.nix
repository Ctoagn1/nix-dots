{config, pkgs, lib, ...}:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autocd = true;
        history.append = true;
        shellAliases = {
            ".." = "cd ..";
            "..." = "cd ../..";
            "ls" = "eza";
        };
        initContent = 
            ''
                fastfetch
            '';
    };
}
