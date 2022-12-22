let
  pkgs = (import <nixpkgs> {});
  riscv32-embedded = (import <nixpkgs> {
    crossSystem = {
      config = "riscv32-none-elf";
      gcc.arch = "rv32i";
      libc = "newlib";

    };
  });
in
riscv32-embedded.stdenv.mkDerivation {
  name = "riscv32-embedded-dev";
  nativeBuildInputs = [
    pkgs.clang_12
    pkgs.automake
    pkgs.autoconf
    pkgs.m4
    pkgs.libtool
    pkgs.rustup
    pkgs.pkg-config
    pkgs.gdb
    pkgs.xz
    pkgs.openssl
  ];
  buildInputs = [
    # your dependencies here
  ];
  LIBCLANG_PATH = "${pkgs.llvmPackages_12.libclang.lib}/lib";
  #CLANG_PATH="${riscv32-embedded.stdenv.cc}/bin/${riscv32-embedded.stdenv.cc.targetPrefix}clang";
  CC_riscv32_none_elf =
    "${riscv32-embedded.stdenv.cc}/bin/${riscv32-embedded.stdenv.cc.targetPrefix}gcc";
  CXX_riscv32_none_elf =
    "${riscv32-embedded.stdenv.cc}/bin/${riscv32-embedded.stdenv.cc.targetPrefix}g++";
  CC_x86_64_unknown_linux_gnu = "${pkgs.stdenv.cc}/bin/gcc";
  CXX_x86_64_unknown_linux_gnu = "${pkgs.stdenv.cc}/bin/g++";
}
