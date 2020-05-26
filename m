Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2D71A2270
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Apr 2020 15:00:21 +0200 (CEST)
Received: from localhost ([::1]:35702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMAJX-0001gC-GU
	for lists+qemu-devel@lfdr.de; Wed, 08 Apr 2020 09:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <miaoyubo@huawei.com>) id 1jMAI6-0008VI-Mo
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <miaoyubo@huawei.com>) id 1jMAI5-00057n-5i
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:58:50 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:36626 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <miaoyubo@huawei.com>) id 1jMAI4-00056R-Ei
 for qemu-devel@nongnu.org; Wed, 08 Apr 2020 08:58:49 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E71CBAE3E4A40088D63C;
 Wed,  8 Apr 2020 20:58:44 +0800 (CST)
Received: from DESKTOP-D7EVK5B.china.huawei.com (10.173.221.29) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 20:58:35 +0800
From: Yubo Miao <miaoyubo@huawei.com>
To: <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>, <lersek@redhat.com>
Subject: [PATCH v6 6/8] unit-test: The files changed.
Date: Wed, 8 Apr 2020 20:58:14 +0800
Message-ID: <20200408125816.955-7-miaoyubo@huawei.com>
X-Mailer: git-send-email 2.24.1.windows.2
In-Reply-To: <20200408125816.955-1-miaoyubo@huawei.com>
References: <20200408125816.955-1-miaoyubo@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.29]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: berrange@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, miaoyubo@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: miaoyubo <miaoyubo@huawei.com>

The unit-test is seperated into three patches:
1. The files changed and list in bios-tables-test-allowed-diff.h
2. The unit-test
3. The binary file and clear bios-tables-test-allowed-diff.h

The ASL diff would also be listed.
Sice there are 1000+lines diff, some changes would be omitted.

  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000014BB (5307)
+ *     Length           0x00001E7A (7802)
  *     Revision         0x02
- *     Checksum         0xD1
+ *     Checksum         0x57
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)

+        Device (PC80)
+        {
+            Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardw=
are ID
+            Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
+            Name (_ADR, Zero)  // _ADR: Address
+            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
+            Name (_SEG, Zero)  // _SEG: PCI Segment
+            Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
+            Name (_UID, 0x80)  // _UID: Unique ID
+            Name (_STR, Unicode ("pxb Device"))  // _STR: Description St=
ring
+            Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
+            {
+                Package (0x04)
+                {
+                    0xFFFF,
+                    Zero,
+                    GSI0,
+                    Zero
+                },
+

Packages are omitted.

+                Package (0x04)
+                {
+                    0x001FFFFF,
+                    0x03,
+                    GSI2,
+                    Zero
+                }
+            })
+            Device (GSI0)
+            {
+                Name (_HID, "PNP0C0F" /* PCI Interrupt Link Device */)  =
// _HID: Hardware ID
+                Name (_UID, Zero)  // _UID: Unique ID
+                Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resou=
rce Settings
+                {
+                    Interrupt (ResourceConsumer, Level, ActiveHigh, Excl=
usive, ,, )
+                    {
+                        0x00000023,
+                    }
+                })
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resour=
ce Settings
+                {
+                    Interrupt (ResourceConsumer, Level, ActiveHigh, Excl=
usive, ,, )
+                    {
+                        0x00000023,
+                    }
+                })
+                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource S=
ettings
+                {
+                }
+            }

GSI1,2,3 are omitted.

+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource S=
ettings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, Pos=
Decode,
+                    0x0000,             // Granularity
+                    0x0080,             // Range Minimum
+                    0x0080,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+            Name (SUPP, Zero)
+            Name (CTRL, Zero)
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System C=
apabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 =3D=3D ToUUID ("33db4d5b-1ff7-401c-9657-7441c0=
3dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    SUPP =3D CDW2 /* \_SB_.PC80._OSC.CDW2 */
+                    CTRL =3D CDW3 /* \_SB_.PC80._OSC.CDW3 */
+                    CTRL &=3D 0x1F
+                    If ((Arg1 !=3D One))
+                    {
+                        CDW1 |=3D 0x08
+                    }
+
+                    If ((CDW3 !=3D CTRL))
+                    {
+                        CDW1 |=3D 0x10
+                    }
+
+                    CDW3 =3D CTRL /* \_SB_.PC80.CTRL */
+                    Return (Arg3)
+                }
+                Else
+                {
+                    CDW1 |=3D 0x04
+                    Return (Arg3)
+                }
+            }

DSM is are omitted

         Device (PCI0)
         {
             Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardw=
are ID
                     WordBusNumber (ResourceProducer, MinFixed, MaxFixed,=
 PosDecode,
                         0x0000,             // Granularity
                         0x0000,             // Range Minimum
-                        0x00FF,             // Range Maximum
+                        0x007F,             // Range Maximum
                         0x0000,             // Translation Offset
-                        0x0100,             // Length
+                        0x0080,             // Length

Signed-off-by: miaoyubo <miaoyubo@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bi=
os-tables-test-allowed-diff.h
index dfb8523c8b..90c53925fc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT.pxb",
--=20
2.19.1



