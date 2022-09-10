import QtQuick
import QtQuick3D
import Quick3DAssets.Badge 1.0

Node {
    // Materials
    // end of Materials

    Node {
        id: _STL_BINARY_
        Model {
            source: "meshes/node.mesh"
            materials: [
                defaultMaterial_material
            ]
        }
    }

    Node {
        id: __materialLibrary__
        DefaultMaterial {
            id: defaultMaterial_material
            objectName: "defaultMaterial_material"
        }
    }
}
