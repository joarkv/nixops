{ config, lib, pkgs, ... }:

{
 users.mutableUsers = false;
 security.sudo.wheelNeedsPassword = false;

 users.users = {

   root = {
     hashedPassword = "$6$VwQ3hjMNBymCRJX$5BIuoBDTjlPJDpLhRNIzPWO9cyxn6oDoYymSfOj35wHSeNyPtz./588npUQbs4VREj/piwmarjezSFrHXwkrL1";
   };
   sgo = {
     isNormalUser = true;
     createHome = true;
     uid = 2000;
     extraGroups = ["wheel"];
     #shell = pkgs.fish;
     openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD6BojjhmHz4lY6P+tgviFzHQQhbxVFKXt4L0cxDMGT/2vW7wHVGBZMPNtsYvSNlRza7kzu/EKBaysBIbBBbgW9U/AnDR6SdU3XNlrkkWT1RZ/kj2iJsKGgYOEPFCVRkw/P0dVY20hjA4U/zwB39q1CD1Wz733dprdTanKapfzE6SApYemeaKY6AwDDir7TC3y8OQL/Si2R+jMixcJOLsLLkHI92iMM7eP5whCwOV8i0ZFdtZiBqdMxyG4S+DBE5RYvk3hCjf3rYjNcU3pSma7awRPv357gS5iljqLMJydteVareJHEjGmVOaERQ3/Jw5yxnBzp/o0DnL06UC/YTX7mXOwA0ZFqopTIySHbH2n7uNpvbUB+0XAi9Nk6adrfbSjvthcvca8a3Gzu+ZmEucnCJubjHlX7RZ+xzW93DmfLZooucikDxpDU9QFFNOnqldI+CFe68wnsAh0vwq8oC67Iofqj4UsC5CAFxeqtQwTTYPNnH7y5PL5qsvrpV3IhBR1FJG/woJENmQeMZAuQHFREKvv/RebfFioYeM1ItjK3NkU83NRBDuZtwFfvI74cu2MiX8M9+Uqv9IjlSRcuEwHZT044t7aWcxgdL159bk9Mi/OeIViklok3xNJo7ESSZ/W7vtVh2tf3cMnZndMizm54ZeFjN6+j/HjYbu85NXVaYw== stig+b@stig.io"
  "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCuOj3f2CIbZO+1yL3H+C6ZJYlKUF3F5ok6i6sEnYdv99WZR7Q4Ip/9x7XT2IpqsA8ayaDeEZEeuN6U/A5cIkJJ8YNrej+pvLV7AMxaRDe0FVdZBYfoRzyRXlqe3vJl6wiVYp1owAnIMUz+df/Qt8/IjenZAmY7ga30GJfmSDULAkfeyMP40dFl/wVQJobOmiyooRxMGDECt+xKZ8cOGTxvaqkEgUtY+pWpRO7cCZBygdnnMU+DNqFNF3PedRBhRMd+DOyXh0OBLmrO6m1sFAjrBqEFeWv/JMlRCimxe3JMkgDU4uqlSdXmPx+wCqFQEATYn+wMzy+7TwRP7PNNDGZiKoH12j+WjkqndDiP5xjNDdz6ompqRZ0D/SInag03lwzFGx+XMTWDwhcwOuR8XeByVPXhXIgDXbf7OMIsUwjFnoKrovvjUXFktWGFOzvakFFKGJsuYdCxMphlXiIIxzFalZ4WyG0Ci8Xj/2tcS1PMcQWWInzrZJNDe5SK/i7ao4TuLSLTg+4OIT+USl6SaEO/sPYRIro7Jd4p+lKEITD5KFLiKMTzsUeeq7CHd7t5BeauMfsShf8J3Y55qLXAWzvgyNefZwz9mRa+yz34D54+MNTgTUZa2Mb2Xx0mYTlGu/cPVnASeMRf0hXd/rentmEtG0XTzpbBZrB4u3JryUdmKQ== stig+x@stig.io"];
    
   };

   heplaphon = {
     isNormalUser = true;
     createHome = true;
     uid = 2001;
     extraGroups = ["wheel"];
     openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/073c4DBiGno3sKi/OIxRWWydUNRWEfqq/EMt2TCALqfgL7ZfJ5LizyG9bH0+dkvSstbiy+GTCLlMYhLV7rF+k4QjrtLILdF7Iy/IsljwfEypfxiUFrq5TIt2jlxfguuxPQsvEqlnXhNkeRu4/XBKMRFUfzf+RQl+4WB/KwYlz5yp+heMNP6QtYB0E6abx9WIfQXUm+NSWUQuP9fofFZqJ/4I43MzPiUsWNYYsgvRcwWtIsXcdMbxF6QcQRqIq/jYEQC4NpUssX1db1btmr4QgUGK9qMrwk6/5wxidEWqQ8U4gEjVQMS7Pnz/FLF6ThBcnv/bKFclveOdLeJYHuYDn1o4so/L/YygSVhhT8CYHDqOc8TeCZZ9YHEBn9QdTxpX3qVmKgA+QFb0LKA1PXzKIVr5uYzD6H2730lGr7TGcMLRAwqACH28DQzazTsXwLV1I9k3bP74QPqSRiHx2szltnWFjwox+PsCbcH4UsEfpVHhH9GBSMnQ/a3kILvlq8bcsWweB0jdD5sh4VCcQfE/ULZu/HjbN42b/AYdYPGuNTpOwrS1/HhrZlLa000ed18D4EvPgV9oKI2vu7LXEjlWAoU4AqZpfsCfS6piJRA9VuYIWOKlmTQluRsvc2BTjcAXogNNgg490qslRazR/a5KsKwj1HpuWwMxheCd3Sz+dw== hepalphon@gmail.com"];
   };
 };
}
