Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84A32D1324
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:10:27 +0100 (CET)
Received: from localhost ([::1]:43142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHDe-0003rH-MJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHBC-000299-TP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:07:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmHB9-0002hD-Qx
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:07:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607350070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=da5frvfYUUYMgQwv0oC4ZhslkyyiWQAyV0GfPbPnOHs=;
 b=YIYrcZClJx9Uv+sz4arGbZzZ4pSxgQR72PPSpQF2kzZZX+FMcVk+S3mPT4r1euRxCb/3SR
 YUNNrQm6wd4VqwoOWk2xTaP1OQz/xXcA3oIZQgqhO9pRTUptCpYv24zktfvKy+tTqH6Bxm
 lB37sv5Q9x3nqkk9dqFo20aSskIJf24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404--jjnDzysMR-LZq_KsRN5Eg-1; Mon, 07 Dec 2020 09:07:48 -0500
X-MC-Unique: -jjnDzysMR-LZq_KsRN5Eg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7427E800D53;
 Mon,  7 Dec 2020 14:07:47 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7095110023AD;
 Mon,  7 Dec 2020 14:07:46 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] hw: add compat machines for 6.0
Date: Mon,  7 Dec 2020 09:07:32 -0500
Message-Id: <20201207140739.3829993-2-imammedo@redhat.com>
In-Reply-To: <20201207140739.3829993-1-imammedo@redhat.com>
References: <20201207140739.3829993-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
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
Cc: lersek@redhat.com, ankur.a.arora@oracle.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Add 6.0 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 9 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index a49e3a6b44..f94f4ad5d8 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -310,6 +310,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_5_2[];
+extern const size_t hw_compat_5_2_len;
+
 extern GlobalProperty hw_compat_5_1[];
 extern const size_t hw_compat_5_1_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 911e460097..49dfa667de 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -191,6 +191,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_5_2[];
+extern const size_t pc_compat_5_2_len;
+
 extern GlobalProperty pc_compat_5_1[];
 extern const size_t pc_compat_5_1_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..d21dad4491 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2587,10 +2587,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_6_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
+
 static void virt_machine_5_2_options(MachineClass *mc)
 {
+    virt_machine_6_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
+DEFINE_VIRT_MACHINE(5, 2)
 
 static void virt_machine_5_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index d0408049b5..9c41b94e0d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -28,6 +28,9 @@
 #include "hw/mem/nvdimm.h"
 #include "migration/vmstate.h"
 
+GlobalProperty hw_compat_5_2[] = {};
+const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
+
 GlobalProperty hw_compat_5_1[] = {
     { "vhost-scsi", "num_queues", "1"},
     { "vhost-user-blk", "num-queues", "1"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 17b514d1da..781523684c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -97,6 +97,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_5_2[] = {};
+const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
+
 GlobalProperty pc_compat_5_1[] = {
     { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 13d1628f13..6188c3e97e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_5_2_machine_options(MachineClass *m)
+static void pc_i440fx_6_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -435,6 +435,18 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
+                      pc_i440fx_6_0_machine_options);
+
+static void pc_i440fx_5_2_machine_options(MachineClass *m)
+{
+    pc_i440fx_6_0_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
                       pc_i440fx_5_2_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a3f4959c43..0a212443aa 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -344,7 +344,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_5_2_machine_options(MachineClass *m)
+static void pc_q35_6_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -352,6 +352,17 @@ static void pc_q35_5_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
+                   pc_q35_6_0_machine_options);
+
+static void pc_q35_5_2_machine_options(MachineClass *m)
+{
+    pc_q35_6_0_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
+}
+
 DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
                    pc_q35_5_2_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 12a012d9dd..c060702013 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4509,15 +4509,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-6.0
+ */
+static void spapr_machine_6_0_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
+
 /*
  * pseries-5.2
  */
 static void spapr_machine_5_2_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_6_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
 }
 
-DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
+DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
 
 /*
  * pseries-5.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4e140bbead..f0ee8dae68 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -789,14 +789,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_6_0_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_6_0_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(6_0, "6.0", true);
+
 static void ccw_machine_5_2_instance_options(MachineState *machine)
 {
+    ccw_machine_6_0_instance_options(machine);
 }
 
 static void ccw_machine_5_2_class_options(MachineClass *mc)
 {
+    ccw_machine_6_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
 }
-DEFINE_CCW_MACHINE(5_2, "5.2", true);
+DEFINE_CCW_MACHINE(5_2, "5.2", false);
 
 static void ccw_machine_5_1_instance_options(MachineState *machine)
 {
-- 
2.27.0


