{
    config,
    pkgs,
    ...
}: 
{
    environment.systemPackages = [
        pkgs.mkalias
        pkgs.gitFull
        pkgs.mas
    ];
}