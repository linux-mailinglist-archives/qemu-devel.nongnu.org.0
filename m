Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3F3FD7CC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:39:41 +0200 (CEST)
Received: from localhost ([::1]:48226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNee-0001RM-5T
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc8-0006jq-4i
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc5-0005dB-2K
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id u16so3749816wrn.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kw+tgxnJQFgyIKtC9H3QhpTCdzasNtrMOVm+PcV5arQ=;
 b=ioXyUWKLhk3NPSbBlb40NKHCGzSdo+rJCPCRlg0chYz+H2xXpBjKj4MhMau19aMJCl
 dEvWM5N8czO/x3dhhytEwNmR/Rghza+WJ2Tv8mWDyXRhY0DK+PsMR6uo9wsVkDPTBpNn
 QeasL0sLg0rUUPJVLQWaIilzjgtrSjvODV9tfTP+GjsK0pWBkm6HLdGYzXCQMZZA1hRp
 7S6/lbMIiATIieivA7YrLkZBy/iTM4YfD0nEOvbPQ5592gFXATwWQi59fzwR1QS2iKuY
 nPf0+hEOBdZ549+vcOwl3VWIIO+S8GGP+Tx1RIQNFyyG/jcd2dmpp9d+kwt78YwBQL+P
 JPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kw+tgxnJQFgyIKtC9H3QhpTCdzasNtrMOVm+PcV5arQ=;
 b=WwMHg0zFPJKvFviOz8XenIKAYJsia6L84aqMkTMq3LcAHl+oZMhfAzKiKZbHd238po
 UDNzloJZ/cp5wJxyPMciXy4cV4Ul0tPeG9ICcH3GCs43TzPKiLiH3qHf/at6d02p4dNO
 OTmlkIQsinsO7Of2JOoDllU9599ld1lNhOAAGRg/EoYGr9XjzIUnuumBqWrE4bWfKkaj
 bfm5iQmjDgORXB+XoSSqt4LkEYmRI7crU2Ky9aOrMBvZnRzOnDg1KHKqYS4b/xYi9GAn
 IzgE4Wg3yfyYsddOzMjAuMLaPH5omNom517fI5AIY4Ml537Ur031iXKit4VR7J2TpayG
 cKdg==
X-Gm-Message-State: AOAM53181WI7LMG5bWCKFZTE3Opq1mBetPif1QUKpYsTUoHImnNNDjUp
 8dT3XtvzmRnPdN9Mpew9V4tZO6l4IzKq/Q==
X-Google-Smtp-Source: ABdhPJyT4uDWUhKGFBPc41aAljyjs3WYkwLgTp112y8f1nBje/wXyABlmKMu0KR+Ut0jH2Rlfh4P0g==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr37468326wre.387.1630492619745; 
 Wed, 01 Sep 2021 03:36:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.36.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:36:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/51] hw: Add compat machines for 6.2
Date: Wed,  1 Sep 2021 11:36:07 +0100
Message-Id: <20210901103653.13435-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/virt.c              | 11 +++++++++--
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 17 ++++++++++++++---
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 9 files changed, 73 insertions(+), 8 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index accd6eff35a..463a5514f97 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -353,6 +353,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_1[];
+extern const size_t hw_compat_6_1_len;
+
 extern GlobalProperty hw_compat_6_0[];
 extern const size_t hw_compat_6_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe75172..97b4ab79b53 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -196,6 +196,9 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_6_1[];
+extern const size_t pc_compat_6_1_len;
+
 extern GlobalProperty pc_compat_6_0[];
 extern const size_t pc_compat_6_0_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 86c8a4ca3d7..dbb77b59974 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2783,10 +2783,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_machine_6_1_options(MachineClass *mc)
+static void virt_machine_6_2_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
+DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
+
+static void virt_machine_6_1_options(MachineClass *mc)
+{
+    virt_machine_6_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+}
+DEFINE_VIRT_MACHINE(6, 1)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 54e040587dd..067f42b528f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_1[] = {};
+const size_t hw_compat_6_1_len = G_N_ELEMENTS(hw_compat_6_1);
+
 GlobalProperty hw_compat_6_0[] = {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
     { "i8042", "extended-state", "false"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 102b2239468..1276bfeee45 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -93,6 +93,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_1[] = {};
+const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
+
 GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1bc30167acc..c5da7739cef 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -412,7 +412,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_1_machine_options(MachineClass *m)
+static void pc_i440fx_6_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -421,6 +421,18 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
+                      pc_i440fx_6_2_machine_options);
+
+static void pc_i440fx_6_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_6_2_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
                       pc_i440fx_6_1_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index eeb0b185b11..565fadce540 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -354,7 +354,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_1_machine_options(MachineClass *m)
+static void pc_q35_6_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -362,6 +362,17 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
+                   pc_q35_6_2_machine_options);
+
+static void pc_q35_6_1_machine_options(MachineClass *m)
+{
+    pc_q35_6_2_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+    compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
+}
+
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
                    pc_q35_6_1_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 81699d4f8be..d39fd4e6449 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4686,14 +4686,25 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     type_init(spapr_machine_register_##suffix)
 
 /*
- * pseries-6.1
+ * pseries-6.2
  */
-static void spapr_machine_6_1_class_options(MachineClass *mc)
+static void spapr_machine_6_2_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
 }
 
-DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
+DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
+
+/*
+ * pseries-6.1
+ */
+static void spapr_machine_6_1_class_options(MachineClass *mc)
+{
+    spapr_machine_6_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
+}
+
+DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
 
 /*
  * pseries-6.0
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e4b18aef496..4d25278cf20 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -791,14 +791,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_6_2_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_6_2_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(6_2, "6.2", true);
+
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
+    ccw_machine_6_2_instance_options(machine);
 }
 
 static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
+    ccw_machine_6_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
 }
-DEFINE_CCW_MACHINE(6_1, "6.1", true);
+DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
 static void ccw_machine_6_0_instance_options(MachineState *machine)
 {
-- 
2.20.1


