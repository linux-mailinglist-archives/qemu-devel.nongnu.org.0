Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8A49541B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:21:53 +0100 (CET)
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAc4G-0007au-JH
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:21:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgM-0004AX-PB
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:51 -0500
Received: from [2a00:1450:4864:20::32c] (port=55830
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00039Q-09
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:50 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c66so11770263wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XOnaXsBjznZRDORjhMkMS/eA+VHSJADV+QJk7ay91zM=;
 b=RMmv44cHK2Iok/V3e/sRG7L11Dnp3Nujbd+KQEFeCQIm0l21IeKqU+hv2IVy+9DRmb
 JOA4AMQUYsbkJReIvlOPEHuyb0IwGBw90oouECM/z0k1IEJS52XfvjoMNXOQIoMrdXMj
 jQpPkP911Ja8mQm2OfxhxSI10J7f5+WI5hY7ggk+zQOz6O12fAwbjnI1knNIPU/znRps
 YB/U7nNBILWW5s4lfa8XpyfMdKy1HWF8KL/2hXVcmxxbgRrVe/t2GqZGvU5WBeRrOCRV
 WigRNqKddNWlPmM9+A7qVXe53W9u6tTUMir3ktCHqCUIX7SG+zreR673io989azZOYr9
 pjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOnaXsBjznZRDORjhMkMS/eA+VHSJADV+QJk7ay91zM=;
 b=dILRrkrroyk+BxzoUDiBxOtwUoQucbCQbqRjOQ6IbkAlFAIwUh8CjeTrrk4P6f0/+k
 PJrgmtD9FgRo1eVH83f20yuCJgALvv/Z02PH+lCan3THhu3A7tqSJhHv1++zRPiBO1f8
 Gr4xTf+oVLgnuVVgYgA01hwiDHCdYvZp0y++OwiE+9g78BknK4ezmK+TrJK6iU2inGnC
 N4y2qHoK22duYqH7Dfm+Ag3zgQ7UUFGqTiFh99LrqTCW/AmAoIt7MOFVUu1H4UItCNRF
 oMfw9fDlgK0fmjMIHSLuzuN4PzDOzFchwVSWFZH23A+uQKgzIHlzOWARger2R2FyRQNg
 eWGg==
X-Gm-Message-State: AOAM532De/9zaky3edE4/031RByGZkQjr+tjaVKU/BfhjqsLNduRFd/R
 0yWV3aFqgJWsVSKUHuF4EvVmyi+ynNjSHg==
X-Google-Smtp-Source: ABdhPJxw+fppVe+eezbo2LP3IK3sQMpaYY/N9XfCWQRroQvR9CpzU2u0I5EMT2oL5qYAb52rCjbXIw==
X-Received: by 2002:a05:6000:170d:: with SMTP id
 n13mr2311716wrc.4.1642682202146; 
 Thu, 20 Jan 2022 04:36:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/38] docs/can: convert to restructuredText
Date: Thu, 20 Jan 2022 12:36:03 +0000
Message-Id: <20220120123630.267975-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lucas Ramage <lucas.ramage@infinite-omicron.com>

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/527
Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Message-id: 20220105205628.5491-1-oxr463@gmx.us
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: Move to docs/system/devices/ rather than top-level;
 fix a pre-existing typo in passing]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/device-emulation.rst         |  1 +
 docs/{can.txt => system/devices/can.rst} | 90 +++++++++++-------------
 2 files changed, 41 insertions(+), 50 deletions(-)
 rename docs/{can.txt => system/devices/can.rst} (68%)

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 19944f526ce..0b3a3d73ad1 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -82,6 +82,7 @@ Emulated Devices
 .. toctree::
    :maxdepth: 1
 
+   devices/can.rst
    devices/ivshmem.rst
    devices/net.rst
    devices/nvme.rst
diff --git a/docs/can.txt b/docs/system/devices/can.rst
similarity index 68%
rename from docs/can.txt
rename to docs/system/devices/can.rst
index 0d310237dfa..16d72c3ac37 100644
--- a/docs/can.txt
+++ b/docs/system/devices/can.rst
@@ -1,6 +1,5 @@
-QEMU CAN bus emulation support
-==============================
-
+CAN Bus Emulation Support
+=========================
 The CAN bus emulation provides mechanism to connect multiple
 emulated CAN controller chips together by one or multiple CAN busses
 (the controller device "canbus"  parameter). The individual busses
@@ -32,34 +31,39 @@ emulated environment for testing and RTEMS GSoC slot has been donated
 to work on CAN hardware emulation on QEMU.
 
 Examples how to use CAN emulation for SJA1000 based boards
-==========================================================
-
+----------------------------------------------------------
 When QEMU with CAN PCI support is compiled then one of the next
 CAN boards can be selected
 
