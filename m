Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF134FFC52
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 19:24:27 +0200 (CEST)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1negjB-00075L-UP
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 13:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1neghy-00066m-Qw
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 13:23:10 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1neghw-0003Ad-Uk
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 13:23:10 -0400
Received: by mail-pl1-x62d.google.com with SMTP id n18so2523914plg.5
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 10:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIrBGGHaOu6FGsiI3pehBsLPUA3XG5t1mTIHx3K82fk=;
 b=lvakoWdEb4tBAnivjRbSHVUynehMUk4fjMqniu8YO+SWd0ZIOJtUjfGNWB7hofwlvq
 lSxnoY+1ujMFJ8f7KKSEu/nvb/6f2ODHj7b5lrVa+alD2ZsaBRatEKkCyTTnHujmarEy
 C9ndlVJuTAlUMXd600q9oPkmARuSfzSACMGeMemwergUt3X3D+koPOKomR5fhdHyJOTy
 ZobXOV64wqlqIrjn1ZX/hJQhQywlSDh3AKpvRGEBuqXdCR8+eUyWUMuGC8Re9+Pkl7aD
 u25EvCp5W2m8VNcng77JEtEtpz2x8SLAzBcLrLuKhpqQQ5d7z6IqfH6ZKXnxrzoEvIIA
 mG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GIrBGGHaOu6FGsiI3pehBsLPUA3XG5t1mTIHx3K82fk=;
 b=0hjiMhV1kv0tPq1vK+E9F4tAFSEQQ9LDkDunSuHN6GN/wyuoMT0tWy4/Sj04Zzm6f9
 06Bdtxvd09aZPEBAorE6clDKgh2yo6UxEMEXKPYSSUWJrJU719qjWzGbhfTycpEBPcOX
 Cyx2BirSr2xXTyFZFRJf6wF+fBhj9rvYJLMLn7fxKKUxkzXNgvv87orQE0wKXR+UPCwb
 RRzSQu6sTsbPNhRuXgHvgfgdISHbx0CoQ8BVtIFd+x9RP/2vdt6UVsz1s7EKMwDDfZFc
 3jgE2C0vjsEpyOgzQn2PaFSiWdlEubUFmaLPgPRnzT8c8wK3/HfQYysHqaHY70mJP/YK
 Enbg==
X-Gm-Message-State: AOAM533Ueg+khJUlDqrGcQozgkO2gJsFG2iuANWFOzHY8NkrOyfcZMfL
 mgwJIWW/kNFCb/rhuD6to4Bm6V0RgRc5EH0D
X-Google-Smtp-Source: ABdhPJzRwChbKnYzrZQ1kY/fwCsb2WzlP4iTRo1EoF4kV9Ei1w3xBUZtqTChU+R6oVsgkloekq5BRQ==
X-Received: by 2002:a17:90b:1642:b0:1c7:2497:3807 with SMTP id
 il2-20020a17090b164200b001c724973807mr11854905pjb.176.1649870587055; 
 Wed, 13 Apr 2022 10:23:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:4040:e07:30fa:c118:857:c6d2:f2a4])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a65580e000000b0039ce0873289sm6636813pgr.84.2022.04.13.10.23.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Apr 2022 10:23:06 -0700 (PDT)
From: Gautam Agrawal <gautamnagrawal@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Warn user if the vga flag is passed but no vga device is
 created
Date: Wed, 13 Apr 2022 22:52:46 +0530
Message-Id: <20220413172246.73708-1-gautamnagrawal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kraxel@redhat.com,
 Gautam Agrawal <gautamnagrawal@gmail.com>, stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
has been used to track the creation of vga interface. If the vga flag is passed
in the command line "default_vga"(declared in softmmu/vl.c) variable is set to 0.
To warn user, the condition checks if vga_interface_created is false
and default_vga is equal to 0.If "-vga none" is passed, this patch will not warn the
user regarding the creation of VGA device.

The initialisation of Global variable "vga_interface_created" in softmmu/globals.c
has also been corrected.

