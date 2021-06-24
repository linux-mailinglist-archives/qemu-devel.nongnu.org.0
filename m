Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4C03B2B5D
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:27:24 +0200 (CEST)
Received: from localhost ([::1]:60258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLdr-0007jm-To
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLab-0001DX-5c
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:24:01 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaY-00027k-Ux
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:24:00 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so5141258wms.0
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZyL4qZUJDMREGsebSFlKTyQ+cMoe0CCtR44Gg7DKKL4=;
 b=YQjaINpI0nFiJ9e+OYpxXLEgMnJxe6RNMNaQa9MZDYcoTuuNxrgCSmz7gbsu1M0EWP
 fKJbW/QDTFEeurS542rPSn58SubpPGo8Z3zr3VX+CPPGpqJ+YS2Fm46ccAIr0u4UfLhU
 8NOWPOW7vmvt9X5x/f0MZiCvwvGtbwbi44Wl/B5lKtDkGj+bfD91+sZ5C6qgIlN8c8gY
 JNoNAWc5i9DY2w1pVAYR2gy1tO2GBlV4v3lr6WfqZ07pTEgeJVlf8Gxp5e1pXa7KWINY
 +cCPFiYPhvEEbZPiHlok96wUPZ9EcTezVkD3pX2WT0QFN8X0qx++3Mt6gUWJpfleK9Nv
 SNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZyL4qZUJDMREGsebSFlKTyQ+cMoe0CCtR44Gg7DKKL4=;
 b=iPzbiJr4k87VYl8QtVibfV4OrBSlc+xOQXQuxhqfaOsLd3FQhS54k7B7tsolbIfurl
 V8gb6kdeFwXhQq8UM/pOsYMju10eDctQ3Cu4bHxsjp10tl/rwrh7ZL+/dEnwdMdJ9IQm
 O5yUIKUBEzZvFu29wOD7MnqGszYAjIrKi7l+yjMOgRHLsowQ6zfCK22BB8pcMQCmHGTD
 IAQHiiXj7qPnqDbLIWxodgquj6NuErJIradiDUExXeFqOBRiqvKdCYB70PFlK3nkfUsU
 owqI10VBBfCFrI2pAUrlNCNJFkSdEKdC2vcckbKBabFGyPXMb2opifhmpurcg7SJ5+fm
 bthg==
X-Gm-Message-State: AOAM531l+PZ4upmOmm2TR9T6Uic49hi6dT/yPLz5OayxQVpmkcT2T6fx
 x1qUO7LNUt/nQ8U6980l350Nr2obBTl+2Q==
X-Google-Smtp-Source: ABdhPJx0HfBrLM0LasFcaPAukpe2By9FPQYSXdxHbRYMODsL+6Er0PfIhcyC9X1w4HMN+UFuiARV8g==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr3098453wmc.183.1624526637296; 
 Thu, 24 Jun 2021 02:23:57 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b71sm2467493wmb.2.2021.06.24.02.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:23:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] hw/timer: Remove SH_TIMER
