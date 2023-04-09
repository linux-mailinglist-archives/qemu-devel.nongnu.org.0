Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352356DC061
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 16:42:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plWFJ-0003yt-A2; Sun, 09 Apr 2023 10:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWFD-0003yR-3d
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:42:15 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minhquangbui99@gmail.com>)
 id 1plWF9-0000nY-Hw
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 10:42:13 -0400
Received: by mail-pl1-x636.google.com with SMTP id h24so2788102plr.1
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681051330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Y9tje19OFc2dSIBz+eR5m+FLZJ4QhzIEXL1qcEkTng=;
 b=VhGLaUpeSN19Dg10AViurUUw0vS4GGDl+Kjp2zQc74/+ELG4AQft/y6X0QUon6XZ6y
 5Tj3M8FAdDLmfCSGz61CaV65sqFu4vOI4FiFMPXDznIGgcQGLhUkUSWYxHE1gE7U9jGS
 AY7V0MO9Qqw8Wqv9EF/iGRSLOZWacBnZZ1SGUHQirGefHD1YyZelVSA1RT4TPNsypHhC
 8MpSIso5aQ0O3C9dSE+nKcVLPaFDdDT5YupPU7uijih7oiASAnVIeHhB4PUzEdoSLDZe
 8jM56g/6bfYnul6fQC58niyn7bwmcd3G/vPN8VRM5jaVJ8XF70DE6pgjscZMRmE3T2In
 jPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681051330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Y9tje19OFc2dSIBz+eR5m+FLZJ4QhzIEXL1qcEkTng=;
 b=aEa0AVsp3Cc2VDc3RIHA1pgs5NvW9hlsUyNs5TqgP6vHt4Yty9dS+HpnR4ouHv8XHW
 fKG8z6wNIIT3kIapUF1UT/3Fhh/jZcLoWtfe4YOLVGh7mxdQ+kpN1VFMPQPmh9IKf8Uz
 /543Ez3ZjAKvuKcUtTH13bZUkbOlxVbnmjtn/XkenL/PkD+dJi1HevSU0lGddFginR6E
 GLmlA58c8r1iUsDZ4Ves3jw52dVt2pw+QDodr+YRyhDSD7onBAKxmK749y0xeVZJq1Ys
 DBfovHk04+1nKH8scfKzGqEbuMahAttkG7xN0PU4s+WDC6w0QCKdcGAMwWN3tl81VUvE
 GDaQ==
X-Gm-Message-State: AAQBX9fMFO/amZxLqXIXRyvmehjceTJnPOkgHW8XjtWbeiR6+Xub591f
 KtskN6vKit2lCRQ7GEpHu08aqFBeFEDcsA==
X-Google-Smtp-Source: AKy350bMnQ3WBhg0qvfHthyFhqT/xM1EuIXqWmFq+Lkrlm+EA9q/CkZHnm8UITrbQqVz873yUUiztw==
X-Received: by 2002:a05:6a20:3a9b:b0:d6:97e8:c3ed with SMTP id
 d27-20020a056a203a9b00b000d697e8c3edmr4140980pzh.14.1681051329561; 
 Sun, 09 Apr 2023 07:42:09 -0700 (PDT)
Received: from localhost.localdomain ([113.173.97.170])
 by smtp.googlemail.com with ESMTPSA id
 k5-20020aa790c5000000b0062e00158bf3sm6369804pfk.175.2023.04.09.07.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Apr 2023 07:42:09 -0700 (PDT)
From: Bui Quang Minh <minhquangbui99@gmail.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [PATCH v3 1/5] i386/tcg: implement x2APIC registers MSR access
Date: Sun,  9 Apr 2023 21:41:52 +0700
Message-Id: <20230409144156.8313-1-minhquangbui99@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=minhquangbui99@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This commit refactors apic_mem_read/write to support both MMIO access in
xAPIC and MSR access in x2APIC.

