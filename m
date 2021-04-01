Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C03514D0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:36:11 +0200 (CEST)
Received: from localhost ([::1]:41530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwYU-0004Bv-7r
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lRwPq-0000K0-AJ
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:27:14 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lRwPl-0002LF-VP
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:27:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DD9F65C0064;
 Thu,  1 Apr 2021 08:27:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 01 Apr 2021 08:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=tdv5BpR3lhqDdXFaP4lrNhLn1M
 /hSNgFVVhJfBMv3XA=; b=f/PUr5y9o710YBru0hvwTa+996hMlTZomytl8NQg2p
 4y+f1/BUFy2VaAcn3YGfuTE+FS85hd2VqYyb0bylbNB6nNnt4i4sDIHXJA2VDuu3
 tJg5+6EBfgz+Dl1wqW93op0HKukqRKtqLVNCwssYY0yGfbjs3CY+0CVjtBVbSix8
 zULXyEQ0s3x7JCI40vBrw82POwq8JxSwxKUt/FKuObLOQq8XZoiEc5W134qfRf+j
 ++2dz4+LoR6CDd+PNAiQ5v1abuMJ8QBQhI/EzIf0e9UlZ1JXS+tGog9Ca54K2xDB
 FsY8MFt6eQTndduQwSxTkf1n99VnLoRZnswmMMWR7TMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tdv5BpR3lhqDdXFaP
 4lrNhLn1M/hSNgFVVhJfBMv3XA=; b=q/sqTDyKkg/VG39k2VZwDafCrYL8zbhkC
 PjGebg0p8FJUjAY3pz1uUqfHH0pQ/MtBVDt6jFCWe4Gdj/Tz5IcpY/o2yhD4RGi3
 fmzUW0ZF3yxllVsr3HxD+xoaVW3GmfZrpK5CEORwHYTxuHRWoOKPvfGVKBZD2i6l
 Oa6i8WFu+Z7fwRUrnY8AQ2uz0YuJgcXfskz6RKeR6/57s7kPuKgDYGvZ7g4yFZn7
 i0BRLLojH36b6bcnbwDTimAScyHfE+IZtTeTTBHNlKqPQH0nSnSOcoEezrw9HEXT
 H4kKt9ZmZhRLNvdR/HO3KWNGFjjE/8HyMXCZlQecgySFGraJ1pi4g==
X-ME-Sender: <xms:GLxlYLzKoBbNNiAaA8mKU7c5VheOn-8fQriLItXjjZI_qK8BbjAmmg>
 <xme:GLxlYDRW4U0QVgscH0IWuZ4py0yyW0PlVkti4WmPx1f3hdnf55LOJeA1gkOMGleTV
 ys2LqAhomKT4rAZJW8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeggihhntggvnhht
 uceuvghrnhgrthcuoehvihhntggvnhhtsegsvghrnhgrthdrtghhqeenucggtffrrghtth
 gvrhhnpedvieffteeukedtleevfffhvdefgfdtffehtddukeetveffgfevtdefheevffeh
 gfenucfkphepledtrdeltddrledtrdefheenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegsvghrnhgrtheslhhufhhfhidrtgig
X-ME-Proxy: <xmx:GLxlYFXEtCOoHCqVxNNqlGbd9sTGDUZziicHwuPnMAgDj5n9-A1vKw>
 <xmx:GLxlYFhim5Xa8i4RzNwUSXccGPDcsfebppgOAfus_b3L6K0HXL0dqQ>
 <xmx:GLxlYNCz54IsWfvdJMS7mv1sz5ew_OUb0zq8phlOzvSS2XUG6faqag>
 <xmx:GbxlYANrZ7JmoB6geeQ2dnQgctk1fBTEm5lyB9tU3u2jocO4Jv3aVw>
Received: from neo.luffy.cx (lfbn-idf1-1-1655-35.w90-90.abo.wanadoo.fr
 [90.90.90.35])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4D5CB1080068;
 Thu,  1 Apr 2021 08:27:04 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id 23456A28; Thu,  1 Apr 2021 14:27:02 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v3] hw/smbios: support for type 41 (onboard devices extended
 information)
Date: Thu,  1 Apr 2021 14:26:58 +0200
Message-Id: <20210401122658.37842-1-vincent@bernat.ch>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=bernat@luffy.cx;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Type 41 defines the attributes of devices that are onboard. The
original intent was to imply the BIOS had some level of control over
the enablement of the associated devices.

If network devices are present in this table, by default, udev will
name the corresponding interfaces enoX, X being the instance number.
Without such information, udev will fallback to using the PCI ID and
this usually gives ens3 or ens4. This can be a bit annoying as the
name of the network card may depend on the order of options and may
change if a new PCI device is added earlier on the commande line.
Being able to provide SMBIOS type 41 entry ensure the name of the
interface won't change and helps the user guess the right name without
booting a first time.

