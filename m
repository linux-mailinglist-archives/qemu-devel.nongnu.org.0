Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8262D836D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:31:09 +0100 (CET)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsoV-0003fa-Tf
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsaC-0002t2-3F
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:16:20 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZl-0005fr-41
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:16:19 -0500
Received: by mail-wm1-x343.google.com with SMTP id v14so8890446wml.1
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGfBJkjN2qAUyeuQd9Lf8jfyzTE2r7nAxi7Nqw5b6RE=;
 b=WfylVfh4yPpqykbIRNfGyk2UD6MPF7XL7Ojt9ngtD94CxRUAwMrF+g7Kux4K+t5OvT
 VGDmrdkHfrFFGbOlyLj3A6v6VIO8M0YuHVYwysFLvK9YzEzdSDPtIosqoZRXVfWaMMjK
 kE9OacKPIumFldxV3Dsqjvytkn9XIfzoXGnm49UY4uqj/EiqwZ7ubbGVkDFsUGKT/k2P
 znsFe5pd5XdSbtrx1hH3fSRYWXcgfGkkcShXhdAfusl4tixUi/P8VDg5bLSOcIgMebyM
 l2cctErE6+Y9xbnsxbp472no2YU0tFR0xSUR+PGmjJRTfmei4QqRkjUZtOJPh0wAl7nR
 QGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGfBJkjN2qAUyeuQd9Lf8jfyzTE2r7nAxi7Nqw5b6RE=;
 b=Gh4OSdejVPQ58G1sEFDWL3yDwbCiLS2JDcuxr7fw5vckQiJ+z7/TXzZp+zE1WOXugn
 zYEkLeAy+D9KafVEEES/FP5edg7id87AmNjMw04u63ENj+abZA9PGtv81pnDvz+56uW8
 0vpVBl2ZcgHksxgr+w0UankuwvpgmlUJYhjnJwrci0r8q6c8a6EgLthDf1vFdI/M4agN
 akcyKMS6PkbjKph4x+hoslCo49JPDNnx/mm5Pk7CAFr6xx9jh5HLmvvF1T8CmoOhFuoM
 wWqwlQIeLPiGXmtnEfGaJa2gT0r+aq6hfYpYr+r6RlpBR3UtZE1pvy8z+5AuFYHZBYok
 B/Wg==
X-Gm-Message-State: AOAM530vXqW7UcsPoGfEaiUqVLhcPIIXZh7LwGdGo+0gPRQC5EVacctn
 /yNcHN5LlGAJYnpeNb9qSl9TuIfHb48D/A==
X-Google-Smtp-Source: ABdhPJyAhXClQlyEZ+IL3yZ4pde6VHGqEMkgmgsHfQV/xuopOHh54mXAO6tNZ6MrqKyWkr2Ous7VVQ==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr15340565wmi.19.1607732149911; 
 Fri, 11 Dec 2020 16:15:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm16306001wmb.11.2020.12.11.16.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:15:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] hw/ppc: Remove unused ppcuic_init()
Date: Sat, 12 Dec 2020 00:15:37 +0000
Message-Id: <20201212001537.24520-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now we've converted all the callsites to directly create the QOM UIC
device themselves, the ppcuic_init() function is unused and can be
removed. The enum defining PPCUIC symbolic constants can be moved
to the ppc-uic.h header where it more naturally belongs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/ppc-uic.h |  7 +++++++
 include/hw/ppc/ppc4xx.h   |  9 ---------
 hw/ppc/ppc4xx_devs.c      | 38 --------------------------------------
 3 files changed, 7 insertions(+), 47 deletions(-)

diff --git a/include/hw/intc/ppc-uic.h b/include/hw/intc/ppc-uic.h
index e614e2ffd80..22dd5e5ac2c 100644
--- a/include/hw/intc/ppc-uic.h
+++ b/include/hw/intc/ppc-uic.h
@@ -47,6 +47,13 @@ OBJECT_DECLARE_SIMPLE_TYPE(PPCUIC, PPC_UIC)
 
 #define UIC_MAX_IRQ 32
 
+/* Symbolic constants for the sysbus IRQ outputs */
+enum {
+    PPCUIC_OUTPUT_INT = 0,
+    PPCUIC_OUTPUT_CINT = 1,
+    PPCUIC_OUTPUT_NB,
+};
+
 struct PPCUIC {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
index cc19c8da5be..980f964b5a9 100644
--- a/include/hw/ppc/ppc4xx.h
+++ b/include/hw/ppc/ppc4xx.h
@@ -33,15 +33,6 @@ PowerPCCPU *ppc4xx_init(const char *cpu_model,
                         clk_setup_t *cpu_clk, clk_setup_t *tb_clk,
                         uint32_t sysclk);
 
-/* PowerPC 4xx universal interrupt controller */
-enum {
-    PPCUIC_OUTPUT_INT = 0,
-    PPCUIC_OUTPUT_CINT = 1,
-    PPCUIC_OUTPUT_NB,
-};
-qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
-                       uint32_t dcr_base, int has_ssr, int has_vr);
-
 void ppc4xx_sdram_banks(MemoryRegion *ram, int nr_banks,
                         MemoryRegion ram_memories[],
                         hwaddr ram_bases[], hwaddr ram_sizes[],
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index ffe4cf43e88..fe9d4f7155e 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -77,44 +77,6 @@ PowerPCCPU *ppc4xx_init(const char *cpu_type,
     return cpu;
 }
 
-/*****************************************************************************/
-/* "Universal" Interrupt controller */
-
-qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
-                       uint32_t dcr_base, int has_ssr, int has_vr)
-{
-    DeviceState *uicdev = qdev_new(TYPE_PPC_UIC);
-    SysBusDevice *uicsbd = SYS_BUS_DEVICE(uicdev);
-    qemu_irq *uic_irqs;
-    int i;
-
-    qdev_prop_set_uint32(uicdev, "dcr-base", dcr_base);
-    qdev_prop_set_bit(uicdev, "use-vectors", has_vr);
-    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(env_cpu(env)),
-                             &error_fatal);
-    sysbus_realize_and_unref(uicsbd, &error_fatal);
-
-    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT, irqs[PPCUIC_OUTPUT_INT]);
-    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT, irqs[PPCUIC_OUTPUT_CINT]);
-
-    /*
-     * Return an allocated array of the UIC's input IRQ lines.
-     * This is an ugly temporary API to retain compatibility with
-     * the ppcuic_init() interface from the pre-QOM-conversion UIC.
-     * None of the callers free this array, so it is leaked -- but
-     * so was the array allocated by qemu_allocate_irqs() in the
-     * old code.
-     *
-     * The callers should just instantiate the UIC and wire it up
-     * themselves rather than passing qemu_irq* in and out of this function.
-     */
-    uic_irqs = g_new0(qemu_irq, UIC_MAX_IRQ);
-    for (i = 0; i < UIC_MAX_IRQ; i++) {
-        uic_irqs[i] = qdev_get_gpio_in(uicdev, i);
-    }
-    return uic_irqs;
-}
-
 /*****************************************************************************/
 /* SDRAM controller */
 typedef struct ppc4xx_sdram_t ppc4xx_sdram_t;
-- 
2.20.1


