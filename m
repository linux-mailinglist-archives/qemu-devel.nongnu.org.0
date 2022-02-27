Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AFF4C5EFA
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 22:08:37 +0100 (CET)
Received: from localhost ([::1]:55126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOQmP-0004l5-7k
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 16:08:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1nOQku-0003rA-W5
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 16:07:01 -0500
Received: from mail-pg1-f179.google.com ([209.85.215.179]:34471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1nOQkt-0003eU-9Q
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 16:07:00 -0500
Received: by mail-pg1-f179.google.com with SMTP id 139so9776516pge.1
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 13:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wj9Tcn/zpekGqO/HgU+u/SnvJsyayaELTJva3OQH0HE=;
 b=eIButAPyoWVtaQIb/mlCMxD4PX3wG1Dplt7QZlLD+5DSijh3PiE80W6zJaMurIdb7l
 tn4ZyPPOhPsdEzVO7Ylf5cUHQcXVTzieiKqT9Z3w3hXbTxa4tfgIKRZgpDFzSpWc76nP
 wt274HWVeMuBdzSizG/XR5GaNC6RlB5uwmp03ZFBgIsgjStbfx0TKHxoAhSt/9+bi/lR
 Hi8s9WbcvLha0XGWw+L6MLAfyHWwQNbTV0I7wG+EYcldY2LeTqwX1+KmIFDBt5LViyx+
 Jd8z18mL8LPdi5bLzBazkkEogVEjmAbGc2wZSKcR5NukASymv8DG3xM/HsiMEck67L1p
 Tz+w==
X-Gm-Message-State: AOAM533GETyDRPTnUO5SaimArUZin+Dus89f02XaanQGMGPEj/RJqQle
 PQq8Nw/4AP8sJLodZ9+yeGV/ZUuw7i0=
X-Google-Smtp-Source: ABdhPJw7dp202OEEIRkD2q2vYiDunEA3+R+mYGebNYocP4/q39ObXx3/xBKMalQk2nBqBU9lGtYD9w==
X-Received: by 2002:a63:1405:0:b0:344:3b39:fd27 with SMTP id
 u5-20020a631405000000b003443b39fd27mr14789738pgl.488.1645996017157; 
 Sun, 27 Feb 2022 13:06:57 -0800 (PST)
Received: from localhost.localdomain ([98.51.2.27])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a17090aac0c00b001b9e5286c90sm18067866pjq.0.2022.02.27.13.06.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Feb 2022 13:06:56 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH] pc: add option to disable PS/2 mouse/keyboard
Date: Sun, 27 Feb 2022 13:06:55 -0800
Message-Id: <20220227210655.45592-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.179; envelope-from=osy86dev@gmail.com;
 helo=mail-pg1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On some older software like Windows 7 installer, having both a PS/2
mouse and USB mouse results in only one device working property (which
might be a different device each boot). While the workaround to not use
a USB mouse with such software is valid, it creates an inconsistent
experience if the user wishes to always use a USB mouse.

This introduces a new machine property to inhibit the creation of the
i8042 PS/2 controller.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 include/hw/i386/pc.h |  2 ++
 hw/i386/pc.c         | 28 ++++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9c9f4ac748..1a27de9c8b 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -48,6 +48,7 @@ typedef struct PCMachineState {
     bool sata_enabled;
     bool pit_enabled;
     bool hpet_enabled;
+    bool i8042_enabled;
     bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
@@ -64,6 +65,7 @@ typedef struct PCMachineState {
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
+#define PC_MACHINE_I8042            "i8042"
 #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
 #define PC_MACHINE_SMBIOS_EP        "smbios-entry-point-type"
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c8696ac01e..32bf12421e 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1014,7 +1014,8 @@ static const MemoryRegionOps ioportF0_io_ops = {
     },
 };
 
-static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
+static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
+                            bool create_i8042, bool no_vmport)
 {
     int i;
     DriveInfo *fd[MAX_FD];
@@ -1036,6 +1037,10 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
         }
     }
 
+    if (!create_i8042) {
+        return;
+    }
+
     i8042 = isa_create_simple(isa_bus, "i8042");
     if (!no_vmport) {
         isa_create_simple(isa_bus, TYPE_VMPORT);
@@ -1131,7 +1136,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
     i8257_dma_init(isa_bus, 0);
 
     /* Super I/O */
-    pc_superio_init(isa_bus, create_fdctrl, pcms->vmport != ON_OFF_AUTO_ON);
+    pc_superio_init(isa_bus, create_fdctrl, pcms->i8042_enabled,
+                    pcms->vmport != ON_OFF_AUTO_ON);
 }
 
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus)
@@ -1512,6 +1518,20 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
     pcms->hpet_enabled = value;
 }
 
+static bool pc_machine_get_i8042(Object *obj, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    return pcms->i8042_enabled;
+}
+
+static void pc_machine_set_i8042(Object *obj, bool value, Error **errp)
+{
+    PCMachineState *pcms = PC_MACHINE(obj);
+
+    pcms->i8042_enabled = value;
+}
+
 static bool pc_machine_get_default_bus_bypass_iommu(Object *obj, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -1641,6 +1661,7 @@ static void pc_machine_initfn(Object *obj)
     pcms->smbus_enabled = true;
     pcms->sata_enabled = true;
     pcms->pit_enabled = true;
+    pcms->i8042_enabled = true;
     pcms->max_fw_size = 8 * MiB;
 #ifdef CONFIG_HPET
     pcms->hpet_enabled = true;
@@ -1777,6 +1798,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "hpet",
         "Enable/disable high precision event timer emulation");
 
+    object_class_property_add_bool(oc, PC_MACHINE_I8042,
+        pc_machine_get_i8042, pc_machine_set_i8042);
+
     object_class_property_add_bool(oc, "default-bus-bypass-iommu",
         pc_machine_get_default_bus_bypass_iommu,
         pc_machine_set_default_bus_bypass_iommu);
-- 
2.28.0


