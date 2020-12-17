Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C02DCA23
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 01:49:32 +0100 (CET)
Received: from localhost ([::1]:40438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kphU3-0008Nb-8m
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 19:49:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3LqraXwgKCvEpnaThmlaZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--wuhaotsh.bounces.google.com>)
 id 1kphQP-0006Ix-Eq
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:45 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3LqraXwgKCvEpnaThmlaZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--wuhaotsh.bounces.google.com>)
 id 1kphQI-0006qv-OW
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 19:45:45 -0500
Received: by mail-pg1-x54a.google.com with SMTP id f19so18392547pgm.4
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 16:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=bfvJpd9+m7ujAeaE5a8zb+sHbXmybrvFRRI+Ug0qSfk=;
 b=u2bu7lkOAhPSab5fkkA7fhl33Gk3CPM7a6w+QT6X++zV/q7sHtc6m9NBo749jHQNyX
 wHemAm03YvtmFeFsmfLAk6X8T9r3Xj60r4szbW5D2R1ToVsSVDvPWGSFuSnX7dJZbiT8
 7/jfnY2e3Ug754NFMIDPDeW4atHsXHH+0MmSuRcJug+G/HCoIKG2ks4Sn4R5fUqfB7ug
 8sQeBxzVhMbWbxVpELH74E6tggAdjZn/ZYlDORIP3fIqBlVIjIMloVBrkX9baBl3UxKB
 DHiXFTWHx7xjP6rQjggbDNwI68fcgYyNZ7O+/qvG2yR2c8l82XEqGOLVMWRhXQARnf/5
 3Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bfvJpd9+m7ujAeaE5a8zb+sHbXmybrvFRRI+Ug0qSfk=;
 b=TzOBTVRT0eZ3svguSy0vwsgdd/qNa6Q+OHo5MtG7sUDF2dzD4fm8SzQXg1aD31D5ju
 VScr9aC+/n2nMUgafR3klS/iFJAvZbwLA+2yPqwfMVIMW1BB5uliE2QGaQw8G4G+jfiT
 bjUJdltu6sIrqdS0SOJdBVD7xVl5XXURe7vPXhtVV8eRVQAzRvnb0bcW7gNXdK0qiSPD
 XA1WVZsuTHMQDocXblFEUTKWVJ0f1RbpUnRR0E8VKI3PIkMuY+qe6GASv/akWIABCUeQ
 JiiMGfRxgykeUW6m8ZwlGJH9nePbo8My41YfiyCfbtxmSHyGuy0VGkkBWtP9QMQGZ80z
 RlKg==
X-Gm-Message-State: AOAM533sUlM2+UHdnhTB5qCufVk1eiXPFC/uon26M4qp2M5lJR/IbFnC
 jidiXANgaRyNG7M1y5IkWL1IrkzwqFa4jA==
X-Google-Smtp-Source: ABdhPJyqGrWVlcP1yP4o0FgfCT2o4dOLBfti7jl3fmktBH+6ZkwE+ArBnWpr0tqGPkcMlt4ya/SDTQR5XDsRug==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:1615:0:b029:19d:c9f1:f450 with SMTP
 id 21-20020a6216150000b029019dc9f1f450mr34292206pfw.11.1608165934634; Wed, 16
 Dec 2020 16:45:34 -0800 (PST)
