Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8746F45A244
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 13:12:17 +0100 (CET)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpUem-0006Yp-7q
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 07:12:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mpUdM-0005kA-6C; Tue, 23 Nov 2021 07:10:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33142
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mpUdJ-00053d-Ml; Tue, 23 Nov 2021 07:10:47 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ANAM8pR013227; 
 Tue, 23 Nov 2021 12:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=CAqNmSPf5HZRWbXMMvcgqxJMvQOl93z/G/wjJY2a4hA=;
 b=dFvMxy3HUwu1LMo0ZQzNxUVBRr/KV+6TCzYlytHPbBr0YrgrYbnVSnTlgufSPDU6UU3k
 qtJNDyWI4ZDFJffuTy+F3JmwanQIIOeUln6JKZOv/g/iEOGncRllQ4j5OympAF9NFeBn
 lTYaGukJiViOhhUxykduSlPehzwKT9811UdgunzCr4JrD7BEEmq7h+AO60rNBXlpVWfL
 QS4Pxf8DxIeeavcpnfJGKGOPwUIuuY2CalfLhjuYXz6BqMioZB/NeYSRULOVUjDbysaU
 7eXGjEHONnd+kxVfnT4x7uqgKlDAJ9xwtnw3WVV0tBUrx0NfAgHs/hYJeUI/kuy6DUpJ sw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgxg3225k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 12:10:39 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ANC31u2016529;
 Tue, 23 Nov 2021 12:10:39 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3cernb6n43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 12:10:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ANCAcQL34341330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 12:10:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1A5BF7806A;
 Tue, 23 Nov 2021 12:10:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDB5078060;
 Tue, 23 Nov 2021 12:10:36 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.160.47.188])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 23 Nov 2021 12:10:36 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH v2] docs: Minor updates on the powernv documentation.
Date: Tue, 23 Nov 2021 09:10:24 -0300
Message-Id: <c387f883b3db34d9fcb44ccac2ef11c35a25e18c.1637669345.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GXsAdXsawk53AOSDujUpdqSJcBfFBy_x
X-Proofpoint-ORIG-GUID: GXsAdXsawk53AOSDujUpdqSJcBfFBy_x
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_04,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230067
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
 docs/system/ppc/powernv.rst | 57 +++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
index 86186b7d2c..eda4219a27 100644
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
@@ -189,4 +186,8 @@ CAVEATS
 -------
 
  * No support for multiple HW threads (SMT=1). Same as pseries.
- * CPU can hang when doing intensive I/Os. Use ``-append powersave=off`` in that case.
+
+Maintainer contact information
+------------------------------
+
+Cédric Le Goater <clg@kaod.org>
\ No newline at end of file
-- 
2.33.1


