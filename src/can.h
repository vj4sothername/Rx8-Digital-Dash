#ifndef CAN_H
#define CAN_H

#include <QObject>
#include <QCanBusDevice>
#include <QQueue>
#include <QList>
#define Wheel_SPEED 0x4b0
#define THROTTLE 0x201
#define Steering_Wheel_Angle 0x4DA
#define TEMP 0x420

class QCanBusFrame;


class Can : public QObject
{
    Q_OBJECT

   // Q_PROPERTY(int someVar READ someVar WRITE setSomeVar  NOTIFY someVarChanged )
   // Q_PROPERTY(int someVar READ someVar WRITE setSomeVar  NOTIFY someVarChanged )
   //Q_PROPERTY(int canframesReceived READ canframesReceived WRITE setFrameReceived  NOTIFY setFrameReceivedchange )
//setFrontLeft  NOTIFY

    Q_PROPERTY(int canFrontLeft READ canFrontLeft WRITE setFrontLeft  NOTIFY  setWheelchange)
    Q_PROPERTY(int canFrontRight READ canFrontRight WRITE setFrontRight  NOTIFY setWheelchange)
    Q_PROPERTY(int canRearLeft READ canRearLeft WRITE setRearLeft  NOTIFY setWheelchange)
    Q_PROPERTY(int canRearRight READ canRearRight WRITE setRearRight  NOTIFY setWheelchange)

    Q_PROPERTY(int canRpm READ canRpm WRITE setRpm  NOTIFY setRPMchangd)
    Q_PROPERTY(int canSpeed READ canSpeed WRITE setSpeed  NOTIFY setRPMchangd)
    Q_PROPERTY(int canTHROTTTLEP READ canTHROTTTLEP WRITE setTHROTTLEP  NOTIFY setRPMchangd)

    Q_PROPERTY(int canTemp READ canTemp WRITE setTemp  NOTIFY setTempchangd)

public:
    explicit Can(QObject *parent = nullptr);
    //filter functions
    void filterListfunction();
    //Q_INVOKABLE void setSomeVar();
    //Q_INVOKABLE void decodeFrame();
    ////signal stufff
   int someVar();
   int canframesReceived();
   int canFrontLeft();
   int canFrontRight();
    int canRearLeft();
    int canRearRight();
    int canRpm();
     int canSpeed();
     int canTHROTTTLEP();
     int canTemp();
//other



signals:
    void someVarChanged();
    void setFrameReceivedchange();
    void setWheelchange();
    void setRPMchangd();
    void setTempchangd();

  public slots:
     void setSomeVar(int);
     void setFrameReceived(int);
     void setFrontLeft(int);
     void setFrontRight(int);
     void setRearLeft(int);
     void setRearRight(int);
     void setRpm(int);
     void setSpeed(int);
     void setTHROTTLEP(int);
     void setTemp(int);
    //void decodeFrame();

//private slots:
            void checkFrames();


private:
// functions for access
        void connectDevice();
        void decodeFrame();


// canbus stufff
        std::unique_ptr<QCanBusDevice> device;
        const QCanBusFrame frame;
       // QQueue<QCanBusFrame> messageQueue;
        QList<QCanBusDevice::Filter> filterList;
        QCanBusDevice::Filter filter;
// varibles
        int m_someVar;
        int m_numberFramesReceived;
        bool ok;





///4B0
/// left front
        uint lf1;
        uint lf2;
        float lfa1 ;
        float lfa2;
        int leftFrontVal;
/// right front
        uint rf1;
        uint rf2;
        float rfa1 ;
        float rfa2;
        int rightFrontVal;
/// left rear
        uint lr1;
        uint lr2;
        float lra1 ;
        float lra2;
        int leftRearVal;
/// left front
        uint rr1;
        uint rr2;
        float rra1 ;
        float rra2;
        int rightRearVal;

//0x201;

        ///throttlle post
            uint tp1;
            float tpa1;
            int THRTP;
        //RRPM
            uint rpm1;
            uint rpm2;
            float m1;
            float m2;
             int rpm;

        //Speed
            uint sp1;
            uint sp2;
            float a1;
            float a2;
             int Speed;
 //0x433
             uint temp1;
             float tempa1;
             int temp;

};

#endif // CAN_H
