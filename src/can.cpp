#include "can.h"
#include  <QDebug>
#include <QtSerialBus>
#include <iostream>
#include <QString>
#include <QThread>
#include <QTimer>
#include <QCanBus>
#include <QCanBusFrame>
#include <QQueue>

Can::Can(QObject *parent)
    : QObject(parent)
    ,m_someVar(0)
    ,m_numberFramesReceived(0)
    ,leftFrontVal(0)
    ,rightFrontVal(0)
    ,leftRearVal(0)
    ,rightRearVal(0)

{
    filterListfunction();
    connectDevice();

}


//Can::~Can()
//{
   // device->disconnectDevice();
//}

void Can::connectDevice()
{
    QString errorString;
     device.reset(QCanBus::instance()->createDevice("socketcan",
                                                    "vcan0",
                                                    &errorString));
     if (!device->connectDevice()) {
                                    device.reset();
                                    }

     if (filterList.size()) {
         device->setConfigurationParameter(QCanBusDevice::RawFilterKey, QVariant::fromValue(filterList));
     }
    connect(device.get(), &QCanBusDevice::framesReceived,
            this, &Can::checkFrames);
}


void Can::checkFrames()
{
    while (device->framesAvailable()) {
 //       const QCanBusFrame frame = device->readFrame();
//        messageQueue.enqueue(frame);
   //     qDebug()  << "avail?";
       decodeFrame();
    }
}


//// value setting  functions
int Can::someVar(){return m_someVar;}
int Can::canframesReceived(){
                    return m_numberFramesReceived;
                 }

int Can::canFrontLeft(){return leftFrontVal;}
int Can::canFrontRight(){return rightFrontVal;}
int Can::canRearLeft(){return leftRearVal;}
int Can::canRearRight(){return rightRearVal;}

int Can::canRpm(){return rpm;}
int Can::canSpeed(){return Speed;}
int Can::canTHROTTTLEP(){return THRTP;}

int Can::canTemp(){return  temp;}

///signal functions
void Can::setSomeVar(int newVar){
//    m_someVar++;
//    emit someVarChanged();
}

void Can::setFrameReceived(int newVar){
//m_numberFramesReceived++;
//  emit setFrameReceivedchange();
    }
void Can::setFrontLeft(int newVar){}
void Can::setFrontRight(int newVar){}
void Can::setRearLeft(int newVar){}
void Can::setRearRight(int newVar){}

void Can::setRpm(int newVar){}
void Can::setSpeed(int newVar){}
void Can::setTHROTTLEP(int newVar){}

void Can::setTemp(int newVar){}
// decode ffunctios

void Can::decodeFrame () {
const QCanBusFrame frame = device->readFrame();
    QByteArray payload = frame.payload().toHex(' ').toUpper();
  //  qDebug() << payload;
       switch(frame.frameId()){
            case Wheel_SPEED:{

                //           Left Front
                            lf1 = payload.mid(0,2).toUInt(&ok,16);
                            lf2 = payload.mid(3,2).toUInt(&ok,16);
                            lfa1 = static_cast< float >(lf1);
                            lfa2 = static_cast< float >(lf2);
                            //leftFrontVal = QString::number((((((lfa1*256)+lfa2)-10000)/100)/1.609),'g',0);
                            leftFrontVal = static_cast< int >(((((lfa1*256)+lfa2)-10000)/100)/1.609);

                        //        Right Front
                            rf1 = payload.mid(6,2).toUInt(&ok,16);
                            rf2 = payload.mid(9,2).toUInt(&ok,16);
                            rfa1 = static_cast< float >(rf1);
                            rfa2 = static_cast< float >(rf2);
                            rightFrontVal = static_cast< int >(((((rfa1*256)+rfa2)-10000)/100)/1.609);
                        //qDebug()<< "Right Front" << rf << "MPH";


                        //        left rear
                            lr1 = payload.mid(12,2).toUInt(&ok,16);
                            lr2 = payload.mid(15,2).toUInt(&ok,16);
                            lra1 = static_cast< float >(lr1);
                            lra2 = static_cast< float >(lr2);
                            leftRearVal  = static_cast< int >(((((lra1*256)+lra2)-10000)/100)/1.609);
                        //qDebug()<< "Left Rear" << lr << "MPH";

                        //        right rear
                            rr1 = payload.mid(18,2).toUInt(&ok,16);
                            rr2 = payload.mid(21,2).toUInt(&ok,16);
                            rra1 = static_cast< float >(rr1);
                            rra2 = static_cast< float >(rr2);
                            rightRearVal  = static_cast< int >(((((rra1*256)+rra2)-10000)/100)/1.609);

emit setWheelchange();}
                   case THROTTLE:{
           //      RPM byts 1 & 2
                    rpm1 = payload.mid(0,2).toUInt(&ok,16);
                    rpm2 = payload.mid(3,2).toUInt(&ok,16);
                    m1 = static_cast< float >(lf1);
                    m2 = static_cast< float >(lf2);
                    rpm  = static_cast< int >((((m1*256)+m2)/3.85));
//                    rpm  = static_cast< int >(((m1*256)+m2));
//qDebug() <<payload.mid(0,2);
//qDebug() <<payload.mid(3,2);
//qDebug() << payload;



                  // MPH
                      sp1 = payload.mid(12,2).toUInt(&ok,16);
                     sp2 = payload.mid(15,2).toUInt(&ok,16);
                      a1  = static_cast< float >(lr1);
                      a2 = static_cast< float >(lr2);
                      Speed = static_cast< int >((((((a1*256)+a2)-10000)/100)/1.609));
            //qDebug() << lr << "MPH"<< lf << "RPM";
  //    qDebug() <<payload.mid(12,2);
//      qDebug() <<payload.mid(15,2);
//      qDebug() << payload;

                     // Thhrottle posiition  byte 6 max 200
                     tp1 = payload.mid(18,2).toUInt(&ok,16);
                     tpa1  = static_cast< float >(tp1);
                     THRTP = static_cast< int >((tpa1/2));

emit setRPMchangd();
                   }
       case TEMP:{

         temp1 = payload.mid(0,2).toUInt(&ok,16);
         tempa1  = static_cast< float >(temp1);
         temp = static_cast< int >((tempa1)/4);

emit setTempchangd();
       }
}}


void Can::filterListfunction(){



    filter.frameId = 0x4B0;
    filterList.append(filter);
    filter.frameId = 0x201;
    filterList.append(filter);
    filter.frameId = 0x4DA;
    filterList.append(filter);
    filter.frameId = 0x240;
    filterList.append(filter);

}