- (1) CAN bus Kvaser PCI CAN-S (single SJA1000 channel) boad. QEMU startup options
+(1) CAN bus Kvaser PCI CAN-S (single SJA1000 channel) board. QEMU startup options::
+
     -object can-bus,id=canbus0
     -device kvaser_pci,canbus=canbus0
-    Add "can-host-socketcan" object to connect device to host system CAN bus
+
+Add "can-host-socketcan" object to connect device to host system CAN bus::
+
     -object can-host-socketcan,id=canhost0,if=can0,canbus=canbus0
 
- (2) CAN bus PCM-3680I PCI (dual SJA1000 channel) emulation
+(2) CAN bus PCM-3680I PCI (dual SJA1000 channel) emulation::
+
     -object can-bus,id=canbus0
     -device pcm3680_pci,canbus0=canbus0,canbus1=canbus0
 
- another example:
+Another example::
+
     -object can-bus,id=canbus0
     -object can-bus,id=canbus1
     -device pcm3680_pci,canbus0=canbus0,canbus1=canbus1
 
- (3) CAN bus MIOe-3680 PCI (dual SJA1000 channel) emulation
+(3) CAN bus MIOe-3680 PCI (dual SJA1000 channel) emulation::
+
     -device mioe3680_pci,canbus0=canbus0
 
-
 The ''kvaser_pci'' board/device model is compatible with and has been tested with
-''kvaser_pci'' driver included in mainline Linux kernel.
+the ''kvaser_pci'' driver included in mainline Linux kernel.
 The tested setup was Linux 4.9 kernel on the host and guest side.
-Example for qemu-system-x86_64:
+
+Example for qemu-system-x86_64::
 
     qemu-system-x86_64 -accel kvm -kernel /boot/vmlinuz-4.9.0-4-amd64 \
       -initrd ramdisk.cpio \
@@ -69,7 +73,7 @@ Example for qemu-system-x86_64:
       -device kvaser_pci,canbus=canbus0 \
       -nographic -append "console=ttyS0"
 
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
-===========================
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
       -device ctucan_pci,canbus0=canbus0-bus,canbus1=canbus0-bus \
       -nographic
 
-Setup of CTU CAN FD controller in a guest Linux system
+Setup of CTU CAN FD controller in a guest Linux system::
 
   insmod ctucanfd.ko || modprobe ctucanfd
   insmod ctucanfd_pci.ko || modprobe ctucanfd_pci
@@ -150,19 +153,19 @@ Setup of CTU CAN FD controller in a guest Linux system
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
 
@@ -170,29 +173,16 @@ The test can be run viceversa, generate messages in the guest system and capture
 in the host one and much more combinations.
 
 Links to other resources
-========================
+------------------------
 
- (1) CAN related projects at Czech Technical University, Faculty of Electrical Engineering
-     http://canbus.pages.fel.cvut.cz/
- (2) Repository with development can-pci branch at Czech Technical University
-     https://gitlab.fel.cvut.cz/canbus/qemu-canbus
- (3) RTEMS page describing project
-     https://devel.rtems.org/wiki/Developer/Simulators/QEMU/CANEmulation
- (4) RTLWS 2015 article about the project and its use with CANopen emulation
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
-     http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/ctu_can_fd_architecture.pdf
- (10) CTU CAN FD Driver Documentation
-     http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd-driver.html
- (11) Integration with PCIe interfacing for Intel/Altera Cyclone IV based board
-     https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd
+ (1) `CAN related projects at Czech Technical University, Faculty of Electrical Engineering <http://canbus.pages.fel.cvut.cz>`_
+ (2) `Repository with development can-pci branch at Czech Technical University <https://gitlab.fel.cvut.cz/canbus/qemu-canbus>`_
+ (3) `RTEMS page describing project <https://devel.rtems.org/wiki/Developer/Simulators/QEMU/CANEmulation>`_
+ (4) `RTLWS 2015 article about the project and its use with CANopen emulation <http://cmp.felk.cvut.cz/~pisa/can/doc/rtlws-17-pisa-qemu-can.pdf>`_
+ (5) `GNU/Linux, CAN and CANopen in Real-time Control Applications Slides from LinuxDays 2017 (include updated RTLWS 2015 content) <https://www.linuxdays.cz/2017/video/Pavel_Pisa-CAN_canopen.pdf>`_
+ (6) `Linux SocketCAN utilities <https://github.com/linux-can/can-utils>`_
+ (7) `CTU CAN FD project including core VHDL design, Linux driver, test utilities etc. <https://gitlab.fel.cvut.cz/canbus/ctucanfd_ip_core>`_
+ (8) `CTU CAN FD Core Datasheet Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/Progdokum.pdf>`_
+ (9) `CTU CAN FD Core System Architecture Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/ctu_can_fd_architecture.pdf>`_
+ (10) `CTU CAN FD Driver Documentation <http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd-driver.html>`_
+ (11) `Integration with PCIe interfacing for Intel/Altera Cyclone IV based board <https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd>`_
-- 
2.25.1


