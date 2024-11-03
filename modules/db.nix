{
    config,
    pkgs,
    ...
}: 
{
    environment.systemPackages = [
        pkgs.postgresql_16
    ];
}