Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD24475E76
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:22:01 +0100 (CET)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXya-0002sY-8i
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcV-0005f6-G7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:11 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:49859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcM-0003WF-Dx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.162])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9FA35D226596;
 Wed, 15 Dec 2021 17:59:00 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0013d07f9fd-de98-4da4-8dfc-00d2fe4b10e7,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 012/102] docs: Minor updates on the powernv documentation.
Date: Wed, 15 Dec 2021 17:57:17 +0100
Message-ID: <20211215165847.321042-13-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6d5ed02d-4052-4f8f-8e12-12d0878126dd
X-Ovh-Tracer-Id: 2221400518506220326
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtkeetvddutddvheetffegvdelfeejleegiedvleejvdelhffhheefvdehffevffenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkrghougdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
[ clg: replaced Power9 by POWER9 ]
Message-Id: <c387f883b3db34d9fcb44ccac2ef11c35a25e18c.1637669345.git.lagarcia@br.ibm.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/ppc/powernv.rst | 55 +++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
index 86186b7d2cb7..edd45d1eaadd 100644
--- a/docs/system/ppc/powernv.rst
+++ b/docs/system/ppc/powernv.rst
@@ -1,7 +1,7 @@
-PowerNV family boards (``powernv8``, ``powernv9``)
+PowerNV family boards (``powernv8``, ``powernv9``, ``powernv10``)
 ==================================================================
 
-PowerNV (as Non-Virtualized) is the "baremetal" platform using the
+PowerNV (as Non-Virtualized) is the "bare metal" platform using the
 OPAL firmware. It runs Linux on IBM and OpenPOWER systems and it can
 be used as an hypervisor OS, running KVM guests, or simply as a host
 OS.
@@ -16,16 +16,14 @@ Supported devices
 -----------------
 
  * Multi processor support for POWER8, POWER8NVL and POWER9.
- * XSCOM, serial communication sideband bus to configure chiplets
- * Simple LPC Controller
- * Processor Service Interface (PSI) Controller
- * Interrupt Controller, XICS (POWER8) and XIVE (POWER9)
- * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge
- * Simple OCC is an on-chip microcontroller used for power management
-   tasks
- * iBT device to handle BMC communication, with the internal BMC
-   simulator provided by QEMU or an external BMC such as an Aspeed
-   QEMU machine.
+ * XSCOM, serial communication sideband bus to configure chiplets.
+ * Simple LPC Controller.
+ * Processor Service Interface (PSI) Controller.
+ * Interrupt Controller, XICS (POWER8) and XIVE (POWER9) and XIVE2 (Power10).
+ * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge.
+ * Simple OCC is an on-chip micro-controller used for power management tasks.
+ * iBT device to handle BMC communication, with the internal BMC simulator
+   provided by QEMU or an external BMC such as an Aspeed QEMU machine.
  * PNOR containing the different firmware partitions.
 
 Missing devices
@@ -33,27 +31,25 @@ Missing devices
 
 A lot is missing, among which :
 
- * POWER10 processor
- * XIVE2 (POWER10) interrupt controller
- * I2C controllers (yet to be merged)
- * NPU/NPU2/NPU3 controllers
- * EEH support for PCIe Host bridge controllers
- * NX controller
- * VAS controller
- * chipTOD (Time Of Day)
+ * I2C controllers (yet to be merged).
+ * NPU/NPU2/NPU3 controllers.
+ * EEH support for PCIe Host bridge controllers.
+ * NX controller.
+ * VAS controller.
+ * chipTOD (Time Of Day).
  * Self Boot Engine (SBE).
- * FSI bus
+ * FSI bus.
 
 Firmware
 --------
 
 The OPAL firmware (OpenPower Abstraction Layer) for OpenPower systems
 includes the runtime services ``skiboot`` and the bootloader kernel and
-initramfs ``skiroot``. Source code can be found on GitHub:
+initramfs ``skiroot``. Source code can be found on the `OpenPOWER account at
+GitHub <https://github.com/open-power>`_.
 
-  https://github.com/open-power.
-
-Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the `OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
+Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the
+`OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
 
 QEMU includes a prebuilt image of ``skiboot`` which is updated when a
 more recent version is required by the models.
@@ -83,6 +79,7 @@ and a SATA disk :
 
 Complex PCIe configuration
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 Six PHBs are defined per chip (POWER9) but no default PCI layout is
 provided (to be compatible with libvirt). One PCI device can be added
 on any of the available PCIe slots using command line options such as:
@@ -157,7 +154,7 @@ one on the command line :
 The files `palmetto-SDR.bin <http://www.kaod.org/qemu/powernv/palmetto-SDR.bin>`__
 and `palmetto-FRU.bin <http://www.kaod.org/qemu/powernv/palmetto-FRU.bin>`__
 define a Sensor Data Record repository and a Field Replaceable Unit
-inventory for a palmetto BMC. They can be used to extend the QEMU BMC
+inventory for a Palmetto BMC. They can be used to extend the QEMU BMC
 simulator.
 
 .. code-block:: bash
@@ -189,4 +186,8 @@ CAVEATS
 -------
 
  * No support for multiple HW threads (SMT=1). Same as pseries.
- * CPU can hang when doing intensive I/Os. Use ``-append powersave=off`` in that case.
+
+Maintainer contact information
+------------------------------
+
+Cédric Le Goater <clg@kaod.org>
-- 
2.31.1


