Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52C36C5A7C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:34:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf7rU-00059H-Iy; Wed, 22 Mar 2023 19:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <30o4bZAcKCoU4nw230npxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--venture.bounces.google.com>)
 id 1pf7rS-00056L-31
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:27:18 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <30o4bZAcKCoU4nw230npxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--venture.bounces.google.com>)
 id 1pf7rQ-0003zc-D2
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 19:27:17 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 204-20020a2514d5000000b00a3637aea9e1so21172932ybu.17
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 16:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679527634;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U9RzfAwdC/gxJMPtb+q36TGdZaPRjhMiBoZVwsjHAvw=;
 b=X/WNvaxMo5d91OD/TYp61ULmwErbPmWkUfNd5f1BkmsI2T1hqwZrhTbT2Y+LNlNYZv
 sZbJ9RNnZTBm4TbP/iozQJXovqo8/He2QbNkLQKM6zKhuoPOnju4UGmYTZHOTlaxO91J
 0vrbyQ81adeRjD0P9Dr7+LoocrZV+MvlXY9gmy1dV0bQ0MquQRMWcJUQYh5Jo4pVKLXF
 O2UHktbikHdIye/t9M+5XbLAEvb6mPpA6HrnErIv4zKjxobGhvzktk8BQz8R8quGeL/u
 tqkHXSIzF3QhyzWUAy17rmlFHOvWdO90EnDiCQRQK5GmDSMyxQ4EyEzF+I8xY70iLKEI
 SUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679527634;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U9RzfAwdC/gxJMPtb+q36TGdZaPRjhMiBoZVwsjHAvw=;
 b=HM+yZPWZXGVZto9FGPvUURxDAvusE40ggSX2se14+JARYqzqnSCKKLu51V65tOJ/0R
 aHOCh4GDGo9DbajlObK8B+LMTtUvB8FBaT6mksJ6i5JLCeoy9rYyYZBgwIgFozOD6M+o
 Fuf3MLhaFcuVKMmE0pf0cxzYXBb8zB5rVL7jogNZDAcu1XntHipUXo50+9BJ0beB6X22
 NrOszBYQutu+g43/Svw7Q+17JBMtNr8o8bvtbIJITr1OIfHgwCbmMzIqvIAnEZmhKn7U
 mkOwv6bCA28cKcOondmSjLDtzjIip5XKd8BGvx5F3bc2JZkCDuRU3/rNjre6NJnc76H/
 kBfg==
X-Gm-Message-State: AAQBX9cEybUc0ARgZ0EsztbDF0Y3d+2GA2OgDsaChJiBSK+iEkhazIXN
 zdLkveIO0WH+sVC9HQ7RkQPXcc36Ze1m
X-Google-Smtp-Source: AKy350YzUaDhMX0i0/KsJ5CUfO2Ab514yJLKm90gci6U5Za6l1O4Brv2Zke3qb0/BkOV4hgMkOT5U0EUQCXy
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:5585:15f1:5eaf:5462])
 (user=venture job=sendgmr) by 2002:a05:6902:1005:b0:a6b:bc64:a0af with SMTP
 id w5-20020a056902100500b00a6bbc64a0afmr1038599ybt.4.1679527634097; Wed, 22
 Mar 2023 16:27:14 -0700 (PDT)
Date: Wed, 22 Mar 2023 16:27:04 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Message-ID: <20230322232704.206683-1-venture@google.com>
Subject: [PATCH] hw/arm/virt: support both pl011 and 16550 uart
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>,
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=30o4bZAcKCoU4nw230npxxpun.lxvznv3-mn4nuwxwpw3.x0p@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Shu-Chun Weng <scw@google.com>

Select uart for virt machine from pl011 and ns16550a with
-M virt,uart={pl011|ns16550a}.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Signed-off-by: Patrick Venture <venture@google.com>
---
 hw/arm/virt.c         | 85 ++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  6 +++
 2 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..84b335a5d7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -80,6 +80,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "hw/char/serial.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -847,8 +848,37 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
 }
 
