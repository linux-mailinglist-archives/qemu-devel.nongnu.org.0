Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8472D331A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:19:47 +0100 (CET)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjSc-0001Fn-Mq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminY-0007sG-Sb
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminV-0005th-Py
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GgqegJ2AwPrrSt1c+ZG97wYMfpCS+LJtHRAzqe50o9Y=;
 b=Eyi0hfMHF142gyA9DESQhHGRzoo1XyMx81CVhg9CXG8EPj5852XA01qzFTi6ZIsv+rTx+g
 qHF3qt/eRYRwApJB09Xvjzq+2aNfjjpumfhiMe4FyCERSYb44nFUUAx1GDD/RpoNFl4hUv
 GzaMAZ6mYvTrt18VRgxUKklYBo/6vIE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-5d5BvvxIN5mb_51YnwrscA-1; Tue, 08 Dec 2020 14:37:13 -0500
X-MC-Unique: 5d5BvvxIN5mb_51YnwrscA-1
Received: by mail-wr1-f71.google.com with SMTP id d2so2248139wrr.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GgqegJ2AwPrrSt1c+ZG97wYMfpCS+LJtHRAzqe50o9Y=;
 b=EjXfvEtTNqD/yHLmVQXGAuJdUUoBTwL/0zuJ3kQoa3rX8IJBnsW0ldNHLLlqKYZSbd
 fzOmAzVTrLgFOzvUFDsZPgwaHFhdWFfRTtbwDhfBAsrtZlaJX5MfaDoeG/DAbJnDgO2j
 mjk5NewlVLf5mc/WlTYYbmvp03xBCNUQGRZpZx8GkquM5n4UmBxrocxcXsAmBH30Czdf
 /ghlwzqtoHU/bMmRu0iHH1oi2gq9OjUmzBxXRqYt6bHY3/BppAnAtpFBg5oR+WhKLtYB
 V1gc1ssvRe6hVnDTD2AssVoFZSOuJnNU1bOJnOHkor2x+YyBQw9vN9MMOcBKg1ut12Wf
 4TRw==
X-Gm-Message-State: AOAM532emko8hsvwhdfBjXazw+yeMtVceTk1i46TcmUYmGthdS6B/hfg
 IQKUoLl/TiQ1ci+IPyS3dNde9p32D8yO5pJHZt3v6PZMBYp5kJhJlYTCzhBVi4gGMD+7qHtU3sA
 NcdLuNMsnaXGAsbK8fCfejwJAvAp0QF+TUyzVbIl1tNE5RYuw870OuBO6TgAt
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr5220381wmi.95.1607456231858; 
 Tue, 08 Dec 2020 11:37:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBW3IK5NrY7DNga+YUUaKx2DM3yRyOMSy6vgfo74XVtQS7THs6qSmSSJs0bZ9r/bFiU/mUsA==
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr5220361wmi.95.1607456231592; 
 Tue, 08 Dec 2020 11:37:11 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c1sm4929869wml.8.2020.12.08.11.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:10 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 56/66] hw/i386/pc: add max combined fw size as machine
 configuration option
Message-ID: <20201208193307.646726-57-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Erich-McMillan <erich.mcmillan@hp.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Erich-McMillan <erich.mcmillan@hp.com>

At Hewlett Packard Inc. we have a need for increased fw size to enable testing of our custom fw.

Rebase v6 patch to d73c46e4

Signed-off-by: Erich McMillan <erich.mcmillan@hp.com>
Message-Id: <20201208155338.14-1-erich.mcmillan@hp.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h |  2 ++
 hw/i386/pc.c         | 51 ++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc_sysfw.c   | 15 +++----------
 3 files changed, 56 insertions(+), 12 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 49dfa667de..2aa8797c6e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -44,6 +44,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    uint64_t max_fw_size;
 
     /* NUMA information: */
     uint64_t numa_nodes;
@@ -60,6 +61,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
+#define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
 
 /**
  * PCMachineClass:
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7113fb0770..675e15c0aa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1569,6 +1569,50 @@ static void pc_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
     pcms->max_ram_below_4g = value;
 }
 
+static void pc_machine_get_max_fw_size(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    uint64_t value = pcms->max_fw_size;
+
+    visit_type_size(v, name, &value, errp);
+}
+
+static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
+                                       const char *name, void *opaque,
+                                       Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+    Error *error = NULL;
+    uint64_t value;
+
+    visit_type_size(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    /*
+    * We don't have a theoretically justifiable exact lower bound on the base
+    * address of any flash mapping. In practice, the IO-APIC MMIO range is
+    * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving free
+    * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB in
+    * size.
+    */
+    if (value > 16 * MiB) {
+        error_setg(errp,
+                   "User specified max allowed firmware size %" PRIu64 " is "
+                   "greater than 16MiB. If combined firwmare size exceeds "
+                   "16MiB the system may not boot, or experience intermittent"
+                   "stability issues.",
+                   value);
+        return;
+    }
+
+    pcms->max_fw_size = value;
+}
+
 static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1584,6 +1628,7 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->pit_enabled = true;
+    pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
 #endif
@@ -1710,6 +1755,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
 
     object_class_property_add_bool(oc, "hpet",
         pc_machine_get_hpet, pc_machine_set_hpet);
+
+    object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
+        pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
+        NULL, NULL);
+    object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
+        "Maximum combined firmware size");
 }
 
 static const TypeInfo pc_machine_info = {
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index b6c0822fe3..f8bd3a8b85 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -39,15 +39,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 
-/*
- * We don't have a theoretically justifiable exact lower bound on the base
- * address of any flash mapping. In practice, the IO-APIC MMIO range is
- * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving free
- * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8MB in
- * size.
- */
-#define FLASH_SIZE_LIMIT (8 * MiB)
-
 #define FLASH_SECTOR_SIZE 4096
 
 static void pc_isa_bios_init(MemoryRegion *rom_memory,
@@ -140,7 +131,7 @@ void pc_system_flash_cleanup_unused(PCMachineState *pcms)
  * Stop at the first pcms->flash[0] lacking a block backend.
  * Set each flash's size from its block backend.  Fatal error if the
  * size isn't a non-zero multiple of 4KiB, or the total size exceeds
- * FLASH_SIZE_LIMIT.
+ * pcms->max_fw_size.
  *
  * If pcms->flash[0] has a block backend, its memory is passed to
  * pc_isa_bios_init().  Merging several flash devices for isa-bios is
@@ -182,10 +173,10 @@ static void pc_system_flash_map(PCMachineState *pcms,
         }
         if ((hwaddr)size != size
             || total_size > HWADDR_MAX - size
-            || total_size + size > FLASH_SIZE_LIMIT) {
+            || total_size + size > pcms->max_fw_size) {
             error_report("combined size of system firmware exceeds "
                          "%" PRIu64 " bytes",
-                         FLASH_SIZE_LIMIT);
+                         pcms->max_fw_size);
             exit(1);
         }
 
-- 
MST


