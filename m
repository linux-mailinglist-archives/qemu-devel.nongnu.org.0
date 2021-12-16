Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54940477DB8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 21:37:09 +0100 (CET)
Received: from localhost ([::1]:38340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxxUy-0000lW-E1
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 15:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKq-00019j-FU; Thu, 16 Dec 2021 15:26:40 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxxKo-0007HS-CU; Thu, 16 Dec 2021 15:26:39 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKPeL2004426; 
 Thu, 16 Dec 2021 20:26:30 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cypc74v1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:30 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGKDXcq026882;
 Thu, 16 Dec 2021 20:26:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3cy77pj7yc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 20:26:28 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGKQQXY37421488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 20:26:26 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07F9652052;
 Thu, 16 Dec 2021 20:26:26 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id BB78652050;
 Thu, 16 Dec 2021 20:26:25 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.48.122])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 16A7C2201A0;
 Thu, 16 Dec 2021 21:26:25 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 012/101] docs: Minor updates on the powernv documentation.
Date: Thu, 16 Dec 2021 21:24:45 +0100
Message-Id: <20211216202614.414266-13-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216202614.414266-1-clg@kaod.org>
References: <20211216202614.414266-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zk9fJhbNZPHymkjBifTrZ9-7syXdDel0
X-Proofpoint-GUID: Zk9fJhbNZPHymkjBifTrZ9-7syXdDel0
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_08,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=997 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1034
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160109
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Message-Id: <c387f883b3db34d9fcb44ccac2ef11c35a25e18c.1637669345.git.lagarc=
ia@br.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
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
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-PowerNV (as Non-Virtualized) is the "baremetal" platform using the
+PowerNV (as Non-Virtualized) is the "bare metal" platform using the
 OPAL firmware. It runs Linux on IBM and OpenPOWER systems and it can
 be used as an hypervisor OS, running KVM guests, or simply as a host
 OS.
@@ -16,16 +16,14 @@ Supported devices
 -----------------
=20
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
+ * Interrupt Controller, XICS (POWER8) and XIVE (POWER9) and XIVE2 (Power1=
0).
+ * POWER8 PHB3 PCIe Host bridge and POWER9 PHB4 PCIe Host bridge.
+ * Simple OCC is an on-chip micro-controller used for power management tas=
ks.
+ * iBT device to handle BMC communication, with the internal BMC simulator
+   provided by QEMU or an external BMC such as an Aspeed QEMU machine.
  * PNOR containing the different firmware partitions.
=20
 Missing devices
@@ -33,27 +31,25 @@ Missing devices
=20
 A lot is missing, among which :
=20
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
=20
 Firmware
 --------
=20
 The OPAL firmware (OpenPower Abstraction Layer) for OpenPower systems
 includes the runtime services ``skiboot`` and the bootloader kernel and
-initramfs ``skiroot``. Source code can be found on GitHub:
+initramfs ``skiroot``. Source code can be found on the `OpenPOWER account =
at
+GitHub <https://github.com/open-power>`_.
=20
-  https://github.com/open-power.
-
-Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the `=
OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
+Prebuilt images of ``skiboot`` and ``skiroot`` are made available on the
+`OpenPOWER <https://github.com/open-power/op-build/releases/>`__ site.
=20
 QEMU includes a prebuilt image of ``skiboot`` which is updated when a
 more recent version is required by the models.
@@ -83,6 +79,7 @@ and a SATA disk :
=20
 Complex PCIe configuration
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 Six PHBs are defined per chip (POWER9) but no default PCI layout is
 provided (to be compatible with libvirt). One PCI device can be added
 on any of the available PCIe slots using command line options such as:
@@ -157,7 +154,7 @@ one on the command line :
 The files `palmetto-SDR.bin <http://www.kaod.org/qemu/powernv/palmetto-SDR=
.bin>`__
 and `palmetto-FRU.bin <http://www.kaod.org/qemu/powernv/palmetto-FRU.bin>`=
__
 define a Sensor Data Record repository and a Field Replaceable Unit
-inventory for a palmetto BMC. They can be used to extend the QEMU BMC
+inventory for a Palmetto BMC. They can be used to extend the QEMU BMC
 simulator.
=20
 .. code-block:: bash
@@ -189,4 +186,8 @@ CAVEATS
 -------
=20
  * No support for multiple HW threads (SMT=3D1). Same as pseries.
- * CPU can hang when doing intensive I/Os. Use ``-append powersave=3Doff``=
 in that case.
+
+Maintainer contact information
+------------------------------
+
+C=C3=A9dric Le Goater <clg@kaod.org>
--=20
2.31.1


