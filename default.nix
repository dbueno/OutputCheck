{ lib, buildPythonPackage, fetchFromGitHub }:

buildPythonPackage rec {
  pname = "OutputCheck";
  version = "0.4.2";

  src = fetchFromGitHub {
    owner = "stp";
    repo = "OutputCheck";
    rev = "${version}";
    sha256 = "1y27vz6jq6sywas07kz3v01sqjd0sga9yv9w2cksqac3v7wmf2a0";
  };

  preConfigure = ''
    substituteInPlace setup.py --replace 'version.get_git_version()' '"${version}"'
  '';

  meta = with lib; {
    description = "A tool for checking the output of console programs inspired by LLVM's FileCheck";
    homepage = "https://github.com/stp/OutputCheck";
    license = licenses.bsd3;
    maintainers = with maintainers; [ "bueno" ];
  };
}

