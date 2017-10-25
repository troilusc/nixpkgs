{ fetchPypi, buildPythonPackage, lib
, requests, beautifulsoup4, six }:


buildPythonPackage rec {
  name = "${pname}-${version}";
  pname = "MechanicalSoup";
  version = "0.8.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "38a6ca35428196be94f87f8f036ee4a88b1418d1f77e5634ad92acfaa22c28da";
  };

  propagatedBuildInputs = [ requests beautifulsoup4 six ];

  meta = with lib; {
    description = "A Python library for automating interaction with websites";
    homepage = https://github.com/hickford/MechanicalSoup;
    license = licenses.mit;
    maintainers = [ maintainers.jgillich ];
  };
}