-static void create_uart(const VirtMachineState *vms, int uart,
-                        MemoryRegion *mem, Chardev *chr)
+static void create_uart_ns16550a(const VirtMachineState *vms, int uart,
+                                 MemoryRegion *mem, Chardev *chr)
+{
+    char *nodename;
+    hwaddr base = vms->memmap[uart].base;
+    hwaddr size = vms->memmap[uart].size;
+    int irq = vms->irqmap[uart];
+    const char compat[] = "ns16550a";
+
+    serial_mm_init(get_system_memory(), base, 0,
+                   qdev_get_gpio_in(vms->gic, irq), 19200, serial_hd(0),
+                   DEVICE_LITTLE_ENDIAN);
+
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
+
+    MachineState *ms = MACHINE(vms);
+
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 2, base, 2, size);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "clock-frequency",
+                                 1, 0x825f0);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+
+    g_free(nodename);
+}
+
+static void create_uart_pl011(const VirtMachineState *vms, int uart,
+                              MemoryRegion *mem, Chardev *chr)
 {
     char *nodename;
     hwaddr base = vms->memmap[uart].base;
@@ -895,6 +925,16 @@ static void create_uart(const VirtMachineState *vms, int uart,
     g_free(nodename);
 }
 
+static void create_uart(const VirtMachineState *vms, int uart,
+                        MemoryRegion *mem, Chardev *chr)
+{
+    if (vms->uart == UART_NS16550A) {
+        create_uart_ns16550a(vms, uart, mem, chr);
+    } else {
+        create_uart_pl011(vms, uart, mem, chr);
+    }
+}
+
 static void create_rtc(const VirtMachineState *vms)
 {
     char *nodename;
@@ -2601,6 +2641,39 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     }
 }
 
+static char *virt_get_uart_type(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+    const char *val = NULL;
+
+    switch (vms->uart) {
+    case UART_PL011:
+        val = "pl011";
+        break;
+    case UART_NS16550A:
+        val = "ns16550a";
+        break;
+    default:
+        error_setg(errp, "Invalid uart value");
+    }
+
+    return g_strdup(val);
+}
+
+static void virt_set_uart_type(Object *obj, const char *value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    if (!strcmp(value, "pl011")) {
+        vms->uart = UART_PL011;
+    } else if (!strcmp(value, "ns16550a")) {
+        vms->uart = UART_NS16550A;
+    } else {
+        error_setg(errp, "Invalid uart type");
+        error_append_hint(errp, "Valid values are pl011, and ns16550a.\n");
+    }
+}
+
 static char *virt_get_iommu(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
@@ -3172,6 +3245,14 @@ static void virt_instance_init(Object *obj)
     vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
+    /* Default uart type is pl011 */
+    vms->uart = UART_PL011;
+    object_property_add_str(obj, "uart", virt_get_uart_type,
+                            virt_set_uart_type);
+    object_property_set_description(obj, "uart",
+                                    "Set uart type. "
+                                    "Valid values are pl011 and ns16550a");
+
     vms->highmem_ecam = !vmc->no_highmem_ecam;
     vms->highmem_mmio = true;
     vms->highmem_redists = true;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e1ddbea96b..04539f347d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -122,6 +122,11 @@ typedef enum VirtGICType {
 #define VIRT_GIC_VERSION_3_MASK BIT(VIRT_GIC_VERSION_3)
 #define VIRT_GIC_VERSION_4_MASK BIT(VIRT_GIC_VERSION_4)
 
+typedef enum UartType {
+    UART_PL011,
+    UART_NS16550A,
+} UartType;
+
 struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
@@ -183,6 +188,7 @@ struct VirtMachineState {
     PCIBus *bus;
     char *oem_id;
     char *oem_table_id;
+    UartType uart;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
-- 
2.40.0.rc1.284.g88254d51c5-goog


