/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick3D 6.3
import Cardash
import QtQuick3D.Effects 6.0
import QtQuick3D.Particles3D 6.3
import Quick3DAssets.Mazda_RX8 1.0
import QtQuick.Studio.Components 1.0
import Quick3DAssets.Badge 1.0
import QtQuick.Timeline 1.0
import QtQuick.Studio.Effects 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: 1080

    color: Constants.backgroundColor


    View3D {
        id: view3D
        anchors.fill: parent
        camera: sceneCamera

        environment: sceneEnvironment




        Node {
            id: scene

            SceneEnvironment {
                id: sceneEnvironment
                backgroundMode: SceneEnvironment.Color
                clearColor: "#000000"
                antialiasingMode: SceneEnvironment.MSAA
                antialiasingQuality: SceneEnvironment.High
            }

            Badge {
                id: badge
                x: -0
                y: 0
                visible: true
                scale.z: 8
                eulerRotation.z: -22.82919
                eulerRotation.y: -155.05122
                eulerRotation.x: -87.13004
                scale.y: 8
                scale.x: 8
                z: 709.33679
            }


        }


        Mazda_RX8 {
            id: mazda_RX8
            eulerRotation.z: 0
            eulerRotation.y: 180
            eulerRotation.x: 0

            ParticleSystem3D {
                id: exhaust
                x: 63.519
                y: 35.58
                eulerRotation.z: 0.00001
                eulerRotation.y: 90
                eulerRotation.x: 0.00001
                z: -202.56
                ParticleEmitter3D {
                    id: exhaustEmitter
                    lifeSpan: 300
                    particle: exhaustParticle
                    SpriteParticle3D {
                        id: exhaustParticle
                        color: "#fdfeff"
                        maxAmount: 100
                        fadeInDuration: 150
                        Texture {
                            id: exhaustTexture
                            source: "smoke2.png"
                        }

                        SpriteSequence3D {
                            id: exhaustSequence
                            frameCount: 15
                            duration: 2000
                        }

                        Wander3D {
                            id: exhaustWander
                            uniqueAmount.y: 60
                            uniqueAmountVariation: 0.3
                            uniqueAmount.x: 30
                            fadeInDuration: 500
                            globalPace.y: 0.3
                            particles: exhaustParticle
                            uniquePace.z: 0.25
                            uniqueAmount.z: 50
                            globalAmount.y: 50
                            system: exhaust
                            uniquePace.x: 0.1
                            uniquePaceVariation: 0.3
                            uniquePace.y: 0.3
                        }

                        VectorDirection3D {
                            id: exhaustDirection
                            directionVariation.z: 20
                            directionVariation.x: 5
                            direction.x: 750
                            direction.y: 0
                            directionVariation.y: 10
                        }
                        blendMode: SpriteParticle3D.SourceOver
                        sprite: exhaustTexture
                        fadeInEffect: Particle3D.FadeScale
                        sortMode: Particle3D.SortNewest
                        spriteSequence: exhaustSequence
                        fadeOutDuration: 150
                        particleScale: 12
                        billboard: true
                    }
                    lifeSpanVariation: 100
                    emitRate: 35
                    particleScaleVariation: 3
                    particleScale: 8
                    depthBias: -20
                    velocity: exhaustDirection
                }
            }

            ParticleSystem3D {
                id: exhaust1
                x: -62.809
                y: 35.584
                eulerRotation.x: 0
                eulerRotation.y: 90
                z: -202.56276
                ParticleEmitter3D {
                    id: exhaustEmitter1
                    velocity: exhaustDirection1
                    particleScale: 8
                    particle: exhaustParticle1
                    lifeSpanVariation: 100
                    particleScaleVariation: 3
                    emitRate: 35
                    lifeSpan: 300
                    SpriteParticle3D {
                        id: exhaustParticle1
                        color: "#fdfeff"
                        blendMode: SpriteParticle3D.SourceOver
                        particleScale: 12
                        billboard: true
                        sortMode: Particle3D.SortNewest
                        maxAmount: 100
                        fadeInDuration: 150
                        fadeOutDuration: 150
                        sprite: exhaustTexture1
                        spriteSequence: exhaustSequence1
                        fadeInEffect: Particle3D.FadeScale
                        Texture {
                            id: exhaustTexture1
                            source: "smoke2.png"
                        }

                        SpriteSequence3D {
                            id: exhaustSequence1
                            frameCount: 15
                            duration: 2000
                        }

                        Wander3D {
                            id: exhaustWander1
                            particles: exhaustParticle1
                            uniqueAmount.x: 30
                            globalPace.y: 0.3
                            uniqueAmount.z: 50
                            uniquePace.y: 0.3
                            uniquePace.x: 0.1
                            uniquePaceVariation: 0.3
                            uniquePace.z: 0.25
                            fadeInDuration: 500
                            uniqueAmountVariation: 0.3
                            uniqueAmount.y: 60
                            system: exhaust1
                            globalAmount.y: 50
                        }

                        VectorDirection3D {
                            id: exhaustDirection1
                            directionVariation.x: 5
                            direction.y: 0
                            directionVariation.y: 10
                            direction.x: 750
                            directionVariation.z: 20
                        }
                    }
                    depthBias: -20
                }
            }

            SpotLight {
                id: lightSpot1
                x: 74.01
                y: 67.23
                brightness: 852.19
                quadraticFade: 0.11386
                innerConeAngle: 6
                coneAngle: 15
                eulerRotation.z: -0
                eulerRotation.y: 180
                eulerRotation.x: -12.99768
                z: 185.57999
            }

            SpotLight {
                id: lightSpot
                x: -68.571
                y: 67.228
                innerConeAngle: 6
                coneAngle: 15
                quadraticFade: 0.11
                eulerRotation.z: -0
                eulerRotation.y: -180
                eulerRotation.x: -13
                z: 185.57915
            }

            PerspectiveCamera {
                id: sceneCamera
                x: 0
                y: 300
                fieldOfViewOrientation: PerspectiveCamera.Horizontal
                clipNear: 1
                clipFar: 10000
                fieldOfView: 35
                pivot.z: 0
                pivot.x: 0
                pivot.y: 0
                eulerRotation.x: -21.54296
                eulerRotation.z: -0
                eulerRotation.y: 0
                z: 670

                DirectionalLight {
                    id: directionalLight
                    x: -0
                    y: 0
                    z: 542.61487
                }
            }
        }






        ArcItem {
            id: arc
            x: 0
            y: 0
            width: 1080
            height: 1080
            antialiasing: true
            begin: 40
            strokeWidth: 50
            fillColor: "#00000000"

            ArcItem {
                id: arc1
                x: 0
                y: 0
                width: 1080
                height: 1080
                antialiasing: true
                dashPattern: [0.02,1.5,0.02,1.7999999999999998]
                capStyle: 16
                dashOffset: 0
                strokeStyle: 2
                end: 40
                strokeWidth: 50
                begin: -140
                strokeColor: "#ffffff"
                fillColor: "#00000000"
            }

        }

    }

    PerspectiveCamera {
        id: cameraPerspective
        z: 500
    }

    Model {
        id: cone
        source: "#Cone"
        materials: defaultMaterial
    }

    Item {
        id: __materialLibrary__
        DefaultMaterial {
            id: defaultMaterial
            objectName: "Default Material"
            diffuseColor: "#4aee45"
        }
    }


    EllipseItem {
        id: ellipse
        x: 0
        y: 0
        width: 1080
        height: 1080
        opacity: 0.1
    }

    Timeline {
        id: bootTimeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                onFinished: rectangle.state = "Running"
                easing.bezierCurve: [0.6,0.04,0.98,0.335,1,1]
                duration: 5000
                running: false
                loops: 1
                to: 5000
                from: 0
            }
        ]
        endFrame: 5000
        startFrame: 0
        enabled: false

        KeyframeGroup {
            target: badge
            property: "visible"
            Keyframe {
                frame: 0
                value: false
            }

            Keyframe {
                frame: 500
                value: true
            }
        }

        KeyframeGroup {
            target: arc
            property: "visible"
            Keyframe {
                frame: 0
                value: false
            }

            Keyframe {
                frame: 750
                value: false
            }

            Keyframe {
                frame: 1000
                value: true
            }
        }

        KeyframeGroup {
            target: sceneCamera
            property: "fieldOfView"
            Keyframe {
                frame: 0
                value: 30
            }

            Keyframe {
                frame: 750
                value: 120
            }

            Keyframe {
                frame: 500
                value: 30
            }

            Keyframe {
                frame: 50
                value: 60
            }

            Keyframe {
                frame: 250
                value: 40
            }

            Keyframe {
                frame: 450
                value: 60
            }

            Keyframe {
                frame: 100
                value: 70
            }

            Keyframe {
                frame: 400
                value: 70
            }
        }

        KeyframeGroup {
            target: sceneCamera
            property: "x"
            Keyframe {
                frame: 0
                value: 0.00001
            }

            Keyframe {
                frame: 250
                value: 900
            }

            Keyframe {
                frame: 500
                value: 0
            }

            Keyframe {
                frame: 1000
                value: -0.00007
            }
        }

        KeyframeGroup {
            target: sceneCamera
            property: "y"
            Keyframe {
                frame: 0
                value: 300
            }

            Keyframe {
                frame: 1000
                value: -9.62677
            }

            Keyframe {
                frame: 500
                value: 230.57248
            }

            Keyframe {
                frame: 750
                value: 0
            }
        }

        KeyframeGroup {
            target: sceneCamera
            property: "z"
            Keyframe {
                frame: 0
                value: 670
            }

            Keyframe {
                frame: 499
                value: -670
            }
        }

        KeyframeGroup {
            target: sceneCamera
            property: "eulerRotation.x"
            Keyframe {
                frame: 0
                value: -21.54296
            }

            Keyframe {
                frame: 250
                value: -16.06573
            }

            Keyframe {
                frame: 500
                value: -20
            }

            Keyframe {
                frame: 750
                value: -90
            }
        }

        KeyframeGroup {
            target: sceneCamera
            property: "eulerRotation.y"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 500
                value: 180
            }

            Keyframe {
                frame: 250
                value: 90.17458
            }
        }

        KeyframeGroup {
            target: sceneCamera
            property: "eulerRotation.z"
            Keyframe {
                frame: 0
                value: -0
            }

            Keyframe {
                frame: 250
                value: 0.01791
            }

            Keyframe {
                frame: 750
                value: 0.01783
            }
        }

        KeyframeGroup {
            target: badge
            property: "eulerRotation.z"
            Keyframe {
                frame: 500
                value: 0
            }
        }

        KeyframeGroup {
            target: badge
            property: "x"
            Keyframe {
                frame: 495
                value: 0
            }
        }

        KeyframeGroup {
            target: badge
            property: "y"
            Keyframe {
                frame: 750
                value: -250
            }

            Keyframe {
                frame: 500
                value: -250
            }

            Keyframe {
                frame: 1000
                value: 0
            }
        }

        KeyframeGroup {
            target: badge
            property: "z"
            Keyframe {
                frame: 750
                value: 709.31134
            }
        }
    }


    states: [
        State {
            name: "bootState"
            when: values.booting

            PropertyChanges {
                target: bootTimeline
                enabled: true
            }

            PropertyChanges {
                target: timelineAnimation
                pingPong: true
                paused: true
                duration: 5000
                running: true
            }

            PropertyChanges {
                target: badge
                x: 2.518
                y: -250
                visible: false
                eulerRotation.z: 0
                eulerRotation.y: 0
                eulerRotation.x: -90
            }

            PropertyChanges {
                target: arc1
                visible: true
                antialiasing: true
            }

            PropertyChanges {
                target: sceneCamera
                x: 0.028
                y: 0
                z: -638.92212
                fieldOfView: 120
            }
        },
        State {
            name: "stock"
            when: !dashApp.main.values.booting

            PropertyChanges {
                target: badge
                visible: false
                state: "Running"
            }

            PropertyChanges {
                target: rectangle
                visible: true
            }

            PropertyChanges {
                target: mazda_RX8
                visible: false
            }

            PropertyChanges {
                target: exhaust
                visible: false
            }

            PropertyChanges {
                target: exhaust1
                visible: false
            }

            PropertyChanges {
                target: lightSpot1
                visible: false
            }

            PropertyChanges {
                target: lightSpot
                visible: false
            }

            PropertyChanges {
                target: cone
                x: 0
                y: 84.4
                z: 0
            }

            PropertyChanges {
                target: cameraPerspective
                x: 0
                y: -0
                z: 103.58997
            }

            PropertyChanges {
                target: sceneCamera
                visible: false
            }
        }
    ]



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.25}D{i:3;invisible:true}D{i:8;invisible:true}D{i:23;locked:true}
}
##^##*/
