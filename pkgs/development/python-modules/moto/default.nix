{ stdenv, buildPythonPackage, fetchPypi, jinja2, werkzeug, flask, requests, pytz
, six, boto, httpretty, xmltodict, nose, sure, boto3, freezegun, dateutil }:

buildPythonPackage rec {
  pname = "moto";
  version = "1.1.24";
  name    = "moto-${version}";
  src = fetchPypi {
    inherit pname version;
    sha256 = "5423f8dccab04f153c965427ce042481b9a3c15b8566b1065cb08073ae1a2fc9";
  };

  propagatedBuildInputs = [
    boto
    dateutil
    flask
    httpretty
    jinja2
    pytz
    werkzeug
    requests
    six
    xmltodict
  ];

  checkInputs = [ boto3 nose sure freezegun ];

  checkPhase = "nosetests";

  # TODO: make this true; I think lots of the tests want network access but we can probably run the others
  doCheck = false;
}
