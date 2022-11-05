Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969D061DC8C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpq-0008SI-Ug; Sat, 05 Nov 2022 13:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoK-0007K1-29
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoI-0007jQ-GY
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=e+ISK/zHTrWPjg4h9c9lRtADojg9MRnifj8UMHnZJBAHt2GBM3Vg3sE3N0I4sVWa7Ds51w
 FHLI9FliSvZ5v6kM0SuXTvVdPNsZBR+glle3S7kXbk0aiBpTGGH0bhtwxPbUbPnlhoQY4B
 ZuDDNKOIK/kqo4oQqTeVjAo5xJjNIWE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-cLkeIbU_P4u_fkhWQV46xw-1; Sat, 05 Nov 2022 13:18:19 -0400
X-MC-Unique: cLkeIbU_P4u_fkhWQV46xw-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay40-20020a05600c1e2800b003cf8aa16377so3800692wmb.7
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yhIUS8lDsK4Y+UjpInP5GENmj51Psd/BxPn+ebR+Z4=;
 b=UZBTMBom/7xEPHO0dK57vx0VLtk6uher1Iib/17iUjIbUgfKjCpOjGJhkVvlBZ2UtS
 BCNm+NR6puhKassGsdr5YcN+mQaPuyYPR6mDCbw30iPjgVrDArjb3RSUW/zjcTwCbGSb
 A8NWS96YTKO5SD+/NsJWVEgjI1gIH4VPx5JXyjU97nshbhwe0iqPbrUoP8Gm8wJFC+WZ
 hSiPxds86yJE7V9viZ10VXQtQK3CgAMNXXvODflR5XDNiD6O0jf+q1Ng5v70TBt0Lq7Z
 /nVbxL5FBnJutcM/dDD4pzxtkI0Et23dFWEscDUmOihbEhNs4p9OhtNNL+aY8pkAHqZ9
 vS1w==
X-Gm-Message-State: ACrzQf2391Ij0cTBhzA6rJkWsgfk2/x4J3K89cSqr+TYxQ6Y4vYGRO37
 YSO1GChf9G6rth6FMFpWUJ0xiwJWCoJV7dg4qqAMFy2Ub2Er8Qw1TltHDMqECMqfvVlRLS6v5WU
 V7Yw1mA9IbEwkHr9+fh8uwnXmQMPU4wTzVtEtwN5u4p85i7Pf/7/23mVnadJ2
X-Received: by 2002:a05:600c:3642:b0:3cf:700e:6533 with SMTP id
 y2-20020a05600c364200b003cf700e6533mr22942015wmq.8.1667668697630; 
 Sat, 05 Nov 2022 10:18:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u/qcQiXZfrRR2n9AgXYw0yID9+ijtsMi0D4piZib4HLXv5oDpuzZQD0uhaof/K9amMPw3Ww==
X-Received: by 2002:a05:600c:3642:b0:3cf:700e:6533 with SMTP id
 y2-20020a05600c364200b003cf700e6533mr22941995wmq.8.1667668697313; 
 Sat, 05 Nov 2022 10:18:17 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 j13-20020adfea4d000000b0023bb7e4b8b1sm2663209wrn.82.2022.11.05.10.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:16 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v3 58/81] acpi: pc/35: sanitize _GPE declaration order
Message-ID: <20221105171116.432921-59-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Move _GPE block declaration before it gets referenced by other
hotplug handlers. While at it move PCI hotplug (_E01) handler
after PCI tree description to avoid forward reference to
to not yet declared methods/devices.

PS:
Forward 'usage' usualy is fine as long as it's hidden within
method, however 'iasl' may print warnings. So be nice
to iasl/guest OS and do things in proper order.

PS2: Also follow up patches will move some of hotplug code
from PCI tree to _E01 and that also requires PCI Device
nodes build first, before Scope can reuse that from
global context.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-11-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 47 +++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 916343d8d6..960305462c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1434,6 +1434,18 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, sb_scope);
     }
 
+    scope =  aml_scope("_GPE");
+    {
+        aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
+        if (machine->nvdimms_state->is_enabled) {
+            method = aml_method("_E04", 0, AML_NOTSERIALIZED);
+            aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
+                                          aml_int(0x80)));
+            aml_append(scope, method);
+        }
+    }
+    aml_append(dsdt, scope);
+
     if (pcmc->legacy_cpu_hotplug) {
         build_legacy_cpu_hotplug_aml(dsdt, machine, pm->cpu_hp_io_base);
     } else {
@@ -1452,28 +1464,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                                  pcms->memhp_io_base);
     }
 
-    scope =  aml_scope("_GPE");
-    {
-        aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
-
-        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
-            method = aml_method("_E01", 0, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
-            aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
-            aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
-            aml_append(scope, method);
-        }
-
-        if (machine->nvdimms_state->is_enabled) {
-            method = aml_method("_E04", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_notify(aml_name("\\_SB.NVDR"),
-                                          aml_int(0x80)));
-            aml_append(scope, method);
-        }
-    }
-    aml_append(dsdt, scope);
-
     crs_range_set_init(&crs_range_set);
     bus = PC_MACHINE(machine)->bus;
     if (bus) {
@@ -1752,6 +1742,19 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     }
     aml_append(dsdt, sb_scope);
 
+    if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+        scope =  aml_scope("_GPE");
+        {
+            method = aml_method("_E01", 0, AML_NOTSERIALIZED);
+            aml_append(method,
+                aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
+            aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
+            aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
+            aml_append(scope, method);
+        }
+        aml_append(dsdt, scope);
+    }
+
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     acpi_table_end(linker, &table);
-- 
MST


