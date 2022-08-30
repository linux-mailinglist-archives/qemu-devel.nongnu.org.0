Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3B5A6A57
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 19:28:16 +0200 (CEST)
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT528-0004Aq-3r
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 13:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4uA-0006Oe-FM
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT4u6-0005hn-LH
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 13:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661879996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QlIADtL1/ylJTvF48iJIfhWrxv0+BgSLXfMGZ5gP6Ug=;
 b=SrK6nj7cRlqAdeUbU9AcDtbHJ6LWG2i7Lw8TLwa0jj01kg+ov+EaaggK9sKhgNxNwcQ6jT
 V0FOtk+T2UtS/qx5yLnO13CXywa7v9zl7FmIuNcX27VXSKP2HOLtjK06cB9QFZRbzbh76i
 IAczRzIrskoktFe+JnpHgCUViSftWX0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-vsoIj3UMMLibnyBcg_S-rQ-1; Tue, 30 Aug 2022 13:19:53 -0400
X-MC-Unique: vsoIj3UMMLibnyBcg_S-rQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 034D785A589;
 Tue, 30 Aug 2022 17:19:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86C071121314;
 Tue, 30 Aug 2022 17:19:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-s390x@nongnu.org
Subject: [PULL 1/6] hw: Add compat machines for 7.2
Date: Tue, 30 Aug 2022 19:19:42 +0200
Message-Id: <20220830171947.71464-2-thuth@redhat.com>
In-Reply-To: <20220830171947.71464-1-thuth@redhat.com>
References: <20220830171947.71464-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Cornelia Huck <cohuck@redhat.com>

Add 7.2 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220727121755.395894-1-cohuck@redhat.com>
[thuth: fixed conflict with pcmc->legacy_no_rng_seed]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/m68k/virt.c             |  9 ++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 10 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 7b416c9787..311ed17e18 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -379,6 +379,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_7_1[];
+extern const size_t hw_compat_7_1_len;
+
 extern GlobalProperty hw_compat_7_0[];
 extern const size_t hw_compat_7_0_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 8435733bd6..c95333514e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -200,6 +200,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_7_1[];
+extern const size_t pc_compat_7_1_len;
+
 extern GlobalProperty pc_compat_7_0[];
 extern const size_t pc_compat_7_0_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..1a6480fd2a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3094,10 +3094,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_7_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(7, 2)
+
 static void virt_machine_7_1_options(MachineClass *mc)
 {
+    virt_machine_7_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(7, 1)
+DEFINE_VIRT_MACHINE(7, 1)
 
 static void virt_machine_7_0_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..aa520e74a8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,6 +40,9 @@
 #include "hw/virtio/virtio-pci.h"
 #include "qom/object_interfaces.h"
 
+GlobalProperty hw_compat_7_1[] = {};
+const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
+
 GlobalProperty hw_compat_7_0[] = {
     { "arm-gicv3-common", "force-8-bit-prio", "on" },
     { "nvme-ns", "eui64-default", "on"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7280c02ce3..566accf7e6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -107,6 +107,9 @@
     { "qemu64-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },\
     { "athlon-" TYPE_X86_CPU, "model-id", "QEMU Virtual CPU version " v, },
 
+GlobalProperty pc_compat_7_1[] = {};
+const size_t pc_compat_7_1_len = G_N_ELEMENTS(pc_compat_7_1);
+
 GlobalProperty pc_compat_7_0[] = {};
 const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
 
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 20962c34e7..8043a250ad 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -432,7 +432,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_7_1_machine_options(MachineClass *m)
+static void pc_i440fx_7_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -442,6 +442,18 @@ static void pc_i440fx_7_1_machine_options(MachineClass *m)
     pcmc->legacy_no_rng_seed = true;
 }
 
+DEFINE_I440FX_MACHINE(v7_2, "pc-i440fx-7.2", NULL,
+                      pc_i440fx_7_2_machine_options);
+
+static void pc_i440fx_7_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_7_2_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
+    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
+}
+
 DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
                       pc_i440fx_7_1_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 2e5dae9a89..53eda50e81 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -370,7 +370,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_7_1_machine_options(MachineClass *m)
+static void pc_q35_7_2_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -379,6 +379,17 @@ static void pc_q35_7_1_machine_options(MachineClass *m)
     pcmc->legacy_no_rng_seed = true;
 }
 
+DEFINE_Q35_MACHINE(v7_2, "pc-q35-7.2", NULL,
+                   pc_q35_7_2_machine_options);
+
+static void pc_q35_7_1_machine_options(MachineClass *m)
+{
+    pc_q35_7_2_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_7_1, hw_compat_7_1_len);
+    compat_props_add(m->compat_props, pc_compat_7_1, pc_compat_7_1_len);
+}
+
 DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
                    pc_q35_7_1_machine_options);
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 0aa383fa6b..3122c8ef2c 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -322,10 +322,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_7_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(7, 2, true)
+
 static void virt_machine_7_1_options(MachineClass *mc)
 {
+    virt_machine_7_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
-DEFINE_VIRT_MACHINE(7, 1, true)
+DEFINE_VIRT_MACHINE(7, 1, false)
 
 static void virt_machine_7_0_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index bc9ba6e6dc..fb790b61e4 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4730,15 +4730,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-7.2
+ */
+static void spapr_machine_7_2_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(7_2, "7.2", true);
+
 /*
  * pseries-7.1
  */
 static void spapr_machine_7_1_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_7_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
 
-DEFINE_SPAPR_MACHINE(7_1, "7.1", true);
+DEFINE_SPAPR_MACHINE(7_1, "7.1", false);
 
 /*
  * pseries-7.0
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index cc3097bfee..bf1b36d824 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -792,14 +792,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_7_2_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_7_2_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(7_2, "7.2", true);
+
 static void ccw_machine_7_1_instance_options(MachineState *machine)
 {
+    ccw_machine_7_2_instance_options(machine);
 }
 
 static void ccw_machine_7_1_class_options(MachineClass *mc)
 {
+    ccw_machine_7_2_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
 }
-DEFINE_CCW_MACHINE(7_1, "7.1", true);
+DEFINE_CCW_MACHINE(7_1, "7.1", false);
 
 static void ccw_machine_7_0_instance_options(MachineState *machine)
 {
-- 
2.31.1


