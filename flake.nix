{

  inputs = {
    miso.url = "github:dmjio/miso";
  };

  outputs = inputs: 
    inputs.miso.inputs.flake-utils.lib.eachDefaultSystem (system: {
      devShells.wasm = inputs.miso.outputs.devShells.${system}.wasm;
      devShells.ghcjs = inputs.miso.outputs.devShells.${system}.ghcjs;
      devShells.default = inputs.miso.outputs.devShells.${system}.default;
    });

}

