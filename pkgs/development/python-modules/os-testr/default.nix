{ stdenv, buildPythonPackage, fetchurl, python,
  pbr, Babel, testrepository, subunit, testtools,
  coverage, oslosphinx, oslotest, testscenarios, six, ddt 
}:
buildPythonPackage rec {
  version = "1.0.0";
  pname = "os-testr";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "mirror://pypi/o/os-testr/${name}.tar.gz";
    sha256 = "387950e4627aa92c747414ac4a12b5c1127e1e25e405995a90236b1c5b8d7150";
  };

  patchPhase = ''
    sed -i 's@python@${python.interpreter}@' .testr.conf
    sed -i 's@python@${python.interpreter}@' os_testr/tests/files/testr-conf
  '';

  checkPhase = ''
    export PATH=$PATH:$out/bin
    ${python.interpreter} setup.py test
  '';

  propagatedBuildInputs = [ pbr Babel testrepository subunit testtools ];
  buildInputs = [ coverage oslosphinx oslotest testscenarios six ddt ];

  meta = with stdenv.lib; {
    description = "A testr wrapper to provide functionality for OpenStack projects";
    homepage  = http://docs.openstack.org/developer/os-testr/;
    license = licenses.asl20;
  };
}
