Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA49614368
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 03:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ophJO-0002Gh-EE; Mon, 31 Oct 2022 22:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJD-0002F1-MP
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:47:29 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1ophJB-0004Dq-Hk
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:47:22 -0400
Received: by mail-oi1-x232.google.com with SMTP id c129so2892446oia.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 19:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zYqMYuafMjaUotlufhtCIW3HJ2L3kxSptx+Y2MFaREk=;
 b=E9FiDLiJncelb152++R4wrfXwBz3W6U/vtLY/YyckY+2NKNkmcksxl9Y2I8CSVvYnP
 3wpzqwrqOcGDqhVriKzmAcP4XLDabrZlhLVWWcFus/co5xVUucNEVelI8FoAUrniNvLb
 VdTbWm9oKjDWYoBRSrUx9AyzFXpagJj6CdgngWVBQxgbsSfffiZ0ndkZp5jr3FhhkBHT
 rwk6+dg7aI9t7t92gHutLlJjHkCjAfWHSAxju4L98JgQPGdpY0M1dSP6hwWoICeOlsVz
 IShAYDUr2EVe/CBGyQjvasbrZpqYiawFTqlwQRpwqpYqYITzenV8+yoCMIyf9MarWnac
 v8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYqMYuafMjaUotlufhtCIW3HJ2L3kxSptx+Y2MFaREk=;
 b=bVCVHsmflr4xXtbqrMO8hjrT5oTP1YNjWOKi89kQGpK14Azp0/sxT6MiffQdcADR56
 /wAu/4sFt9tgggN+Le3JZR1yneMP6gpJzL7p3QDoWAri3AxsT+5HGP033CzP8BMOwLLc
 va94vRRd/YMMniptqfIeiq6XVUubwc+XN5bljX2jwuRRBaZaUELcTp7SyZpWrenqlDLC
 wSMJx3QbXyD0Is/HS4DwRGYoBAo0Yamn+WP/l05M9JCgs13LLRjLivAnyWa4OZn3KGsS
 ly3fQCqAcnEpbrxR4Q8aDmYdfO9EhfnmOglCVXm2j4u9aaL+E3yGotphyUsmPHUl0+3X
 asaA==
X-Gm-Message-State: ACrzQf3CzeC7CZCSx4NQ6qSvawGLdOoKFlAbUHnk6/FlRXHvGHTGTBcb
 jUgTqsLmxoLw4ycwCMrgayv5khGxt0A2d9szlDfpeLtbZwU5rj2FnDDe6W4lxvBJreD6qVOTyFB
 SwFehr0G4wTZVTNDDSQc/v5yCy165e+TXGUsdNsngmqnqbcOtKEC5SJjNUN9Lh44YrOyD8T8=
X-Google-Smtp-Source: AMsMyM6olggA1LHUblSC22kcEph67zxtn4o0DY8J8ORVhh2LC+JZJgk0+hIS/yjYgxNv9TUp7tr1Kg==
X-Received: by 2002:a05:6808:656:b0:35a:167a:48e3 with SMTP id
 z22-20020a056808065600b0035a167a48e3mr2901307oih.237.1667270838632; 
 Mon, 31 Oct 2022 19:47:18 -0700 (PDT)
Received: from sw05.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05683001c400b00661a33883b8sm3367215ota.71.2022.10.31.19.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 19:47:18 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH v2 2/3] hw/riscv: sifive_e: Support the watchdog timer of
 HiFive 1 rev b.
Date: Mon, 31 Oct 2022 19:46:55 -0700
Message-Id: <20221101024656.517608-3-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221101024656.517608-1-tommy.wu@sifive.com>
References: <20221101024656.517608-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=tommy.wu@sifive.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Create the AON device when we realize the sifive_e machine.
This patch only implemented the functionality of the watchdog timer,
not all the functionality of the AON device.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 hw/riscv/Kconfig            |  1 +
 hw/riscv/sifive_e.c         | 13 +++++++++++--
 include/hw/riscv/sifive_e.h |  8 +++++---
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 79ff61c464..50890b1b75 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -59,6 +59,7 @@ config SIFIVE_E
     select SIFIVE_PLIC
     select SIFIVE_UART
     select SIFIVE_E_PRCI
+    select SIFIVE_E_AON
     select UNIMP
 
 config SIFIVE_U
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index d65d2fd869..c866ffe232 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -45,6 +45,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
+#include "hw/misc/sifive_e_aon.h"
 #include "chardev/char.h"
 #include "sysemu/sysemu.h"
 
@@ -222,8 +223,13 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
         RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
-    create_unimplemented_device("riscv.sifive.e.aon",
-        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
+
+    s->aon = qdev_new(TYPE_SIFIVE_E_AON);
+    if (!sysbus_realize(SYS_BUS_DEVICE(s->aon), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(s->aon), 0, memmap[SIFIVE_E_DEV_AON].base);
+
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
 
     /* GPIO */
@@ -244,6 +250,9 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
                            qdev_get_gpio_in(DEVICE(s->plic),
                                             SIFIVE_E_GPIO0_IRQ0 + i));
     }
+    sysbus_connect_irq(SYS_BUS_DEVICE(s->aon), 0,
+                       qdev_get_gpio_in(DEVICE(s->plic),
+                                        SIFIVE_E_AON_WDT_IRQ));
 
     sifive_uart_create(sys_mem, memmap[SIFIVE_E_DEV_UART0].base,
         serial_hd(0), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_UART0_IRQ));
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index d738745925..e2de1564a7 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -35,6 +35,7 @@ typedef struct SiFiveESoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     DeviceState *plic;
+    DeviceState *aon;
     SIFIVEGPIOState gpio;
     MemoryRegion xip_mem;
     MemoryRegion mask_rom;
@@ -76,9 +77,10 @@ enum {
 };
 
 enum {
-    SIFIVE_E_UART0_IRQ  = 3,
-    SIFIVE_E_UART1_IRQ  = 4,
-    SIFIVE_E_GPIO0_IRQ0 = 8
+    SIFIVE_E_AON_WDT_IRQ  = 1,
+    SIFIVE_E_UART0_IRQ    = 3,
+    SIFIVE_E_UART1_IRQ    = 4,
+    SIFIVE_E_GPIO0_IRQ0   = 8
 };
 
 #define SIFIVE_E_PLIC_HART_CONFIG "M"
-- 
2.27.0


