Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C957819FC5B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 20:01:57 +0200 (CEST)
Received: from localhost ([::1]:36132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLW4K-0000Xz-Qw
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 14:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36153)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVr3-0001yN-41
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqu-00023J-98
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqu-0001x3-2H; Mon, 06 Apr 2020 13:48:04 -0400
Received: by mail-wr1-x42d.google.com with SMTP id s8so485999wrt.7;
 Mon, 06 Apr 2020 10:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACqwWM6q3w6eeeLf6eS/r0Fpb4qEkaBMb1O9yAVXZQo=;
 b=YnlBvtszUzDdb+icZKReBOOOFv0y6kc3QKAP+hS9DENTtSQ52gd5dGpP83znPnHzcA
 uV6RdSFmkila64rigN1j+TaMTrTjwErg9MX7TL2DhlnXV0tB8V/GXKMABWy0yQTJ6UIT
 pFMj2U1J7EsZXj5pwii6wtZab5Xd5LeWhU8BuyXH+rtBimXkg4wci7ZpXn83xwyVSTqa
 wmjBFsgXTjlrPsGl36usaWNEQ/CmFdWf/wH9ctIB4T+g6qBkmi+5WqS6rAqYO0lROSci
 4i8rrGmZar8XKfhxF2J5pq91RELY3N9yEpsGZdEpYv1Hkb/v47LKRp2UeHIIw/qxYZwY
 j2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ACqwWM6q3w6eeeLf6eS/r0Fpb4qEkaBMb1O9yAVXZQo=;
 b=mlIdxf819pS+HLG60OApjJWtvpHvIXw2H6mqCstqZoZpTN08Js5WrVYLT8pEYVSfNW
 V9+layNmeKLJzTX3mLlPbAE1Rxc/b+daomCuDfWN3gkyedU4lOi9QUu4T0vw4tqrBo5B
 Wjk7/g5+XoJFTRaLjXYtqrN+sA3NhUmwQKhz+6YRSOSAIwj9eePC1u6UOwLd8sVxojX7
 4NrbZuzEE9FIojCoQBkdLwC9mmIGYowVVqik9zHYwZgMnJpdlqqI2q8eni6MlSintzU7
 kfbAlyUN+fpl/CnWH/rVUio2+kJCCm52YghBnmrB4VVOqbW0qJCWnjYDm1W3ydTmG0UK
 7v/w==
X-Gm-Message-State: AGi0PubA+IQoIIq6MDemv9tqhjJRsnFkrOIdIC9qczk0aVTU0BC1+ZCN
 lSn4pEkZAkWcjfcBHPZtpQh3CMLCuro=
X-Google-Smtp-Source: APiQypI5qPfu9zlCCsgYeOd9oXnxsUMaKFlVxqollrYI+h70XiJmpExNDb7HscE6xSvZoEe+sSm4Iw==
X-Received: by 2002:a5d:4649:: with SMTP id j9mr371222wrs.71.1586195282744;
 Mon, 06 Apr 2020 10:48:02 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 12/54] hw/arm/stm32f205_soc: Store MemoryRegion in
 STM32F205State
Date: Mon,  6 Apr 2020 19:47:01 +0200
Message-Id: <20200406174743.16956-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/stm32f205_soc.c
  >>> possible moves from stm32f205_soc_initfn() to stm32f205_soc_realize() in ./hw/arm/stm32f205_soc.c:83

While reviewing we notice storing the MemoryRegion in the device
state, we'll be able to later automatically simplify the error
propagation calls.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/stm32f205_soc.h |  4 ++++
 hw/arm/stm32f205_soc.c         | 18 +++++++-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 922a733f88..63e7e7c825 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -56,6 +56,10 @@ typedef struct STM32F205State {
 
     ARMv7MState armv7m;
 
+    MemoryRegion sram;
+    MemoryRegion flash;
+    MemoryRegion flash_alias;
+
     STM32F2XXSyscfgState syscfg;
     STM32F2XXUsartState usart[STM_NUM_USARTS];
     STM32F2XXTimerState timer[STM_NUM_TIMERS];
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 118c342559..42f4e44134 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -87,23 +87,19 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     SysBusDevice *busdev;
     Error *err = NULL;
     int i;
-
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *flash = g_new(MemoryRegion, 1);
-    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
 
-    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
+    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
                            FLASH_SIZE, &error_fatal);
-    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
-                             "STM32F205.flash.alias", flash, 0, FLASH_SIZE);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "STM32F205.flash.alias", &s->flash, 0, FLASH_SIZE);
 
-    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
-    memory_region_add_subregion(system_memory, 0, flash_alias);
+    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
+    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
 
-    memory_region_init_ram(sram, NULL, "STM32F205.sram", SRAM_SIZE,
+    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
                            &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
-- 
2.21.1


