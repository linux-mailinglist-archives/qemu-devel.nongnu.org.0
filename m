Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBEC4F456B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 00:43:43 +0200 (CEST)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbrtn-0005WQ-1Z
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 18:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ycRMYggKCp4USF8MRQFEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1nbroW-0004Gm-8U
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:17 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:48063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ycRMYggKCp4USF8MRQFEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--wuhaotsh.bounces.google.com>)
 id 1nbroS-00031R-2W
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 18:38:15 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 c9-20020a17090a1d0900b001caaf769af6so468576pjd.2
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 15:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=aKrl4B9R6NVX6G2NvNi2BDS8jsDGfBJKh91JKnTnPZc=;
 b=A3d0CBHx/cJJEuZoQpZoT5f4YmAbBVUqIrTEOhEGKPmF7Ab9611qAVWMLmlMGzPWCX
 aRSXek1Bk8k84MrnhueieojjmQZmxFeWTuZxCWNmK8SUTqL/AmQERjWF7/HV3MmW54WG
 6w0hCi0htwC/73w/ajFvSG6MxP+bToaim1hbvJgZTXVGlP17hzD+n3m1i8FDtmUyeXWe
 XSzTtSEIkOVzn+d3pftwnTAETFvbdupNGR0BTOM7CO1DMUVZkBng5CfxxbLrv8IcjINj
 3DucErehBzmdaqR871UFMotzj2sknHTzMxS4AbpSaySSTxCDn2jN3PePKdm6TI2tIQGd
 UuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=aKrl4B9R6NVX6G2NvNi2BDS8jsDGfBJKh91JKnTnPZc=;
 b=VggYv35YMBcazMhixOoayF+SlfjVcXf3NqIEDTXUuYaJGmKSeH/Prp1yyi/fF2zbW5
 goo4SsTs51U01tmvJFopZ1sQ2o0ycZh4Jkkm1oIxHhPxdWuzwWKBqy27wxU7YSScZdA+
 QtjZQe7jlpLnjizyf5Wg+F62PNk4ZABfoeHdFizbdxVMZc5uy0/HaQBppgonVGvn+XiI
 jUbSNrnv0w2m9XsxkFqoGVHAdi8iZn/zf6suUfNX8WwBTeBZsbJD+JEc1DtwxRWdRden
 eK8/n5Fyv3cCLq3EX6J08jx+ngsmsxLmUfQYPvcu2asCO3h/5KS8Bx+man+XvjR4a1j9
 WCSw==
X-Gm-Message-State: AOAM530ZNwrKd5zqaB106ZY2xWS57CNdSF2iOwYCJe1qO4wRBnugxCMe
 PiJjhsQC2K6Hk/9wbxsQxnPPjwJZ+mde2w==
X-Google-Smtp-Source: ABdhPJxFlYzJXohJeNmSVEVPXN1zhv4bF+p58VvJ2n9Wmt8GdljGAKF8r+DIX9Pg8aikTMMTTki6KRSMG4kk6w==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:1acb:b0:4fb:358f:fe87 with SMTP
 id f11-20020a056a001acb00b004fb358ffe87mr5816637pfv.75.1649198281626; Tue, 05
 Apr 2022 15:38:01 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:32 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 03/11] hw/misc: Support NPCM8XX GCR module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3ycRMYggKCp4USF8MRQFEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NPCM8XX has a different set of global control registers than 7XX.
