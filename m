Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744704852EB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:41:09 +0100 (CET)
Received: from localhost ([::1]:42452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55bH-0004ld-8D
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:41:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55Wq-0002jg-74
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55Wo-0000R0-A0
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RnIFzPkRPOW15ffdzRSTFcv8s1Asud4isyVjYgSDCI=;
 b=fcT+jbSZvBSgpPu/a1FMCY0+uRO9p12RcaBuROmiNXng+cAzB8Crw+s8OXoZJXFCEmuAQU
 RXV5lQBdovgqzHs11A2HBySO/IykzKI2VoTtJJ9uc+OqV1kfLG7+1yOblzCPcXXswXOTZQ
 Olbte9QLbFGA9SmG5pWJeLlPPXe3aD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-NvwGvVIJOY-UCBP0X-lAqw-1; Wed, 05 Jan 2022 07:36:28 -0500
X-MC-Unique: NvwGvVIJOY-UCBP0X-lAqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 821DE801962;
 Wed,  5 Jan 2022 12:36:27 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CDF722DFF;
 Wed,  5 Jan 2022 12:36:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] hw: Add compat machines for 7.0
Date: Wed,  5 Jan 2022 13:36:05 +0100
Message-Id: <20220105123612.432038-2-thuth@redhat.com>
In-Reply-To: <20220105123612.432038-1-thuth@redhat.com>
References: <20220105123612.432038-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20211217143948.289995-1-cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/core/machine.c          |  3 +++
 hw/i386/pc.c               |  3 +++
 hw/i386/pc_piix.c          | 14 +++++++++++++-
 hw/i386/pc_q35.c           | 13 ++++++++++++-
 hw/ppc/spapr.c             | 15 +++++++++++++--
 hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
 include/hw/boards.h        |  3 +++
 include/hw/i386/pc.h       |  3 +++
 9 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6bce595aba..4593fea1ce 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2856,10 +2856,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
+static void virt_machine_7_0_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
+
 static void virt_machine_6_2_options(MachineClass *mc)
 {
+    virt_machine_7_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(6, 2)
+DEFINE_VIRT_MACHINE(6, 2)
 
 static void virt_machine_6_1_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index a4a2df405f..debcdc0e70 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,6 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
+GlobalProperty hw_compat_6_2[] = {};
+const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
+
 GlobalProperty hw_compat_6_1[] = {
     { "vhost-user-vsock-device", "seqpacket", "off" },
     { "nvme-ns", "shared", "off" },
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a2ef40ecbc..fccde2ef39 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -94,6 +94,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
+GlobalProperty pc_compat_6_2[] = {};
+const size_t pc_compat_6_2_len = G_N_ELEMENTS(pc_compat_6_2);
+
 GlobalProperty pc_compat_6_1[] = {
     { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
     { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 223dd3e05d..1999190276 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
 }
 
-static void pc_i440fx_6_2_machine_options(MachineClass *m)
+static void pc_i440fx_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
+                      pc_i440fx_7_0_machine_options);
+
+static void pc_i440fx_6_2_machine_options(MachineClass *m)
+{
+    pc_i440fx_7_0_machine_options(m);
+    m->alias = NULL;
+    m->is_default = false;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
+}
+
 DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
                       pc_i440fx_6_2_machine_options);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index e1e100316d..2e981f436c 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus = 288;
 }
 
-static void pc_q35_6_2_machine_options(MachineClass *m)
+static void pc_q35_7_0_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
     pcmc->default_cpu_version = 1;
 }
 
+DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
+                   pc_q35_7_0_machine_options);
+
+static void pc_q35_6_2_machine_options(MachineClass *m)
+{
+    pc_q35_7_0_machine_options(m);
+    m->alias = NULL;
+    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
+    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
+}
+
 DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
                    pc_q35_6_2_machine_options);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 3b5fd749be..8373429325 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4665,15 +4665,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
 
+/*
+ * pseries-7.0
+ */
+static void spapr_machine_7_0_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(7_0, "7.0", true);
+
 /*
  * pseries-6.2
  */
 static void spapr_machine_6_2_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_7_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
 
-DEFINE_SPAPR_MACHINE(6_2, "6.2", true);
+DEFINE_SPAPR_MACHINE(6_2, "6.2", false);
 
 /*
  * pseries-6.1
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 653587ea62..84e3e63c43 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -791,14 +791,26 @@ bool css_migration_enabled(void)
     }                                                                         \
     type_init(ccw_machine_register_##suffix)
 
+static void ccw_machine_7_0_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_7_0_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(7_0, "7.0", true);
+
 static void ccw_machine_6_2_instance_options(MachineState *machine)
 {
+    ccw_machine_7_0_instance_options(machine);
 }
 
 static void ccw_machine_6_2_class_options(MachineClass *mc)
 {
+    ccw_machine_7_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_2, hw_compat_6_2_len);
 }
-DEFINE_CCW_MACHINE(6_2, "6.2", true);
+DEFINE_CCW_MACHINE(6_2, "6.2", false);
 
 static void ccw_machine_6_1_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index f49a2578ea..c92ac8815c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -380,6 +380,9 @@ struct MachineState {
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
 
-- 
2.27.0


