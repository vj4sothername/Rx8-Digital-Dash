import QtQuick
import QtQuick3D

Node {
    // Materials
    DefaultMaterial {
        id: defaultMaterial_material
        diffuseColor: "#ff999999"
    }
    DefaultMaterial {
        id: body_material
        diffuseColor: "#ffe70000"
    }
    DefaultMaterial {
        id: plastic_material
        diffuseColor: "#ff121212"
    }
    DefaultMaterial {
        id: glass_material
        diffuseColor: "#ff000000"
        opacity: 0.8
    }
    DefaultMaterial {
        id: plastic_matt_material
        diffuseColor: "#ff121212"
    }
    DefaultMaterial {
        id: metal_material
        diffuseColor: "#fff3f3f3"
    }
    DefaultMaterial {
        id: node12___Default_material
        diffuseMap: Texture {
            source: "maps/numberplate_diff.tga"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        bumpMap: Texture {
            source: "maps/Map__58_Normal Bump.jpg"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }    }
    DefaultMaterial {
        id: rubber_material
        diffuseColor: "#ff969696"
    }
    DefaultMaterial {
        id: chrome_material
    }
    DefaultMaterial {
        id: glass_yellow_material
        diffuseColor: "#ffffe432"
        opacity: 0.5
    }
    DefaultMaterial {
        id: glass_white_material
        opacity: 0.5
    }
    DefaultMaterial {
        id: glass_red_material
        diffuseColor: "#ffe10000"
        opacity: 0.5
    }
    DefaultMaterial {
        id: glass_clear_material
        diffuseColor: "#ff000000"
        opacity: 0.16
    }
    DefaultMaterial {
        id: chrome_lamps_material
    }
    DefaultMaterial {
        id: shadow_material
        diffuseMap: Texture {
            source: "maps/shadow.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }
        opacityMap: Texture {
            source: "maps/shadow_opac.png"
            generateMipmaps: true
            mipFilter: Texture.Linear
        }    }
    // end of Materials

    Node {
        id: mazda_RX8_obj
        Model {
            id: body
            source: "meshes/body.mesh"
            materials: [
                body_material
            ]
        }
        Model {
            id: plastic
            source: "meshes/plastic.mesh"
            materials: [
                plastic_material
            ]
        }
        Model {
            id: glass
            source: "meshes/glass.mesh"
            materials: [
                glass_material
            ]
        }
        Model {
            id: plastic_matt
            source: "meshes/plastic_matt.mesh"
            materials: [
                plastic_matt_material
            ]
        }
        Model {
            id: metal
            source: "meshes/metal.mesh"
            materials: [
                metal_material
            ]
        }
        Model {
            id: numberplate
            source: "meshes/numberplate.mesh"
            materials: [
                node12___Default_material
            ]
        }
        Model {
            id: rubber
            source: "meshes/rubber.mesh"
            materials: [
                rubber_material
            ]
        }
        Model {
            id: chrome
            source: "meshes/chrome.mesh"
            materials: [
                chrome_material
            ]
        }
        Model {
            id: glass_yellow
            source: "meshes/glass_yellow.mesh"
            materials: [
                glass_yellow_material
            ]
        }
        Model {
            id: glass_white
            source: "meshes/glass_white.mesh"
            materials: [
                glass_white_material
            ]
        }
        Model {
            id: glass_red
            source: "meshes/glass_red.mesh"
            materials: [
                glass_red_material
            ]
        }
        Model {
            id: glass_clear
            source: "meshes/glass_clear.mesh"
            materials: [
                glass_clear_material
            ]
        }
        Model {
            id: chrome_lamps
            source: "meshes/chrome_lamps.mesh"
            materials: [
                chrome_lamps_material
            ]
        }
        Model {
            id: plane001
            source: "meshes/plane001.mesh"
            materials: [
                shadow_material
            ]
        }
    }
}
