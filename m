Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089561B7039
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 11:04:44 +0200 (CEST)
Received: from localhost ([::1]:56062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRuGI-0006Bz-JG
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 05:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jRuFC-0005GR-BQ
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 05:03:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jRuFB-0005JD-CI
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 05:03:34 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58161
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jRuF9-0005E7-MZ
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 05:03:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587719008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6U2rzUlOkf0vsj1al/PPdjPoH81uzBo5LIRE8RJ8g/0=;
 b=NEBqxurT6YcPAMW0lvpE6CHVhlreBi2kTcuOXrgGX4dsw4nExlyGADtVu0iixxEWUn5QKj
 qOt2JeUXLR1dXPEzZQGdN2qBcc37l3a0UtdL0bKh06tqlCcf9pOQKsyKRsITFicW5iczxc
 l1hGH0LL6zLobv2HF6sU2iAx/5EawEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-5dEwdAcbPxiKXLPSWK_YYQ-1; Fri, 24 Apr 2020 05:03:24 -0400
X-MC-Unique: 5dEwdAcbPxiKXLPSWK_YYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FDAD800D24;
 Fri, 24 Apr 2020 09:03:22 +0000 (UTC)
Received: from localhost (ovpn-112-240.ams2.redhat.com [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B53966084A;
 Fri, 24 Apr 2020 09:03:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH] hw: add compat machines for 5.1
Date: Fri, 24 Apr 2020 11:03:14 +0200
Message-Id: <20200424090314.544-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:11:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 5.1 machine types for arm/i440fx/q35/s390x/spapr.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

Still keeping the default cpu model version on x86 at v1.

I'll queue this to my s390-next branch, as I'm planning to send a pull
req as soon as 5.0 is out; if someone else wants to queue this, we'll
figure it out :)

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
index 7dc96abf72cf..5e84c09402dd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2309,15 +2309,22 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
=20
+static void virt_machine_5_1_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
+
 static void virt_machine_5_0_options(MachineClass *mc)
 {
     static GlobalProperty compat[] =3D {
         { TYPE_TPM_TIS_SYSBUS, "ppi", "false" },
     };
=20
+    virt_machine_5_1_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(5, 0)
+DEFINE_VIRT_MACHINE(5, 0)
=20
 static void virt_machine_4_2_options(MachineClass *mc)
 {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c1a444cb7558..7a50dd518f4c 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -28,6 +28,9 @@
 #include "hw/mem/nvdimm.h"
 #include "migration/vmstate.h"
=20
+GlobalProperty hw_compat_5_0[] =3D {};
+const size_t hw_compat_5_0_len =3D G_N_ELEMENTS(hw_compat_5_0);
+
 GlobalProperty hw_compat_4_2[] =3D {
     { "virtio-blk-device", "queue-size", "128"},
     { "virtio-scsi-device", "virtqueue_size", "128"},
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5143c516531e..13e1d18cd758 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -94,6 +94,9 @@
 #include "fw_cfg.h"
 #include "trace.h"
=20
+GlobalProperty pc_compat_5_0[] =3D {};
+const size_t pc_compat_5_0_len =3D G_N_ELEMENTS(pc_compat_5_0);
+
 GlobalProperty pc_compat_4_2[] =3D {
     { "mch", "smbase-smram", "off" },
 };
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 22dee0e76c62..921caa502b85 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -419,7 +419,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
 }
=20
-static void pc_i440fx_5_0_machine_options(MachineClass *m)
+static void pc_i440fx_5_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
@@ -428,6 +428,18 @@ static void pc_i440fx_5_0_machine_options(MachineClass=
 *m)
     pcmc->default_cpu_version =3D 1;
 }
=20
+DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
+                      pc_i440fx_5_1_machine_options);
+
+static void pc_i440fx_5_0_machine_options(MachineClass *m)
+{
+    pc_i440fx_5_1_machine_options(m);
+    m->alias =3D NULL;
+    m->is_default =3D false;
+    compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
+    compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
+}
+
 DEFINE_I440FX_MACHINE(v5_0, "pc-i440fx-5.0", NULL,
                       pc_i440fx_5_0_machine_options);
=20
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index d37c425e2236..253688a9b8f3 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -349,7 +349,7 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus =3D 288;
 }