Date: Thu, 24 Jun 2021 11:23:36 +0200
Message-Id: <20210624092336.1078504-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624092336.1078504-1-f4bug@amsat.org>
References: <20210624092336.1078504-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SH_TIMER has been replaced by the generic RENESAS_TIMER.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c  | 368 -------------------------------------------
 MAINTAINERS          |   1 -
 hw/timer/Kconfig     |   4 -
 hw/timer/meson.build |   1 -
 4 files changed, 374 deletions(-)
 delete mode 100644 hw/timer/sh_timer.c

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
deleted file mode 100644
index 58af1a1edbd..00000000000
--- a/hw/timer/sh_timer.c
+++ /dev/null
@@ -1,368 +0,0 @@
-/*
- * SuperH Timer modules.
- *
- * Copyright (c) 2007 Magnus Damm
- * Based on arm_timer.c by Paul Brook
- * Copyright (c) 2005-2006 CodeSourcery.
- *
- * This code is licensed under the GPL.
- */
-
-#include "qemu/osdep.h"
-#include "exec/memory.h"
-#include "hw/hw.h"
-#include "hw/irq.h"
-#include "hw/sh4/sh.h"
-#include "hw/timer/tmu012.h"
-#include "hw/ptimer.h"
-
-//#define DEBUG_TIMER
-
-#define TIMER_TCR_TPSC          (7 << 0)
-#define TIMER_TCR_CKEG          (3 << 3)
-#define TIMER_TCR_UNIE          (1 << 5)
-#define TIMER_TCR_ICPE          (3 << 6)
-#define TIMER_TCR_UNF           (1 << 8)
-#define TIMER_TCR_ICPF          (1 << 9)
-#define TIMER_TCR_RESERVED      (0x3f << 10)
-
-#define TIMER_FEAT_CAPT   (1 << 0)
-#define TIMER_FEAT_EXTCLK (1 << 1)
-
-#define OFFSET_TCOR   0
-#define OFFSET_TCNT   1
-#define OFFSET_TCR    2
-#define OFFSET_TCPR   3
-
-typedef struct {
-    ptimer_state *timer;
-    uint32_t tcnt;
-    uint32_t tcor;
-    uint32_t tcr;
-    uint32_t tcpr;
-    int freq;
-    int int_level;
-    int old_level;
-    int feat;
-    int enabled;
-    qemu_irq irq;
-} sh_timer_state;
-
-/* Check all active timers, and schedule the next timer interrupt. */
-
-static void sh_timer_update(sh_timer_state *s)
-{
-    int new_level = s->int_level && (s->tcr & TIMER_TCR_UNIE);
-
-    if (new_level != s->old_level)
-      qemu_set_irq (s->irq, new_level);
-
-    s->old_level = s->int_level;
-    s->int_level = new_level;
-}
-
-static uint32_t sh_timer_read(void *opaque, hwaddr offset)
-{
-    sh_timer_state *s = (sh_timer_state *)opaque;
-
-    switch (offset >> 2) {
-    case OFFSET_TCOR:
-        return s->tcor;
-    case OFFSET_TCNT:
-        return ptimer_get_count(s->timer);
-    case OFFSET_TCR:
-        return s->tcr | (s->int_level ? TIMER_TCR_UNF : 0);
-    case OFFSET_TCPR:
-        if (s->feat & TIMER_FEAT_CAPT)
-            return s->tcpr;
-        /* fall through */
-    default:
-        hw_error("sh_timer_read: Bad offset %x\n", (int)offset);
-        return 0;
-    }
-}
-
-static void sh_timer_write(void *opaque, hwaddr offset,
-                            uint32_t value)
-{
-    sh_timer_state *s = (sh_timer_state *)opaque;
-    int freq;
-
-    switch (offset >> 2) {
-    case OFFSET_TCOR:
-        s->tcor = value;
-        ptimer_transaction_begin(s->timer);
-        ptimer_set_limit(s->timer, s->tcor, 0);
-        ptimer_transaction_commit(s->timer);
-        break;
-    case OFFSET_TCNT:
-        s->tcnt = value;
-        ptimer_transaction_begin(s->timer);
-        ptimer_set_count(s->timer, s->tcnt);
-        ptimer_transaction_commit(s->timer);
-        break;
-    case OFFSET_TCR:
-        ptimer_transaction_begin(s->timer);
-        if (s->enabled) {
-            /* Pause the timer if it is running.  This may cause some
-               inaccuracy dure to rounding, but avoids a whole lot of other
-               messyness.  */
-            ptimer_stop(s->timer);
-        }
-        freq = s->freq;
-        /* ??? Need to recalculate expiry time after changing divisor.  */
-        switch (value & TIMER_TCR_TPSC) {
-        case 0: freq >>= 2; break;
-        case 1: freq >>= 4; break;
-        case 2: freq >>= 6; break;
-        case 3: freq >>= 8; break;
-        case 4: freq >>= 10; break;
-        case 6:
-        case 7:
-            if (s->feat & TIMER_FEAT_EXTCLK) {
-                break;
-            }
-            /* fallthrough */
-        default:
-            hw_error("sh_timer_write: Reserved TPSC value\n");
-        }
-        switch ((value & TIMER_TCR_CKEG) >> 3) {
-        case 0:
-            break;
-        case 1:
-        case 2:
-        case 3:
-            if (s->feat & TIMER_FEAT_EXTCLK) {
-                break;
-            }
-            /* fallthrough */
-        default:
-            hw_error("sh_timer_write: Reserved CKEG value\n");
-        }
-        switch ((value & TIMER_TCR_ICPE) >> 6) {
-        case 0:
-            break;
-        case 2:
-        case 3:
-            if (s->feat & TIMER_FEAT_CAPT) {
-                break;
-            }
-            /* fallthrough */
-        default:
-            hw_error("sh_timer_write: Reserved ICPE value\n");
-        }
-        if ((value & TIMER_TCR_UNF) == 0) {
-            s->int_level = 0;
-        }
-
-        value &= ~TIMER_TCR_UNF;
-
-        if ((value & TIMER_TCR_ICPF) && (!(s->feat & TIMER_FEAT_CAPT))) {
-            hw_error("sh_timer_write: Reserved ICPF value\n");
-        }
-
-        value &= ~TIMER_TCR_ICPF; /* capture not supported */
-
-        if (value & TIMER_TCR_RESERVED) {
-            hw_error("sh_timer_write: Reserved TCR bits set\n");
-        }
-        s->tcr = value;
-        ptimer_set_limit(s->timer, s->tcor, 0);
-        ptimer_set_freq(s->timer, freq);
-        if (s->enabled) {
-            /* Restart the timer if still enabled.  */
-            ptimer_run(s->timer, 0);
-        }
-        ptimer_transaction_commit(s->timer);
-        break;
-    case OFFSET_TCPR:
-        if (s->feat & TIMER_FEAT_CAPT) {
-            s->tcpr = value;
-            break;
-        }
-        /* fallthrough */
-    default:
-        hw_error("sh_timer_write: Bad offset %x\n", (int)offset);
-    }
-    sh_timer_update(s);
-}
-
-static void sh_timer_start_stop(void *opaque, int enable)
-{
-    sh_timer_state *s = (sh_timer_state *)opaque;
-
-#ifdef DEBUG_TIMER
-    printf("sh_timer_start_stop %d (%d)\n", enable, s->enabled);
-#endif
-
-    ptimer_transaction_begin(s->timer);
-    if (s->enabled && !enable) {
-        ptimer_stop(s->timer);
-    }
-    if (!s->enabled && enable) {
-        ptimer_run(s->timer, 0);
-    }
-    ptimer_transaction_commit(s->timer);
-    s->enabled = !!enable;
-
-#ifdef DEBUG_TIMER
-    printf("sh_timer_start_stop done %d\n", s->enabled);
-#endif
-}
-
-static void sh_timer_tick(void *opaque)
-{
-    sh_timer_state *s = (sh_timer_state *)opaque;
-    s->int_level = s->enabled;
-    sh_timer_update(s);
-}
-
-static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
-{
-    sh_timer_state *s;
-
-    s = (sh_timer_state *)g_malloc0(sizeof(sh_timer_state));
-    s->freq = freq;
-    s->feat = feat;
-    s->tcor = 0xffffffff;
-    s->tcnt = 0xffffffff;
-    s->tcpr = 0xdeadbeef;
-    s->tcr = 0;
-    s->enabled = 0;
-    s->irq = irq;
-
-    s->timer = ptimer_init(sh_timer_tick, s, PTIMER_POLICY_DEFAULT);
-
-    sh_timer_write(s, OFFSET_TCOR >> 2, s->tcor);
-    sh_timer_write(s, OFFSET_TCNT >> 2, s->tcnt);
-    sh_timer_write(s, OFFSET_TCPR >> 2, s->tcpr);
-    sh_timer_write(s, OFFSET_TCR  >> 2, s->tcpr);
-    /* ??? Save/restore.  */
-    return s;
-}
-
-typedef struct {
-    MemoryRegion iomem;
-    MemoryRegion iomem_p4;
-    MemoryRegion iomem_a7;
-    void *timer[3];
-    int level[3];
-    uint32_t tocr;
-    uint32_t tstr;
-    int feat;
-} tmu012_state;
-
-static uint64_t tmu012_read(void *opaque, hwaddr offset,
-                            unsigned size)
-{
-    tmu012_state *s = (tmu012_state *)opaque;
-
-#ifdef DEBUG_TIMER
-    printf("tmu012_read 0x%lx\n", (unsigned long) offset);
-#endif
-
-    if (offset >= 0x20) {
-        if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
-        }
-        return sh_timer_read(s->timer[2], offset - 0x20);
-    }
-
-    if (offset >= 0x14)
-        return sh_timer_read(s->timer[1], offset - 0x14);
-
-    if (offset >= 0x08)
-        return sh_timer_read(s->timer[0], offset - 0x08);
-
-    if (offset == 4)
-        return s->tstr;
-
-    if ((s->feat & TMU012_FEAT_TOCR) && offset == 0)
-        return s->tocr;
-
-    hw_error("tmu012_write: Bad offset %x\n", (int)offset);
-    return 0;
-}
-
-static void tmu012_write(void *opaque, hwaddr offset,
-                        uint64_t value, unsigned size)
-{
-    tmu012_state *s = (tmu012_state *)opaque;
-
-#ifdef DEBUG_TIMER
-    printf("tmu012_write 0x%lx 0x%08x\n", (unsigned long) offset, value);
-#endif
-
-    if (offset >= 0x20) {
-        if (!(s->feat & TMU012_FEAT_3CHAN)) {
-            hw_error("tmu012_write: Bad channel offset %x\n", (int)offset);
-        }
-        sh_timer_write(s->timer[2], offset - 0x20, value);
-        return;
-    }
-
-    if (offset >= 0x14) {
-        sh_timer_write(s->timer[1], offset - 0x14, value);
-        return;
-    }
-
-    if (offset >= 0x08) {
-        sh_timer_write(s->timer[0], offset - 0x08, value);
-        return;
-    }
-
-    if (offset == 4) {
-        sh_timer_start_stop(s->timer[0], value & (1 << 0));
-        sh_timer_start_stop(s->timer[1], value & (1 << 1));
-        if (s->feat & TMU012_FEAT_3CHAN) {
-            sh_timer_start_stop(s->timer[2], value & (1 << 2));
-        } else {
-            if (value & (1 << 2)) {
-                hw_error("tmu012_write: Bad channel\n");
-            }
-        }
-
-        s->tstr = value;
-        return;
-    }
-
-    if ((s->feat & TMU012_FEAT_TOCR) && offset == 0) {
-        s->tocr = value & (1 << 0);
-    }
-}
-
-static const MemoryRegionOps tmu012_ops = {
-    .read = tmu012_read,
-    .write = tmu012_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-void tmu012_init(MemoryRegion *sysmem, hwaddr base,
-                 int feat, uint32_t freq,
-                 qemu_irq ch0_irq, qemu_irq ch1_irq,
-                 qemu_irq ch2_irq0, qemu_irq ch2_irq1)
-{
-    tmu012_state *s;
-    int timer_feat = (feat & TMU012_FEAT_EXTCLK) ? TIMER_FEAT_EXTCLK : 0;
-
-    s = (tmu012_state *)g_malloc0(sizeof(tmu012_state));
-    s->feat = feat;
-    s->timer[0] = sh_timer_init(freq, timer_feat, ch0_irq);
-    s->timer[1] = sh_timer_init(freq, timer_feat, ch1_irq);
-    if (feat & TMU012_FEAT_3CHAN) {
-        s->timer[2] = sh_timer_init(freq, timer_feat | TIMER_FEAT_CAPT,
-                                    ch2_irq0); /* ch2_irq1 not supported */
-    }
-
-    memory_region_init_io(&s->iomem, NULL, &tmu012_ops, s,
-                          "timer", 0x100000000ULL);
-
-    memory_region_init_alias(&s->iomem_p4, NULL, "timer-p4",
-                             &s->iomem, 0, 0x1000);
-    memory_region_add_subregion(sysmem, P4ADDR(base), &s->iomem_p4);
-
-    memory_region_init_alias(&s->iomem_a7, NULL, "timer-a7",
-                             &s->iomem, 0, 0x1000);
-    memory_region_add_subregion(sysmem, A7ADDR(base), &s->iomem_a7);
-    /* ??? Save/restore.  */
-}
diff --git a/MAINTAINERS b/MAINTAINERS
index 0ca6b7de94a..a1c68d23031 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2188,7 +2188,6 @@ S: Odd Fixes
 F: hw/char/renesas_sci.c
 F: hw/char/sh_serial.c
 F: hw/timer/renesas_*.c
-F: hw/timer/sh_timer.c
 F: include/hw/char/renesas_sci.h
 F: include/hw/sh4/sh.h
 F: include/hw/timer/renesas_*.h
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index b1a87b0484e..8e409fb54ec 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -36,10 +36,6 @@ config CMSDK_APB_DUALTIMER
     bool
     select PTIMER
 
-config SH_TIMER
-    bool
-    select PTIMER
-
 config RENESAS_TIMER
     bool
     select PTIMER
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 5584185870c..088e015c143 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -25,7 +25,6 @@
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_synctimer.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
-softmmu_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
 softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
-- 
2.31.1


