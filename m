Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E03EE9FA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:34:41 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvUW-0005t9-8F
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mFvR4-0001Er-NP
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:31:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mFvR2-0000nI-H9
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:31:06 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17H92vD2140571; Tue, 17 Aug 2021 05:30:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aga21rw9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 05:30:45 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17H945it148556;
 Tue, 17 Aug 2021 05:30:45 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aga21rw8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 05:30:45 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17H9QvgV026821;
 Tue, 17 Aug 2021 09:30:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3ae5f8ckhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 09:30:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17H9UeOv57737538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Aug 2021 09:30:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E21FAA4082;
 Tue, 17 Aug 2021 09:30:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78D41A407E;
 Tue, 17 Aug 2021 09:30:39 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 17 Aug 2021 09:30:39 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.64.176])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B8A9322013D;
 Tue, 17 Aug 2021 11:30:37 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/acceptance: Test powernv machines
Date: Tue, 17 Aug 2021 11:30:36 +0200
Message-Id: <20210817093036.1288791-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7TdJJgfgBZ4hKDZ-Fb1Gkmi7cz90-DTr
X-Proofpoint-ORIG-GUID: efkB18DUNr-WLEQki5AVuQ28ATENTixy
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_03:2021-08-16,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=844 clxscore=1034
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108170057
Received-SPF: softfail client-ip=148.163.156.1; envelope-from=clg@kaod.org;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
with a simple PCI layout.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Since v2:

 - Change the skiboot.lid file to use the one shipped with QEMU
=20
 tests/acceptance/boot_linux_console.py | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 5248c8097df9..59c9309c4d0b 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1176,6 +1176,41 @@ def test_ppc64_e500(self):
         tar_hash =3D '6951d86d644b302898da2fd701739c9406527fe1'
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
=20
+    def do_test_ppc64_powernv(self, proc):
+        images_url =3D ('https://github.com/open-power/op-build/releases/d=
ownload/v2.7/')
+
+        kernel_url =3D images_url + 'zImage.epapr'
+        kernel_hash =3D '0ab237df661727e5392cee97460e8674057a883c5f74381a1=
28fa772588d45cd'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash,
+                                       algorithm=3D'sha256')
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', 'console=3Dtty0 console=3Dhvc0',
+                         '-device', 'pcie-pci-bridge,id=3Dbridge1,bus=3Dpc=
ie.1,addr=3D0x0',
+                         '-device', 'nvme,bus=3Dpcie.2,addr=3D0x0,serial=
=3D1234',
+                         '-device', 'e1000e,bus=3Dbridge1,addr=3D0x3',
+                         '-device', 'nec-usb-xhci,bus=3Dbridge1,addr=3D0x2=
')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("CPU: " + proc + " generation proces=
sor")
+        self.wait_for_console_pattern("zImage starting: loaded")
+        self.wait_for_console_pattern("Run /init as init process")
+        self.wait_for_console_pattern("Creating 1 MTD partitions")
+
+    def test_ppc_powernv8(self):
+        """
+        :avocado: tags=3Darch:ppc64
+        :avocado: tags=3Dmachine:powernv8
+        """
+        self.do_test_ppc64_powernv('P8')
+
+    def test_ppc_powernv9(self):
+        """
+        :avocado: tags=3Darch:ppc64
+        :avocado: tags=3Dmachine:powernv9
+        """
+        self.do_test_ppc64_powernv('P9')
+
     def test_ppc_g3beige(self):
         """
         :avocado: tags=3Darch:ppc
--=20
2.31.1


