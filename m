Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FC2EF800
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:20:08 +0100 (CET)
Received: from localhost ([::1]:56358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxxIt-0006Nw-Sq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ka74XwgKCm4igTMafeTSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9n-0001Bq-0s
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:44 -0500
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:50949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ka74XwgKCm4igTMafeTSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--wuhaotsh.bounces.google.com>)
 id 1kxx9f-0007MT-H4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:10:42 -0500
Received: by mail-pf1-x449.google.com with SMTP id l17so7231665pff.17
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=hNm0ut2O+1mIOJ9J+86PhKTX0lwSI4vyPoH9VqTzsXI=;
 b=VfBXqzECNGvBewlj3It9ry2PgO5f0nywYkp74DWkdaQtCaptakXmNFarrXlSu3TaCL
 J3mCIqNUT4/1sU4Ppm3+kopykDmEtn2UkE6sDLujaDEJCtRI3sr6ouxNvExVHpCpB1EK
 3WMNBoLVj2afTYTTjFzAIr/Rj4BTI7Z8KabH5i6syzCiFS50Q1hu4d11RRn898N9bxRJ
 XFY9I7hCV5AEPax3RC7yH5qW1pG4K81Lfs6DdQl9F4UoVu7ECwkwaXAX3X1OmVh/7ZTF
 tgQ8BnSByfYHVWTIURpw9LGzteZqul35vxkvdbuEZxOoMRxJNIi7XrkEcwm0wzev04Ur
 VjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hNm0ut2O+1mIOJ9J+86PhKTX0lwSI4vyPoH9VqTzsXI=;
 b=f3K2X06G3fhLK1ve5VBrrrIpYvY3LldYF7MdxoLnHPesIuhgIfD+NiMk9TYLtIIWmW
 wJo/jv3nbz5cd7Up4tkIr/Mu6qhWFKq7OtZWPK+0kYiDAJa1hX3uprtuH02mXd/iusOb
 QvMJexNsavlQEdlDJCO7uEWQ5Cm3+lrx3W7Tp2S0XItL275Fye8/hxr16xvAvc8TLa2u
 Idht2tOmfOl6EIzDbGpbf/KoEXLO0OspPi+qeF72pYlH7o48xjheLVOfUeVQtu6gUq/e
 xBH5TsOcaflyDNjxLRNbqZz1LGE+FxwxfUqBFr8o0aV3zEokQjP065dc8pOrB6Nk2X+O
 VEPg==
X-Gm-Message-State: AOAM530YDOmwliTq8YMvByKOzJ/C8mFkMavfk5KyIIwhUtyDxj9Q/FdQ
 FyXMYcNcUDH/R1hPtXX2iVB3zYnpYSVxWg==
X-Google-Smtp-Source: ABdhPJy91Atode/M5C4++yLdoH978miwg6ED/2QXrMUSV43RQMLBYskQIFvTtom+zfkwWrIsMZF6Nqt/ZnWxHA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:a485:: with SMTP id
 z5mr5279205pjp.160.1610133033191; Fri, 08 Jan 2021 11:10:33 -0800 (PST)
Date: Fri,  8 Jan 2021 11:09:45 -0800
In-Reply-To: <20210108190945.949196-1-wuhaotsh@google.com>
Message-Id: <20210108190945.949196-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210108190945.949196-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v5 6/6] hw/*: Use type casting for SysBusDevice in NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3Ka74XwgKCm4igTMafeTSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
2.29.2.729.g45daf8777d-goog