This patch supports that.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviwed-by: Titus Rwantare <titusr@google.com>
---
 MAINTAINERS                                   |   9 +-
 hw/misc/meson.build                           |   2 +-
 hw/misc/npcm7xx_gcr.c                         | 269 ------------
 hw/misc/npcm_gcr.c                            | 413 ++++++++++++++++++
 hw/misc/trace-events                          |   6 +-
 include/hw/arm/npcm7xx.h                      |   4 +-
 include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} |  29 +-
 7 files changed, 445 insertions(+), 287 deletions(-)
 delete mode 100644 hw/misc/npcm7xx_gcr.c
 create mode 100644 hw/misc/npcm_gcr.c
 rename include/hw/misc/{npcm7xx_gcr.h => npcm_gcr.h} (56%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ad2451e03..c31ed09527 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -791,14 +791,15 @@ F: hw/net/mv88w8618_eth.c
 F: include/hw/net/mv88w8618_eth.h
 F: docs/system/arm/musicpal.rst
 
-Nuvoton NPCM7xx
+Nuvoton NPCM
 M: Havard Skinnemoen <hskinnemoen@google.com>
 M: Tyrone Ting <kfting@nuvoton.com>
+M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
-F: hw/*/npcm7xx*
-F: include/hw/*/npcm7xx*
-F: tests/qtest/npcm7xx*
+F: hw/*/npcm*
+F: include/hw/*/npcm*
+F: tests/qtest/npcm*
 F: pc-bios/npcm7xx_bootrom.bin
 F: roms/vbootrom
 F: docs/system/arm/nuvoton.rst
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 6fb69612e0..13f8fee5b6 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -61,7 +61,7 @@ softmmu_ss.add(when: 'CONFIG_IMX', if_true: files(
 softmmu_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mst_fpga.c'))
 softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
-  'npcm7xx_gcr.c',
+  'npcm_gcr.c',
   'npcm7xx_mft.c',
   'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
deleted file mode 100644
index eace9e1967..0000000000
--- a/hw/misc/npcm7xx_gcr.c
+++ /dev/null
@@ -1,269 +0,0 @@
-/*
- * Nuvoton NPCM7xx System Global Control Registers.
- *
- * Copyright 2020 Google LLC
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the
- * Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
- * for more details.
- */
-
-#include "qemu/osdep.h"
-
-#include "hw/misc/npcm7xx_gcr.h"
-#include "hw/qdev-properties.h"
-#include "migration/vmstate.h"
-#include "qapi/error.h"
-#include "qemu/cutils.h"
-#include "qemu/log.h"
-#include "qemu/module.h"
-#include "qemu/units.h"
-
-#include "trace.h"
-
-#define NPCM7XX_GCR_MIN_DRAM_SIZE   (128 * MiB)
-#define NPCM7XX_GCR_MAX_DRAM_SIZE   (2 * GiB)
-
-enum NPCM7xxGCRRegisters {
-    NPCM7XX_GCR_PDID,
-    NPCM7XX_GCR_PWRON,
-    NPCM7XX_GCR_MFSEL1          = 0x0c / sizeof(uint32_t),
-    NPCM7XX_GCR_MFSEL2,
-    NPCM7XX_GCR_MISCPE,
-    NPCM7XX_GCR_SPSWC           = 0x038 / sizeof(uint32_t),
-    NPCM7XX_GCR_INTCR,
-    NPCM7XX_GCR_INTSR,
-    NPCM7XX_GCR_HIFCR           = 0x050 / sizeof(uint32_t),
-    NPCM7XX_GCR_INTCR2          = 0x060 / sizeof(uint32_t),
-    NPCM7XX_GCR_MFSEL3,
-    NPCM7XX_GCR_SRCNT,
-    NPCM7XX_GCR_RESSR,
-    NPCM7XX_GCR_RLOCKR1,
-    NPCM7XX_GCR_FLOCKR1,
-    NPCM7XX_GCR_DSCNT,
-    NPCM7XX_GCR_MDLR,
-    NPCM7XX_GCR_SCRPAD3,
-    NPCM7XX_GCR_SCRPAD2,
-    NPCM7XX_GCR_DAVCLVLR        = 0x098 / sizeof(uint32_t),
-    NPCM7XX_GCR_INTCR3,
-    NPCM7XX_GCR_VSINTR          = 0x0ac / sizeof(uint32_t),
-    NPCM7XX_GCR_MFSEL4,
-    NPCM7XX_GCR_CPBPNTR         = 0x0c4 / sizeof(uint32_t),
-    NPCM7XX_GCR_CPCTL           = 0x0d0 / sizeof(uint32_t),
-    NPCM7XX_GCR_CP2BST,
-    NPCM7XX_GCR_B2CPNT,
-    NPCM7XX_GCR_CPPCTL,
-    NPCM7XX_GCR_I2CSEGSEL,
-    NPCM7XX_GCR_I2CSEGCTL,
-    NPCM7XX_GCR_VSRCR,
-    NPCM7XX_GCR_MLOCKR,
-    NPCM7XX_GCR_SCRPAD          = 0x013c / sizeof(uint32_t),
-    NPCM7XX_GCR_USB1PHYCTL,
-    NPCM7XX_GCR_USB2PHYCTL,
-    NPCM7XX_GCR_REGS_END,
-};
-
-static const uint32_t cold_reset_values[NPCM7XX_GCR_NR_REGS] = {
-    [NPCM7XX_GCR_PDID]          = 0x04a92750,   /* Poleg A1 */
-    [NPCM7XX_GCR_MISCPE]        = 0x0000ffff,
-    [NPCM7XX_GCR_SPSWC]         = 0x00000003,
-    [NPCM7XX_GCR_INTCR]         = 0x0000035e,
-    [NPCM7XX_GCR_HIFCR]         = 0x0000004e,
-    [NPCM7XX_GCR_INTCR2]        = (1U << 19),   /* DDR initialized */
-    [NPCM7XX_GCR_RESSR]         = 0x80000000,
-    [NPCM7XX_GCR_DSCNT]         = 0x000000c0,
-    [NPCM7XX_GCR_DAVCLVLR]      = 0x5a00f3cf,
-    [NPCM7XX_GCR_SCRPAD]        = 0x00000008,
-    [NPCM7XX_GCR_USB1PHYCTL]    = 0x034730e4,
-    [NPCM7XX_GCR_USB2PHYCTL]    = 0x034730e4,
-};
-
-static uint64_t npcm7xx_gcr_read(void *opaque, hwaddr offset, unsigned size)
-{
-    uint32_t reg = offset / sizeof(uint32_t);
-    NPCM7xxGCRState *s = opaque;
-
-    if (reg >= NPCM7XX_GCR_NR_REGS) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
-                      __func__, offset);
-        return 0;
-    }
-
-    trace_npcm7xx_gcr_read(offset, s->regs[reg]);
-
-    return s->regs[reg];
-}
-
-static void npcm7xx_gcr_write(void *opaque, hwaddr offset,
-                              uint64_t v, unsigned size)
-{
-    uint32_t reg = offset / sizeof(uint32_t);
-    NPCM7xxGCRState *s = opaque;
-    uint32_t value = v;
-
-    trace_npcm7xx_gcr_write(offset, value);
-
-    if (reg >= NPCM7XX_GCR_NR_REGS) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
-                      __func__, offset);
-        return;
-    }
-
-    switch (reg) {
-    case NPCM7XX_GCR_PDID:
-    case NPCM7XX_GCR_PWRON:
-    case NPCM7XX_GCR_INTSR:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
-                      __func__, offset);
-        return;
-
-    case NPCM7XX_GCR_RESSR:
-    case NPCM7XX_GCR_CP2BST:
-        /* Write 1 to clear */
-        value = s->regs[reg] & ~value;
-        break;
-
-    case NPCM7XX_GCR_RLOCKR1:
-    case NPCM7XX_GCR_MDLR:
-        /* Write 1 to set */
-        value |= s->regs[reg];
-        break;
-    };
-
-    s->regs[reg] = value;
-}
-
-static const struct MemoryRegionOps npcm7xx_gcr_ops = {
-    .read       = npcm7xx_gcr_read,
-    .write      = npcm7xx_gcr_write,
-    .endianness = DEVICE_LITTLE_ENDIAN,
-    .valid      = {
-        .min_access_size        = 4,
-        .max_access_size        = 4,
-        .unaligned              = false,
-    },
-};
-
-static void npcm7xx_gcr_enter_reset(Object *obj, ResetType type)
-{
-    NPCM7xxGCRState *s = NPCM7XX_GCR(obj);
-
-    QEMU_BUILD_BUG_ON(sizeof(s->regs) != sizeof(cold_reset_values));
-
-    switch (type) {
-    case RESET_TYPE_COLD:
-        memcpy(s->regs, cold_reset_values, sizeof(s->regs));
-        s->regs[NPCM7XX_GCR_PWRON] = s->reset_pwron;
-        s->regs[NPCM7XX_GCR_MDLR] = s->reset_mdlr;
-        s->regs[NPCM7XX_GCR_INTCR3] = s->reset_intcr3;
-        break;
-    }
-}
-
-static void npcm7xx_gcr_realize(DeviceState *dev, Error **errp)
-{
-    ERRP_GUARD();
-    NPCM7xxGCRState *s = NPCM7XX_GCR(dev);
-    uint64_t dram_size;
-    Object *obj;
-
-    obj = object_property_get_link(OBJECT(dev), "dram-mr", errp);
-    if (!obj) {
-        error_prepend(errp, "%s: required dram-mr link not found: ", __func__);
-        return;
-    }
-    dram_size = memory_region_size(MEMORY_REGION(obj));
-    if (!is_power_of_2(dram_size) ||
-        dram_size < NPCM7XX_GCR_MIN_DRAM_SIZE ||
-        dram_size > NPCM7XX_GCR_MAX_DRAM_SIZE) {
-        g_autofree char *sz = size_to_str(dram_size);
-        g_autofree char *min_sz = size_to_str(NPCM7XX_GCR_MIN_DRAM_SIZE);
-        g_autofree char *max_sz = size_to_str(NPCM7XX_GCR_MAX_DRAM_SIZE);
-        error_setg(errp, "%s: unsupported DRAM size %s", __func__, sz);
-        error_append_hint(errp,
-                          "DRAM size must be a power of two between %s and %s,"
-                          " inclusive.\n", min_sz, max_sz);
-        return;
-    }
-
-    /* Power-on reset value */
-    s->reset_intcr3 = 0x00001002;
-
-    /*
-     * The GMMAP (Graphics Memory Map) field is used by u-boot to detect the
-     * DRAM size, and is normally initialized by the boot block as part of DRAM
-     * training. However, since we don't have a complete emulation of the
-     * memory controller and try to make it look like it has already been
-     * initialized, the boot block will skip this initialization, and we need
-     * to make sure this field is set correctly up front.
-     *
-     * WARNING: some versions of u-boot only looks at bits 8 and 9, so 2 GiB of
-     * DRAM will be interpreted as 128 MiB.
-     *
-     * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408dbaad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
-     */
-    s->reset_intcr3 |= ctz64(dram_size / NPCM7XX_GCR_MIN_DRAM_SIZE) << 8;
-}
-
-static void npcm7xx_gcr_init(Object *obj)
-{
-    NPCM7xxGCRState *s = NPCM7XX_GCR(obj);
-
-    memory_region_init_io(&s->iomem, obj, &npcm7xx_gcr_ops, s,
-                          TYPE_NPCM7XX_GCR, 4 * KiB);
-    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
-}
-
-static const VMStateDescription vmstate_npcm7xx_gcr = {
-    .name = "npcm7xx-gcr",
-    .version_id = 0,
-    .minimum_version_id = 0,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, NPCM7xxGCRState, NPCM7XX_GCR_NR_REGS),
-        VMSTATE_END_OF_LIST(),
-    },
-};
-
-static Property npcm7xx_gcr_properties[] = {
-    DEFINE_PROP_UINT32("disabled-modules", NPCM7xxGCRState, reset_mdlr, 0),
-    DEFINE_PROP_UINT32("power-on-straps", NPCM7xxGCRState, reset_pwron, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
-{
-    ResettableClass *rc = RESETTABLE_CLASS(klass);
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END > NPCM7XX_GCR_NR_REGS);
-
-    dc->desc = "NPCM7xx System Global Control Registers";
-    dc->realize = npcm7xx_gcr_realize;
-    dc->vmsd = &vmstate_npcm7xx_gcr;
-    rc->phases.enter = npcm7xx_gcr_enter_reset;
-
-    device_class_set_props(dc, npcm7xx_gcr_properties);
-}
-
-static const TypeInfo npcm7xx_gcr_info = {
-    .name               = TYPE_NPCM7XX_GCR,
-    .parent             = TYPE_SYS_BUS_DEVICE,
-    .instance_size      = sizeof(NPCM7xxGCRState),
-    .instance_init      = npcm7xx_gcr_init,
-    .class_init         = npcm7xx_gcr_class_init,
-};
-
-static void npcm7xx_gcr_register_type(void)
-{
-    type_register_static(&npcm7xx_gcr_info);
-}
-type_init(npcm7xx_gcr_register_type);
diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
new file mode 100644
index 0000000000..2349949599
--- /dev/null
+++ b/hw/misc/npcm_gcr.c
@@ -0,0 +1,413 @@
+/*
+ * Nuvoton NPCM7xx/8xx System Global Control Registers.
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/misc/npcm_gcr.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+
+#include "trace.h"
+
+#define NPCM7XX_GCR_MIN_DRAM_SIZE   (128 * MiB)
+#define NPCM7XX_GCR_MAX_DRAM_SIZE   (2 * GiB)
+
+enum NPCM7xxGCRRegisters {
+    NPCM7XX_GCR_PDID,
+    NPCM7XX_GCR_PWRON,
+    NPCM7XX_GCR_MFSEL1          = 0x0c / sizeof(uint32_t),
+    NPCM7XX_GCR_MFSEL2,
+    NPCM7XX_GCR_MISCPE,
+    NPCM7XX_GCR_SPSWC           = 0x038 / sizeof(uint32_t),
+    NPCM7XX_GCR_INTCR,
+    NPCM7XX_GCR_INTSR,
+    NPCM7XX_GCR_HIFCR           = 0x050 / sizeof(uint32_t),
+    NPCM7XX_GCR_INTCR2          = 0x060 / sizeof(uint32_t),
+    NPCM7XX_GCR_MFSEL3,
+    NPCM7XX_GCR_SRCNT,
+    NPCM7XX_GCR_RESSR,
+    NPCM7XX_GCR_RLOCKR1,
+    NPCM7XX_GCR_FLOCKR1,
+    NPCM7XX_GCR_DSCNT,
+    NPCM7XX_GCR_MDLR,
+    NPCM7XX_GCR_SCRPAD3,
+    NPCM7XX_GCR_SCRPAD2,
+    NPCM7XX_GCR_DAVCLVLR        = 0x098 / sizeof(uint32_t),
+    NPCM7XX_GCR_INTCR3,
+    NPCM7XX_GCR_VSINTR          = 0x0ac / sizeof(uint32_t),
+    NPCM7XX_GCR_MFSEL4,
+    NPCM7XX_GCR_CPBPNTR         = 0x0c4 / sizeof(uint32_t),
+    NPCM7XX_GCR_CPCTL           = 0x0d0 / sizeof(uint32_t),
+    NPCM7XX_GCR_CP2BST,
+    NPCM7XX_GCR_B2CPNT,
+    NPCM7XX_GCR_CPPCTL,
+    NPCM7XX_GCR_I2CSEGSEL,
+    NPCM7XX_GCR_I2CSEGCTL,
+    NPCM7XX_GCR_VSRCR,
+    NPCM7XX_GCR_MLOCKR,
+    NPCM7XX_GCR_SCRPAD          = 0x013c / sizeof(uint32_t),
+    NPCM7XX_GCR_USB1PHYCTL,
+    NPCM7XX_GCR_USB2PHYCTL,
+    NPCM7XX_GCR_REGS_END,
+};
+
+static const uint32_t npcm7xx_cold_reset_values[NPCM7XX_GCR_NR_REGS] = {
+    [NPCM7XX_GCR_PDID]          = 0x04a92750,   /* Poleg A1 */
+    [NPCM7XX_GCR_MISCPE]        = 0x0000ffff,
+    [NPCM7XX_GCR_SPSWC]         = 0x00000003,
+    [NPCM7XX_GCR_INTCR]         = 0x0000035e,
+    [NPCM7XX_GCR_HIFCR]         = 0x0000004e,
+    [NPCM7XX_GCR_INTCR2]        = (1U << 19),   /* DDR initialized */
+    [NPCM7XX_GCR_RESSR]         = 0x80000000,
+    [NPCM7XX_GCR_DSCNT]         = 0x000000c0,
+    [NPCM7XX_GCR_DAVCLVLR]      = 0x5a00f3cf,
+    [NPCM7XX_GCR_SCRPAD]        = 0x00000008,
+    [NPCM7XX_GCR_USB1PHYCTL]    = 0x034730e4,
+    [NPCM7XX_GCR_USB2PHYCTL]    = 0x034730e4,
+};
+
+enum NPCM8xxGCRRegisters {
+    NPCM8XX_GCR_PDID,
+    NPCM8XX_GCR_PWRON,
+    NPCM8XX_GCR_MISCPE          = 0x014 / sizeof(uint32_t),
+    NPCM8XX_GCR_FLOCKR2         = 0x020 / sizeof(uint32_t),
+    NPCM8XX_GCR_FLOCKR3,
+    NPCM8XX_GCR_A35_MODE        = 0x034 / sizeof(uint32_t),
+    NPCM8XX_GCR_SPSWC,
+    NPCM8XX_GCR_INTCR,
+    NPCM8XX_GCR_INTSR,
+    NPCM8XX_GCR_HIFCR           = 0x050 / sizeof(uint32_t),
+    NPCM8XX_GCR_INTCR2          = 0x060 / sizeof(uint32_t),
+    NPCM8XX_GCR_SRCNT           = 0x068 / sizeof(uint32_t),
+    NPCM8XX_GCR_RESSR,
+    NPCM8XX_GCR_RLOCKR1,
+    NPCM8XX_GCR_FLOCKR1,
+    NPCM8XX_GCR_DSCNT,
+    NPCM8XX_GCR_MDLR,
+    NPCM8XX_GCR_SCRPAD_C        = 0x080 / sizeof(uint32_t),
+    NPCM8XX_GCR_SCRPAD_B,
+    NPCM8XX_GCR_DAVCLVLR        = 0x098 / sizeof(uint32_t),
+    NPCM8XX_GCR_INTCR3,
+    NPCM8XX_GCR_PCIRCTL         = 0x0a0 / sizeof(uint32_t),
+    NPCM8XX_GCR_VSINTR,
+    NPCM8XX_GCR_SD2SUR1         = 0x0b4 / sizeof(uint32_t),
+    NPCM8XX_GCR_SD2SUR2,
+    NPCM8XX_GCR_INTCR4          = 0x0c0 / sizeof(uint32_t),
+    NPCM8XX_GCR_CPCTL           = 0x0d0 / sizeof(uint32_t),
+    NPCM8XX_GCR_CP2BST,
+    NPCM8XX_GCR_B2CPNT,
+    NPCM8XX_GCR_CPPCTL,
+    NPCM8XX_GCR_I2CSEGSEL       = 0x0e0 / sizeof(uint32_t),
+    NPCM8XX_GCR_I2CSEGCTL,
+    NPCM8XX_GCR_VSRCR,
+    NPCM8XX_GCR_MLOCKR,
+    NPCM8XX_GCR_SCRPAD          = 0x13c / sizeof(uint32_t),
+    NPCM8XX_GCR_USB1PHYCTL,
+    NPCM8XX_GCR_USB2PHYCTL,
+    NPCM8XX_GCR_USB3PHYCTL,
+    NPCM8XX_GCR_MFSEL1          = 0x260 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL2,
+    NPCM8XX_GCR_MFSEL3,
+    NPCM8XX_GCR_MFSEL4,
+    NPCM8XX_GCR_MFSEL5,
+    NPCM8XX_GCR_MFSEL6,
+    NPCM8XX_GCR_MFSEL7,
+    NPCM8XX_GCR_MFSEL_LK1       = 0x280 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL_LK2,
+    NPCM8XX_GCR_MFSEL_LK3,
+    NPCM8XX_GCR_MFSEL_LK4,
+    NPCM8XX_GCR_MFSEL_LK5,
+    NPCM8XX_GCR_MFSEL_LK6,
+    NPCM8XX_GCR_MFSEL_LK7,
+    NPCM8XX_GCR_MFSEL_SET1      = 0x2a0 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL_SET2,
+    NPCM8XX_GCR_MFSEL_SET3,
+    NPCM8XX_GCR_MFSEL_SET4,
+    NPCM8XX_GCR_MFSEL_SET5,
+    NPCM8XX_GCR_MFSEL_SET6,
+    NPCM8XX_GCR_MFSEL_SET7,
+    NPCM8XX_GCR_MFSEL_CLR1      = 0x2c0 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL_CLR2,
+    NPCM8XX_GCR_MFSEL_CLR3,
+    NPCM8XX_GCR_MFSEL_CLR4,
+    NPCM8XX_GCR_MFSEL_CLR5,
+    NPCM8XX_GCR_MFSEL_CLR6,
+    NPCM8XX_GCR_MFSEL_CLR7,
+    NPCM8XX_GCR_WD0RCRLK        = 0x400 / sizeof(uint32_t),
+    NPCM8XX_GCR_WD1RCRLK,
+    NPCM8XX_GCR_WD2RCRLK,
+    NPCM8XX_GCR_SWRSTC1LK,
+    NPCM8XX_GCR_SWRSTC2LK,
+    NPCM8XX_GCR_SWRSTC3LK,
+    NPCM8XX_GCR_TIPRSTCLK,
+    NPCM8XX_GCR_CORSTCLK,
+    NPCM8XX_GCR_WD0RCRBLK,
+    NPCM8XX_GCR_WD1RCRBLK,
+    NPCM8XX_GCR_WD2RCRBLK,
+    NPCM8XX_GCR_SWRSTC1BLK,
+    NPCM8XX_GCR_SWRSTC2BLK,
+    NPCM8XX_GCR_SWRSTC3BLK,
+    NPCM8XX_GCR_TIPRSTCBLK,
+    NPCM8XX_GCR_CORSTCBLK,
+    /* 64 scratch pad registers start here. 0xe00 ~ 0xefc */
+    NPCM8XX_GCR_SCRPAD_00       = 0xe00 / sizeof(uint32_t),
+    /* 32 semaphore registers start here. 0xf00 ~ 0xf7c */
+    NPCM8XX_GCR_GP_SEMFR_00     = 0xf00 / sizeof(uint32_t),
+    NPCM8XX_GCR_REGS_END        = 0xf80 / sizeof(uint32_t),
+};
+
+static const uint32_t npcm8xx_cold_reset_values[NPCM8XX_GCR_NR_REGS] = {
+    [NPCM8XX_GCR_PDID]          = 0x04a35850,   /* Arbel A1 */
+    [NPCM8XX_GCR_MISCPE]        = 0x0000ffff,
+    [NPCM8XX_GCR_A35_MODE]      = 0xfff4ff30,
+    [NPCM8XX_GCR_SPSWC]         = 0x00000003,
+    [NPCM8XX_GCR_INTCR]         = 0x0010035e,
+    [NPCM8XX_GCR_HIFCR]         = 0x0000004e,
+    [NPCM8XX_GCR_SD2SUR1]       = 0xfdc80000,
+    [NPCM8XX_GCR_SD2SUR2]       = 0x5200b130,
+    [NPCM8XX_GCR_INTCR2]        = (1U << 19),   /* DDR initialized */
+    [NPCM8XX_GCR_RESSR]         = 0x80000000,
+    [NPCM8XX_GCR_DAVCLVLR]      = 0x5a00f3cf,
+    [NPCM8XX_GCR_INTCR3]        = 0x5e001002,
+    [NPCM8XX_GCR_VSRCR]         = 0x00004800,
+    [NPCM8XX_GCR_SCRPAD]        = 0x00000008,
+    [NPCM8XX_GCR_USB1PHYCTL]    = 0x034730e4,
+    [NPCM8XX_GCR_USB2PHYCTL]    = 0x034730e4,
+    [NPCM8XX_GCR_USB3PHYCTL]    = 0x034730e4,
+    /* All 32 semaphores should be initialized to 1. */
+    [NPCM8XX_GCR_GP_SEMFR_00...NPCM8XX_GCR_REGS_END - 1] = 0x00000001,
+};
+
+static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint32_t reg = offset / sizeof(uint32_t);
+    NPCMGCRState *s = opaque;
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
+
+    if (reg >= c->nr_regs) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    trace_npcm_gcr_read(offset, s->regs[reg]);
+
+    return s->regs[reg];
+}
+
+static void npcm_gcr_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    uint32_t reg = offset / sizeof(uint32_t);
+    NPCMGCRState *s = opaque;
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
+    uint32_t value = v;
+
+    trace_npcm_gcr_write(offset, value);
+
+    if (reg >= c->nr_regs) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+        return;
+    }
+
+    switch (reg) {
+    case NPCM7XX_GCR_PDID:
+    case NPCM7XX_GCR_PWRON:
+    case NPCM7XX_GCR_INTSR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: register @ 0x%04" HWADDR_PRIx " is read-only\n",
+                      __func__, offset);
+        return;
+
+    case NPCM7XX_GCR_RESSR:
+    case NPCM7XX_GCR_CP2BST:
+        /* Write 1 to clear */
+        value = s->regs[reg] & ~value;
+        break;
+
+    case NPCM7XX_GCR_RLOCKR1:
+    case NPCM7XX_GCR_MDLR:
+        /* Write 1 to set */
+        value |= s->regs[reg];
+        break;
+    };
+
+    s->regs[reg] = value;
+}
+
+static const struct MemoryRegionOps npcm_gcr_ops = {
+    .read       = npcm_gcr_read,
+    .write      = npcm_gcr_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid      = {
+        .min_access_size        = 4,
+        .max_access_size        = 4,
+        .unaligned              = false,
+    },
+};
+
+static void npcm_gcr_enter_reset(Object *obj, ResetType type)
+{
+    NPCMGCRState *s = NPCM_GCR(obj);
+    NPCMGCRClass *c = NPCM_GCR_GET_CLASS(obj);
+
+    switch (type) {
+    case RESET_TYPE_COLD:
+        memcpy(s->regs, c->cold_reset_values, c->nr_regs * sizeof(uint32_t));
+        /* These 3 registers are at the same location in both 7xx and 8xx. */
+        s->regs[NPCM7XX_GCR_PWRON] = s->reset_pwron;
+        s->regs[NPCM7XX_GCR_MDLR] = s->reset_mdlr;
+        s->regs[NPCM7XX_GCR_INTCR3] = s->reset_intcr3;
+        break;
+    }
+}
+
+static void npcm_gcr_realize(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+    NPCMGCRState *s = NPCM_GCR(dev);
+    uint64_t dram_size;
+    Object *obj;
+
+    obj = object_property_get_link(OBJECT(dev), "dram-mr", errp);
+    if (!obj) {
+        error_prepend(errp, "%s: required dram-mr link not found: ", __func__);
+        return;
+    }
+    dram_size = memory_region_size(MEMORY_REGION(obj));
+    if (!is_power_of_2(dram_size) ||
+        dram_size < NPCM7XX_GCR_MIN_DRAM_SIZE ||
+        dram_size > NPCM7XX_GCR_MAX_DRAM_SIZE) {
+        g_autofree char *sz = size_to_str(dram_size);
+        g_autofree char *min_sz = size_to_str(NPCM7XX_GCR_MIN_DRAM_SIZE);
+        g_autofree char *max_sz = size_to_str(NPCM7XX_GCR_MAX_DRAM_SIZE);
+        error_setg(errp, "%s: unsupported DRAM size %s", __func__, sz);
+        error_append_hint(errp,
+                          "DRAM size must be a power of two between %s and %s,"
+                          " inclusive.\n", min_sz, max_sz);
+        return;
+    }
+
+    /* Power-on reset value */
+    s->reset_intcr3 = 0x00001002;
+
+    /*
+     * The GMMAP (Graphics Memory Map) field is used by u-boot to detect the
+     * DRAM size, and is normally initialized by the boot block as part of DRAM
+     * training. However, since we don't have a complete emulation of the
+     * memory controller and try to make it look like it has already been
+     * initialized, the boot block will skip this initialization, and we need
+     * to make sure this field is set correctly up front.
+     *
+     * WARNING: some versions of u-boot only looks at bits 8 and 9, so 2 GiB of
+     * DRAM will be interpreted as 128 MiB.
+     *
+     * https://github.com/Nuvoton-Israel/u-boot/blob/2aef993bd2aafeb5408dbaad0f3ce099ee40c4aa/board/nuvoton/poleg/poleg.c#L244
+     */
+    s->reset_intcr3 |= ctz64(dram_size / NPCM7XX_GCR_MIN_DRAM_SIZE) << 8;
+}
+
+static void npcm_gcr_init(Object *obj)
+{
+    NPCMGCRState *s = NPCM_GCR(obj);
+
+    memory_region_init_io(&s->iomem, obj, &npcm_gcr_ops, s,
+                          TYPE_NPCM_GCR, 4 * KiB);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static const VMStateDescription vmstate_npcm_gcr = {
+    .name = "npcm-gcr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, NPCMGCRState, NPCM_GCR_MAX_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static Property npcm_gcr_properties[] = {
+    DEFINE_PROP_UINT32("disabled-modules", NPCMGCRState, reset_mdlr, 0),
+    DEFINE_PROP_UINT32("power-on-straps", NPCMGCRState, reset_pwron, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void npcm_gcr_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = npcm_gcr_realize;
+    dc->vmsd = &vmstate_npcm_gcr;
+    rc->phases.enter = npcm_gcr_enter_reset;
+
+    device_class_set_props(dc, npcm_gcr_properties);
+}
+
+static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
+{
+    NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
+    QEMU_BUILD_BUG_ON(NPCM7XX_GCR_REGS_END != NPCM7XX_GCR_NR_REGS);
+    dc->desc = "NPCM7xx System Global Control Registers";
+    c->nr_regs = NPCM7XX_GCR_NR_REGS;
+    c->cold_reset_values = npcm7xx_cold_reset_values;
+}
+
+static void npcm8xx_gcr_class_init(ObjectClass *klass, void *data)
+{
+    NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
+    QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END != NPCM8XX_GCR_NR_REGS);
+    dc->desc = "NPCM8xx System Global Control Registers";
+    c->nr_regs = NPCM8XX_GCR_NR_REGS;
+    c->cold_reset_values = npcm8xx_cold_reset_values;
+}
+
+static const TypeInfo npcm_gcr_info[] = {
+    {
+        .name               = TYPE_NPCM_GCR,
+        .parent             = TYPE_SYS_BUS_DEVICE,
+        .instance_size      = sizeof(NPCMGCRState),
+        .instance_init      = npcm_gcr_init,
+        .class_size         = sizeof(NPCMGCRClass),
+        .class_init         = npcm_gcr_class_init,
+        .abstract           = true,
+    },
+    {
+        .name               = TYPE_NPCM7XX_GCR,
+        .parent             = TYPE_NPCM_GCR,
+        .class_init         = npcm7xx_gcr_class_init,
+    },
+    {
+        .name               = TYPE_NPCM8XX_GCR,
+        .parent             = TYPE_NPCM_GCR,
+        .class_init         = npcm8xx_gcr_class_init,
+    },
+};
+DEFINE_TYPES(npcm_gcr_info)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4e0c7973a4..3f9f0fcce0 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -102,9 +102,9 @@ mos6522_read(uint64_t addr, const char *name, unsigned val) "reg=0x%"PRIx64 " [%
 npcm7xx_clk_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 npcm7xx_clk_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
-# npcm7xx_gcr.c
-npcm7xx_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
-npcm7xx_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+# npcm_gcr.c
+npcm_gcr_read(uint64_t offset, uint32_t value) " offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
+npcm_gcr_write(uint64_t offset, uint32_t value) "offset: 0x%04" PRIx64 " value: 0x%08" PRIx32
 
 # npcm7xx_mft.c
 npcm7xx_mft_read(const char *name, uint64_t offset, uint16_t value) "%s: offset: 0x%04" PRIx64 " value: 0x%04" PRIx16
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index ce593235d9..b0f50ff5c5 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -24,7 +24,7 @@
 #include "hw/i2c/npcm7xx_smbus.h"
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
-#include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
@@ -88,7 +88,7 @@ typedef struct NPCM7xxState {
     MemoryRegion        ram3;
     MemoryRegion        *dram;
 
-    NPCM7xxGCRState     gcr;
+    NPCMGCRState        gcr;
     NPCM7xxCLKState     clk;
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm_gcr.h
similarity index 56%
rename from include/hw/misc/npcm7xx_gcr.h
rename to include/hw/misc/npcm_gcr.h
index 13109d9d32..ac3d781c2e 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -1,5 +1,5 @@
 /*
- * Nuvoton NPCM7xx System Global Control Registers.
+ * Nuvoton NPCM7xx/NPCM8xx System Global Control Registers.
  *
  * Copyright 2020 Google LLC
  *
@@ -18,26 +18,39 @@
 
 #include "exec/memory.h"
 #include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define NPCM7XX_GCR_NR_REGS (0x148 / sizeof(uint32_t))
+#define NPCM8XX_GCR_NR_REGS (0xf80 / sizeof(uint32_t))
 
 /*
- * Number of registers in our device state structure. Don't change this without
- * incrementing the version_id in the vmstate.
+ * Number of maximum registers in NPCM device state structure. Don't change
+ * this without incrementing the version_id in the vmstate.
  */
-#define NPCM7XX_GCR_NR_REGS (0x148 / sizeof(uint32_t))
+#define NPCM_GCR_MAX_NR_REGS NPCM8XX_GCR_NR_REGS
 
-typedef struct NPCM7xxGCRState {
+typedef struct NPCMGCRState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
 
-    uint32_t regs[NPCM7XX_GCR_NR_REGS];
+    uint32_t regs[NPCM_GCR_MAX_NR_REGS];
 
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
-} NPCM7xxGCRState;
+} NPCMGCRState;
+
+typedef struct NPCMGCRClass {
+    SysBusDeviceClass parent;
+
+    size_t nr_regs;
+    const uint32_t *cold_reset_values;
+} NPCMGCRClass;
 
+#define TYPE_NPCM_GCR "npcm-gcr"
+OBJECT_DECLARE_TYPE(NPCMGCRState, NPCMGCRClass, NPCM_GCR)
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
-#define NPCM7XX_GCR(obj) OBJECT_CHECK(NPCM7xxGCRState, (obj), TYPE_NPCM7XX_GCR)
+#define TYPE_NPCM8XX_GCR "npcm8xx-gcr"
 
 #endif /* NPCM7XX_GCR_H */
-- 
2.35.1.1094.g7c7d902a7c-goog


