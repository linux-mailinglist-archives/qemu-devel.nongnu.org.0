Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3411E48C425
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:46:53 +0100 (CET)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7d1g-0001kw-3U
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:46:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEw-0006To-EA; Wed, 12 Jan 2022 06:56:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n7cEn-0007V8-OZ; Wed, 12 Jan 2022 06:56:30 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CAuV37006856; 
 Wed, 12 Jan 2022 11:56:13 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhwp723c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:13 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CBmJB9027661;
 Wed, 12 Jan 2022 11:56:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3df289tmfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 11:56:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CBu7me40370592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 11:56:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 788534207E;
 Wed, 12 Jan 2022 11:56:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35C524207D;
 Wed, 12 Jan 2022 11:56:07 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 12 Jan 2022 11:56:07 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7D1BE2201C6;
 Wed, 12 Jan 2022 12:56:06 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 07/34] docs: Clarifications and formatting changes in ppc docs.
Date: Wed, 12 Jan 2022 12:55:24 +0100
Message-Id: <20220112115551.987666-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112115551.987666-1-clg@kaod.org>
References: <20220112115551.987666-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m6gGAhl98ZQbbHfvRJb8o01S0qhwlFV8
X-Proofpoint-ORIG-GUID: m6gGAhl98ZQbbHfvRJb8o01S0qhwlFV8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1034 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120075
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_SOFTFAIL=0.665,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <3b228af4785241c7fb4a2c70f0c495d2a9adea83.1641405872.git.lagarc=
ia@br.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/specs/ppc-spapr-hcalls.rst | 21 ++++++++---------
 docs/system/ppc/pseries.rst     | 42 ++++++++++++++++-----------------
 2 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/docs/specs/ppc-spapr-hcalls.rst b/docs/specs/ppc-spapr-hcalls.=
rst
index 28daf9734a8e..6cdcef20265e 100644
--- a/docs/specs/ppc-spapr-hcalls.rst
+++ b/docs/specs/ppc-spapr-hcalls.rst
@@ -1,13 +1,12 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 sPAPR hypervisor calls
-----------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 When used with the ``pseries`` machine type, ``qemu-system-ppc64`` impleme=
nts
-a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on Power
-Architecture Reference document (LoPAR)
-<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-2020=
0812.pdf>`_.
-This document is a subset of the Power Architecture Platform Reference (PA=
PR+)
-specification (IBM internal only), which is what PowerVM, the IBM propriet=
ary
-hypervisor, adheres to.
+a set of hypervisor calls (a.k.a. hcalls) defined in the Linux on Power
+Architecture Reference ([LoPAR]_) document. This document is a subset of t=
he
+Power Architecture Platform Reference (PAPR+) specification (IBM internal =
only),
+which is what PowerVM, the IBM proprietary hypervisor, adheres to.
=20
 The subset in LoPAR is selected based on the requirements of Linux as a gu=
est.
=20
@@ -18,8 +17,8 @@ running in the guest and QEMU.
 All those hypercalls start at hcall number 0xf000 which correspond
 to an implementation specific range in PAPR.
=20
-H_RTAS (0xf000)
-^^^^^^^^^^^^^^^
+``H_RTAS (0xf000)``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 RTAS stands for Run-Time Abstraction Sercies and is a set of runtime servi=
ces
 generally provided by the firmware inside the guest to the operating syste=
m. It
@@ -44,8 +43,8 @@ Returns:
=20
   ``H_PARAMETER``: Unknown token.
=20
-H_LOGICAL_MEMOP (0xf001)
-^^^^^^^^^^^^^^^^^^^^^^^^
+``H_LOGICAL_MEMOP (0xf001)``
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
 When the guest runs in "real mode" (in powerpc terminology this means with=
 MMU
 disabled, i.e. guest effective address equals to guest physical address), =
it
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index 16394fa5218b..16893248151f 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -1,19 +1,18 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 pSeries family boards (``pseries``)
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
-The Power machine para-virtualized environment described by the `Linux on =
Power
-Architecture Reference document (LoPAR)
-<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812=
.pdf>`_
-is called pSeries. This environment is also known as sPAPR, System p guest=
s, or
-simply Power Linux guests (although it is capable of running other operati=
ng
-systems, such as AIX).
+The Power machine para-virtualized environment described by the Linux on P=
ower
+Architecture Reference ([LoPAR]_) document is called pSeries. This environ=
ment
+is also known as sPAPR, System p guests, or simply Power Linux guests (alt=
hough
+it is capable of running other operating systems, such as AIX).
=20
 Even though pSeries is designed to behave as a guest environment, it is al=
so
 capable of acting as a hypervisor OS, providing, on that role, nested
 virtualization capabilities.
=20
 Supported devices
------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
  * Multi processor support for many Power processors generations: POWER7,
    POWER7+, POWER8, POWER8NVL, POWER9, and Power10. Support for POWER5+ ex=
ists,
@@ -26,12 +25,12 @@ Supported devices
  * PCIe device pass through.
=20
 Missing devices
----------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
  * SPICE support.
=20
 Firmware
---------
+=3D=3D=3D=3D=3D=3D=3D=3D
=20
 `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
 implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
