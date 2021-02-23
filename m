Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88521322E90
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:18:05 +0100 (CET)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaNw-0003ZY-HJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDS-0000B7-Ki
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaDP-00057u-SX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1ukuRVgkofH+UtrMRGSY9YqbsE1ipuouYGmZgQF7Rs=;
 b=FmvmTSZkYjPTqgmIT2vnFFCJ3w9ihcowGLqbRjR630Z19NOfaGIGcdoPvTRuqNuLIax4o3
 jhQKeoRq1QQHA2h4QKqtqRdIVJxPEc6RLoWKc01M9VLKX72+tKidr4LA+W7krzOW43s8Kr
 Hynq7+9e4DXMXKw42zDq6hUPVb3wRow=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-WcD6wTWqPf610zwd7CFRvQ-1; Tue, 23 Feb 2021 11:04:22 -0500
X-MC-Unique: WcD6wTWqPf610zwd7CFRvQ-1
Received: by mail-wr1-f72.google.com with SMTP id v1so7540237wru.2
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=C1ukuRVgkofH+UtrMRGSY9YqbsE1ipuouYGmZgQF7Rs=;
 b=XyfL7Zawh+7imgy5xaP2JlYhV1Ry/0gD5mLDGF/dFYY6s4Kw3F05GdFgYPrTnz0Lis
 Qnvn4fTXCaN89pRF3eJD5vPvBhO1pyCu/R7fUDIf7jZlsOTgP9iqNLoBe2+fVahwWULY
 ujqmcEDHrQBIgvw7TrOOsfsA9avYdfMlNxMGmiffyEUTPWiSvS9wHAgSSZi50osaPDAF
 NwDb+qP7geB64psbl7GDtyRbQYUCMbXRNrrv7mRX3GTErIN+SzY72IbRbUh4MURhYDBA
 A8SNNXI6C0NzxmdTEUsVlLmCYZb6yjsrZkcbDY3CGWgmxFHxG4pDwOnaD5JC4R62+lT2
 PgcA==
X-Gm-Message-State: AOAM530/vWriRtf0H5X2/hGpUztzILtuQtYHbiLZPz/MLg+QGnTyfqn4
 gzhHEqNtsqCr8tvJpQC6EZND6NiG1caMeuMsjS0v8WBBBRlSYp6Wi/fYyPzg/6srQGquXcCXy4n
 tuSHlA9SEelnS56Kh9+x+HcpGixAXz8Wfaw6HX8q8eBDdgGYfVjCXvnTdOWF5
X-Received: by 2002:a1c:29c4:: with SMTP id p187mr25860985wmp.8.1614096259995; 
 Tue, 23 Feb 2021 08:04:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzDQzjKf0B6ts1GVCJPO8NC054tST/F87FhBGKLfnrVFaD9JUL9260qvr7YdVjyIVdTs0T4A==
X-Received: by 2002:a1c:29c4:: with SMTP id p187mr25860958wmp.8.1614096259838; 
 Tue, 23 Feb 2021 08:04:19 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id a186sm3311870wme.17.2021.02.23.08.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:04:19 -0800 (PST)
Date: Tue, 23 Feb 2021 11:04:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/17] i386: acpi: Don't build HPET ACPI entry if HPET is
 disabled
Message-ID: <20210223160144.1507082-16-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

Omit HPET AML if the HPET is disabled, QEMU is not emulating it and the
guest may get confused by seeing HPET in the ACPI tables without a
"physical" device present.

The change of DSDT when -no-hpet is as follows.

@@ -141,47 +141,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
         }
     }

-    Scope (_SB)
-    {
-        Device (HPET)
-        {
-            Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
-            Name (_UID, Zero)  // _UID: Unique ID
-            OperationRegion (HPTM, SystemMemory, 0xFED00000, 0x0400)
-            Field (HPTM, DWordAcc, Lock, Preserve)
-            {
-                VEND,   32,
-                PRD,    32
-            }
-
-            Method (_STA, 0, NotSerialized)  // _STA: Status
-            {
-                Local0 = VEND /* \_SB_.HPET.VEND */
-                Local1 = PRD /* \_SB_.HPET.PRD_ */
-                Local0 >>= 0x10
-                If (((Local0 == Zero) || (Local0 == 0xFFFF)))
-                {
-                    Return (Zero)
-                }
-
-                If (((Local1 == Zero) || (Local1 > 0x05F5E100)))
-                {
-                    Return (Zero)
-                }
-
-                Return (0x0F)
-            }
-
-            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
-            {
-                Memory32Fixed (ReadOnly,
-                    0xFED00000,         // Address Base
-                    0x00000400,         // Address Length
-                    )
-            })
-        }
-    }
-
     Scope (_SB.PCI0)
     {
         Device (ISA)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Message-Id: <66114dead09232d04891b9e5f5a4081e85cc2c4d.1613615732.git.isaku.yamahata@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 96497475d1..31a5f6f4a5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1281,7 +1281,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(sb_scope, dev);
         aml_append(dsdt, sb_scope);
 
-        build_hpet_aml(dsdt);
+        if (misc->has_hpet) {
+            build_hpet_aml(dsdt);
+        }
         build_piix4_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
@@ -1328,7 +1330,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
         aml_append(dsdt, sb_scope);
 
-        build_hpet_aml(dsdt);
+        if (misc->has_hpet) {
+            build_hpet_aml(dsdt);
+        }
         build_q35_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
         build_q35_pci0_int(dsdt);
-- 
MST


