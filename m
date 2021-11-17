Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2769454E5E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:19:42 +0100 (CET)
Received: from localhost ([::1]:34954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnRPB-0004H4-VL
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mnRM6-0001yJ-RD; Wed, 17 Nov 2021 15:16:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mnRM4-0004PS-Tg; Wed, 17 Nov 2021 15:16:30 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHIk0De023377; 
 Wed, 17 Nov 2021 20:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=d9AVXX1IirCqrLH4ya5t4yXxxA+qSyYuoVpkEl8aaMw=;
 b=K4ghjc1GqtkvtHBHlAAhNQVvUdJ66Lm4661Tc5+KlWn8nBaC0vyGhwQrnBeDG2Uc9s10
 AaazE61FJ4CrdZD/fkA/JAcWzzHoGsqq381ysUakHWizsR8XJOC1grjf28x+vcqleC95
 1OzFOfvDSLSKVpJAxE5XpUJIyPzQ5mASWltXNRu3yte6U74ufKk0CuKDvKuiCzliHEvj
 aiXEOEVXeyYjG36G8UHYHytC1SXrgbs4auxunigeSgbACYJnXbhczxSr403J2W438qKu
 hXtlHw0CA8hbBGbn6UYWf+dH2Fqru0iyprp7M1w7XHHdcaGD55NipkXOi8iHBIb7bcFE zQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd51vd1p8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 20:16:19 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHKDaHw002558;
 Wed, 17 Nov 2021 20:16:19 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 3cd81d8sd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 20:16:19 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHKGITR63963426
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 20:16:18 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 237D9AE073;
 Wed, 17 Nov 2021 20:16:18 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0278AE077;
 Wed, 17 Nov 2021 20:16:16 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.160.118.240])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 20:16:16 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH] docs: Minor updates on the powernv documentation.
Date: Wed, 17 Nov 2021 17:16:14 -0300
Message-Id: <1c40a43de8b899dccaac137c88007ec72609952a.1637180046.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DRCylSkXGINc8y7-o1iBP_J-OgpBQQz4
X-Proofpoint-GUID: DRCylSkXGINc8y7-o1iBP_J-OgpBQQz4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_07,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170090
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/system/ppc/powernv.rst | 56 +++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
index 86186b7d2c..907c4ce4f9 100644
--- a/docs/system/ppc/powernv.rst
+++ b/docs/system/ppc/powernv.rst
@@ -1,7 +1,7 @@
-PowerNV family boards (``powernv8``, ``powernv9``)
+PowerNV family boards (``powernv8``, ``powernv9``, ``power10``)
 ==================================================================
 
-PowerNV (as Non-Virtualized) is the "baremetal" platform using the
+PowerNV (as Non-Virtualized) is the "bare metal" platform using the
 OPAL firmware. It runs Linux on IBM and OpenPOWER systems and it can
 be used as an hypervisor OS, running KVM guests, or simply as a host
 OS.
@@ -15,17 +15,15 @@ beyond the scope of what QEMU addresses today.
 Supported devices
 -----------------
 
- * Multi processor support for POWER8, POWER8NVL and POWER9.
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
+ * Multi processor support for POWER8, POWER8NVL and Power9.
+ * XSCOM, serial communication sideband bus to configure chiplets.
+ * Simple LPC Controller.
+ * Processor Service Interface (PSI) Controller.
+ * Interrupt Controller, XICS (POWER8) and XIVE (Power9) and XIVE2 (Power10).
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
@@ -190,3 +187,8 @@ CAVEATS
 
  * No support for multiple HW threads (SMT=1). Same as pseries.
  * CPU can hang when doing intensive I/Os. Use ``-append powersave=off`` in that case.
+
+Maintainer contact information
+------------------------------
+
+Cédric Le Goater <clg@kaod.org>
\ No newline at end of file
-- 
2.33.1


