Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A054325B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:20:44 +0200 (CEST)
Received: from localhost ([::1]:36974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywY7-0003Sv-K0
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8P-0001u8-2g
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8I-0004OV-AB
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zeTlTs3hc431Jc5Q7hmuxHe/obOAK8+wtkTpl9jdyVY=;
 b=F77tF6OJq9iAQpAr5ripeFJDPvRLwdO/nkzKwFWymdhtgQxrCDG34+sP0i/0P0B+oDXzlJ
 /mCkVD+CxE8oEgPx7fhcmwjbwTlg9gJXynUGBYN4RsjR9UWVFpk/1NOC04dYjdp9NalR1s
 jgvtmXox21i1yUXAzsZpE/n+Pzd2xhA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-Ty3jkteBMe-mA2yTTEf6qA-1; Wed, 08 Jun 2022 09:54:00 -0400
X-MC-Unique: Ty3jkteBMe-mA2yTTEf6qA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E16C80159B
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:54:00 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F6A5C2811E;
 Wed,  8 Jun 2022 13:53:59 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com
Subject: [PATCH v2 21/35] tests: acpi: update expected blobs
Date: Wed,  8 Jun 2022 09:53:26 -0400
Message-Id: <20220608135340.3304695-22-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expected AML change:
ISA devices under separate _SB.PCI0.ISA scope are moved
directly under Device(ISA) node.

Example from PC machine, and q35 have similar changes:

         {
             Name (_ADR, 0x00010000)  // _ADR: Address
             OperationRegion (P40C, PCI_Config, 0x60, 0x04)
-        }
-    }
-
-    Scope (_SB.PCI0.ISA)
-    {
-        Device (KBD)
-        {
-            Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
-            Name (_STA, 0x0F)  // _STA: Status
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            Device (KBD)
             {
-                IO (Decode16,
-                    0x0060,             // Range Minimum
-                    0x0060,             // Range Maximum
-                    0x01,               // Alignment
-                    0x01,               // Length
-                    )
-                IO (Decode16,
-                    0x0064,             // Range Minimum
-                    0x0064,             // Range Maximum
-                    0x01,               // Alignment
-                    0x01,               // Length
-                    )
-                IRQNoFlags ()
-                    {1}
-            })
-        }
-
-        Device (MOU)
-        {
-            Name (_HID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _HID: Hardware ID
-            Name (_STA, 0x0F)  // _STA: Status
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                IRQNoFlags ()
-                    {12}
-            })
-        }
+                Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
+                Name (_STA, 0x0F)  // _STA: Status
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    IO (Decode16,
+                        0x0060,             // Range Minimum
+                        0x0060,             // Range Maximum
+                        0x01,               // Alignment
+                        0x01,               // Length
+                        )
+                    IO (Decode16,
+                        0x0064,             // Range Minimum
+                        0x0064,             // Range Maximum
+                        0x01,               // Alignment
+                        0x01,               // Length
+                        )
+                    IRQNoFlags ()
+                        {1}
+                })
+            }

-        Device (FDC0)
-        {
-            Name (_HID, EisaId ("PNP0700"))  // _HID: Hardware ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                IO (Decode16,
-                    0x03F2,             // Range Minimum
-                    0x03F2,             // Range Maximum
-                    0x00,               // Alignment
-                    0x04,               // Length
-                    )
-                IO (Decode16,
-                    0x03F7,             // Range Minimum
-                    0x03F7,             // Range Maximum
-                    0x00,               // Alignment
-                    0x01,               // Length
-                    )
-                IRQNoFlags ()
-                    {6}
-                DMA (Compatibility, NotBusMaster, Transfer8, )
-                    {2}
-            })
-            Device (FLPA)
+            Device (MOU)
             {
-                Name (_ADR, Zero)  // _ADR: Address
-                Name (_FDI, Package (0x10)  // _FDI: Floppy Drive Information
+                Name (_HID, EisaId ("PNP0F13") /* PS/2 Mouse */)  // _HID: Hardware ID
+                Name (_STA, 0x0F)  // _STA: Status
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                 {
-                    Zero,
-                    0x05,
-                    0x4F,
-                    0x30,
-                    One,
-                    0xAF,
-                    0x02,
-                    0x25,
-                    0x02,
-                    0x12,
-                    0x1B,
-                    0xFF,
-                    0x6C,
-                    0xF6,
-                    0x0F,
-                    0x08
+                    IRQNoFlags ()
+                        {12}
                 })
             }

