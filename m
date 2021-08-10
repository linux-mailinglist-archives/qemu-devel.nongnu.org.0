Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2213E558E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:35:29 +0200 (CEST)
Received: from localhost ([::1]:38006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNEO-0005Lm-Ay
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDNDD-0004Wd-1k; Tue, 10 Aug 2021 04:34:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mDNDB-0005UK-2I; Tue, 10 Aug 2021 04:34:14 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17A8Xowo168254; Tue, 10 Aug 2021 04:33:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab9x9yyw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 04:33:53 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17A8Xrqq168570;
 Tue, 10 Aug 2021 04:33:53 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ab9x9yyuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 04:33:53 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17A8SsHZ003791;
 Tue, 10 Aug 2021 08:33:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 3a9ht8d2px-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 08:33:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17A8Ub4D56557964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Aug 2021 08:30:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEE9AAE045;
 Tue, 10 Aug 2021 08:33:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54A37AE05D;
 Tue, 10 Aug 2021 08:33:48 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 10 Aug 2021 08:33:48 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.82.85])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 34C5D22016B;
 Tue, 10 Aug 2021 10:33:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH] tests/acceptance: Test powernv machines
Date: Tue, 10 Aug 2021 10:33:46 +0200
Message-Id: <20210810083346.730652-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iEpJ-oGxqQxRbc0H1p2IREUEXxpJHm12
X-Proofpoint-GUID: MNX3KAtHTCcQQ2PbqpiNMxcVayldOI6C
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-10_03:2021-08-06,
 2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1034 priorityscore=1501 bulkscore=0
 mlxlogscore=833 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100053
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fetch the OpenPOWER images to boot the powernv8 and powernv9 machines
with a simple PCI layout.

Cc: Cleber Rosa <crosa@redhat.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 tests/acceptance/boot_linux_console.py | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 5248c8097df9..da93a475ca87 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1176,6 +1176,48 @@ def test_ppc64_e500(self):
         tar_hash =3D '6951d86d644b302898da2fd701739c9406527fe1'
         self.do_test_advcal_2018('19', tar_hash, 'uImage')
=20
+    def do_test_ppc64_powernv(self, proc):
+
+        images_url =3D ('https://github.com/open-power/op-build/releases/d=
ownload/v2.7/')
+
+        skiboot_url =3D images_url + 'skiboot.lid'
+        skiboot_hash =3D 'a9ffcddbf238f86cda4b2cae2882d6bd13cff8489109758a=
4980efaf154f4a29'
+        skiboot_path =3D self.fetch_asset(skiboot_url, asset_hash=3Dskiboo=
t_hash,
+                                       algorithm=3D'sha256')
+
+        kernel_url =3D images_url + 'zImage.epapr'
+        kernel_hash =3D '0ab237df661727e5392cee97460e8674057a883c5f74381a1=
28fa772588d45cd'
+        kernel_path =3D self.fetch_asset(kernel_url, asset_hash=3Dkernel_h=
ash,
+                                       algorithm=3D'sha256')
+        self.vm.set_console()
+        self.vm.add_args('-bios', skiboot_path,
+                         '-kernel', kernel_path,
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


