Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAB2ECF19
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:52:08 +0100 (CET)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTpn-00023y-HJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxThQ-00087U-SV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:43:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxThK-0002pp-8O
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:43:28 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DBPTq3wh8zl29j;
 Thu,  7 Jan 2021 19:42:07 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Jan 2021
 19:43:10 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 8/8] acpi: Update _DSM method in expected files
Date: Thu, 7 Jan 2021 19:40:43 +0800
Message-ID: <20210107114043.9624-9-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107114043.9624-1-cenjiahui@huawei.com>
References: <20210107114043.9624-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A new _DSM #5 method is added.

Update expected DSDT files accordingly, and re-enable their testing.

Full diff of changed files disassembly:

diff -ru /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl
--- /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl      2021-01-07 17:31:36.286831080 +0800
+++ /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl      2021-01-07 17:36:16.706831080 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00000BCF (3023)
+ *     Length           0x00000BD7 (3031)
  *     Revision         0x02
- *     Checksum         0x29
+ *     Checksum         0x99
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1302,9 +1302,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.dsl /tmp/new/tests/data/acpi/virt/DSDT.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.dsl      2021-01-07 17:31:36.546831080 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.dsl      2021-01-07 17:36:17.146831080 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000144C (5196)
+ *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0xF0
+ *     Checksum         0x60
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1838,9 +1838,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.memhp.dsl /tmp/new/tests/data/acpi/virt/DSDT.memhp.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.memhp.dsl        2021-01-07 17:31:36.546831080 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.memhp.dsl        2021-01-07 17:36:17.156831080 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000199D (6557)
+ *     Length           0x000019A5 (6565)
  *     Revision         0x02
- *     Checksum         0x11
+ *     Checksum         0x90
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1840,9 +1840,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.numamem.dsl /tmp/new/tests/data/acpi/virt/DSDT.numamem.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.numamem.dsl      2021-01-07 17:31:36.556831080 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.numamem.dsl      2021-01-07 17:36:17.156831080 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x0000144C (5196)
+ *     Length           0x00001454 (5204)
  *     Revision         0x02
- *     Checksum         0xF0
+ *     Checksum         0x60
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1838,9 +1838,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
diff -ru /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl
--- /tmp/old/tests/data/acpi/virt/DSDT.pxb.dsl  2021-01-07 17:31:36.566831080 +0800
+++ /tmp/new/tests/data/acpi/virt/DSDT.pxb.dsl  2021-01-07 17:36:17.166831080 +0800
@@ -9,9 +9,9 @@
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001DF9 (7673)
+ *     Length           0x00001E09 (7689)
  *     Revision         0x02
- *     Checksum         0x42
+ *     Checksum         0x30
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
@@ -1810,9 +1810,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)
@@ -3025,9 +3030,14 @@
                     {
                         Return (Buffer (One)
                         {
-                             0x01                                             // .
+                             0x21                                             // !
                         })
                     }
+
+                    If ((Arg2 == 0x05))
+                    {
+                        Return (Zero)
+                    }
                 }

                 Return (Buffer (One)

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 tests/data/acpi/microvm/DSDT.pcie           | Bin 3023 -> 3031 bytes
 tests/data/acpi/virt/DSDT                   | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.memhp             | Bin 6557 -> 6565 bytes
 tests/data/acpi/virt/DSDT.numamem           | Bin 5196 -> 5204 bytes
 tests/data/acpi/virt/DSDT.pxb               | Bin 7673 -> 7689 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 6 files changed, 5 deletions(-)

diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
index 4b765541e372f4ba4e25529c14acf696516c8f61..e590b98f9960025f75dd0544492d3088781406dc 100644
GIT binary patch
delta 59
zcmV-B0L1^#7uOdGL{mgm*9!mu0-2Et8v;SPu_reH0Z6l70pke>HD5$iO$4ARlS&I8
R2_c{dlWGbDqyUp@3uOk*5ZC|!

delta 51
zcmcaEeqNl*CD<k8JU0UaljcM&X(rE|8`aGj867sqGd||z(2aKq_GMY1IN6I^o{@2K
H5qBy8b(js<

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index bc519abff9cadc1552e4e586b0a3f5f0db498f4a..ea8a0869af1637ab75fe335e100256a2acf85e16 100644
GIT binary patch
delta 58
zcmX@3aYcj6CD<h-M1+BXDPba)G-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{T<qzlp

delta 50
zcmcbjaYlp7CD<jzM}&ca>BB@WX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%yeGTXU

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
index 54728e2b4b8b959f3f829386f6a388ef2600e747..897648637cc6c8af47c67a9a349477c0240f833b 100644
GIT binary patch
delta 60
zcmV-C0K@;CGo>>ML{mgmr5OMK0+5jk8v=lsu_qV_0!FB#K?w>7HD5$iO$4ARlSvaF
S2_c{dlWGbDqyV#N6Ep_<;t(eQ

delta 52
zcmZ2#JlB}ZCD<iot|S8kli)-yX{L_p8`UK^nf#V7cI4#Z(2aKq_GMY1IN4KJo{@2L
Ip|A-X0Bmp#CjbBd

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
index bc519abff9cadc1552e4e586b0a3f5f0db498f4a..ea8a0869af1637ab75fe335e100256a2acf85e16 100644
GIT binary patch
delta 58
zcmX@3aYcj6CD<h-M1+BXDPba)G-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{T<qzlp

delta 50
zcmcbjaYlp7CD<jzM}&ca>BB@WX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%yeGTXU

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index 76f5f1c2fd487644c6b4f827a70ad770edb9fdc9..ce3b67dff277e23f43925b1adcbb55c9d0b4eee3 100644
GIT binary patch
delta 95
zcmexq-D$(+66_MfDaXLTWH6CShVkA;bqP);=h>SbIcqpMOygaGeOVT0PW~n%FQmAD
ieR38T>k@_~g3OEz(M@hE7QYkXLQ%sBS2I~m_AvnX%^QRO

delta 79
zcmeCQ`DxAN66_N4Q<i~&$!Q{&4CCF6>Jpqx-m^A4a@KHi=*GJQ`?4%hocvElo{Mpb
ZATuLFbd%rm#ovUuP~;dHC#%Um1^}tB7n}e9

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 42418e58e7..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/microvm/DSDT.pcie",
-"tests/data/acpi/virt/DSDT",
-"tests/data/acpi/virt/DSDT.memhp",
-"tests/data/acpi/virt/DSDT.numamem",
-"tests/data/acpi/virt/DSDT.pxb",
-- 
2.29.2