-            Name (_FDE, Buffer (0x14)  // _FDE: Floppy Disk Enumerate
+            Device (FDC0)
             {
-                /* 0000 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
-                /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
-                /* 0010 */  0x02, 0x00, 0x00, 0x00                           // ....
-            })
-        }
+                Name (_HID, EisaId ("PNP0700"))  // _HID: Hardware ID
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    IO (Decode16,
+                        0x03F2,             // Range Minimum
+                        0x03F2,             // Range Maximum
+                        0x00,               // Alignment
+                        0x04,               // Length
+                        )
+                    IO (Decode16,
+                        0x03F7,             // Range Minimum
+                        0x03F7,             // Range Maximum
+                        0x00,               // Alignment
+                        0x01,               // Length
+                        )
+                    IRQNoFlags ()
+                        {6}
+                    DMA (Compatibility, NotBusMaster, Transfer8, )
+                        {2}
+                })
+                Device (FLPA)
+                {
+                    Name (_ADR, Zero)  // _ADR: Address
+                    Name (_FDI, Package (0x10)  // _FDI: Floppy Drive Information
+                    {
+                        Zero,
+                        0x05,
+                        0x4F,
+                        0x30,
+                        One,
+                        0xAF,
+                        0x02,
+                        0x25,
+                        0x02,
+                        0x12,
+                        0x1B,
+                        0xFF,
+                        0x6C,
+                        0xF6,
+                        0x0F,
+                        0x08
+                    })
+                }

-        Device (LPT1)
-        {
-            Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
-            Name (_UID, One)  // _UID: Unique ID
-            Name (_STA, 0x0F)  // _STA: Status
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                Name (_FDE, Buffer (0x14)  // _FDE: Floppy Disk Enumerate
+                {
+                    /* 0000 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
+                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
+                    /* 0010 */  0x02, 0x00, 0x00, 0x00                           // ....
+                })
+            }
+
+            Device (LPT1)
             {
-                IO (Decode16,
-                    0x0378,             // Range Minimum
-                    0x0378,             // Range Maximum
-                    0x08,               // Alignment
-                    0x08,               // Length
-                    )
-                IRQNoFlags ()
-                    {7}
-            })
-        }
+                Name (_HID, EisaId ("PNP0400") /* Standard LPT Parallel Port */)  // _HID: Hardware ID
+                Name (_UID, One)  // _UID: Unique ID
+                Name (_STA, 0x0F)  // _STA: Status
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    IO (Decode16,
+                        0x0378,             // Range Minimum
+                        0x0378,             // Range Maximum
+                        0x08,               // Alignment
+                        0x08,               // Length
+                        )
+                    IRQNoFlags ()
+                        {7}
+                })
+            }

-        Device (COM1)
-        {
-            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
-            Name (_UID, One)  // _UID: Unique ID
-            Name (_STA, 0x0F)  // _STA: Status
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            Device (COM1)
             {
-                IO (Decode16,
-                    0x03F8,             // Range Minimum
-                    0x03F8,             // Range Maximum
-                    0x00,               // Alignment
-                    0x08,               // Length
-                    )
-                IRQNoFlags ()
-                    {4}
-            })
-        }
+                Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
+                Name (_UID, One)  // _UID: Unique ID
+                Name (_STA, 0x0F)  // _STA: Status
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    IO (Decode16,
+                        0x03F8,             // Range Minimum
+                        0x03F8,             // Range Maximum
+                        0x00,               // Alignment
+                        0x08,               // Length
+                        )
+                    IRQNoFlags ()
+                        {4}
+                })
+            }

