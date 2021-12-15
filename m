Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDB1475F73
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:37:37 +0100 (CET)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYDg-00020o-0w
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:37:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhZ-0003NH-G4; Wed, 15 Dec 2021 12:04:25 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXhX-0004a5-I7; Wed, 15 Dec 2021 12:04:25 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfaUK026359; 
 Wed, 15 Dec 2021 17:04:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrwvk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:12 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BFGgSEq032102;
 Wed, 15 Dec 2021 17:04:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cygtrwvj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH2ins024823;
 Wed, 15 Dec 2021 17:04:09 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 3cy78e7ks7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH46BE40370464
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C83424C040;
 Wed, 15 Dec 2021 17:04:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E81D4C04E;
 Wed, 15 Dec 2021 17:04:06 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:06 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A173B220247;
 Wed, 15 Dec 2021 18:04:05 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 017/102] docs: rSTify ppc-spapr-hcalls.txt
Date: Wed, 15 Dec 2021 18:02:32 +0100
Message-Id: <20211215170357.321643-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dsDjk51TIxxKHCNJNoxBSlRfkd7QbEAx
X-Proofpoint-GUID: mallZCCtnaWhNbv21qux_L9HaDG_dD7-
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=855 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1034 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
[ clg: replaced lingua by terminology ]
Message-Id: <e20319dcf0ec37bedd915c740c3813eb0e58ead4.1638982486.git.lagarc=
ia@br.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 docs/specs/ppc-spapr-hcalls.txt | 92 ++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hcalls.=
txt
index 93fe3da91b16..72a768b5a038 100644
--- a/docs/specs/ppc-spapr-hcalls.txt
+++ b/docs/specs/ppc-spapr-hcalls.txt
@@ -1,9 +1,15 @@
-When used with the "pseries" machine type, QEMU-system-ppc64 implements
-a set of hypervisor calls using a subset of the server "PAPR" specification
-(IBM internal at this point), which is also what IBM's proprietary hypervi=
sor
-adheres too.
+sPAPR hypervisor calls
+----------------------
=20
-The subset is selected based on the requirements of Linux as a guest.
+When used with the ``pseries`` machine type, ``qemu-system-ppc64`` impleme=
nts
+a set of hypervisor calls (a.k.a. hcalls) defined in the `Linux on Power
+Architecture Reference document (LoPAR)
+<https://cdn.openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-2020=
0812.pdf>`_.
+This document is a subset of the Power Architecture Platform Reference (PA=
PR+)
+specification (IBM internal only), which is what PowerVM, the IBM propriet=
ary
+hypervisor, adheres to.
+
+The subset in LoPAR is selected based on the requirements of Linux as a gu=
est.
=20
 In addition to those calls, we have added our own private hypervisor
 calls which are mostly used as a private interface between the firmware
@@ -12,13 +18,14 @@ running in the guest and QEMU.
 All those hypercalls start at hcall number 0xf000 which correspond
 to an implementation specific range in PAPR.
=20
-- H_RTAS (0xf000)
+H_RTAS (0xf000)
+^^^^^^^^^^^^^^^
=20
-RTAS is a set of runtime services generally provided by the firmware
-inside the guest to the operating system. It predates the existence
-of hypervisors (it was originally an extension to Open Firmware) and
-is still used by PAPR to provide various services that aren't performance
-sensitive.
+RTAS stands for Run-Time Abstraction Sercies and is a set of runtime servi=
ces
+generally provided by the firmware inside the guest to the operating syste=
m. It
+predates the existence of hypervisors (it was originally an extension to O=
pen
+Firmware) and is still used by PAPR and LoPAR to provide various services =
that
+are not performance sensitive.
=20
 We currently implement the RTAS services in QEMU itself. The actual RTAS
 "firmware" blob in the guest is a small stub of a few instructions which
@@ -26,22 +33,25 @@ calls our private H_RTAS hypervisor call to pass the RT=
AS calls to QEMU.
=20
 Arguments:
=20
-  r3 : H_RTAS (0xf000)
-  r4 : Guest physical address of RTAS parameter block
+  ``r3``: ``H_RTAS (0xf000)``
+
+  ``r4``: Guest physical address of RTAS parameter block.
=20
 Returns:
=20
-  H_SUCCESS   : Successfully called the RTAS function (RTAS result
-                will have been stored in the parameter block)
-  H_PARAMETER : Unknown token
+  ``H_SUCCESS``: Successfully called the RTAS function (RTAS result will h=
ave
+  been stored in the parameter block).
=20
-- H_LOGICAL_MEMOP (0xf001)
+  ``H_PARAMETER``: Unknown token.
=20
-When the guest runs in "real mode" (in powerpc lingua this means
-with MMU disabled, ie guest effective =3D=3D guest physical), it only
-has access to a subset of memory and no IOs.
+H_LOGICAL_MEMOP (0xf001)
+^^^^^^^^^^^^^^^^^^^^^^^^
=20
-PAPR provides a set of hypervisor calls to perform cacheable or
+When the guest runs in "real mode" (in powerpc terminology this means with=
 MMU
+disabled, i.e. guest effective address equals to guest physical address), =
it
+only has access to a subset of memory and no I/Os.
+
+PAPR and LoPAR provides a set of hypervisor calls to perform cacheable or
 non-cacheable accesses to any guest physical addresses that the
 guest can use in order to access IO devices while in real mode.
=20
@@ -58,21 +68,33 @@ is used by our SLOF firmware to invert the screen.
=20
 Arguments:
=20
-  r3: H_LOGICAL_MEMOP (0xf001)
-  r4: Guest physical address of destination
-  r5: Guest physical address of source
-  r6: Individual element size
-        0 =3D 1 byte
-        1 =3D 2 bytes
-        2 =3D 4 bytes
-        3 =3D 8 bytes
-  r7: Number of elements
-  r8: Operation
-        0 =3D copy
-        1 =3D xor
+  ``r3 ``: ``H_LOGICAL_MEMOP (0xf001)``
+
+  ``r4``: Guest physical address of destination.
+
+  ``r5``: Guest physical address of source.
+
+  ``r6``: Individual element size, defined by the binary logarithm of the
+  desired size. Supported values are:
+
+    ``0`` =3D 1 byte
+
+    ``1`` =3D 2 bytes
+
+    ``2`` =3D 4 bytes
+
+    ``3`` =3D 8 bytes
+
+  ``r7``: Number of elements.
+
+  ``r8``: Operation. Supported values are:
+
+    ``0``: copy
+
+    ``1``: xor
=20
 Returns:
=20
-  H_SUCCESS   : Success
-  H_PARAMETER : Invalid argument
+  ``H_SUCCESS``: Success.
=20
+  ``H_PARAMETER``: Invalid argument.
\ No newline at end of file
--=20
2.31.1


