Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFDB34FF5E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 13:20:28 +0200 (CEST)
Received: from localhost ([::1]:35916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRYtf-00024W-9E
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 07:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRYsf-0001IW-Sb
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 07:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lRYsa-0001sB-Nu
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 07:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617189559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VdW3BX9PQEuyFzP34FQkIc6tkOMd9xRBVXAttnNcl2s=;
 b=VRjs6qHM0EKdR2sxK8F67nw/TiaeMMfvFyi8MhExQzRpcJ/FLy8qedUqqzTsKaZOLbMmXo
 fWIN+g2rrOI+HagWbl9oKhobIDfyjDCo+o9LWPi6HuHoVruh6Tp8zbvHnpzCmXWP7gDIP2
 UPULaSio9Lg6wrDDlHkYFPw7BVCu9Zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-4U2tunQsPMy7H-22OC54cw-1; Wed, 31 Mar 2021 07:19:15 -0400
X-MC-Unique: 4U2tunQsPMy7H-22OC54cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98968DFFC0;
 Wed, 31 Mar 2021 11:19:13 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-187.ams2.redhat.com
 [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 901ED6F985;
 Wed, 31 Mar 2021 11:19:03 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1] hw: add compat machines for 6.1
Date: Wed, 31 Mar 2021 13:19:00 +0200
Message-Id: <20210331111900.118274-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 6.1 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/arm/virt.c              |  7 ++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e090..d2645f4752af 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2753,10 +2753,15 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_6_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(6, 1)
+
 static void virt_machine_6_0_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
+DEFINE_VIRT_MACHINE(6, 0)
 
 static void virt_machine_5_2_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9935c6ddd564..4dac3197008e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -36,6 +36,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_0[] = {};
+const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
+
 GlobalProperty hw_compat_5_2[] = {
     { "ICH9-LPC", "smm-compat", "on"},
     { "PIIX4_PM", "smm-compat", "on"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8a84b25a031e..364816efc9d2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -96,6 +96,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_0[] = {};
+const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
+
 GlobalProperty pc_compat_5_2[] = {
     { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 46cc951073b4..4e8edffeaf66 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -415,7 +415,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_0_machine_options(MachineClass *m)
+static void pc_i440fx_6_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -424,6 +424,18 @@ static void pc_i440fx_6_0_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
+                      pc_i440fx_6_1_machine_options);
+
+static void pc_i440fx_6_0_machine_options(MachineClass *m)
+{
+    pc_i440fx_6_1_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
                       pc_i440fx_6_0_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 53450190f549..458ed41c65de 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -345,7 +345,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_0_machine_options(MachineClass *m)
+static void pc_q35_6_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -353,6 +353,17 @@ static void pc_q35_6_0_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
+                   pc_q35_6_1_machine_options);
+
+static void pc_q35_6_0_machine_options(MachineClass *m)
+{
+    pc_q35_6_1_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
+    compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
+}
+
 DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
                    pc_q35_6_0_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d56418ca2942..fbc3aa9b3a15 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4596,15 +4596,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-6.1
+ */
+static void spapr_machine_6_1_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(6_1, "6.1", true);
+
 /*
  * pseries-6.0
  */
 static void spapr_machine_6_0_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_6_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
 
-DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
+DEFINE_SPAPR_MACHINE(6_0, "6.0", false);
 
 /*
  * pseries-5.2
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 2972b607f364..56b52d2d3091 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -795,14 +795,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_6_1_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_6_1_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(6_1, "6.1", true);
+
 static void ccw_machine_6_0_instance_options(MachineState *machine)
 {
+    ccw_machine_6_1_instance_options(machine);
 }
 
 static void ccw_machine_6_0_class_options(MachineClass *mc)
 {
+    ccw_machine_6_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
 }
-DEFINE_CCW_MACHINE(6_0, "6.0", true);
+DEFINE_CCW_MACHINE(6_0, "6.0", false);
 
 static void ccw_machine_5_2_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4a90549ad855..d209601a8b8a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -314,6 +314,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_0[];
+extern const size_t hw_compat_6_0_len;
+
 extern GlobalProperty hw_compat_5_2[];
 extern const size_t hw_compat_5_2_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index dcf060b79185..1522a3359a93 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -197,6 +197,9 @@ bool pc_system_ovmf_table_find(const char *entry, uint8_t **data,
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
 
+extern GlobalProperty pc_compat_6_0[];
+extern const size_t pc_compat_6_0_len;
+
 extern GlobalProperty pc_compat_5_2[];
 extern const size_t pc_compat_5_2_len;
 
-- 
2.26.3


