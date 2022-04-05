Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED54F382D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:31:00 +0200 (CEST)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkCx-0001ZU-E6
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1nbkBV-0000ou-H1
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:29:29 -0400
Received: from mout.gmx.net ([212.227.17.20]:43875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1nbkBS-0002Hb-Lm
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1649168960;
 bh=6PRXonlX87DfoKp5MxKrYnJIC/CwPNAPBI62BOKiq2Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=PrKL+GRLmm7V2DNhTL/gW7Z7COCVlWctda+a+kszGEfSekQHTLfQEz1oxEjRn8Vo0
 25/TH0kWdlsRdGsZUJIZ7yCowLCaQcThHZ/zIB/6Efm5pGKBeVgEviMx5vFKFpMrpH
 qH4Byheuqelc/Wnz2nkhQ4WXa/y6NCZlc+Fq1wkQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from srq-net-003.hsd1.fl.comcast.net ([174.58.8.52]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MowGU-1oLYbe02uc-00qPkm; Tue, 05 Apr 2022 16:29:20 +0200
From: oxr463@gmx.us
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/ccid: convert to restructuredText
Date: Tue,  5 Apr 2022 14:29:06 +0000
Message-Id: <20220405142906.21382-1-oxr463@gmx.us>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EYvQNJZg1a/VNye2cotUo24K1CGoQUIfZuWHKDuNJXXh8Wd3R1N
 UbwPoXj209Nzvq4nY2Tvl5CaKCKLryeEIhxSh5RCEVtggqB03bMjChWi0TWatFDiXKkFqsa
 f3josSrnjZpT1T0HoImbUIpi0P84UhTykqTSEURJ/o/rmTi7zwZZhCg6DwSS8NgA64+LkUe
 N9MVF2fynv+jdDX2tdZ9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:g/L2ESCG1LY=:NmGqXd3GqPCEryaUrGQGhm
 9A+H1vgq7COefOHkvmJQyZHUo8EudkMt0mMkbXfOAObKPzWWDT2/dQ1avwXbckPTPEbdZZIsP
 T49njHUMqsBRinhuPCvAnnl8yHMND/mq9x5Hn2AFot0hc36pzBbiOO1BSbVxuGDk+XkLjFW/g
 ENyk02luSkebgKQ5ReP3fefd9/m2njd1yk3p/YoWRprnjfRxpmBieXcVRH8gin0FVbEJaI6qR
 NlJ7IEo2n5pL4zHAVS1y4vNFrf3oDbiktF6WedvQLacjpbSl7xNsJ2Ei3AO5y49lwoO5iwcOG
 2FYROp5rvAdC2TrdUyqivqIXYemdK6zweNqVpbXLllqGl10hCb4DRQQmdgZKWxtuclEXVy+vu
 3Kd5KtIV0xLANH0CmwYhtKDNQEybFJRA1rsVUINIPtcbcm5NHCZwidirYapHYLvTrxDu9vYSp
 v1ccFQ2fWR/LeA6Bax8r/jdaX3tRNJzUYkUFGAVc3AkuOfl+RCGS6Msii0YXiwFbyDFmELKOr
 rL039x2+LYQXbLId7EtfYDynoeZEht+0ImcpC9OpDD/DJ/3MSpluryKdbodAPh654I/wRc+VP
 29txCSA2nP2TqULJD5BaNf02XD1AU41jL/JG0zV3lfhZLCkgCQu/gafRS+cx8Pd9g3I/dCKv6
 SuV+BSHvuqaGrz6cj/jbKWRPTqKiQKt0o+y3yZNfm+5o2P/cl8PV8/jEBPIO6Ezx/kzv88xSC
 26niJHG9eJ7xtzTtg+WCJgKgD2V7ojTx1xxHLC3LoLacGaNeKbxnyyrsYIq4+40HZFtdpzOuT
 P+DhS65hvDW6tyeTaHW5oIMpBZIVwJcxHzymb6+dmM6X5oltdzQC5gPLecWrz68xt0vCQqfvl
 tKg1jV6S/g8OuiiavIhZpCG93ON7xt4XTbUvrc8n4/WKFvN2VkiGg00Nd8yuYUWBJ97Q3xk6I
 7w1GWK0s73i3XcmtjQ1dC4pvt0U3iifxRHIncvCLMlet4fEp8t1xh8TiRxWKxz2mqDutC7cMd
 fRi9xBvsGyoTpnM+dnnWu7jFq/FKXceXHy0tnl1Xshi/vKs5kzFzK6o5tKNZSOp1ZUqkq0hMv
 x8zqGWSrr0qVTw=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=oxr463@gmx.us;
 helo=mout.gmx.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Lucas Ramage <lucas.ramage@infinite-omicron.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Ramage <lucas.ramage@infinite-omicron.com>

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
=2D--
 docs/ccid.txt                    | 182 -------------------------------
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/ccid.rst     | 171 +++++++++++++++++++++++++++++
 3 files changed, 172 insertions(+), 182 deletions(-)
 delete mode 100644 docs/ccid.txt
 create mode 100644 docs/system/devices/ccid.rst

diff --git a/docs/ccid.txt b/docs/ccid.txt
deleted file mode 100644
index 2b85b1bd42..0000000000
=2D-- a/docs/ccid.txt
+++ /dev/null
@@ -1,182 +0,0 @@
-QEMU CCID Device Documentation.
-
-Contents
-1. USB CCID device
-2. Building
-3. Using ccid-card-emulated with hardware
-4. Using ccid-card-emulated with certificates
-5. Using ccid-card-passthru with client side hardware
-6. Using ccid-card-passthru with client side certificates
-7. Passthrough protocol scenario
-8. libcacard
-
-1. USB CCID device
-
-The USB CCID device is a USB device implementing the CCID specification, =
which
-lets one connect smart card readers that implement the same spec. For mor=
e
-information see the specification:
-
- Universal Serial Bus
- Device Class: Smart Card
- CCID
- Specification for
- Integrated Circuit(s) Cards Interface Devices
- Revision 1.1
- April 22rd, 2005
-
-Smartcards are used for authentication, single sign on, decryption in
-public/private schemes and digital signatures. A smartcard reader on the =
client
-cannot be used on a guest with simple usb passthrough since it will then =
not be
-available on the client, possibly locking the computer when it is "remove=
d". On
-the other hand this device can let you use the smartcard on both the clie=
nt and
-the guest machine. It is also possible to have a completely virtual smart=
 card
-reader and smart card (i.e. not backed by a physical device) using this d=
evice.
-
-2. Building
-
-The cryptographic functions and access to the physical card is done via t=
he
-libcacard library, whose development package must be installed prior to
-building QEMU:
-
-In redhat/fedora:
-    yum install libcacard-devel
-In ubuntu:
-    apt-get install libcacard-dev
-
-Configuring and building:
-    ./configure --enable-smartcard && make
-
-
-3. Using ccid-card-emulated with hardware
-
-Assuming you have a working smartcard on the host with the current
-user, using libcacard, QEMU acts as another client using ccid-card-emulat=
ed:
-
-    qemu -usb -device usb-ccid -device ccid-card-emulated
-
-
-4. Using ccid-card-emulated with certificates stored in files
-
-You must create the CA and card certificates. This is a one time process.
-We use NSS certificates:
-
-    mkdir fake-smartcard
-    cd fake-smartcard
-    certutil -N -d sql:$PWD
-    certutil -S -d sql:$PWD -s "CN=3DFake Smart Card CA" -x -t TC,TC,TC -=
n fake-smartcard-ca
-    certutil -S -d sql:$PWD -t ,, -s "CN=3DJohn Doe" -n id-cert -c fake-s=
martcard-ca
-    certutil -S -d sql:$PWD -t ,, -s "CN=3DJohn Doe (signing)" --nsCertTy=
pe smime -n signing-cert -c fake-smartcard-ca
-    certutil -S -d sql:$PWD -t ,, -s "CN=3DJohn Doe (encryption)" --nsCer=
tType sslClient -n encryption-cert -c fake-smartcard-ca
-
-Note: you must have exactly three certificates.
-
-You can use the emulated card type with the certificates backend:
-
-    qemu -usb -device usb-ccid -device ccid-card-emulated,backend=3Dcerti=
ficates,db=3Dsql:$PWD,cert1=3Did-cert,cert2=3Dsigning-cert,cert3=3Dencrypt=
ion-cert
-
-To use the certificates in the guest, export the CA certificate:
-
-    certutil -L -r -d sql:$PWD -o fake-smartcard-ca.cer -n fake-smartcard=
-ca
-
-and import it in the guest:
-
-    certutil -A -d /etc/pki/nssdb -i fake-smartcard-ca.cer -t TC,TC,TC -n=
 fake-smartcard-ca
-
-In a Linux guest you can then use the CoolKey PKCS #11 module to access
-the card:
-
-    certutil -d /etc/pki/nssdb -L -h all
-
-It will prompt you for the PIN (which is the password you assigned to the
-certificate database early on), and then show you all three certificates
-together with the manually imported CA cert:
-
-    Certificate Nickname                        Trust Attributes
-    fake-smartcard-ca                           CT,C,C
-    John Doe:CAC ID Certificate                 u,u,u
-    John Doe:CAC Email Signature Certificate    u,u,u
-    John Doe:CAC Email Encryption Certificate   u,u,u
-
-If this does not happen, CoolKey is not installed or not registered with
-NSS.  Registration can be done from Firefox or the command line:
-
-    modutil -dbdir /etc/pki/nssdb -add "CAC Module" -libfile /usr/lib64/p=
kcs11/libcoolkeypk11.so
-    modutil -dbdir /etc/pki/nssdb -list
-
-
-5. Using ccid-card-passthru with client side hardware
-
-on the host specify the ccid-card-passthru device with a suitable chardev=
:
-
-    qemu -chardev socket,server=3Don,host=3D0.0.0.0,port=3D2001,id=3Dccid=
,wait=3Doff \
-         -usb -device usb-ccid -device ccid-card-passthru,chardev=3Dccid
-
-on the client run vscclient, built when you built QEMU:
-
-    vscclient <qemu-host> 2001
-
-
-6. Using ccid-card-passthru with client side certificates
-
-This case is not particularly useful, but you can use it to debug
-your setup if #4 works but #5 does not.
-
-Follow instructions as per #4, except run QEMU and vscclient as follows:
-Run qemu as per #5, and run vscclient from the "fake-smartcard"
-directory as follows:
-
-    qemu -chardev socket,server=3Don,host=3D0.0.0.0,port=3D2001,id=3Dccid=
,wait=3Doff \
-         -usb -device usb-ccid -device ccid-card-passthru,chardev=3Dccid
-    vscclient -e "db=3D\"sql:$PWD\" use_hw=3Dno soft=3D(,Test,CAC,,id-cer=
t,signing-cert,encryption-cert)" <qemu-host> 2001
-
-
-7. Passthrough protocol scenario
-
-This is a typical interchange of messages when using the passthru card de=
vice.
-usb-ccid is a usb device. It defaults to an unattached usb device on star=
tup.
-usb-ccid expects a chardev and expects the protocol defined in
-cac_card/vscard_common.h to be passed over that.
-The usb-ccid device can be in one of three modes:
- * detached
- * attached with no card
- * attached with card
-
-A typical interchange is: (the arrow shows who started each exchange, it =
can be client
-originated or guest originated)
-
-client event      |      vscclient           |    passthru    |     usb-c=
cid  |  guest event
=2D-----------------------------------------------------------------------=
-----------------------
-                  |      VSC_Init            |                |          =
     |
-                  |      VSC_ReaderAdd       |                |     attac=
h    |
-                  |                          |                |          =
     |  sees new usb device.
-card inserted ->  |                          |                |          =
     |
-                  |      VSC_ATR             |   insert       |     inser=
t    |  see new card
-                  |                          |                |          =
     |
-                  |      VSC_APDU            |   VSC_APDU     |          =
     | <- guest sends APDU
-client<->physical |                          |                |          =
     |
-card APDU exchange|                          |                |          =
     |
-client response ->|      VSC_APDU            |   VSC_APDU     |          =
     |  receive APDU response
-                                                    ...
-                                    [APDU<->APDU repeats several times]
-                                                    ...
-card removed  ->  |                          |                |          =
     |
-                  |      VSC_CardRemove      |   remove       |    remove=
     |   card removed
-                                                    ...
-                                    [(card insert, apdu's, card remove) r=
epeat]
-                                                    ...
-kill/quit         |                          |                |          =
     |
-  vscclient       |                          |                |          =
     |
-                  |      VSC_ReaderRemove    |                |    detach=
     |
-                  |                          |                |          =
     |   usb device removed.
-
-
-8. libcacard
-
-Both ccid-card-emulated and vscclient use libcacard as the card emulator.
-libcacard implements a completely virtual CAC (DoD standard for smart
-cards) compliant card and uses NSS to retrieve certificates and do
-any encryption.  The backend can then be a real reader and card, or
-certificates stored in files.
-
-For documentation of the library see docs/libcacard.txt.
-
diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulati=
on.rst
index 0b3a3d73ad..ae8dd233e8 100644
=2D-- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -83,6 +83,7 @@ Emulated Devices
    :maxdepth: 1

    devices/can.rst
+   devices/ccid.rst
    devices/ivshmem.rst
    devices/net.rst
    devices/nvme.rst
diff --git a/docs/system/devices/ccid.rst b/docs/system/devices/ccid.rst
new file mode 100644
index 0000000000..0290265a18
=2D-- /dev/null
+++ b/docs/system/devices/ccid.rst
@@ -0,0 +1,171 @@
+Chip Card Interface Device (CCID)
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+USB CCID device
+---------------
+The USB CCID device is a USB device implementing the CCID specification, =
which
+lets one connect smart card readers that implement the same spec. For mor=
e
+information see the specification::
+
+  Universal Serial Bus
+  Device Class: Smart Card
+  CCID
+  Specification for
+  Integrated Circuit(s) Cards Interface Devices
+  Revision 1.1
+  April 22rd, 2005
+
+Smartcards are used for authentication, single sign on, decryption in
+public/private schemes and digital signatures. A smartcard reader on the =
client
+cannot be used on a guest with simple usb passthrough since it will then =
not be
+available on the client, possibly locking the computer when it is "remove=
d". On
+the other hand this device can let you use the smartcard on both the clie=
nt and
+the guest machine. It is also possible to have a completely virtual smart=
 card
+reader and smart card (i.e. not backed by a physical device) using this d=
evice.
+
+Building
+--------
+The cryptographic functions and access to the physical card is done via t=
he
+libcacard library, whose development package must be installed prior to
+building QEMU:
+
+In redhat/fedora::
+
+  yum install libcacard-devel
+
+In ubuntu::
+
+  apt-get install libcacard-dev
+
+Configuring and building::
+
+  ./configure --enable-smartcard && make
+
+Using ccid-card-emulated with hardware
+--------------------------------------
+Assuming you have a working smartcard on the host with the current
+user, using libcacard, QEMU acts as another client using ccid-card-emulat=
ed::
+
+  qemu -usb -device usb-ccid -device ccid-card-emulated
+
+Using ccid-card-emulated with certificates stored in files
+----------------------------------------------------------
+You must create the CA and card certificates. This is a one time process.
+We use NSS certificates::
+
+  mkdir fake-smartcard
+  cd fake-smartcard
+  certutil -N -d sql:$PWD
+  certutil -S -d sql:$PWD -s "CN=3DFake Smart Card CA" -x -t TC,TC,TC -n =
fake-smartcard-ca
+  certutil -S -d sql:$PWD -t ,, -s "CN=3DJohn Doe" -n id-cert -c fake-sma=
rtcard-ca
+  certutil -S -d sql:$PWD -t ,, -s "CN=3DJohn Doe (signing)" --nsCertType=
 smime -n signing-cert -c fake-smartcard-ca
+  certutil -S -d sql:$PWD -t ,, -s "CN=3DJohn Doe (encryption)" --nsCertT=
ype sslClient -n encryption-cert -c fake-smartcard-ca
+
+Note: you must have exactly three certificates.
+
+You can use the emulated card type with the certificates backend::
+
+  qemu -usb -device usb-ccid -device ccid-card-emulated,backend=3Dcertifi=
cates,db=3Dsql:$PWD,cert1=3Did-cert,cert2=3Dsigning-cert,cert3=3Dencryptio=
n-cert
+
+To use the certificates in the guest, export the CA certificate::
+
+  certutil -L -r -d sql:$PWD -o fake-smartcard-ca.cer -n fake-smartcard-c=
a
+
+and import it in the guest::
+
+  certutil -A -d /etc/pki/nssdb -i fake-smartcard-ca.cer -t TC,TC,TC -n f=
ake-smartcard-ca
+
+In a Linux guest you can then use the CoolKey PKCS #11 module to access
+the card::
+
+  certutil -d /etc/pki/nssdb -L -h all
+
+It will prompt you for the PIN (which is the password you assigned to the
+certificate database early on), and then show you all three certificates
+together with the manually imported CA cert::
+
+  Certificate Nickname                        Trust Attributes
+  fake-smartcard-ca                           CT,C,C
+  John Doe:CAC ID Certificate                 u,u,u
+  John Doe:CAC Email Signature Certificate    u,u,u
+  John Doe:CAC Email Encryption Certificate   u,u,u
+
+If this does not happen, CoolKey is not installed or not registered with
+NSS. Registration can be done from Firefox or the command line::
+
+  modutil -dbdir /etc/pki/nssdb -add "CAC Module" -libfile /usr/lib64/pkc=
s11/libcoolkeypk11.so
+  modutil -dbdir /etc/pki/nssdb -list
+
+Using ccid-card-passthru with client side hardware
+--------------------------------------------------
+On the host specify the ccid-card-passthru device with a suitable chardev=
::
+
+  qemu -chardev socket,server=3Don,host=3D0.0.0.0,port=3D2001,id=3Dccid,w=
ait=3Doff \
+       -usb -device usb-ccid -device ccid-card-passthru,chardev=3Dccid
+
+On the client run vscclient, built when you built QEMU::
+
+  vscclient <qemu-host> 2001
+
+Using ccid-card-passthru with client side certificates
+------------------------------------------------------
+This case is not particularly useful, but you can use it to debug
+your setup.
+
+Follow instructions above, except run QEMU and vscclient as follows.
+
+Run qemu as per above, and run vscclient from the "fake-smartcard"
+directory as follows::
+
+  qemu -chardev socket,server=3Don,host=3D0.0.0.0,port=3D2001,id=3Dccid,w=
ait=3Doff \
+       -usb -device usb-ccid -device ccid-card-passthru,chardev=3Dccid
+  vscclient -e "db=3D\"sql:$PWD\" use_hw=3Dno soft=3D(,Test,CAC,,id-cert,=
signing-cert,encryption-cert)" <qemu-host> 2001
+
+
+Passthrough protocol scenario
+-----------------------------
+This is a typical interchange of messages when using the passthru card de=
vice.
+usb-ccid is a usb device. It defaults to an unattached usb device on star=
tup.
+usb-ccid expects a chardev and expects the protocol defined in
+cac_card/vscard_common.h to be passed over that.
+The usb-ccid device can be in one of three modes:
+* detached
+* attached with no card
+* attached with card
+
+A typical interchange is (the arrow shows who started each exchange, it c=
an be client
+originated or guest originated)::
+
+  client event        |      vscclient           |    passthru    |     u=
sb-ccid  |  guest event
+  -----------------------------------------------------------------------=
-------------------------
+                      |      VSC_Init            |                |      =
         |
+                      |      VSC_ReaderAdd       |                |     a=
ttach    |
+                      |                          |                |      =
         |  sees new usb device.
+    card inserted ->  |                          |                |      =
         |
+                      |      VSC_ATR             |   insert       |     i=
nsert    |  see new card
+                      |                          |                |      =
         |
+                      |      VSC_APDU            |   VSC_APDU     |      =
         | <- guest sends APDU
+  client <-> physical |                          |                |      =
         |
+   card APDU exchange |                          |                |      =
         |
+   client response -> |      VSC_APDU            |   VSC_APDU     |      =
         |  receive APDU response
+                                                        ...
+                                        [APDU<->APDU repeats several time=
s]
+                                                        ...
+     card removed  -> |                          |                |      =
         |
+                      |      VSC_CardRemove      |   remove       |    re=
move     |   card removed
+                                                        ...
+                                        [(card insert, apdu's, card remov=
e) repeat]
+                                                        ...
+    kill/quit         |                          |                |      =
         |
+      vscclient       |                          |                |      =
         |
+                      |      VSC_ReaderRemove    |                |    de=
tach     |
+                      |                          |                |      =
         |   usb device removed.
+
+libcacard
+---------
+Both ccid-card-emulated and vscclient use libcacard as the card emulator.
+libcacard implements a completely virtual CAC (DoD standard for smart
+cards) compliant card and uses NSS to retrieve certificates and do
+any encryption. The backend can then be a real reader and card, or
+certificates stored in files.
+
=2D-
2.34.1