@@ -42,14 +41,14 @@ QEMU includes a prebuilt image of SLOF which is updated=
 when a more recent
 version is required.
=20
 Build directions
-----------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 .. code-block:: bash
=20
   ./configure --target-list=3Dppc64-softmmu && make
=20
 Running instructions
---------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Someone can select the pSeries machine type by running QEMU with the follo=
wing
 options:
@@ -59,7 +58,7 @@ options:
   qemu-system-ppc64 -M pseries <other QEMU arguments>
=20
 sPAPR devices
--------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 The sPAPR specification defines a set of para-virtualized devices, which a=
re
 also supported by the pSeries machine in QEMU and can be instantiated with=
 the
@@ -102,11 +101,9 @@ device, or specify one with an ID
 NVRAM device with ``-global spapr-nvram.drive=3Dpfid``.
=20
 sPAPR specification
-^^^^^^^^^^^^^^^^^^^
+-------------------
=20
-The main source of documentation on the sPAPR standard is the `Linux on Po=
wer
-Architecture Reference document (LoPAR)
-<https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200812=
.pdf>`_.
+The main source of documentation on the sPAPR standard is the [LoPAR]_ doc=
ument.
 However, documentation specific to QEMU's implementation of the specificat=
ion
 can  also be found in QEMU documentation:
=20
@@ -124,7 +121,7 @@ Other documentation available in QEMU docs directory:
   (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
=20
 Switching between the KVM-PR and KVM-HV kernel module
------------------------------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
 Currently, there are two implementations of KVM on Power, ``kvm_hv.ko`` and
 ``kvm_pr.ko``.
@@ -139,7 +136,7 @@ possible to switch between the two modes with the ``kvm=
-type`` parameter:
   instead.
=20
 KVM-PR
-^^^^^^
+------
=20
 KVM-PR uses the so-called **PR**\ oblem state of the PPC CPUs to run the g=
uests,
 i.e. the virtual machine is run in user mode and all privileged instructio=
ns
@@ -166,7 +163,7 @@ In order to run KVM-PR guests with POWER9 processors, s=
omeone will need to start
 QEMU with ``kernel_irqchip=3Doff`` command line option.
=20
 KVM-HV
-^^^^^^
+------
=20
 KVM-HV uses the hypervisor mode of more recent Power processors, that allow
 access to the bare metal hardware directly. Although POWER7 had this capab=
ility,
@@ -188,7 +185,7 @@ CPUs generations, e.g. you can run a POWER7 guest on a =
POWER8 host by using
 ``-cpu POWER8,compat=3Dpower7`` as parameter to QEMU.
=20
 Modules support
----------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 As noticed in the sections above, each module can run in a different
 environment. The following table shows with which environment each module =
can
@@ -264,8 +261,11 @@ enabled, whether or not the guest has actually entered=
 secure mode.
=20
=20
 Maintainer contact information
-------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
=20
 C=C3=A9dric Le Goater <clg@kaod.org>
=20
 Daniel Henrique Barboza <danielhb413@gmail.com>
+
+.. [LoPAR] `Linux on Power Architecture Reference document (LoPAR) revision
+   2.9 <https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-2=
0200812.pdf>`_.
--=20
2.31.1