This can be invoked with:

    $QEMU -netdev user,id=internet
          -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
          -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev

The PCI segment is assumed to be 0. This should hold true for most
cases.

    $ dmidecode -t 41
    # dmidecode 3.3
    Getting SMBIOS data from sysfs.
    SMBIOS 2.8 present.

    Handle 0x2900, DMI type 41, 11 bytes
    Onboard Device
            Reference Designation: Onboard LAN
            Type: Ethernet
            Status: Enabled
            Type Instance: 1
            Bus Address: 0000:00:09.0

    $ ip -brief a
    lo               UNKNOWN        127.0.0.1/8 ::1/128
    eno1             UP             10.0.2.14/24 fec0::5254:ff:fe00:42/64 fe80::5254:ff:fe00:42/64

Signed-off-by: Vincent Bernat <vincent@bernat.ch>
---
 hw/arm/virt.c                |   7 ++-
 hw/i386/fw_cfg.c             |   4 +-
 hw/smbios/smbios.c           | 112 ++++++++++++++++++++++++++++++++++-
 include/hw/firmware/smbios.h |  14 ++++-
 qemu-options.hx              |   7 ++-
 5 files changed, 138 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e090..840ec0af02db 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -53,6 +53,7 @@
 #include "sysemu/kvm.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
+#include "qapi/error.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
@@ -1524,8 +1525,10 @@ static void virt_build_smbios(VirtMachineState *vms)
                         vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
                         true, SMBIOS_ENTRY_POINT_30);
 
