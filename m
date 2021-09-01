Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E13FD85F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:03:44 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLO1v-0002ms-T4
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcR-0007Ai-UK
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcM-0005sn-O6
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:22 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso4372898wmc.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7K40W+n2BmNQl8Ueq80FHzUsouD+Q77Hv2+ZcA1BX38=;
 b=ID0oCYKIma52uVgmslopmEhKlJi7MG8z1KkEzzjRMef8BMMwceqmGL7CZ2KUWdWm4G
 bH7GJq2Xo8z9yUMeNqvZcHWKukp68M9gXrkKUs9HJVzxtLEvlc3vlOxABcHcDxwXKozU
 2BgQdSf6zFbCZBFhP6I4Msjq87lbGn4tnJECMKdB61JsfPldvfCTQiNJDmhcfprLidGB
 NJT9c8WxXnSmqNypAhbPcoORXyB4yHREVJMXEOnBzwV0vH9pjtFyS/ryrmZFhkOCAtzw
 iEPmRpj9OxpbX2fo8jYBVFqh+Pn2GQ2wYPCfBG3S2lj2NG14qDFs8mckc6gugWSzH4bE
 +xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7K40W+n2BmNQl8Ueq80FHzUsouD+Q77Hv2+ZcA1BX38=;
 b=pPQVhuufB4B5bOlzAqTdJej8E7QwW+FNoXSKeE96YpAbFmC5g2UCdOv5Fn3usbDlIx
 uGqj3FVle52iLwIDBw5tiQTSjA94uTpr3vxL3zmNp9yS1SGqW4VnmEh8a/NhW2c17Bb/
 mj1S8riZVCLv5uBZDvnXkK5ZJZ/M/4Ug5BOD0hxdxzIRcPkpTcUj0ynA+jYUzxFh2YQJ
 GVFY4/hXY8yu8pX3nGKXtub1qLj6Ck4RO7PVxOMrzLcz0pHm+bFKCRjnw0p4+e9+RWkx
 1ql8/9oPIXkGppGgZxlqM3HAV+2e5/uNEgiUY9khk2sszdkoAe6WSEH7pZXadVIfi8Nf
 T/cg==
X-Gm-Message-State: AOAM530nboBe+HD7DBK1X3fUc3lOl4aYI3BV5fQjUlEJTpmZuWOZe0S3
 KAlw3B7V/6OJAN/m5TbgA8ePAOY0aayPPg==
X-Google-Smtp-Source: ABdhPJwIxt3Z6L9csgX5hm8wIeqMgQw0+HW2A5aLrhDUPA0t2EdPtHS6Hmzka0mSosBZHTKiINbm5A==
X-Received: by 2002:a1c:3b05:: with SMTP id i5mr8963348wma.136.1630492636774; 
 Wed, 01 Sep 2021 03:37:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/51] hw/timer/armv7m_systick: Add input clocks
Date: Wed,  1 Sep 2021 11:36:33 +0100
Message-Id: <20210901103653.13435-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The v7M systick timer can be programmed to run from either of
two clocks:
 * an "external reference clock" (when SYST_CSR.CLKSOURCE == 0)
 * the main CPU clock (when SYST_CSR.CLKSOURCE == 1)

Our implementation currently hardwires the external reference clock
to be 1MHz, and allows boards to set the main CPU clock frequency via
the global 'system_clock_scale'.  (Most boards set that to a constant
value; the Stellaris boards allow the guest to reprogram it via the
board-specific RCC registers).

As the first step in converting this to use the Clock infrastructure,
add input clocks to the systick device for the reference clock and
the CPU clock.  The device implementation ignores them; once we have
made all the users of the device correctly wire up the new Clocks we
will switch the implementation to use them and ignore the old
system_clock_scale.

This is a migration compat break for all M-profile boards, because of
the addition of the new clock objects to the vmstate struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-6-peter.maydell@linaro.org
---
 include/hw/timer/armv7m_systick.h |  7 +++++++
 hw/timer/armv7m_systick.c         | 10 ++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 685fc5bc0d7..38adf8d274e 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -15,6 +15,7 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 
 #define TYPE_SYSTICK "armv7m_systick"
 
@@ -25,6 +26,10 @@ OBJECT_DECLARE_SIMPLE_TYPE(SysTickState, SYSTICK)
  *  + sysbus MMIO region 0 is the register interface (covering
  *    the registers which are mapped at address 0xE000E010)
  *  + sysbus IRQ 0 is the interrupt line to the NVIC
+ *  + Clock input "refclk" is the external reference clock
+ *    (used when SYST_CSR.CLKSOURCE == 0)
+ *  + Clock input "cpuclk" is the main CPU clock
+ *    (used when SYST_CSR.CLKSOURCE == 1)
  */
 
 struct SysTickState {
@@ -38,6 +43,8 @@ struct SysTickState {
     ptimer_state *ptimer;
     MemoryRegion iomem;
     qemu_irq irq;
+    Clock *refclk;
+    Clock *cpuclk;
 };
 
 /*
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 2f192011eb0..e43f74114e8 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -14,6 +14,7 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -201,6 +202,9 @@ static void systick_instance_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick", 0xe0);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+
+    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
+    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
 }
 
 static void systick_realize(DeviceState *dev, Error **errp)
@@ -215,9 +219,11 @@ static void systick_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_systick = {
     .name = "armv7m_systick",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(refclk, SysTickState),
+        VMSTATE_CLOCK(cpuclk, SysTickState),
         VMSTATE_UINT32(control, SysTickState),
         VMSTATE_INT64(tick, SysTickState),
         VMSTATE_PTIMER(ptimer, SysTickState),
-- 
2.20.1


