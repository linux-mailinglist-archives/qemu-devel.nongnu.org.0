Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFD492821
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 15:15:39 +0100 (CET)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9pGs-0006Zi-Dv
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 09:15:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDM-0003nH-4A; Tue, 18 Jan 2022 08:07:56 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22766
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9oDJ-0000EX-Bb; Tue, 18 Jan 2022 08:07:55 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20ICQLpx022030; 
 Tue, 18 Jan 2022 13:07:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnqv4hub7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:44 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20ICefx0005968;
 Tue, 18 Jan 2022 13:07:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dnqv4huae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20ID7d5e025814;
 Tue, 18 Jan 2022 13:07:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3dknw9mhbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 13:07:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20ID7dwG46596484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 13:07:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB2644C046;
 Tue, 18 Jan 2022 13:07:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 664B64C044;
 Tue, 18 Jan 2022 13:07:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 18 Jan 2022 13:07:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.52.153])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8F87722016C;
 Tue, 18 Jan 2022 14:07:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 10/31] tests/avocado: ppc: Add smoke tests for MPC7400 and
 MPC7450 families
Date: Tue, 18 Jan 2022 14:07:09 +0100
Message-Id: <20220118130730.1927983-11-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118130730.1927983-1-clg@kaod.org>
References: <20220118130730.1927983-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zNvorW9dj1HOyGxHTl_B7NaoZ7xHhgHk
X-Proofpoint-ORIG-GUID: SyrQtwNcPruIRczgxASNJud_eFvkKxqD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_03,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1034
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180081
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.322,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

These tests ensure that our emulation for these cpus is not completely
broken and we can at least run OpenBIOS on them.

$ make check-avocado AVOCADO_TESTS=3D../tests/avocado/ppc_74xx.py

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220117144757.782441-1-farosas@linux.ibm.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/avocado/ppc_74xx.py | 123 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 tests/avocado/ppc_74xx.py

diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
new file mode 100644
index 000000000000..556a9a7da968
--- /dev/null
+++ b/tests/avocado/ppc_74xx.py
@@ -0,0 +1,123 @@
+# Smoke tests for 74xx cpus (aka G4).
+#
+# Copyright (c) 2021, IBM Corp.
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+
+class ppc74xxCpu(QemuSystemTest):
+    """
+    :avocado: tags=3Darch:ppc
+    """
+    timeout =3D 5
+
+    def test_ppc_7400(self):
+        """
+        :avocado: tags=3Dcpu:7400
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7410(self):
+        """
+        :avocado: tags=3Dcpu:7410
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,74xx')
+
+    def test_ppc_7441(self):
+        """
+        :avocado: tags=3Dcpu:7441
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7445(self):
+        """
+        :avocado: tags=3Dcpu:7445
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7447(self):
+        """
+        :avocado: tags=3Dcpu:7447
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7447a(self):
+        """
+        :avocado: tags=3Dcpu:7447a
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7448(self):
+        """
+        :avocado: tags=3Dcpu:7448
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,MPC86xx')
+
+    def test_ppc_7450(self):
+        """
+        :avocado: tags=3Dcpu:7450
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7451(self):
+        """
+        :avocado: tags=3Dcpu:7451
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7455(self):
+        """
+        :avocado: tags=3Dcpu:7455
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7457(self):
+        """
+        :avocado: tags=3Dcpu:7457
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
+
+    def test_ppc_7457a(self):
+        """
+        :avocado: tags=3Dcpu:7457a
+        """
+        self.vm.set_console()
+        self.vm.launch()
+        wait_for_console_pattern(self, '>> OpenBIOS')
+        wait_for_console_pattern(self, '>> CPU type PowerPC,G4')
--=20
2.31.1


