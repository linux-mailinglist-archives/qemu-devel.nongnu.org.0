Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4012485A5A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:59:10 +0100 (CET)
Received: from localhost ([::1]:33628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5DNF-00057L-GT
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1n5DL6-0003yz-B3
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:56:56 -0500
Received: from mout.gmx.net ([212.227.17.20]:58883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1n5DL2-0005Ik-Re
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 15:56:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641416205;
 bh=HBxqQkdO5We9pHDi96q8aV0HXTTMqX5v65imS54N+y0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=i/R/dxavUeXLxxi8RIlTqayeXheeR+LnAS9PTcvleR+Rw+HqC2pnGYKPeH0fcoYKY
 Y7/5zDzzCbtSK03njFQ9wlj24W/l7rAOaRC1KNJi5cm31XBxhoh1BNuWwRhnKfAKLo
 ADhoSj0DQEctr0FgBLcUGVuZb2+ezdWBTLDAoPEE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from e79b3c08a125.hsd1.fl.comcast.net ([174.58.14.136]) by
 mail.gmx.net (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1M1Ygt-1n798x2Zlj-0037La; Wed, 05 Jan 2022 21:56:45 +0100
From: oxr463@gmx.us
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/can: convert to restructuredText
Date: Wed,  5 Jan 2022 20:56:28 +0000
Message-Id: <20220105205628.5491-1-oxr463@gmx.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FVygQj2MoIrMX6lGdonCNFQy/mDcijlcE1alAuefGfmPumItA2X
 Darfo2ChWCv4y4h+u1SGDloQY9LZt6SonJoTZPM7l6o7bqkggIoTW+8fcjLfuXBqlEGQsH4
 6dGpkU0ZcIZPWdmr6H67ZcsHZSqcCIxB/s9Thg0V41OzR6RUO6yHmAX5fAbMmjAXVGN3tSA
 ddj3ak7JxKln8gGrMCoiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uH8aqpoHzr8=:4W4yr2jv2gvdRQKak7+we3
 K8pB2yWM8FHnFWAgsHN+V1TjWopJHhHRVAC1jsB6g1zlYQAq4pxe5CKnEL3wBJ2fitMDpBDeH
 kEGzJlVt/GY2k+JuyPxyHhkydrE0vWW0Wz6hfw2MQWHyb3c2/dQRx+CWzBsSOCLJHe36jDao6
 JZwbg7YYuVX1TA2c22eNLGb+cM/4bNl2GwkO0uvSBCGk9bLVleUpxIDRgTRxbHrT0suHx9+yi
 MftYAVo1oSpmzQStw+tqhEgGl4Y84jd+EgQMywehHlCCwdnnN8Sa56GDRTdIXBI9Chox2e7oK
 uAlS5xF6dbTTpf4jI+65EHKOrl4bc1JDjWIzbTCDpyALuzCzuFudi2rLh34SxMR2UCg+bJTnf
 LcwPWjAcISMB8pRAsJXH0qcZZDgNYJk9wlyrssspD8wE+9tvEYfXMFT/JGig1PG+YXtaKs+Ly
 XCkIZf1HM0kOF2zjdw0lJ15JcMtpT+4x3rKPr9b2T8neLcG/Uuw6KIxUFhs5vBjOP99TjUi/x
 Xjg//3E2amfeiO8OGoxHoWtl4zuaG1RVcGbCcXQd6HFlb3zpMGAAVxaCRbE5Z9opz4FqNX4wA
 nl1VjeyC75iEjQ/iJM+0z7ltd4maOqrqT/TiBHLp+0en6IV6r7ms09CYUy4aeDRgQm0ejen45
 cRTmNoKl63xJcyC973NtHhcfI6prZRw6/lncS6tqbHFP7UDDbTbsOdjbaBCmZVEqqC3p87wtr
 YftqzJmmIp7+HDKMqRkfDEe0AYyCeXe4i3MPToePkoBYoNOyA/CD9S/mHqclx3ReO+Ztad0cN
 u1ZMluR3jbonI3H/tMZ2RxrzMhcYsYk2eNBsAPdZ1MpD0Hi3FSaKqq4fFM8wu/jXnuZTdMts6
 0lN86oIQCQ/II4wKrPoU44g0zu4BOex41EL+k4nXn+WHgBKls4yb5qOCrWh4Ptm4o8hbRf+JN
 3CpXJxbkevzPOTqS0Wbe+NprB7D2jZ6p7l98oqoZrLlg7l0xDD2f1GCIKTWSU9jY/XAgWW2N6
 HVgY5OsUQWsao8C6D5SEcM02KoKGBOsyBGTVZO2OAp/O+Phy82RG89n8UwxCgV1jELjqt4Mo1
 TYotK8kHcwaouY=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=oxr463@gmx.us;
 helo=mout.gmx.net
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com,
 Lucas Ramage <lucas.ramage@infinite-omicron.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Ramage <lucas.ramage@infinite-omicron.com>

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
=2D--
 docs/{can.txt =3D> system/can.rst} | 92 ++++++++++++++------------------
 docs/system/index.rst            |  1 +
 2 files changed, 42 insertions(+), 51 deletions(-)
 rename docs/{can.txt =3D> system/can.rst} (68%)

diff --git a/docs/can.txt b/docs/system/can.rst
similarity index 68%
rename from docs/can.txt
rename to docs/system/can.rst
index 0d310237df..198522eaa4 100644
=2D-- a/docs/can.txt
+++ b/docs/system/can.rst
@@ -1,6 +1,5 @@
-QEMU CAN bus emulation support
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
-
+CAN Bus Emulation Support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
 The CAN bus emulation provides mechanism to connect multiple
 emulated CAN controller chips together by one or multiple CAN busses
 (the controller device "canbus"  parameter). The individual busses
@@ -32,34 +31,39 @@ emulated environment for testing and RTEMS GSoC slot h=
as been donated
 to work on CAN hardware emulation on QEMU.

 Examples how to use CAN emulation for SJA1000 based boards
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
+----------------------------------------------------------
 When QEMU with CAN PCI support is compiled then one of the next
 CAN boards can be selected

- (1) CAN bus Kvaser PCI CAN-S (single SJA1000 channel) boad. QEMU startup=
 options
+(1) CAN bus Kvaser PCI CAN-S (single SJA1000 channel) boad. QEMU startup =
options::
+
     -object can-bus,id=3Dcanbus0
     -device kvaser_pci,canbus=3Dcanbus0
-    Add "can-host-socketcan" object to connect device to host system CAN =
bus
+
+Add "can-host-socketcan" object to connect device to host system CAN bus:=
:
+
     -object can-host-socketcan,id=3Dcanhost0,if=3Dcan0,canbus=3Dcanbus0

- (2) CAN bus PCM-3680I PCI (dual SJA1000 channel) emulation
+(2) CAN bus PCM-3680I PCI (dual SJA1000 channel) emulation::
+
     -object can-bus,id=3Dcanbus0
     -device pcm3680_pci,canbus0=3Dcanbus0,canbus1=3Dcanbus0

- another example:
+Another example::
+
     -object can-bus,id=3Dcanbus0
     -object can-bus,id=3Dcanbus1
     -device pcm3680_pci,canbus0=3Dcanbus0,canbus1=3Dcanbus1

- (3) CAN bus MIOe-3680 PCI (dual SJA1000 channel) emulation
-    -device mioe3680_pci,canbus0=3Dcanbus0
+(3) CAN bus MIOe-3680 PCI (dual SJA1000 channel) emulation::

+    -device mioe3680_pci,canbus0=3Dcanbus0

 The ''kvaser_pci'' board/device model is compatible with and has been tes=
ted with
-''kvaser_pci'' driver included in mainline Linux kernel.
+the ''kvaser_pci'' driver included in mainline Linux kernel.
 The tested setup was Linux 4.9 kernel on the host and guest side.
-Example for qemu-system-x86_64:
+
+Example for qemu-system-x86_64::

     qemu-system-x86_64 -accel kvm -kernel /boot/vmlinuz-4.9.0-4-amd64 \
       -initrd ramdisk.cpio \
@@ -69,7 +73,7 @@ Example for qemu-system-x86_64:
       -device kvaser_pci,canbus=3Dcanbus0 \
       -nographic -append "console=3DttyS0"

-Example for qemu-system-arm:
+Example for qemu-system-arm::

     qemu-system-arm -cpu arm1176 -m 256 -M versatilepb \
       -kernel kernel-qemu-arm1176-versatilepb \
@@ -84,24 +88,23 @@ Example for qemu-system-arm:
 The CAN interface of the host system has to be configured for proper
 bitrate and set up. Configuration is not propagated from emulated
 devices through bus to the physical host device. Example configuration
-for 1 Mbit/s
+for 1 Mbit/s::

   ip link set can0 type can bitrate 1000000
   ip link set can0 up

 Virtual (host local only) can interface can be used on the host
-side instead of physical interface
+side instead of physical interface::

   ip link add dev can0 type vcan

 The CAN interface on the host side can be used to analyze CAN
-traffic with "candump" command which is included in "can-utils".
+traffic with "candump" command which is included in "can-utils"::

   candump can0

 CTU CAN FD support examples
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-
+---------------------------
 This open-source core provides CAN FD support. CAN FD drames are
 delivered even to the host systems when SocketCAN interface is found
 CAN FD capable.
@@ -113,7 +116,7 @@ on the board.
 Example how to connect the canbus0-bus (virtual wire) to the host
 Linux system (SocketCAN used) and to both CTU CAN FD cores emulated
 on the corresponding PCI card expects that host system CAN bus
-is setup according to the previous SJA1000 section.
+is setup according to the previous SJA1000 section::

   qemu-system-x86_64 -enable-kvm -kernel /boot/vmlinuz-4.19.52+ \
       -initrd ramdisk.cpio \
@@ -125,7 +128,7 @@ is setup according to the previous SJA1000 section.
       -device ctucan_pci,canbus0=3Dcanbus0-bus,canbus1=3Dcanbus0-bus \
       -nographic

-Setup of CTU CAN FD controller in a guest Linux system
+Setup of CTU CAN FD controller in a guest Linux system::

   insmod ctucanfd.ko || modprobe ctucanfd
   insmod ctucanfd_pci.ko || modprobe ctucanfd_pci
@@ -150,19 +153,19 @@ Setup of CTU CAN FD controller in a guest Linux syst=
em
     /bin/ip link set $ifc up
   done

-The test can run for example
+The test can run for example::

   candump can1

-in the guest system and next commands in the host system for basic CAN
+in the guest system and next commands in the host system for basic CAN::

   cangen can0

-for CAN FD without bitrate switch
+for CAN FD without bitrate switch::

   cangen can0 -f

-and with bitrate switch
+and with bitrate switch::

   cangen can0 -b

@@ -170,29 +173,16 @@ The test can be run viceversa, generate messages in =
the guest system and capture
 in the host one and much more combinations.

 Links to other resources
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
- (1) CAN related projects at Czech Technical University, Faculty of Elect=
rical Engineering
-     http://canbus.pages.fel.cvut.cz/
- (2) Repository with development can-pci branch at Czech Technical Univer=
sity
-     https://gitlab.fel.cvut.cz/canbus/qemu-canbus
- (3) RTEMS page describing project
-     https://devel.rtems.org/wiki/Developer/Simulators/QEMU/CANEmulation
- (4) RTLWS 2015 article about the project and its use with CANopen emulat=
ion
-     http://cmp.felk.cvut.cz/~pisa/can/doc/rtlws-17-pisa-qemu-can.pdf
- (5) GNU/Linux, CAN and CANopen in Real-time Control Applications
-     Slides from LinuxDays 2017 (include updated RTLWS 2015 content)
-     https://www.linuxdays.cz/2017/video/Pavel_Pisa-CAN_canopen.pdf
- (6) Linux SocketCAN utilities
-     https://github.com/linux-can/can-utils/
- (7) CTU CAN FD project including core VHDL design, Linux driver,
-     test utilities etc.
-     https://gitlab.fel.cvut.cz/canbus/ctucanfd_ip_core
- (8) CTU CAN FD Core Datasheet Documentation
-     http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/Progdokum.pdf
- (9) CTU CAN FD Core System Architecture Documentation
-     http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/ctu_can_fd_architec=
ture.pdf
- (10) CTU CAN FD Driver Documentation
-     http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd=
-driver.html
- (11) Integration with PCIe interfacing for Intel/Altera Cyclone IV based=
 board
-     https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd
+------------------------
+
+ (1) `CAN related projects at Czech Technical University, Faculty of Elec=
trical Engineering <http://canbus.pages.fel.cvut.cz>`_
+ (2) `Repository with development can-pci branch at Czech Technical Unive=
rsity <https://gitlab.fel.cvut.cz/canbus/qemu-canbus>`_
+ (3) `RTEMS page describing project <https://devel.rtems.org/wiki/Develop=
er/Simulators/QEMU/CANEmulation>`_
+ (4) `RTLWS 2015 article about the project and its use with CANopen emula=
tion <http://cmp.felk.cvut.cz/~pisa/can/doc/rtlws-17-pisa-qemu-can.pdf>`_
+ (5) `GNU/Linux, CAN and CANopen in Real-time Control Applications Slides=
 from LinuxDays 2017 (include updated RTLWS 2015 content) <https://www.lin=
uxdays.cz/2017/video/Pavel_Pisa-CAN_canopen.pdf>`_
+ (6) `Linux SocketCAN utilities <https://github.com/linux-can/can-utils>`=
_
+ (7) `CTU CAN FD project including core VHDL design, Linux driver, test u=
tilities etc. <https://gitlab.fel.cvut.cz/canbus/ctucanfd_ip_core>`_
+ (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cv=
ut.cz/ctucanfd_ip_core/Progdokum.pdf>`_
+ (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pa=
ges.fel.cvut.cz/ctucanfd_ip_core/ctu_can_fd_architecture.pdf>`_
+ (10) `CTU CAN FD Driver Documentation <http://canbus.pages.fel.cvut.cz/c=
tucanfd_ip_core/driver_doc/ctucanfd-driver.html>`_
+ (11) `Integration with PCIe interfacing for Intel/Altera Cyclone IV base=
d board <https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd>`_
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 73bbedbc22..70bf4863a4 100644
=2D-- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -34,3 +34,4 @@ or Hypervisor.Framework.
    targets
    security
    multi-process
+   can
=2D-
2.30.2