Signed-off-by: Bui Quang Minh <minhquangbui99@gmail.com>
---
 hw/intc/apic.c                       | 79 ++++++++++++++++++----------
 hw/intc/trace-events                 |  4 +-
 include/hw/i386/apic.h               |  3 ++
 target/i386/cpu.h                    |  3 ++
 target/i386/tcg/sysemu/misc_helper.c | 27 ++++++++++
 5 files changed, 86 insertions(+), 30 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 20b5a94073..61b494b20a 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -288,6 +288,13 @@ void apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode,
     apic_bus_deliver(deliver_bitmask, delivery_mode, vector_num, trigger_mode);
 }
 
+bool is_x2apic_mode(DeviceState *dev)
+{
+    APICCommonState *s = APIC(dev);
+
+    return s->apicbase & MSR_IA32_APICBASE_EXTD;
+}
+
 static void apic_set_base(APICCommonState *s, uint64_t val)
 {
     s->apicbase = (val & 0xfffff000) |
@@ -636,16 +643,11 @@ static void apic_timer(void *opaque)
     apic_timer_update(s, s->next_time);
 }
 
-static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
+uint64_t apic_register_read(int index)
 {
     DeviceState *dev;
     APICCommonState *s;
-    uint32_t val;
-    int index;
-
-    if (size < 4) {
-        return 0;
-    }
+    uint64_t val;
 
     dev = cpu_get_current_apic();
     if (!dev) {
@@ -653,7 +655,6 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
     }
     s = APIC(dev);
 
-    index = (addr >> 4) & 0xff;
     switch(index) {
     case 0x02: /* id */
         val = s->id << 24;
@@ -720,7 +721,23 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
         val = 0;
         break;
     }
-    trace_apic_mem_readl(addr, val);
+
+    trace_apic_register_read(index, val);
+    return val;
+}
+
+static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint32_t val;
+    int index;
+
+    if (size < 4) {
+        return 0;
+    }
+
+    index = (addr >> 4) & 0xff;
+    val = (uint32_t)apic_register_read(index);
+
     return val;
 }
 
@@ -737,27 +754,10 @@ static void apic_send_msi(MSIMessage *msi)
     apic_deliver_irq(dest, dest_mode, delivery, vector, trigger_mode);
 }
 
-static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
-                           unsigned size)
+void apic_register_write(int index, uint64_t val)
 {
     DeviceState *dev;
     APICCommonState *s;
-    int index = (addr >> 4) & 0xff;
-
-    if (size < 4) {
-        return;
-    }
-
-    if (addr > 0xfff || !index) {
-        /* MSI and MMIO APIC are at the same memory location,
-         * but actually not on the global bus: MSI is on PCI bus
-         * APIC is connected directly to the CPU.
-         * Mapping them on the global bus happens to work because
-         * MSI registers are reserved in APIC MMIO and vice versa. */
-        MSIMessage msi = { .address = addr, .data = val };
-        apic_send_msi(&msi);
-        return;
-    }
 
     dev = cpu_get_current_apic();
     if (!dev) {
@@ -765,7 +765,7 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
     }
     s = APIC(dev);
 
-    trace_apic_mem_writel(addr, val);
+    trace_apic_register_write(index, val);
 
     switch(index) {
     case 0x02:
@@ -843,6 +843,29 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
     }
 }
 
