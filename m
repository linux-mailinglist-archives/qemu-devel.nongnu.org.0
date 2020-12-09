Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A222D4981
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:54:31 +0100 (CET)
Received: from localhost ([::1]:58340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4be-0000VD-CB
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uZ-0003nk-V4
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:10:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3uX-00004u-VT
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zmq5kZJrirBBBXS35ysh+mUgTzxp2lOUsH4CrA7XSDk=;
 b=S00GvkuyoQNKl/yYE/jJiUJM0a/6WSpvNDQzVdIoTp7XNgzp/VYT4lOIwqG/QjvdUnIh47
 zTqyx//VLnEHQk8CkMP18rxiQMRIEWUjMKn9pV7KvDhPlQ25Et5zNXZ2+yzW1ap1Qh3jvn
 O4SNo9ublZ9el8lPbjDZWht0AZXwrEc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-flr6k5ZDNQO5HWEZyKJv1w-1; Wed, 09 Dec 2020 13:09:55 -0500
X-MC-Unique: flr6k5ZDNQO5HWEZyKJv1w-1
Received: by mail-wm1-f71.google.com with SMTP id z12so865758wmf.9
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zmq5kZJrirBBBXS35ysh+mUgTzxp2lOUsH4CrA7XSDk=;
 b=cT0Rl5c8CHLlTFy6lsdR9CBsM0WVuRVi1mTu2Um5yyFEGhIHwHqJ2ew8w4mNYm+reb
 gsfnqvwpU3A1Y57GNakim9cmrgYgCTbdF9Sondy9OQ42yj4/rflzZAW+7RS3JDISdkhF
 ZtO7bi9InQtH/rpz3nex/MNysqPCA9+Ke5EmRlbCGXeUrMdw9eNsdsUZ6T5NICL4FQZk
 15oO0ArEfI9HLXWPbN82FdYLX5WzVd48mYZCUu0oq51lV2fJxr09Rq274cAfUFaaUt21
 TRnzn02Du6PcRdnzVujRSQoye+21fEwyDRUiJ5tpjtNqewFq4JbwaQJeE3jqJ747mAtW
 AmAA==
X-Gm-Message-State: AOAM533wLwKuKA75uk8uV7mYuyXZCLf/cuWU6vmEAU4G7opxjLxWGePj
 Hw7sVTFmuS/QW45oqvjslY0v6nTGXz+bNWqCffaE6N/Y5w8GGrBnZLKenKYIxFOlpM6E86tW+y2
 Ia4IkWYgKtQRXmbDkdf7lKHhnyq3dXMyL9Za6LRnM4bq2MYhiSsxiNWtDQQK3
X-Received: by 2002:a1c:234d:: with SMTP id j74mr4061835wmj.18.1607537392941; 
 Wed, 09 Dec 2020 10:09:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEtrtsttZlUEVHY/t76bo549KYxETkFcbzFhzyAQA/fZuvv5jSbPXFWFDCRHtD+7OjUM/ydA==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr4061803wmj.18.1607537392729; 
 Wed, 09 Dec 2020 10:09:52 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id c9sm4927313wrp.73.2020.12.09.10.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:09:51 -0800 (PST)
Date: Wed, 9 Dec 2020 13:09:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 43/65] hw: add compat machines for 6.0
Message-ID: <20201209180546.721296-44-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Add 6.0 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20201109173928.1001764-1-cohuck@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index 847257aa5c..22572c32b7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2590,10 +2590,17 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_machine_5_2_options(MachineClass *mc)
+static void virt_machine_6_0_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
+DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
+
+static void virt_machine_5_2_options(MachineClass *mc)
+{
+    virt_machine_6_0_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+}
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
index 76a846ff9a..7113fb0770 100644
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
@@ -4510,14 +4510,25 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     type_init(spapr_machine_register_##suffix)
 
 /*
- * pseries-5.2
+ * pseries-6.0
  */
-static void spapr_machine_5_2_class_options(MachineClass *mc)
+static void spapr_machine_6_0_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
 }
 
-DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
+DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
+
+/*
+ * pseries-5.2
+ */
+static void spapr_machine_5_2_class_options(MachineClass *mc)
+{
+    spapr_machine_6_0_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+}
+
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
MST