The warning "A -vga option was passed but this
machine type does not use that option; no VGA device has been created"
is logged if vga flag is passed but no vga device is created.

"vga_interface_created" has also been included in "xen_machine_pv.c" and
"fuloong2e.c". This patch has been tested for x86_64, i386, sparc, sparc64 and arm boards.

Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
---
 hw/isa/isa-bus.c          | 1 +
 hw/mips/fuloong2e.c       | 1 +
 hw/pci/pci.c              | 1 +
 hw/sparc/sun4m.c          | 2 ++
 hw/sparc64/sun4u.c        | 1 +
 hw/xenpv/xen_machine_pv.c | 1 +
 include/sysemu/sysemu.h   | 1 +
 softmmu/globals.c         | 1 +
 softmmu/vl.c              | 6 ++++++
 9 files changed, 15 insertions(+)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 0ad1c5fd65..cd5ad3687d 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -166,6 +166,7 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
 
 ISADevice *isa_vga_init(ISABus *bus)
 {
+    vga_interface_created = true;
     switch (vga_interface_type) {
     case VGA_CIRRUS:
         return isa_create_simple(bus, "isa-cirrus-vga");
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c9f14e70a0..538453b426 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -321,6 +321,7 @@ static void mips_fuloong2e_init(MachineState *machine)
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
+        vga_interface_created = true;
         pci_dev = pci_new(-1, "ati-vga");
         dev = DEVICE(pci_dev);
         qdev_prop_set_uint32(dev, "vgamem_mb", 16);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index dae9119bfe..fab9c80f8d 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2038,6 +2038,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
 
 PCIDevice *pci_vga_init(PCIBus *bus)
 {
+    vga_interface_created = true;
     switch (vga_interface_type) {
     case VGA_CIRRUS:
         return pci_create_simple(bus, -1, "cirrus-vga");
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 7f3a7c0027..f45e29acc8 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -921,6 +921,7 @@ static void sun4m_hw_init(MachineState *machine)
             /* sbus irq 5 */
             cg3_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
                      graphic_width, graphic_height, graphic_depth);
+            vga_interface_created = true;
         } else {
             /* If no display specified, default to TCX */
             if (graphic_depth != 8 && graphic_depth != 24) {
@@ -936,6 +937,7 @@ static void sun4m_hw_init(MachineState *machine)
 
             tcx_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
                      graphic_width, graphic_height, graphic_depth);
+            vga_interface_created = true;
         }
     }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index cda7df36e3..75334dba71 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -633,6 +633,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     switch (vga_interface_type) {
     case VGA_STD:
         pci_create_simple(pci_busA, PCI_DEVFN(2, 0), "VGA");
+        vga_interface_created = true;
         break;
     case VGA_NONE:
         break;
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 8df575a457..20c9611d71 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -63,6 +63,7 @@ static void xen_init_pv(MachineState *machine)
     if (vga_interface_type == VGA_XENFB) {
         xen_config_dev_vfb(0, "vnc");
         xen_config_dev_vkbd(0);
+        vga_interface_created = true;
     }
 
     /* configure disks */
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index b9421e03ff..a558b895e4 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -32,6 +32,7 @@ typedef enum {
 } VGAInterfaceType;
 
 extern int vga_interface_type;
+extern bool vga_interface_created;
 
 extern int graphic_width;
 extern int graphic_height;
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 3ebd718e35..98b64e0492 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -40,6 +40,7 @@ int nb_nics;
 NICInfo nd_table[MAX_NICS];
 int autostart = 1;
 int vga_interface_type = VGA_NONE;
+bool vga_interface_created;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
 int singlestep;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6f646531a0..8c9f31fa35 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2734,6 +2734,12 @@ static void qemu_machine_creation_done(void)
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
         exit(1);
     }
+    if (!vga_interface_created && !default_vga &&
+        vga_interface_type != VGA_NONE) {
+        warn_report("A -vga option was passed but this machine "
+                    "type does not use that option; "
+                    "No VGA device has been created");
+    }
 }
 
 void qmp_x_exit_preconfig(Error **errp)
-- 
2.34.1