+static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
+                           unsigned size)
+{
+    int index = (addr >> 4) & 0xff;
+
+    if (size < 4) {
+        return;
+    }
+
+    if (addr > 0xfff || !index) {
+        /* MSI and MMIO APIC are at the same memory location,
+         * but actually not on the global bus: MSI is on PCI bus
+         * APIC is connected directly to the CPU.
+         * Mapping them on the global bus happens to work because
+         * MSI registers are reserved in APIC MMIO and vice versa. */
+        MSIMessage msi = { .address = addr, .data = val };
+        apic_send_msi(&msi);
+        return;
+    }
+
+    apic_register_write(index, val);
+}
+
 static void apic_pre_save(APICCommonState *s)
 {
     apic_sync_vapic(s, SYNC_FROM_VAPIC);
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 50cadfb996..9d4e7a67be 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -14,8 +14,8 @@ cpu_get_apic_base(uint64_t val) "0x%016"PRIx64
 # apic.c
 apic_local_deliver(int vector, uint32_t lvt) "vector %d delivery mode %d"
 apic_deliver_irq(uint8_t dest, uint8_t dest_mode, uint8_t delivery_mode, uint8_t vector_num, uint8_t trigger_mode) "dest %d dest_mode %d delivery_mode %d vector %d trigger_mode %d"
-apic_mem_readl(uint64_t addr, uint32_t val)  "0x%"PRIx64" = 0x%08x"
-apic_mem_writel(uint64_t addr, uint32_t val) "0x%"PRIx64" = 0x%08x"
+apic_register_read(uint8_t reg, uint64_t val) "register 0x%02x = 0x%"PRIx64
+apic_register_write(uint8_t reg, uint64_t val) "register 0x%02x = 0x%"PRIx64
 
 # ioapic.c
 ioapic_set_remote_irr(int n) "set remote irr for pin %d"
diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index bdc15a7a73..2cebeb4faf 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -18,6 +18,9 @@ void apic_sipi(DeviceState *s);
 void apic_poll_irq(DeviceState *d);
 void apic_designate_bsp(DeviceState *d, bool bsp);
 int apic_get_highest_priority_irr(DeviceState *dev);
+uint64_t apic_register_read(int index);
+void apic_register_write(int index, uint64_t val);
+bool is_x2apic_mode(DeviceState *d);
 
 /* pc.c */
 DeviceState *cpu_get_current_apic(void);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d243e290d3..02165a5ad2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -545,6 +545,9 @@ typedef enum X86Seg {
 #define MSR_IA32_VMX_TRUE_ENTRY_CTLS     0x00000490
 #define MSR_IA32_VMX_VMFUNC             0x00000491
 
+#define MSR_APIC_START                  0x00000800
+#define MSR_APIC_END                    0x000008ff
+
 #define XSTATE_FP_BIT                   0
 #define XSTATE_SSE_BIT                  1
 #define XSTATE_YMM_BIT                  2
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index e1528b7f80..1fce2076a3 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -25,6 +25,7 @@
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
+#include "hw/i386/apic.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
 {
@@ -289,6 +290,19 @@ void helper_wrmsr(CPUX86State *env)
         env->msr_bndcfgs = val;
         cpu_sync_bndcs_hflags(env);
         break;
+    case MSR_APIC_START ... MSR_APIC_END: {
+        int index = (uint32_t)env->regs[R_ECX] - MSR_APIC_START;
+
+        if (!is_x2apic_mode(env_archcpu(env)->apic_state)) {
+            goto error;
+        }
+
+        qemu_mutex_lock_iothread();
+        apic_register_write(index, val);
+        qemu_mutex_unlock_iothread();
+
+        break;
+    }
     default:
         if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
             && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
@@ -455,6 +469,19 @@ void helper_rdmsr(CPUX86State *env)
         val = (cs->nr_threads * cs->nr_cores) | (cs->nr_cores << 16);
         break;
     }
+    case MSR_APIC_START ... MSR_APIC_END: {
+        int index = (uint32_t)env->regs[R_ECX] - MSR_APIC_START;
+
+        if (!is_x2apic_mode(env_archcpu(env)->apic_state)) {
+            raise_exception_ra(env, EXCP0D_GPF, GETPC());
+        }
+
+        qemu_mutex_lock_iothread();
+        val = apic_register_read(index);
+        qemu_mutex_unlock_iothread();
+
+        break;
+    }
     default:
         if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
             && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
-- 
2.25.1


