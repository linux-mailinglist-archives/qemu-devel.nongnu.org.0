Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3938528908
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:38:49 +0200 (CEST)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqco4-0000vH-TC
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccX-0004lL-5l
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nqccV-0006J2-7U
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652714810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7JlcLlFsQRi9x649S2daBlPqnlajDaXJNUd8RmNk7Q=;
 b=Zp2SBqWuNJ1N63Bz+3N0HRojYcWEZ+gl5O7Y+EFZew5/9wIRAumMU72ONNwN2rdcSAAkCz
 buD7UcBlnqQomQ63CPk17IUw547MJGSgvqMM2pB6hmf8FOgA7dLI/1maU4Eacj4LECw0Cc
 klYSRhFHursyLrFPyzzjAwerjG/dSV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-PDjgd9RtNmStmB8obRDa6A-1; Mon, 16 May 2022 11:26:47 -0400
X-MC-Unique: PDjgd9RtNmStmB8obRDa6A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97E7285A5A8;
 Mon, 16 May 2022 15:26:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FEBE492C14;
 Mon, 16 May 2022 15:26:45 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, ani@anisinha.ca, minyard@acm.org,
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Subject: [PATCH 25/35] tests: acpi: update expected blobs
Date: Mon, 16 May 2022 11:26:00 -0400
Message-Id: <20220516152610.1963435-26-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-1-imammedo@redhat.com>
References: <20220516152610.1963435-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

@@ -145,6 +145,23 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
         {
             Name (_ADR, 0x001F0000)  // _ADR: Address
             OperationRegion (PIRQ, PCI_Config, 0x60, 0x0C)
+            Device (SMC)
+            {
+                Name (_HID, EisaId ("APP0001"))  // _HID: Hardware ID
+                Name (_STA, 0x0B)  // _STA: Status
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    IO (Decode16,
+                        0x0300,             // Range Minimum
+                        0x0300,             // Range Maximum
+                        0x01,               // Alignment
+                        0x20,               // Length
+                        )
+                    IRQNoFlags ()
+                        {6}
+                })
+            }
+
             Device (KBD)
             {
                 Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
@@ -3246,26 +3263,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
         }
     }

-    Scope (\_SB.PCI0.ISA)
-    {
-        Device (SMC)
-        {
-            Name (_HID, EisaId ("APP0001"))  // _HID: Hardware ID
-            Name (_STA, 0x0B)  // _STA: Status
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                IO (Decode16,
-                    0x0300,             // Range Minimum
-                    0x0300,             // Range Maximum
-                    0x01,               // Alignment
-                    0x20,               // Length
-                    )
-                IRQNoFlags ()
-                    {6}
-            })
-        }
-    }
-
     Scope (\_SB)
     {
         Scope (PCI0)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DSDT.applesmc           | Bin 0 -> 8320 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e893029d87..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.applesmc",
diff --git a/tests/data/acpi/q35/DSDT.applesmc b/tests/data/acpi/q35/DSDT.applesmc
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..00092aacc6ce44dd8792b00a0fa183e5b06d33c6 100644
GIT binary patch
literal 8320
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
Y3<fg}Ry~GIOPrjSCl~lhh8_|2f2v2oY5)KL

literal 0
HcmV?d00001

-- 
2.31.1


