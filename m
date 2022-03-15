Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE54D9502
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:08:22 +0100 (CET)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1I6-0001x9-3j
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:08:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0ot-0002E9-NX; Tue, 15 Mar 2022 02:38:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nU0os-0007t8-1Y; Tue, 15 Mar 2022 02:38:11 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22F3fpuY020922; 
 Tue, 15 Mar 2022 06:37:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etk49jt0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:59 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22F6IsVJ031324;
 Tue, 15 Mar 2022 06:37:59 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3etk49jsya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:58 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22F6XMha022957;
 Tue, 15 Mar 2022 06:37:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3erk58mypc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Mar 2022 06:37:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22F6br2844630306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Mar 2022 06:37:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE27811C268;
 Tue, 15 Mar 2022 06:37:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5D9E11C1C2;
 Tue, 15 Mar 2022 06:37:44 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 15 Mar 2022 06:37:44 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.77.144])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 021962202F6;
 Tue, 15 Mar 2022 07:37:43 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 10/20] avocado/ppc_74xx.py: check TCG accel for all tests
Date: Tue, 15 Mar 2022 07:37:26 +0100
Message-Id: <20220315063736.592808-11-clg@kaod.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
References: <20220315063736.592808-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dDD-dyeeQjhjfxBJK0_m7r4QfYAUXF6Z
X-Proofpoint-GUID: xy5Xe-p3DugQZeKuEAnUxLtK0bvlALr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_14,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1034 priorityscore=1501 phishscore=0 spamscore=0
 mlxlogscore=913 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203150042
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

All tests of this file, when running in an IBM POWER host and with
--disable-tcg, fail in a similar manner:

        Command: ./qemu-system-ppc -display none -vga none (...)
-cpu 7400 (...)
        Output: ioctl(KVM_CREATE_VM) failed: 22 Invalid argument
PPC KVM module is not loaded. Try modprobe kvm_pr.
qemu-system-ppc: failed to initialize kvm: Invalid argument

We don't have a way of telling which KVM module is loaded in a Power
host (kvm_hv or kvm_pr). For now let's make all the tests of this
file depend on TCG support.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220310183011.110391-6-danielhb413@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/avocado/ppc_74xx.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
index 556a9a7da968..f54757c243f1 100644
--- a/tests/avocado/ppc_74xx.py
+++ b/tests/avocado/ppc_74xx.py
@@ -11,6 +11,7 @@
 class ppc74xxCpu(QemuSystemTest):
     """
     :avocado: tags=3Darch:ppc
+    :avocado: tags=3Daccel:tcg
     """
     timeout =3D 5
=20
@@ -18,6 +19,7 @@ def test_ppc_7400(self):
         """
         :avocado: tags=3Dcpu:7400
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -27,6 +29,7 @@ def test_ppc_7410(self):
         """
         :avocado: tags=3Dcpu:7410
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -36,6 +39,7 @@ def test_ppc_7441(self):
         """
         :avocado: tags=3Dcpu:7441
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -45,6 +49,7 @@ def test_ppc_7445(self):
         """
         :avocado: tags=3Dcpu:7445
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -54,6 +59,7 @@ def test_ppc_7447(self):
         """
         :avocado: tags=3Dcpu:7447
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -63,6 +69,7 @@ def test_ppc_7447a(self):
         """
         :avocado: tags=3Dcpu:7447a
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -72,6 +79,7 @@ def test_ppc_7448(self):
         """
         :avocado: tags=3Dcpu:7448
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -81,6 +89,7 @@ def test_ppc_7450(self):
         """
         :avocado: tags=3Dcpu:7450
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -90,6 +99,7 @@ def test_ppc_7451(self):
         """
         :avocado: tags=3Dcpu:7451
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -99,6 +109,7 @@ def test_ppc_7455(self):
         """
         :avocado: tags=3Dcpu:7455
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -108,6 +119,7 @@ def test_ppc_7457(self):
         """
         :avocado: tags=3Dcpu:7457
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
@@ -117,6 +129,7 @@ def test_ppc_7457a(self):
         """
         :avocado: tags=3Dcpu:7457a
         """
+        self.require_accelerator("tcg")
         self.vm.set_console()
         self.vm.launch()
         wait_for_console_pattern(self, '>> OpenBIOS')
--=20
2.34.1


