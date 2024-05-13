{
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  scipy,
  pandas,
  scikit-learn,
  anndata,
  h5py,
  poetry-core
}:

buildPythonPackage rec {
  pname = "mofapy2";
  version = "1581c5c";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "bioFAM";
    repo = pname;
    rev = version;
    sha256 = "sha256-oKrFUceqpi4XV9o5QIChaLNejy0tV4ME9jDLZya2ECo=";
  };

  propagatedBuildInputs = [
    numpy
    scipy
    pandas
    scikit-learn
    anndata
    h5py
  ];

  nativeBuildInputs = [
    poetry-core
  ];
}