=20
-static void pc_q35_5_0_machine_options(MachineClass *m)
+static void pc_q35_5_1_machine_options(MachineClass *m)
 {
     PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
     pc_q35_machine_options(m);
@@ -357,6 +357,17 @@ static void pc_q35_5_0_machine_options(MachineClass *m=
)
     pcmc->default_cpu_version =3D 1;
 }
=20
+DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
+                   pc_q35_5_1_machine_options);
+
+static void pc_q35_5_0_machine_options(MachineClass *m)
+{
+    pc_q35_5_1_machine_options(m);
+    m->alias =3D NULL;
+    compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
+    compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
+}
+
 DEFINE_Q35_MACHINE(v5_0, "pc-q35-5.0", NULL,
                    pc_q35_5_0_machine_options);
=20
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9a2bd501aa6e..fd5bfd11a84c 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4599,15 +4599,26 @@ static void spapr_machine_latest_class_options(Mach=
ineClass *mc)
     }                                                                \
     type_init(spapr_machine_register_##suffix)
=20
+/*
+ * pseries-5.1
+ */
+static void spapr_machine_5_1_class_options(MachineClass *mc)
+{
+    /* Defaults for the latest behaviour inherited from the base class */
+}
+
+DEFINE_SPAPR_MACHINE(5_1, "5.1", true);
+
 /*
  * pseries-5.0
  */
 static void spapr_machine_5_0_class_options(MachineClass *mc)
 {
-    /* Defaults for the latest behaviour inherited from the base class */
+    spapr_machine_5_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
 }
=20
-DEFINE_SPAPR_MACHINE(5_0, "5.0", true);
+DEFINE_SPAPR_MACHINE(5_0, "5.0", false);
=20
 /*
  * pseries-4.2
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 0fa00a9fff3d..967a6de9683b 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -672,14 +672,26 @@ bool css_migration_enabled(void)
     }                                                                     =
    \
     type_init(ccw_machine_register_##suffix)
=20
+static void ccw_machine_5_1_instance_options(MachineState *machine)
+{
+}
+
+static void ccw_machine_5_1_class_options(MachineClass *mc)
+{
+}
+DEFINE_CCW_MACHINE(5_1, "5.1", true);
+
 static void ccw_machine_5_0_instance_options(MachineState *machine)
 {
+    ccw_machine_5_1_instance_options(machine);
 }
=20
 static void ccw_machine_5_0_class_options(MachineClass *mc)
 {
+    ccw_machine_5_1_class_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
 }
-DEFINE_CCW_MACHINE(5_0, "5.0", true);
+DEFINE_CCW_MACHINE(5_0, "5.0", false);
=20
 static void ccw_machine_4_2_instance_options(MachineState *machine)
 {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index fd4d62b5010f..18815d9be24f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -318,6 +318,9 @@ struct MachineState {
     } \
     type_init(machine_initfn##_register_types)
=20
+extern GlobalProperty hw_compat_5_0[];
+extern const size_t hw_compat_5_0_len;
+
 extern GlobalProperty hw_compat_4_2[];
 extern const size_t hw_compat_4_2_len;
=20
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 6ab6eda046fd..15b9294dac38 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -204,6 +204,9 @@ void pc_system_firmware_init(PCMachineState *pcms, Memo=
ryRegion *rom_memory);
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        const CPUArchIdList *apic_ids, GArray *entry);
=20
+extern GlobalProperty pc_compat_5_0[];
+extern const size_t pc_compat_5_0_len;
+
 extern GlobalProperty pc_compat_4_2[];
 extern const size_t pc_compat_4_2_len;
=20
--=20
2.21.1