-    smbios_get_tables(MACHINE(vms), NULL, 0, &smbios_tables, &smbios_tables_len,
-                      &smbios_anchor, &smbios_anchor_len);
+    smbios_get_tables(MACHINE(vms), NULL, 0,
+                      &smbios_tables, &smbios_tables_len,
+                      &smbios_anchor, &smbios_anchor_len,
+                      &error_fatal);
 
     if (smbios_anchor) {
         fw_cfg_add_file(vms->fw_cfg, "etc/smbios/smbios-tables",
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index e48a54fa364b..4e68d5dea438 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -22,6 +22,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "e820_memory_layout.h"
 #include "kvm/kvm_i386.h"
+#include "qapi/error.h"
 #include CONFIG_DEVICES
 
 struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
@@ -78,7 +79,8 @@ void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
     }
     smbios_get_tables(ms, mem_array, array_count,
                       &smbios_tables, &smbios_tables_len,
-                      &smbios_anchor, &smbios_anchor_len);
+                      &smbios_anchor, &smbios_anchor_len,
+                      &error_fatal);
     g_free(mem_array);
 
     if (smbios_anchor) {
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index f22c4f5b734e..8d26564972c3 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -27,6 +27,7 @@
 #include "hw/firmware/smbios.h"
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include "hw/pci/pci.h"
 #include "smbios_build.h"
 
 /* legacy structures and constants for <= 2.0 machines */
@@ -118,6 +119,28 @@ static struct {
     uint16_t speed;
 } type17;
 
+static QEnumLookup type41_kind_lookup = {
+    .array = (const char *const[]) {
+        "other",
+        "unknown",
+        "video",
+        "scsi",
+        "ethernet",
+        "tokenring",
+        "sound",
+        "pata",
+        "sata",
+        "sas",
+    },
+    .size = 10
+};
+struct type41_instance {
+    const char *designation, *pcidev;
+    uint8_t instance, kind;
+    QTAILQ_ENTRY(type41_instance) next;
+};
+static QTAILQ_HEAD(, type41_instance) type41 = QTAILQ_HEAD_INITIALIZER(type41);
+
 static QemuOptsList qemu_smbios_opts = {
     .name = "smbios",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_smbios_opts.head),
@@ -358,6 +381,32 @@ static const QemuOptDesc qemu_smbios_type17_opts[] = {
     { /* end of list */ }
 };
 
+static const QemuOptDesc qemu_smbios_type41_opts[] = {
+    {
+        .name = "type",
+        .type = QEMU_OPT_NUMBER,
+        .help = "SMBIOS element type",
+    },{
+        .name = "designation",
+        .type = QEMU_OPT_STRING,
+        .help = "reference designation string",
+    },{
+        .name = "kind",
+        .type = QEMU_OPT_STRING,
+        .help = "device type",
+        .def_value_str = "other",
+    },{
+        .name = "instance",
+        .type = QEMU_OPT_NUMBER,
+        .help = "device type instance",
+    },{
+        .name = "pcidev",
+        .type = QEMU_OPT_STRING,
+        .help = "PCI device",
+    },
+    { /* end of list */ }
+};
+
 static void smbios_register_config(void)
 {
     qemu_add_opts(&qemu_smbios_opts);
@@ -773,6 +822,41 @@ static void smbios_build_type_32_table(void)
     SMBIOS_BUILD_TABLE_POST;
 }
 
+static void smbios_build_type_41_table(Error **errp)
+{
+    unsigned instance = 0;
+    struct type41_instance *t41;
+
+    QTAILQ_FOREACH(t41, &type41, next) {
+        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
+
+        SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
+        t->device_type = t41->kind;
+        t->device_type_instance = t41->instance;
+
+        if (t41->pcidev) {
+            PCIDevice *pdev = NULL;
+            int rc = pci_qdev_find_device(t41->pcidev, &pdev);
+            if (rc != 0) {
+                error_setg(errp,
+                           "No PCI device %s for SMBIOS type 41 entry %s",
+                           t41->pcidev, t41->designation);
+                return;
+            }
+            /*
+             * TODO: Extract the appropriate value. Most of the
+             * time, this will be 0.
+             */
+            t->segment_group_number = cpu_to_le16(0);
+            t->bus_number = pci_dev_bus_num(pdev);
+            t->device_number = pdev->devfn;
+        }
+
+        SMBIOS_BUILD_TABLE_POST;
+        instance++;
+    }
+}
+
 static void smbios_build_type_127_table(void)
 {
     SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
@@ -883,7 +967,8 @@ void smbios_get_tables(MachineState *ms,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
                        uint8_t **tables, size_t *tables_len,
-                       uint8_t **anchor, size_t *anchor_len)
+                       uint8_t **anchor, size_t *anchor_len,
+                       Error **errp)
 {
     unsigned i, dimm_cnt;
 
@@ -928,6 +1013,7 @@ void smbios_get_tables(MachineState *ms,
 
         smbios_build_type_32_table();
         smbios_build_type_38_table();
+        smbios_build_type_41_table(errp);
         smbios_build_type_127_table();
 
         smbios_validate_table(ms);
@@ -1224,6 +1310,30 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             save_opt(&type17.part, opts, "part");
             type17.speed = qemu_opt_get_number(opts, "speed", 0);
             return;
+        case 41: {
+            struct type41_instance *t;
+            Error *local_err = NULL;
+
+            if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
+                return;
+            }
+            t = g_new0(struct type41_instance, 1);
+            save_opt(&t->designation, opts, "designation");
+            t->kind = qapi_enum_parse(&type41_kind_lookup,
+                                      qemu_opt_get(opts, "kind"),
+                                      0, &local_err) + 1;
+            t->kind |= 0x80;     /* enabled */
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                g_free(t);
+                return;
+            }
+            t->instance = qemu_opt_get_number(opts, "instance", 1);
+            save_opt(&t->pcidev, opts, "pcidev");
+
+            QTAILQ_INSERT_TAIL(&type41, t, next);
+            return;
+        }
         default:
             error_setg(errp,
                        "Don't know how to build fields for SMBIOS type %ld",
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 02a0ced0a09f..5a0dd0c8cfff 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -258,6 +258,17 @@ struct smbios_type_32 {
     uint8_t boot_status;
 } QEMU_PACKED;
 
+/* SMBIOS type 41 - Onboard Devices Extended Information */
+struct smbios_type_41 {
+    struct smbios_structure_header header;
+    uint8_t reference_designation_str;
+    uint8_t device_type;
+    uint8_t device_type_instance;
+    uint16_t segment_group_number;
+    uint8_t bus_number;
+    uint8_t device_number;
+} QEMU_PACKED;
+
 /* SMBIOS type 127 -- End-of-table */
 struct smbios_type_127 {
     struct smbios_structure_header header;
@@ -273,5 +284,6 @@ void smbios_get_tables(MachineState *ms,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
                        uint8_t **tables, size_t *tables_len,
-                       uint8_t **anchor, size_t *anchor_len);
+                       uint8_t **anchor, size_t *anchor_len,
+                       Error **errp);
 #endif /* QEMU_SMBIOS_H */
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd61d..e6e54f9bd1f3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2370,7 +2370,9 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 11 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
     "               [,asset=str][,part=str][,speed=%d]\n"
-    "                specify SMBIOS type 17 fields\n",
+    "                specify SMBIOS type 17 fields\n"
+    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
+    "                specify SMBIOS type 41 fields\n",
     QEMU_ARCH_I386 | QEMU_ARCH_ARM)
 SRST
 ``-smbios file=binary``
@@ -2432,6 +2434,9 @@ SRST
 
 ``-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]``
     Specify SMBIOS type 17 fields
+
+``-smbios type=41[,designation=str][,kind=str][,instance=%d][,dev=str]``
+    Specify SMBIOS type 41 fields
 ERST
 
 DEFHEADING()
-- 
2.31.0


