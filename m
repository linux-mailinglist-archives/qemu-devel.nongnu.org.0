Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D144760A4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:25:26 +0100 (CET)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYxx-0004rG-4v
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:25:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXjd-00078t-1D
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:06:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxXjX-0005MJ-96
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 12:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639587985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BVJ71uw6HRB7fYWDHHNdUUDpx3rUdpwf6Cjl8m6iATU=;
 b=IgeFly6eQavCRByczi8ZW3yho9rky3acI1NVTP2v7ujNqlZE9XNJX4YCAsLALF4EL7GZHc
 DtXHraiVGalzQqouLZhkeXIkw8a0F9EloGq0iM+/U826J3kld61iiZJsKF5hZRz8C2/zdb
 gQWI59yXx5IuuUoDLS6n90lumLdrQq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-1ci6PI0EOr6Xx_pXx-w_6A-1; Wed, 15 Dec 2021 12:06:22 -0500
X-MC-Unique: 1ci6PI0EOr6Xx_pXx-w_6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8077410151E0;
 Wed, 15 Dec 2021 17:06:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7231E610AE;
 Wed, 15 Dec 2021 17:05:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: Add compat machines for 6.3
Date: Wed, 15 Dec 2021 18:05:48 +0100
Message-Id: <20211215170548.20776-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 6.2 machine types for arm/i440fx/q35/s390x/spapr.

Shameless copy of commit
	52e64f5b1f2c81472b57dbad255ab9b00302f10d
from
	Yanan Wang <wangyanan55@huawei.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 hw/arm/virt.c              | 11 ++++++++++-
 hw/core/machine.c          |  4 ++++
 hw/i386/pc.c               |  4 ++++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 19 ++++++++++++++++---
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 9 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 9c1c190104..b7b68471ff 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -375,6 +375,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
 
+extern GlobalProperty hw_compat_6_2[];
+extern const size_t hw_compat_6_2_len;
+
 extern GlobalProperty hw_compat_6_1[];
 extern const size_t hw_compat_6_1_len;
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9ab39e428f..b38947c224 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -196,6 +196,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 /* sgx.c */
 void pc_machine_init_sgx_epc(PCMachineState *pcms);
 
+extern GlobalProperty pc_compat_6_2[];
+extern const size_t pc_compat_6_2_len;
+
 extern GlobalProperty pc_compat_6_1[];
 extern const size_t pc_compat_6_1_len;
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 30da05dfe0..80222aea20 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2857,10 +2857,19 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_6_3_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(6, 3)
+
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_6_3_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
+DEFINE_VIRT_MACHINE(6, 2)
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 53a99abc56..1b92e787f4 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,10 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_2[] = {
+};
+const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
+
 GlobalProperty hw_compat_6_1[] = {
     { "vhost-user-vsock-device", "seqpacket", "off" },
     { "nvme-ns", "shared", "off" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a2ef40ecbc..68836d5bc3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -94,6 +94,10 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_2[] = {
+};
+const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
+
 GlobalProperty pc_compat_6_1[] = {
     { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
     { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 223dd3e05d..d9f9cd593d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_2_machine_options(MachineClass *m)
+static void pc_i440fx_6_3_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v6_3, "pc-i440fx-6.3", NULL,
+                      pc_i440fx_6_3_machine_options);
+
+static void pc_i440fx_6_2_machine_options(MachineClass *m)
+{
+    pc_i440fx_6_3_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
                       pc_i440fx_6_2_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e1e100316d..60efb61fca 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_2_machine_options(MachineClass *m)
+static void pc_q35_6_3_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v6_3, "pc-q35-6.3", NULL,
+                   pc_q35_6_3_machine_options);
+
+static void pc_q35_6_2_machine_options(MachineClass *m)
+{
+    pc_q35_6_3_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
+}
+
 DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
                    pc_q35_6_2_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3b5fd749be..1b999027bb 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4666,14 +4666,27 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     type_init(spapr_machine_register_##suffix)
 
 /*
- * pseries-6.2
+ * pseries-6.3
  */
-static void spapr_machine_6_2_class_options(MachineClass *mc)
+static void spapr_machine_6_3_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
 }
 
-DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
+DEFINE_SPAPR_MACHINE(6_2, "6.3", true);
+
+/*
+ * pseries-6.1
+ */
+static void spapr_machine_6_1_class_options(MachineClass *mc)
+{
+    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
+
+    spapr_machine_6_3_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+}
+
+DEFINE_SPAPR_MACHINE(6_2, "6.2", false);
 
 /*
  * pseries-6.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 653587ea62..16e2441143 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -791,14 +791,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_6_3_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_6_3_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(6_3, "6.3", true);
+
 static void ccw_machine_6_2_instance_options(MachineState *machine)
 {
+    ccw_machine_6_3_instance_options(machine);
 }
 
 static void ccw_machine_6_2_class_options(MachineClass *mc)
 {
+    ccw_machine_6_3_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
-DEFINE_CCW_MACHINE(6_2, "6.2", true);
+DEFINE_CCW_MACHINE(6_2, "6.2", false);
 
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
-- 
2.33.1


