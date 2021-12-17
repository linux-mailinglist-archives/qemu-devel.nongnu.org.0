Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A323479624
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:23:23 +0100 (CET)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myKhG-0002RD-5i
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:23:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1myKgF-0001jR-0D
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:22:19 -0500
Received: from mout.gmx.net ([212.227.15.18]:33235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oxr463@gmx.us>) id 1myKgC-0002vT-Ur
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639776131;
 bh=bkOtKOL5XUA+/PbSGvsvMtt8Orb99DSb4cQrUNIIVGI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Y7yOyK8FGhNfRKQ2HYA7s5UII/qFUuc19tNPRMSHq8Nel+WS1Y8nSSFbmgpNIxMQm
 N41UDG7uF0gc/qwSutUuwuQp4kYDb7SwGvxXTx3o1cIKhczE3FgONyQ5jfPueas+J/
 NurZik/GYZLoS7nCoPKMtNYvgMtS4m3fRFT+SEoU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from srq-net-003.hsd1.fl.comcast.net ([174.58.14.136]) by
 mail.gmx.net (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MdNY2-1mOzrO2IDY-00ZSoD; Fri, 17 Dec 2021 22:22:10 +0100
From: oxr463@gmx.us
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/can: convert to restructuredText
Date: Fri, 17 Dec 2021 21:21:46 +0000
Message-Id: <20211217212146.2573-1-oxr463@gmx.us>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9UqIHMC0/RqlOH7HRngLxdd2O57fnBwbfoBC8AXYCx1AJ/PC6D4
 xnxX7+AXpcNzkU1XZAZC51B6vKTj/IQX+0zja6PQgfFR3MMDJm27qcb5L94BpdwZVhdOHUG
 1JVErgZ4gMdoSQadur2TAWTsQKc6QRcJTpIGqixmHLif34sLtKh0gpvrbQamFbMBfE74OUM
 58SGOeg1lt1F34awp3n2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:suGpFbIee6o=:vyXXjs8fyUmmNT9VmiohBR
 wWU84CXKgmbT/ejBBV6HliTsGz58H+WihB4WNbFHIiw/KxJtwsVnPKgJYR/UiVft3MQqd6l/v
 /zO1dZ9/ygcb4ct+mWmAPiQRFQzDvJeH7PjJjsN5GJeX7mxXtDBPbXAF5zi8RSfrCdVY6ly+C
 S2x0iMHchTKzBiaGTxOBdvPINKUUm6HNGxIJ6Jf+tQs7tAYMiaxarMzYho3WEoeJ0wysTkfVq
 +Nnhe2jN1jIaCHS3JkAVIe+PSP/EavXpO9OvsT9/8k/CRR0t4otI6LaxRW1vOCZBkveGNNdPA
 tBl/KMGUGCBwlIrug6QWbMiySAR69OXz/kRc7y8L9+mxJ9T42Aij6H/+0MNVeOPMNPsd3sfwf
 2+DTSPV6enhXIzi3f4kJUJDH02PbpIwsuscLcOhsB8DA2rbIJr+bHGeRaqeFDH1AzZ9SG7Ont
 2VLEUF80gPot/VI9B7aaZuAeD74T+QesKbnrjJdN58dOUtxv7yucTo0VwwjVUhfFSWlYiPV6y
 mO3UwxyKtcnzokxIksLpsWhwQL/aRxgmLTI88Bwg8pmIkFsgoMCLQL/IIQXBbkO0h6j8LsQLH
 ROzxw2V8fOKD+WBR250gkkZEKCWK39aZD78EanXmmRKm1FLiMfb2HDX+No9OHZUr1wmrDAXi6
 XhA6tg7hWZ/1O0u9/TJ+/BziyjJ7O8mwjoMqCXt2etQeVAOgkqA/rg7LgqqH+1k8e0YtC8mtS
 RWjO+ps8B6EzLGWdsxc4lV/RhUnE5DFuUcWd1nqCMPxKDU/V7sHB08K5Fos5Uo0UYu81TMPM7
 rHG6D/ZuzOideiBPrc+CD82E0St6sqyXY+qInwOKPnVXHdp2cFGDhtESFIQtqpoztArcpPT6m
 v7LXgFgYX4Y5J4zYIc2XMD/+BctTh35dcVJesHfBilvTTXiCiHgzUE+uvIOjR4Kk2zNJZaWk7
 IYDyZ5lGc24VQae0BQPQFliG+CwS4Q3+Bz9AOuI5S9ikoZVzbiVMZcFrUgp3cdjY/yHcKuSnI
 waZ9B5e/TPtV+tAZo2JIjcKhoJTe7nGDUOS1dsCVD1t9Zo5+I84NDsDjhzqi3b/kj57sdHd1g
 +PyyhiT4/Zd4S0=
Received-SPF: pass client-ip=212.227.15.18; envelope-from=oxr463@gmx.us;
 helo=mout.gmx.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Bug: https://gitlab.com/qemu-project/qemu/-/issues/527
Signed-off-by: Lucas Ramage <lucas.ramage@infinite-omicron.com>
=2D--
 docs/{can.txt =3D> can.rst} | 14 ++++++--------
 docs/index.rst            |  1 +
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename docs/{can.txt =3D> can.rst} (97%)

diff --git a/docs/can.txt b/docs/can.rst
similarity index 97%
rename from docs/can.txt
rename to docs/can.rst
index 0d310237df..995134d079 100644
=2D-- a/docs/can.txt
+++ b/docs/can.rst
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
@@ -32,8 +31,7 @@ emulated environment for testing and RTEMS GSoC slot has=
 been donated
 to work on CAN hardware emulation on QEMU.

 Examples how to use CAN emulation for SJA1000 based boards
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
+----------------------------------------------------------
 When QEMU with CAN PCI support is compiled then one of the next
 CAN boards can be selected

@@ -100,8 +98,7 @@ traffic with "candump" command which is included in "ca=
n-utils".
   candump can0

 CTU CAN FD support examples
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
-
+---------------------------
 This open-source core provides CAN FD support. CAN FD drames are
 delivered even to the host systems when SocketCAN interface is found
 CAN FD capable.
@@ -170,7 +167,7 @@ The test can be run viceversa, generate messages in th=
e guest system and capture
 in the host one and much more combinations.

 Links to other resources
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+------------------------

  (1) CAN related projects at Czech Technical University, Faculty of Elect=
rical Engineering
      http://canbus.pages.fel.cvut.cz/
@@ -196,3 +193,4 @@ Links to other resources
      http://canbus.pages.fel.cvut.cz/ctucanfd_ip_core/driver_doc/ctucanfd=
-driver.html
  (11) Integration with PCIe interfacing for Intel/Altera Cyclone IV based=
 board
      https://gitlab.fel.cvut.cz/canbus/pcie-ctu_can_fd
+
diff --git a/docs/index.rst b/docs/index.rst
index 0b9ee9901d..beb868ca7f 100644
=2D-- a/docs/index.rst
+++ b/docs/index.rst
@@ -18,3 +18,4 @@ Welcome to QEMU's documentation!
    interop/index
    specs/index
    devel/index
+   can
=2D-
2.32.0