-        Device (RTC)
-        {
-            Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            Device (RTC)
             {
-                IO (Decode16,
-                    0x0070,             // Range Minimum
-                    0x0070,             // Range Maximum
-                    0x01,               // Alignment
-                    0x08,               // Length
-                    )
-                IRQNoFlags ()
-                    {8}
-            })
+                Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    IO (Decode16,
+                        0x0070,             // Range Minimum
+                        0x0070,             // Range Maximum
+                        0x01,               // Alignment
+                        0x08,               // Length
+                        )
+                    IRQNoFlags ()
+                        {8}
+                })
+            }
         }
     }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  31 --------------------
 tests/data/acpi/pc/DSDT                     | Bin 6002 -> 5987 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 5969 -> 5954 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7327 -> 7312 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 8668 -> 8653 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6466 -> 6451 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7656 -> 7641 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 5969 -> 5954 bytes
 tests/data/acpi/pc/DSDT.hpbrroot            | Bin 3084 -> 3069 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6074 -> 6059 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7361 -> 7346 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 5860 -> 5845 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6008 -> 5993 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6210 -> 6195 bytes
 tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8274 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 8306 -> 8291 bytes
 tests/data/acpi/q35/DSDT.acpihmat           | Bin 9614 -> 9599 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11003 -> 10988 bytes
 tests/data/acpi/q35/DSDT.cphp               | Bin 8753 -> 8738 bytes
 tests/data/acpi/q35/DSDT.dimmpxm            | Bin 9943 -> 9928 bytes
 tests/data/acpi/q35/DSDT.ipmibt             | Bin 8364 -> 8349 bytes
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8378 -> 8363 bytes
 tests/data/acpi/q35/DSDT.ivrs               | Bin 8306 -> 8291 bytes
 tests/data/acpi/q35/DSDT.memhp              | Bin 9648 -> 9633 bytes
 tests/data/acpi/q35/DSDT.mmio64             | Bin 9419 -> 9404 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8583 -> 8568 bytes
 tests/data/acpi/q35/DSDT.nohpet             | Bin 8147 -> 8132 bytes
 tests/data/acpi/q35/DSDT.numamem            | Bin 8295 -> 8280 bytes
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8900 -> 8885 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8921 -> 8906 bytes
 tests/data/acpi/q35/DSDT.viot               | Bin 9398 -> 9383 bytes
 tests/data/acpi/q35/DSDT.xapic              | Bin 35652 -> 35637 bytes
 32 files changed, 31 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index d95f4b25c4..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,32 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/pc/DSDT.hpbrroot",
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/DSDT.acpihmat",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.cphp",
-"tests/data/acpi/q35/DSDT.dimmpxm",
-"tests/data/acpi/q35/DSDT.ipmibt",
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/DSDT.memhp",
-"tests/data/acpi/q35/DSDT.mmio64",
-"tests/data/acpi/q35/DSDT.multi-bridge",
-"tests/data/acpi/q35/DSDT.nohpet",
-"tests/data/acpi/q35/DSDT.numamem",
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
-"tests/data/acpi/q35/DSDT.viot",
-"tests/data/acpi/q35/DSDT.xapic",
-"tests/data/acpi/q35/DSDT.ipmismbus",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index cc1223773e9c459a8d2f20666c051a74338d40b7..e80bef30317b5ef3bf0d2fb7aaabd6def109adb6 100644
GIT binary patch
delta 44
zcmeyQ_gIh1CD<h-S)74^F@GbM7$d)%q+WcmQ+$B4r$Ka+r^IAkM#;_LjM8EN6!Z&r

