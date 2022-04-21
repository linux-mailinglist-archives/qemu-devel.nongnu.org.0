Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A2509E8A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:28:17 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUyu-0005rK-Ig
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpw-0002yw-Oj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpu-0003TW-Pn
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c10so6234667wrb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HtN0kqqvwwTdtiQPjMVdnwH1taYT1AjPI2wX6s5u1Aw=;
 b=Y1iQmWtM7G8bJJgbrlt0ara2NGUC3+0X2km8FlPbtXYGEI1mwHVM/4Rdhi5MZyC2aX
 9y/P2gFNxyi165kQ1wLEXJvbVvIll3yOoiOyMuOTWceZj1IkDYsc8FRVuNKUDh1ddmTu
 ZEZGPv+EyUFFZNYxyqdanmo0FEVfqvq/dv5yI8XkPZ+HnNAxLyi9Vpf/eK9b/E98D3qv
 N5Z0ib1TZ+be91ypB2JmZ+rslI5UTRyN11OXsTWoRUhZMS2E7+J/U0xk7bfBxe2mKx6Z
 WqYlT1VLCoy7mPvKydfGxKfLx5iTjcMCyouJodbZE1/KDn8eMNqv5AF4r7HbjupR9mCt
 Oz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtN0kqqvwwTdtiQPjMVdnwH1taYT1AjPI2wX6s5u1Aw=;
 b=pY+T235nK+yMhoXwNfas4k303ebaerh5UaBpZTiD+nYMr+0lcZcCDy/hAktmPoULmA
 ykyBuiwgo4rR0zfyMPuFxKpSzoFX7yFw3dPVHpjclOANHrbCKdS4SqZF8KJeog97OGpE
 9zDF0P2AVXflFNR/wyl/YkFqUTjQ3S0Ij/ABMEoTy6na5hqtW181P5MwPCrm6gxT8vxY
 t4/v7hTWMUsWiu+7R2wbOMn3OAjhYyw82y3k9eBbqoTybkxCXy3dQ0uxkj0pTDaqhIlv
 iTYAYipVqDeUv9Nlbut3WWnuloirWWIlPUOvggC/8GbyEdEnk6IbNRdC7C0y7eNnngXj
 1A2g==
X-Gm-Message-State: AOAM531uQ+yqPq5WOQA9bKu3BuyBjUWepZ0OA8rQeogUFyC6HO/UGrDo
 df3Hdrh9D2c1YaRvxmNR5unlon3iDFiAzQ==
X-Google-Smtp-Source: ABdhPJzDfCVURl65P8HWAKl3+tyCZmZs3vGtb05vx2c8SvVHP1SWkabwPr+5zQ38kGqyJW0Go2eAsA==
X-Received: by 2002:a05:6000:71c:b0:207:a807:e297 with SMTP id
 bs28-20020a056000071c00b00207a807e297mr18676051wrb.596.1650539937459; 
 Thu, 21 Apr 2022 04:18:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/31] hw/arm/exynos4210: Put a9mpcore device into state struct
Date: Thu, 21 Apr 2022 12:18:25 +0100
Message-Id: <20220421111846.2011565-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The exynos4210 SoC mostly creates its child devices as if it were
board code.  This includes the a9mpcore object.  Switch that to a
new-style "embedded in the state struct" creation, because in the
next commit we're going to want to refer to the object again further
down in the exynos4210_realize() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-4-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h |  2 ++
 hw/arm/exynos4210.c         | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 3999034053e..215c039b414 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -26,6 +26,7 @@
 
 #include "hw/or-irq.h"
 #include "hw/sysbus.h"
+#include "hw/cpu/a9mpcore.h"
 #include "target/arm/cpu-qom.h"
 #include "qom/object.h"
 
@@ -103,6 +104,7 @@ struct Exynos4210State {
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
     qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
+    A9MPPrivState a9mpcore;
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index dfc0a4eec25..ef4d646eb91 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -244,17 +244,16 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     }
 
     /* Private memory region and Internal GIC */
-    dev = qdev_new(TYPE_A9MPCORE_PRIV);
-    qdev_prop_set_uint32(dev, "num-cpu", EXYNOS4210_NCPUS);
-    busdev = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(busdev, &error_fatal);
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-cpu", EXYNOS4210_NCPUS);
+    busdev = SYS_BUS_DEVICE(&s->a9mpcore);
+    sysbus_realize(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
     }
     for (n = 0; n < EXYNOS4210_INT_GIC_NIRQ; n++) {
-        s->irqs.int_gic_irq[n] = qdev_get_gpio_in(dev, n);
+        s->irqs.int_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
     }
 
     /* Cache controller */
@@ -489,6 +488,8 @@ static void exynos4210_init(Object *obj)
         g_autofree char *name = g_strdup_printf("cpu-irq-orgate%d", i);
         object_initialize_child(obj, name, &s->cpu_irq_orgate[i], TYPE_OR_IRQ);
     }
+
+    object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
-- 
2.25.1