Date: Wed, 16 Dec 2020 16:43:49 -0800
In-Reply-To: <20201217004349.3740927-1-wuhaotsh@google.com>
Message-Id: <20201217004349.3740927-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20201217004349.3740927-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v4 6/6] hw/*: Use type casting for SysBusDevice in NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3LqraXwgKCvEpnaThmlaZhhZeX.VhfjXfn-WXoXeghgZgn.hkZ@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: minyard@acm.org, venture@google.com, qemu-devel@nongnu.org,
 hskinnemoen@google.com, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-devel@nongnu.org>

A device shouldn't access its parent object which is QOM internal.
Instead it should use type cast for this purporse. This patch fixes this
issue for all NPCM7XX Devices.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 2 +-
 hw/mem/npcm7xx_mc.c     | 2 +-
 hw/misc/npcm7xx_clk.c   | 2 +-
 hw/misc/npcm7xx_gcr.c   | 2 +-
 hw/misc/npcm7xx_rng.c   | 2 +-
 hw/nvram/npcm7xx_otp.c  | 2 +-
 hw/ssi/npcm7xx_fiu.c    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 306260fa67..3fdd5cab01 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -82,7 +82,7 @@ static NPCM7xxState *npcm7xx_create_soc(MachineState *machine,
                                         uint32_t hw_straps)
 {
     NPCM7xxMachineClass *nmc = NPCM7XX_MACHINE_GET_CLASS(machine);
-    MachineClass *mc = &nmc->parent;
+    MachineClass *mc = MACHINE_CLASS(nmc);
     Object *obj;
 
     if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
diff --git a/hw/mem/npcm7xx_mc.c b/hw/mem/npcm7xx_mc.c
index 0435d06ab4..abc5af5620 100644
--- a/hw/mem/npcm7xx_mc.c
+++ b/hw/mem/npcm7xx_mc.c
@@ -62,7 +62,7 @@ static void npcm7xx_mc_realize(DeviceState *dev, Error **errp)
 
     memory_region_init_io(&s->mmio, OBJECT(s), &npcm7xx_mc_ops, s, "regs",
                           NPCM7XX_MC_REGS_SIZE);
-    sysbus_init_mmio(&s->parent, &s->mmio);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->mmio);
 }
 
 static void npcm7xx_mc_class_init(ObjectClass *klass, void *data)
diff --git a/hw/misc/npcm7xx_clk.c b/hw/misc/npcm7xx_clk.c
index 48bc9bdda5..0bcae9ce95 100644
--- a/hw/misc/npcm7xx_clk.c
+++ b/hw/misc/npcm7xx_clk.c
@@ -913,7 +913,7 @@ static void npcm7xx_clk_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_clk_ops, s,
                           TYPE_NPCM7XX_CLK, 4 * KiB);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static int npcm7xx_clk_post_load(void *opaque, int version_id)
diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
index 745f690809..eace9e1967 100644
--- a/hw/misc/npcm7xx_gcr.c
+++ b/hw/misc/npcm7xx_gcr.c
@@ -220,7 +220,7 @@ static void npcm7xx_gcr_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_gcr_ops, s,
                           TYPE_NPCM7XX_GCR, 4 * KiB);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static const VMStateDescription vmstate_npcm7xx_gcr = {
diff --git a/hw/misc/npcm7xx_rng.c b/hw/misc/npcm7xx_rng.c
index f650f3401f..b01df7cdb2 100644
--- a/hw/misc/npcm7xx_rng.c
+++ b/hw/misc/npcm7xx_rng.c
@@ -143,7 +143,7 @@ static void npcm7xx_rng_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &npcm7xx_rng_ops, s, "regs",
                           NPCM7XX_RNG_REGS_SIZE);
-    sysbus_init_mmio(&s->parent, &s->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
 }
 
 static const VMStateDescription vmstate_npcm7xx_rng = {
diff --git a/hw/nvram/npcm7xx_otp.c b/hw/nvram/npcm7xx_otp.c
index b16ca530ba..c61f2fc1aa 100644
--- a/hw/nvram/npcm7xx_otp.c
+++ b/hw/nvram/npcm7xx_otp.c
@@ -371,7 +371,7 @@ static void npcm7xx_otp_realize(DeviceState *dev, Error **errp)
 {
     NPCM7xxOTPClass *oc = NPCM7XX_OTP_GET_CLASS(dev);
     NPCM7xxOTPState *s = NPCM7XX_OTP(dev);
-    SysBusDevice *sbd = &s->parent;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memset(s->array, 0, sizeof(s->array));
 
diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 5040132b07..4eedb2927e 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -498,7 +498,7 @@ static void npcm7xx_fiu_hold_reset(Object *obj)
 static void npcm7xx_fiu_realize(DeviceState *dev, Error **errp)
 {
     NPCM7xxFIUState *s = NPCM7XX_FIU(dev);
-    SysBusDevice *sbd = &s->parent;
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     int i;
 
     if (s->cs_count <= 0) {
-- 
2.29.2.684.gfbc64c5ab5-goog