delta 60
zcmaE?_eqb-CD<jTNSuLzao$EQF-BfBz4&0K_yA{5gXkuy$@+|vf&zZx`phsv&tS*+
J%^r->VgT_=4|o6o

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index bb0593eeb8730d51a6f0fe51a00a00df9c83c419..d5a2ca51652dfc3637a817bac4a02d6ff6dc8ac2 100644
GIT binary patch
delta 44
zcmcbpcSw)RCD<jzNt}U!F>NE47$d)%q+WcmQ+$B4r$Ka+r^IAkM#;_LjK4$y1_}%4

delta 60
zcmX@4cTtbaCD<h-P@I8*aq31cF-BfBz4&0K_yA{5gXkuy$@+|vf&zZx`phsv&tS*+
J%^r-uL;>5O59$B_

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index 2d0678eb83277088b156d386067429b0f29f9338..f86c743c4d64041c7fbd9999cc700e88416770b7 100644
GIT binary patch
delta 44
zcmbPlIl+?4CD<iof(!!#qs~SyF-CqjNxk@Br}zM8PlM<tPl?I8jFOwf89k%{`}GS4

delta 60
zcmbPWIp31YCD<ioz6=8cWAsKYF-BfBz4&0K_yA{5gXkuy$@+|vf&zZx`phsv&tS*+
J%^r*%(g4m&4+#JO

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index 77778c3a69946efd501e7eff0a73af309b553f13..14ed0d995a9f6540deae5a25a7853ed4493a6e06 100644
GIT binary patch
delta 44
zcmccPeAb!ECD<k8tRe#gW9&vQF-CqjNxk@Br}zM8PlM<tPl?I8jFOwf8Cw+qBM1yi

delta 60
zcmX@>e8-u~CD<k8jv@mCW6wq|F-BfBz4&0K_yA{5gXkuy$@+|vf&zZx`phsv&tS*+
J%^r-c3IGLe5KI67

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index af046b40b0a150b4ab1e113bd9d77912c707074f..c653302a84a42d063a74a22c6adf910beeba7c60 100644
GIT binary patch
delta 44
zcmX?PwAqNuCD<jzSdxK(@$yD4F-CqjNxk@Br}zM8PlM<tPl?I8jFOwf8DEP701Yt=
AB>(^b

delta 60
zcmdmNbjXOyCD<jzNs@tqk!d5B7$dKmUVN}qe1Nm3L3ESUWPL_SK><H;eP)=TXRu@Z
JW)H^K;sCj54<`Ts

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index b56b2e089017f933f8a3089c4fd2389fb8ef1e40..247a1796b1cf31c24b1a981e48937609f84fe2cb 100644
GIT binary patch
delta 44
zcmaE1ebbuDCD<k8rYr*k<KB&2VvPK5l6vvMPVoWGo(9oPo)VLF86`J|GftEN05IST
A!T<mO

delta 60
zcmca<{lc2dCD<k8g)9RD<C~3KVvM|Mdhx+d@d3`B2GLDYll2)T1qJ-X^_gLUp23ds
Kn>`pO$^ZZwMi9gR

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index bb0593eeb8730d51a6f0fe51a00a00df9c83c419..d5a2ca51652dfc3637a817bac4a02d6ff6dc8ac2 100644
GIT binary patch
delta 44
zcmcbpcSw)RCD<jzNt}U!F>NE47$d)%q+WcmQ+$B4r$Ka+r^IAkM#;_LjK4$y1_}%4

delta 60
zcmX@4cTtbaCD<h-P@I8*aq31cF-BfBz4&0K_yA{5gXkuy$@+|vf&zZx`phsv&tS*+
J%^r-uL;>5O59$B_

diff --git a/tests/data/acpi/pc/DSDT.hpbrroot b/tests/data/acpi/pc/DSDT.hpbrroot
index 6ff6f198c7caf445d25c01117a6357b398358cbf..ec99b1622934a0fd8bc316291c33231e4c57dce0 100644
GIT binary patch
delta 44
zcmeB?_$$uk66_N4mz#lsk!d5B7$d)%q+WcmQ+$B4r$Ka+r^IAkM#;_Lj9a+?2qz1y

delta 60
zcmew>-Xp=~66_Mf!^6P9Xt0q>jFDGOFFx2QKET=2Ai7CvvOc4vpn#vaJ~K?vGuSbH
Jvj^i=E&#0n4z2(I

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index 2e618e49d357ae1d0ac20d822f71d676ea90f2fc..f0d9e75841ea3d69fed9384e439bc4e94c7a4c4e 100644
GIT binary patch
delta 44
zcmdm`zgnNmCD<iowKxL<<M)kRVvPKLvU>5sPVoWGo(9oPj<S<=86`J|GbW1x03F5*
ADF6Tf

delta 60
zcmZ3jze}IXCD<iompB6hqtQk#F-BfBz4&0K_yA{5gXkuy$@+|vf&y+b`phsv&tS*+
J%^r-&VgS=C4=Vrw

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index c32d28575b967aff40afb9138822ecd3186dd4ce..d0a7c462094fea9a457cbf537784735e74f7d7d5 100644
GIT binary patch
delta 44
zcmX?Txyh2tCD<iolMDj`W8y|GF-CqjNxk@Br}zM8PlM<tPl?I8jFOwf8MCAT5|9hT

delta 60
zcmdmFdC-!}CD<k8pbP^8<AjY|VvM|Mdhx+d@d3`B2GLDYll2)T1qJ-X^_gLUp23ds
Jn>`q_qyg@S55@oh

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index 623f06a900d12500d2197d101f76f6875e92ed64..cb7bf7d850f340e12a7237c987f570300fd9c92b 100644
GIT binary patch
delta 41
xcmaE&dsUaqCD<k8su%+Uqvb@d4t_UDz4&0K_yA{5gXkttiHY+iH=dLh0{{tT48i~a

delta 57
zcmcbr`$U(^CD<k8i5LR|W5z_T4qi3A_+Y2_0B28w=q9O&3nc{w{KWN{VPc-aj`16J
HNs9ph@NE#p

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index f0a3fa92de94f55d5406f0fafce331776dbb0317..2f512cfbe158f1739803c0c7009fe5e907bdec54 100644
GIT binary patch
delta 44
zcmeyN_fn6`CD<h-Q=EZ;QF0@f7$d)%q+WcmQ+$B4r$Ka+r^IAkM#;_LjEZ6a4Z;gJ

delta 60
zcmaE<_d}1%CD<jTLY#qt(PJZ*7$dKmUVN}qe1Nm3L3ESUWPL_SK><H;eP)=TXRu@Z
JW)DV1F#zS+4>|w<

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index cee3b4d80b51ad30153953ace46127923ce8b271..46e03d39e00ea70e55d6a12333ca2b98c5e5bb53 100644
GIT binary patch
delta 44
zcmX?Pu-SmiCD<jzSb~9pQEDTX7$d)%q+WcmQ+$B4r$Ka+r^IAkM#;_LjIYH2_NfbI

