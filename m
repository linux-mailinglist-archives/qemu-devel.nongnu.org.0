Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2885508669
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:53:46 +0200 (CEST)
Received: from localhost ([::1]:35758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7xy-0006BB-1D
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eT-0001Pk-ME
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nh7eR-0006s5-Uk
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 06:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650450815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9cjgYdCEzeIrhMniFxHd0y1Nu0HQPmgmWnrgAeNGek=;
 b=aBP/YrgQmUhyF3c9ofz+ghXCkK6KdapmgBHrILX/gPAybJ6WS2LfzYrrNNCblW78QKJ8ec
 bbA6uMAvh3GVoe290pwZulOSlqcW0cqpgqlaKlQVtlirtmlbwoR2ru7p0N3QZroTD5RW/v
 XtjjbZ4rQR7PDzEbVEF21WIf4YBSZ6I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-KXmlhPCsMqq9BCIZbUGF4Q-1; Wed, 20 Apr 2022 06:33:32 -0400
X-MC-Unique: KXmlhPCsMqq9BCIZbUGF4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F0EB29AA3B5;
 Wed, 20 Apr 2022 10:33:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34F1FC52CA5;
 Wed, 20 Apr 2022 10:33:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/7] hw: Add compat machines for 7.1
Date: Wed, 20 Apr 2022 12:33:08 +0200
Message-Id: <20220420103309.264479-7-thuth@redhat.com>
In-Reply-To: <20220420103309.264479-1-thuth@redhat.com>
References: <20220420103309.264479-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Add 7.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20220316145521.1224083-1-cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
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
index c92ac8815c..d64b5481e8 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -380,6 +380,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_7_0[];
+extern const size_t hw_compat_7_0_len;
+
 extern GlobalProperty hw_compat_6_2[];
 extern const size_t hw_compat_6_2_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 1a27de9c8b..637367dc5f 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -202,6 +202,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_7_0[];
+extern const size_t pc_compat_7_0_len;
+
 extern GlobalProperty pc_compat_6_2[];
 extern const size_t pc_compat_6_2_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d2e5ecd234..9284f7d28e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3022,10 +3022,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_7_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(7, 1)
+
 static void virt_machine_7_0_options(MachineClass *mc)
 {
+    virt_machine_7_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
+DEFINE_VIRT_MACHINE(7, 0)
 
 static void virt_machine_6_2_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1e23fdc14b..cb9bbc844d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_7_0[] = {};
+const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
+
 GlobalProperty hw_compat_6_2[] = {
     { "PIIX4_PM", "x-not-migrate-acpi-index", "on"},
 };
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd55fc725c..23bba9d82c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -95,6 +95,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_7_0[] = {};
+const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
+
 GlobalProperty pc_compat_6_2[] = {
     { "virtio-mem", "unplugged-inaccessible", "off" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index b72c03d0a6..4c185c72d0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -415,7 +415,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_7_0_machine_options(MachineClass *m)
+static void pc_i440fx_7_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -424,6 +424,18 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
+                      pc_i440fx_7_1_machine_options);
+
+static void pc_i440fx_7_0_machine_options(MachineClass *m)
+{
+    pc_i440fx_7_1_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
+    compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
+}
+
 DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
                       pc_i440fx_7_0_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 1780f79bc1..302288342a 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_7_0_machine_options(MachineClass *m)
+static void pc_q35_7_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -368,6 +368,17 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
+                   pc_q35_7_1_machine_options);
+
+static void pc_q35_7_0_machine_options(MachineClass *m)
+{
+    pc_q35_7_1_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
+    compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
+}
+
 DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
                    pc_q35_7_0_machine_options);
 
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 7de8b5f833..e215aa3d42 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -315,10 +315,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_7_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(7, 1, true)
+
 static void virt_machine_7_0_options(MachineClass *mc)
 {
+    virt_machine_7_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
 }
-DEFINE_VIRT_MACHINE(7, 0, true)
+DEFINE_VIRT_MACHINE(7, 0, false)
 
 static void virt_machine_6_2_options(MachineClass *mc)
 {
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cc11fcc8b2..22569305d2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4702,15 +4702,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-7.1
+ */
+static void spapr_machine_7_1_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(7_1, "7.1", true);
+
 /*
  * pseries-7.0
  */
 static void spapr_machine_7_0_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_7_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
 }
 
-DEFINE_SPAPR_MACHINE(7_0, "7.0", true);
+DEFINE_SPAPR_MACHINE(7_0, "7.0", false);
 
 /*
  * pseries-6.2
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2d32647d08..8fa488d13a 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -792,14 +792,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_7_1_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_7_1_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(7_1, "7.1", true);
+
 static void ccw_machine_7_0_instance_options(MachineState *machine)
 {
+    ccw_machine_7_1_instance_options(machine);
 }
 
 static void ccw_machine_7_0_class_options(MachineClass *mc)
 {
+    ccw_machine_7_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
 }
-DEFINE_CCW_MACHINE(7_0, "7.0", true);
+DEFINE_CCW_MACHINE(7_0, "7.0", false);
 
 static void ccw_machine_6_2_instance_options(MachineState *machine)
 {
-- 
2.27.0


