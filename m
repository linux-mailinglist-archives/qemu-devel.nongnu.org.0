Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C521A546201
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:25:47 +0200 (CEST)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzatm-0008S5-Rv
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXP-00013N-QH
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXN-0006KG-QB
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kxCfGXt/xIo9/mDOHsdcWZfRGIFMgjOzCdJkdJusL5A=;
 b=aH8A5ztfKSpjel6Z36aNEE6/0wuWcarWWiG49vfnUDvcGeovNXW1XEC/ZwOiLC/5CIT8mj
 +IyVDvrBSKQjELtyMHXgXhQ/PWpE0NxK+t3yB0t2VqjdkgQOJeDZJk1+IFKeWI2ZEhh/6Z
 fBcH22Y/HmXEKm11VYlOtzalt6JUV0o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-nDNjWSgpOsuJdTi1-J99bw-1; Fri, 10 Jun 2022 03:58:31 -0400
X-MC-Unique: nDNjWSgpOsuJdTi1-J99bw-1
Received: by mail-wm1-f71.google.com with SMTP id
 p18-20020a05600c23d200b0039c40c05687so6230477wmb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kxCfGXt/xIo9/mDOHsdcWZfRGIFMgjOzCdJkdJusL5A=;
 b=3y6QuzpltKSQAWLV8piJmezd8Itzfpbeo1e3PU7Da0RW5jA4QuWCRyZIoEQZR/cwjw
 /3wuNpa/KhWsA31otQn1rAmLz2nsj1V28SFl9+L/sr9Cdgj3iPd9KZA2JT+u/tcVZxNN
 rOSFaImLpZRLRWnISDsjI5Byp3UYoMpccmeW4yVD4/ZjgJeczzu41VlmkAjPtS4P5LUx
 ldythJJAKDGbxTtQA+NNyAGb049ibwH+HraXzaPt95vVJkGEN4BNqdF2sYM6qJiiwkwE
 cpuK6uWkUVporIneUacae9z6Y4jI4WF0RvQ79NsCY5JYSLVc9EjyJpBt47sI3ukZQ9Qy
 aAlA==
X-Gm-Message-State: AOAM533krp2ccNWVE7n2xQ8f+XNcle6Uzyt8WZVaDqGBqICXKeytt1Cr
 BK9hOfLwlKfXndYdVE2F3gRQvAVwog3mrLGxdBZe5Rn80I8mZ0GU5xPqI28hCW6BSGuyYtKEraT
 au7aGC9v0AIsTTDdkO3bza27YsFyHAAs0W9gsj+mD3WRu7GTCqIb9jt9q9Gsq
X-Received: by 2002:a05:6000:1788:b0:219:e28f:dc98 with SMTP id
 e8-20020a056000178800b00219e28fdc98mr4058363wrg.144.1654847910024; 
 Fri, 10 Jun 2022 00:58:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlyKbi6p+qNskBulXGdacfrn4Eg23ZpX101oM9I6xew+9f/B5Px7NCvwCcRAybNr1au1q0Ew==
X-Received: by 2002:a05:6000:1788:b0:219:e28f:dc98 with SMTP id
 e8-20020a056000178800b00219e28fdc98mr4058336wrg.144.1654847909689; 
 Fri, 10 Jun 2022 00:58:29 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 l29-20020a05600c1d1d00b0039c3056c3dfsm2649082wms.27.2022.06.10.00.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:29 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 29/54] tests: acpi: update expected DSDT.pvpanic-isa blob
Message-ID: <20220610075631.367501-30-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

@@ -145,6 +145,37 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
         {
             Name (_ADR, 0x001F0000)  // _ADR: Address
             OperationRegion (PIRQ, PCI_Config, 0x60, 0x0C)
+            Device (PEVT)
+            {
+                Name (_HID, "QEMU0001")  // _HID: Hardware ID
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    IO (Decode16,
+                        0x0505,             // Range Minimum
+                        0x0505,             // Range Maximum
+                        0x01,               // Alignment
+                        0x01,               // Length
+                        )
+                })
+                OperationRegion (PEOR, SystemIO, 0x0505, One)
+                Field (PEOR, ByteAcc, NoLock, Preserve)
+                {
+                    PEPT,   8
+                }
+
+                Name (_STA, 0x0F)  // _STA: Status
+                Method (RDPT, 0, NotSerialized)
+                {
+                    Local0 = PEPT /* \_SB_.PCI0.ISA_.PEVT.PEPT */
+                    Return (Local0)
+                }
+
+                Method (WRPT, 1, NotSerialized)
+                {
+                    PEPT = Arg0
+                }
+            }
+
             Device (KBD)
             {
                 Name (_HID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _HID: Hardware ID
@@ -3246,40 +3277,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
         }
     }

-    Scope (\_SB.PCI0.ISA)
-    {
-        Device (PEVT)
-        {
-            Name (_HID, "QEMU0001")  // _HID: Hardware ID
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                IO (Decode16,
-                    0x0505,             // Range Minimum
-                    0x0505,             // Range Maximum
-                    0x01,               // Alignment
-                    0x01,               // Length
-                    )
-            })
-            OperationRegion (PEOR, SystemIO, 0x0505, One)
-            Field (PEOR, ByteAcc, NoLock, Preserve)
-            {
-                PEPT,   8
-            }
-
-            Name (_STA, 0x0F)  // _STA: Status
-            Method (RDPT, 0, NotSerialized)
-            {
-                Local0 = PEPT /* \_SB_.PCI0.ISA_.PEVT.PEPT */
-                Return (Local0)
-            }
-
-            Method (WRPT, 1, NotSerialized)
-            {
-                PEPT = Arg0
-            }
-        }
-    }
-
     Scope (\_SB)
     {
         Scope (PCI0)

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220608135340.3304695-30-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DSDT.pvpanic-isa        | Bin 0 -> 8375 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index d5cd7aa4f5..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.pvpanic-isa",
diff --git a/tests/data/acpi/q35/DSDT.pvpanic-isa b/tests/data/acpi/q35/DSDT.pvpanic-isa
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..cc545b5d2505246d33f83d2482273968aa1be032 100644
GIT binary patch
literal 8375
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
B&uRbw

literal 0
HcmV?d00001

-- 
MST