delta 60
zcmdmNaL9nmCD<jzNrHia(Q_l07$dKmUVN}qe1Nm3L3ESUWPL_SK><H;eP)=TXRu@Z
JW)H^KVgSVt4`=`Y

diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index c1965f6051ef2af81dd8412abe169d87845bb033..2cd8d5fc470fc3159fbc464af97e76c8de2136e3 100644
GIT binary patch
delta 44
zcmaFpaLIwoCD<h-NP&TY@!CeNn~eO<f_m}6PVoWGo(9oPZUU1(FiLKgVse)Q064x4
AKL7v#

delta 80
zcmccQ@X&$FCD<h-QGtPh@z+MKn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
b0iHpDOk4?EJObYQ`phteAXS^WncU?7n<EtY

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index cad26e3f0c27a40a33101155a5282ed9bcb1d441..0bc5de80652ae7328fdc07ccda34afff39ade56f 100644
GIT binary patch
delta 44
zcmez5@YsRNCD<h-S%HCpv1}vPO-6oaLB053r}zM8PlM<tH-X6?7$rALF-6D$05z!%
ABLDyZ

delta 80
zcmaFt@X3M8CD<jTNP&TYan?qzn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
b0iHpDOk4?EJObYQ`phteAXS^WnIhx>k-8M!

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index f24d4874bff8d327a165ed7c36de507aea114edd..af10345e8806c78a0074b3a8819b5cfca4d70c01 100644
GIT binary patch
delta 44
zcmeD4{_n-*66_LEugbu{IC&%2O-6oaLB053r}zM8PlM<tH-X6?7$rALF_kC-05qiy
APXGV_

delta 80
zcmezG)#uIS66_Mvr^>*<xP2qnO-6Gyz4&0K_yA{5gXktH&tS)Rj(A6xARYz=d4}kQ
b0MDR6Cawf79szHDeP)<KkgCnxOeM+ylRy;-

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index 424d51bd1cb39ea73501ef7d0044ee52cec5bdac..d820098355e0b79dc69d714817fe906064852f4d 100644
GIT binary patch
delta 44
zcmewz`X-diCD<k8jTQp~<AaS{HyQbz1@+>Co#F$WJq@Cp+yo|nV3gb}#q>}E0AVT)
A?*IS*

delta 80
zcmaD8`a6`%CD<k8w-y5fBg;mvn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
c0iHpDOk4?EJObYQ`phteAXS^WnI38Y0H;3{sQ>@~

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index f1275606f68eeba54bfb11e63d818420385a62b9..ac8456a43d54209d77917163b282954d7429b331 100644
GIT binary patch
delta 44
zcmdn!vdD$YCD<iINr{1h(P|^tO-6oaLB053r}zM8PlM<tH-X6?7$rALF^MYx01*5O
A?*IS*

delta 80
zcmZ4FveAXhCD<jzP>F$oF>WK*O-6Gyz4&0K_yA{5gXktH&tS)Rj(A6xARYz=d4}kQ
b0MDR6Cawf79szHDeP)<KkgCnxOyUXvN|_U>

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index 76e451e829ec4c245315f7eed8731aa1be45a747..bb0eadf869fe366fc139f8b0fd2ed811d3b16814 100644
GIT binary patch
delta 44
zcmccad%~B?CD<k8gc<__qsm6En~eO<f_m}6PVoWGo(9oPZUU1(FiLKgV%n<$05+-(
AivR!s

delta 80
zcmX@%d)=4ICD<k8x*7umqsK<Bn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
c0iHpDOk4?EJObYQ`phteAXS^Wnf9sx0FqA?MF0Q*

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 6ad2411d0ec95f204cfc64b430c537bce09c35bd..bb258279506e78b50545f6f9030bd25afe433c29 100644
GIT binary patch
delta 44
zcmZ4EIM<QOCD<iot^xxC<L`}JHyQc;MD^l>o#F$WJq@Cp97QL8V3gb}#WYC{05{ML
Ap#T5?

delta 80
zcmbR1xW<voCD<iojRFG$quxfYn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
c0iHpDOk4?EJOXYa`phteAXS^WnI_2r09(%#TL1t6

diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 415fe08a407690c0e118743d872de79d22f01a4c..15000c357fdabf1bceef6f860bd35e9a33024927 100644
GIT binary patch
delta 44
zcmdnxxZ07+CD<iowE_bJW9UY%n~eO<f_m}6PVoWGo(9oPZUU1(FiLKgVp<>v04cW(
ABme*a

delta 80
zcmZ4OxXY2tCD<iomjVL=W93G!n~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
c0iHpDOk4?EJObYQ`phteAXS^WnHI<a0DH_7-T(jq

diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index cad26e3f0c27a40a33101155a5282ed9bcb1d441..0bc5de80652ae7328fdc07ccda34afff39ade56f 100644
GIT binary patch
delta 44
zcmez5@YsRNCD<h-S%HCpv1}vPO-6oaLB053r}zM8PlM<tH-X6?7$rALF-6D$05z!%
ABLDyZ

