Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8D2FF45B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:28:22 +0100 (CET)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fcz-0005E1-02
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:28:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIN-0002Oy-FV
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:03 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0005od-2Q
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:03 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m2so2404787wmm.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8qYEJ7vFQTOhZhRO/AtRAFtnFxVNIz2T8FPyZBXE8CU=;
 b=rq2x7PKzCDz83IUDc0edd0kgJTuBpexH0TnVe/OCkjZzPAqY9WrnD4/IuGCGFuVXJE
 Xj7ei0j7aPYJMKijAp9pldq0MvQvokHMWI8GrdgDFXMV+cQCF1bKtMu98QSJ/VrFB0PY
 vnXJBbUHWXpJyryN0xv1Ej896E75b+uR7ZDTov3ZiquH7+ShKwC17jb/+QwG8nrzyALS
 RqtaMlHhx3ka6UieK7Kz27HiTM4zQwA6WL6CzkPoW75K54OBk/QoYAGNz7STL04ux3vi
 blTglX95MhCZGeGQUHs8KSVR1SW+KDK8rWMb58MxpYHe5C8xNy31cAFIbvx4x0MR86Eb
 26ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8qYEJ7vFQTOhZhRO/AtRAFtnFxVNIz2T8FPyZBXE8CU=;
 b=PplaooVjK69DE2orvsZTUGGzuZKpWHRkfAhUJnThDkwTJltDG4BgLWTjOttLGd3XOf
 l0Wld2NVrgI8fkwByKJh1FEDGmOkZdmziXbi8I3IaEWXtpQYxPEy2UOtEDe/0dfkmWIF
 wlsxeRA8zC8NTt7SCu6KQ/VMMQQ4r7vbf64voINqtvoe8aL17m2IAXbKtjFcij8HmCTy
 0nwry3tmziGcMH6+uCnKFCB2PaWTfG8OEJQmkBPClI4LiPGXlY1cru/GEY0DYpPI+5B0
 3iwZsHnBI5i38UKf1PvW6RYRyVFz0CNavR2fpxHoW0RHD/atLn+vdxOWd+vQduwOfbW2
 RDNw==
X-Gm-Message-State: AOAM530BIckRIe7vds/OC7KK6jGKqX7FT4CPnQtvFJ2tNqOwwVlIBBkX
 q6BbOTZlI4tuiQpi8ORapnj6gQ==
X-Google-Smtp-Source: ABdhPJxktaBdtjDFDggb1DzlFO7Vfvdpq8WjaqpWcFuwTqh5r+Guj1sOi9hGmBbOX/6XjiEfUreK4Q==
X-Received: by 2002:a1c:e902:: with SMTP id q2mr690920wmc.143.1611255995115;
 Thu, 21 Jan 2021 11:06:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 10/25] hw/arm/armsse: Rename "MAINCLK" property to
 "MAINCLK_FRQ"
Date: Thu, 21 Jan 2021 19:06:07 +0000
Message-Id: <20210121190622.22000-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we transition the ARMSSE code from integer properties
specifying clock frequencies to Clock objects, we want to have the
device provide both at once.  We want the final name of the main
input Clock to be "MAINCLK", following the hardware name.
Unfortunately creating an input Clock with a name X creates an
under-the-hood QOM property X; for "MAINCLK" this clashes with the
existing UINT32 property of that name.

Rename the UINT32 property to MAINCLK_FRQ so it can coexist with the
MAINCLK Clock; once the transition is complete MAINCLK_FRQ will be
deleted.

Commit created with:
 perl -p -i -e 's/MAINCLK/MAINCLK_FRQ/g' hw/arm/{armsse,mps2-tz,musca}.c include/hw/arm/armsse.h

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 2 +-
 hw/arm/armsse.c         | 6 +++---
 hw/arm/mps2-tz.c        | 2 +-
 hw/arm/musca.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 83f5e28c16e..4860a793f4b 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -39,7 +39,7 @@
  * QEMU interface:
  *  + QOM property "memory" is a MemoryRegion containing the devices provided
  *    by the board model.
- *  + QOM property "MAINCLK" is the frequency of the main system clock
+ *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
  *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts.
  *    (In hardware, the SSE-200 permits the number of expansion interrupts
  *    for the two CPUs to be configured separately, but we restrict it to
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index baac027659d..d2ba0459c44 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -47,7 +47,7 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
+    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
@@ -59,7 +59,7 @@ static Property armsse_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK", ARMSSE, mainclk_frq, 0),
+    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
@@ -448,7 +448,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     }
 
     if (!s->mainclk_frq) {
-        error_setg(errp, "MAINCLK property was not set");
+        error_setg(errp, "MAINCLK_FRQ property was not set");
         return;
     }
 
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 3707876d6d4..6a9eed9022a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -402,7 +402,7 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
-    qdev_prop_set_uint32(iotkitdev, "MAINCLK", SYSCLK_FRQ);
+    qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
 
     /*
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index b50157f63a6..d82bef11cf2 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -375,7 +375,7 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
     qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
-    qdev_prop_set_uint32(ssedev, "MAINCLK", SYSCLK_FRQ);
+    qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
     /*
      * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
      * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
-- 
2.20.1


