Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DAD5E5DF4
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 10:52:44 +0200 (CEST)
Received: from localhost ([::1]:57990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obHwo-00063a-Dl
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 04:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHlv-00083B-QG
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:41:27 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:41633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1obHlr-0000PH-W8
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:41:27 -0400
Received: by mail-pl1-x633.google.com with SMTP id d11so723083pll.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4BjXTJQeqxBw/YQt7EauQLCNg+bbYoI2T6boosefcnI=;
 b=UpgjIeNU16Wbs0q+bkTg1aT+qDkbuYsvWh9BU+VwKKICtF7RdMU9G6+CXY8WD8mqbw
 Bsht5ntN6nWcgFfqGFlKflGAGSgzKbgOTWJayAmu/BC1tvCerolhf9gu/9E96YkecwgK
 jTqOVBS9yKhY1k1eFVwyUpBVE7SM/ZuvR2M6yGlpXmEE1Veem7cj+7kEbGUHCyJWfA4X
 ukwhO5qaU+dhdVUlFRdsTrYnVH1MwU6eVIwfbOt/zRNtSD6K4J0R5D+bOWYez+QcktOk
 qmR4esMiiNFrfz/Oy3RNSk9fDkC7SWn5JbND+bk2c/LMwiHI8uOEoG5AOLj5I77CWy43
 w6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4BjXTJQeqxBw/YQt7EauQLCNg+bbYoI2T6boosefcnI=;
 b=7wcDt8+b6OrepHcLBIa8nSsMlfcduIZBnxmzhni2QM5t71ngHfI6P/3ODAoRWDrk0V
 UnKFK9wB/Az8Da1yiK048C2NcsJlI75m2yjA7gBfYaQEttkByWj+j77pJnTl5ewHA9UK
 xbE8hK5ahm/HzIpMNez/c9v4zrT0mdtgTEmJL4j6iMAexY29PqTs49Ubsvou3eLGKOrD
 OyRihHfu1OVbjRuKWBHl1019aeXSK8/reZVrb9Su7NewsbLXoW6XJ/FRLd92JLzKsRdD
 XZa9FIc5iJJF24N2X68Lt1Em3ujNBCYwjzZtvJm/XXx6X8qIcNjxNmEj+nWQOxfUFfwF
 c7cA==
X-Gm-Message-State: ACrzQf12uCW/4VA5wz2R/egd9MVsf5FLIapOA+8A2s+EUj+1FCjoBFb1
 VWWQL7byqfj4r7xSjm/+FuYA6BRx9Utv2aGDBLDyELGtMGWkt1u7uNMQtDT9zuDfGtSIvwPIWwf
 JZduRdAC/t4rbTHxc4crHmCZL19mTsJ001cmNNxLl+v6sCPoX2TH5AupGd1AJs/Z2xFlI5uI=
X-Google-Smtp-Source: AMsMyM5w5Qvmbrt0RNr8aAsAnFMOCO/fD/kDkd77lRPmSHO8/X466dZLYU79dx/DFXiVvcN8gdNYeA==
X-Received: by 2002:a17:903:41c2:b0:178:5ddd:c75b with SMTP id
 u2-20020a17090341c200b001785dddc75bmr2388882ple.22.1663836081101; 
 Thu, 22 Sep 2022 01:41:21 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a1f8200b0020379616053sm3239202pja.57.2022.09.22.01.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:41:20 -0700 (PDT)
From: Tommy Wu <tommy.wu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 jim.shu@sifive.com, frank.chang@sifive.com, Tommy Wu <tommy.wu@sifive.com>
Subject: [PATCH 2/3] hw/riscv: sifive_e: Support the watchdog timer of HiFive
 1 rev b.
Date: Thu, 22 Sep 2022 01:41:06 -0700
Message-Id: <20220922084107.2834285-3-tommy.wu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220922084107.2834285-1-tommy.wu@sifive.com>
References: <20220922084107.2834285-1-tommy.wu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=tommy.wu@sifive.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create the AON device when we realize the sifive_e machine.
This patch only implemented the functionality of the watchdog timer,
not all the functionality of the AON device.

Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
---
 hw/riscv/Kconfig            | 1 +
 hw/riscv/sifive_e.c         | 5 +++--
 include/hw/riscv/sifive_e.h | 7 ++++---
 3 files changed, 8 insertions(+), 5 deletions(-)

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
index d65d2fd869..f9c05cfd3a 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -45,6 +45,7 @@
 #include "hw/intc/riscv_aclint.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/misc/sifive_e_prci.h"
+#include "hw/misc/sifive_e_aon.h"
 #include "chardev/char.h"
 #include "sysemu/sysemu.h"
 
@@ -222,8 +223,8 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
         RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
-    create_unimplemented_device("riscv.sifive.e.aon",
-        memmap[SIFIVE_E_DEV_AON].base, memmap[SIFIVE_E_DEV_AON].size);
+    sifive_e_aon_create(sys_mem, memmap[SIFIVE_E_DEV_AON].base,
+        qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_E_AON_WDT_IRQ));
     sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
 
     /* GPIO */
diff --git a/include/hw/riscv/sifive_e.h b/include/hw/riscv/sifive_e.h
index 83604da805..7de2221564 100644
--- a/include/hw/riscv/sifive_e.h
+++ b/include/hw/riscv/sifive_e.h
@@ -75,9 +75,10 @@ enum {
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