delta 80
zcmaFt@X3M8CD<jTNP&TYan?qzn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
b0iHpDOk4?EJObYQ`phteAXS^WnIhx>k-8M!

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 4e9cb3dc6896bb79ccac0fe342a404549f6610e8..663456fc0d3c71a51b541f5ab952e05c9dac01e6 100644
GIT binary patch
delta 44
zcmdnsz0jM>CD<iop(+Cd<B5%2HyQbz1@+>Co#F$WJq@Cp+yo|nV3gb}#WYPB05)0;
AjQ{`u

delta 80
zcmZ4Jy}_HyCD<iogDL|9<C~3KHyO><^x}h^;scyL4WgT*JcAwMIpQ5%f_NAh<QbwH
c0z88PnYa?Tcm%xp^_gJ`L8>-$Gfh(l0GH<#M*si-

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index eb5a1c7171c02d153487bfcecfb7019b7c1bf406..91afd01d598c7c2c733387dfb5140d0fcad54adb 100644
GIT binary patch
delta 44
zcmX@@xyO^sCD<ioj|u|=W6MUan~eO<f_m}6PVoWGo(9oPZUU1(FiLKgV%n$#06LHj
AuK)l5

delta 80
zcmdnvdD@f9CD<k8v<d?Q<BE-3HyO><^x}h^;scyL4WgT*JcAwMIpQ5%f_NAh<QbwH
c0z88PnYa?Tcm%xp^_gJ`L8>-$Gi_7?0G&M*X#fBK

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index 45808eb03b78d07ebbe853f674abfed589d35e26..afde339a181628ae9153251eee026b437ab685bc 100644
GIT binary patch
delta 44
zcmZp7{^7*s66_LEp~%3%n6;7XCL_PIpk92iQ+$B4r$Ka+o517`jFOwBm~!O-DNYRX

delta 80
zcmez2)b7mX66_MvuE@Z^*te1ECZoBUUVN}qe1Nm3L3ERpXRu>DN4%p;5Dx=`JVSIt
bfM-x36ITKkkAOG7J~K=qNY!R;rd)Xdd|?!<

diff --git a/tests/data/acpi/q35/DSDT.nohpet b/tests/data/acpi/q35/DSDT.nohpet
index 83d1aa00ac5686df479673fb0d7830f946e25dea..0fb09121cf8f6ad8810587c8b77df9552dd31f42 100644
GIT binary patch
delta 65
zcmca?f5e{4CD<k8h&%%W<ARM`-i#W~f_m}6PVoWGo(9oPZUUacj`1AvjxIqw3=HxN
U(G3BfL4izM30ypzdl=p209?`#`2YX_

delta 80
zcmX?Nf7zbPCD<k8vOEI=<B^SA-i+pIdhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
b0iHpDOk4?EJObYQ`phteAXS@d8QtXof+7_8

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 050aaa237b466b0bda8cca5cfaa06f84661d622e..e537669949a07adbaa4255021ea14bb4a9dc672f 100644
GIT binary patch
delta 44
zcmaFvaKnMiCD<h-LV<ySv0)?EO-6oaLB053r}zM8PlM<tH-X6?7$rALG5N{?05OaW
A0RR91

delta 80
zcmccN@Z5pRCD<h-U4emtamhxmn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
b0iHpDOk4?EJObYQ`phteAXS^WnSA8{ieVJH

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index fb9dd1f0599afd6b555ea570ecd00a3bb227aa84..0b5c97fdb5da8b7b55d6b5f2af498a447fda7bf8 100644
GIT binary patch
delta 44
zcmX@&y497-CD<ios}chP<Nl3YHyQbz1@+>Co#F$WJq@Cp+yo|nV3gb}#k5KR06d2c
A!T<mO

delta 80
zcmdn$dc>8>CD<k8h!O(><KvB7HyO><^x}h^;scyL4WgT*JcAwMIpQ5%f_NAh<QbwH
c0z88PnYa?Tcm%xp^_gJ`L8>-$Gp$kp0HY)od;kCd

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index 00d732e46f5d9d056e557bd026fa30f9db3b8c30..4e16b126cc1c32f2346078fa69c5261c245d15e8 100644
GIT binary patch
delta 44
zcmccVddii{CD<k8loA62<CBeCHyQbz1@+>Co#F$WJq@Cp+yo|nV3gb}#k5}m07~=@
AI{*Lx

delta 80
zcmX@*defE5CD<k8rV;}KBgaOrn~dgadhx+d@d3`B2GLDYp23ds9Py4WK|Bl$@(j@p
c0iHpDOk4?EJObYQ`phteAXS^Wnf5CH0DYkp^#A|>

diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
index 1c3b4da5cbe81ecab5e1ef50d383b561c5e0f55f..e20e4ee5e92e11ccf890a18fbdd78181c43f3b5c 100644
GIT binary patch
delta 44
zcmdnyx!jY>CD<ioxe5aVWAjF?n~eO<f_m}6PVoWGo(9oPZUU1(FiLKgVw$4_05Dq(
AS^xk5

delta 80
zcmZ4Pxy_TyCD<ion+gL1<MNGMHyO><^x}h^;scyL4WgT*JcAwMIpQ5%f_NAh<QbwH
c0z88PnYa?Tcm%xp^_gJ`L8>-$GtE%~0E!3|6aWAK

diff --git a/tests/data/acpi/q35/DSDT.xapic b/tests/data/acpi/q35/DSDT.xapic
index 17552ce363ae81985f69f9ae85837a1540b79ae0..3cab5956eee60363251a6fab0cc981bbbda64443 100644
GIT binary patch
delta 46
zcmX>yjcMyNCN7s?mk`r#1_s8Sja)Yw`JDyz;)9*y1Drh#qMO_VCVya*+$_bU)d>Jm
Crw#`I

delta 82
zcmdlwjp@iVCN7s?mk^h31_s6r8@X;Wnycx>2Rp?FIC~mIH%WO0JH~UwJGun%Ffhn7
eL^lL@1_d&4C2;Wwc=PKs!xVy4ZRTdu>I4AAB^AK{

-- 
2.31.1


