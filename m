Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C722D835C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 01:21:45 +0100 (CET)
Received: from localhost ([::1]:45966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knsfQ-0005aG-9O
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 19:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZe-0002ZN-Bl
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:15:46 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knsZb-0005cl-IA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 19:15:46 -0500
Received: by mail-wr1-x441.google.com with SMTP id t16so10686683wra.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 16:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otGyI9nN7HYyHPl1jamkl/dEV8++zNkKNYJN5ml5WUc=;
 b=gtfpk4xp3kE049J6nTjEo2fKokcEwjkVZyQJsXocYL+xbHpU59nmru0HePMcS/+jLv
 Z8yrzQ6zvr8ytBQ9LI45PP/twfO8U8BN36zmVelGWjcQLX4KzkNtP83JBMkR7HIK1sMi
 WZHlflH5p78mb2zDC9BSTG5dso3YgjNuKXTJpYyRgeV579I2T4rRroHf5RIfQ2QU8i2M
 zFemYkMg0L4rmnGXyA29pXJFb8xLILBpu/oFMdl8BEihItWL+nfyQkpXJwatmh3+Gwd5
 KKkWNa2MUXV6s6nFzExbQyCAf0yNgDAdJiDZu8uR7mnUa/DnD9cp/TSUPadNcuyiIY27
 dE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otGyI9nN7HYyHPl1jamkl/dEV8++zNkKNYJN5ml5WUc=;
 b=BLSCUi9mNTO7EKAhZl54klskZAWzyxzwt1Jp+BnLG3DcxXvSuaQq6k743JM8/MaFUq
 yNp1njsXmzJwPpdKiK706pVaxse3JGQk0p+Z6MJWrpev2IfD3Te0tm87LFjJ9PVOb5q+
 KUaXNaMa4zU0XKJBNwwTl4bVjL7Tc8Jcg7WmGSUwZlelZ+nnSJPmxevUlXLRaswWESdU
 Yo00HsccQ4VN+y6YXHOH1b7tOnMlqb/01tPgC92tUrSBQMM21lK1W0I6sjoYKOTQ9aYS
 qG+jS/co6k0wvmmJNjxY7JIELbamKcnrMkVyMh0mc1rIyaS3MWxcgFmz0VxffJt7RjTv
 NqMg==
X-Gm-Message-State: AOAM533Bwr22TIH4Q8BkYK7/qgZhcQk83dLEO4bY9HstkxhYuwCSEl1t
 o6LSyf9mA+0+D9XnWkkJ6P2dktkQI8ithQ==
X-Google-Smtp-Source: ABdhPJzFN/r2eYROOAEVr30/k1Pru23Cb6PYpxwq4FL8YPjtCxUdFKP0DtGPRbTFu+Po4yxS0Fz5SQ==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr16028694wrj.79.1607732141592; 
 Fri, 11 Dec 2020 16:15:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm16306001wmb.11.2020.12.11.16.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 16:15:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] hw/ppc/ppc4xx_devs: Make code style fixes to UIC code
Date: Sat, 12 Dec 2020 00:15:30 +0000
Message-Id: <20201212001537.24520-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201212001537.24520-1-peter.maydell@linaro.org>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

In a following commit we will move the PPC UIC implementation to
its own file in hw/intc. To prevent checkpatch complaining about that
code-motion, fix up the minor style issues first.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/ppc4xx_devs.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f1651e04d9a..f2f9ca4ffec 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -105,7 +105,7 @@ struct ppcuic_t {
     qemu_irq *irqs;
 };
 
-static void ppcuic_trigger_irq (ppcuic_t *uic)
+static void ppcuic_trigger_irq(ppcuic_t *uic)
 {
     uint32_t ir, cr;
     int start, end, inc, i;
@@ -156,26 +156,28 @@ static void ppcuic_trigger_irq (ppcuic_t *uic)
     }
 }
 
-static void ppcuic_set_irq (void *opaque, int irq_num, int level)
+static void ppcuic_set_irq(void *opaque, int irq_num, int level)
 {
     ppcuic_t *uic;
     uint32_t mask, sr;
 
     uic = opaque;
-    mask = 1U << (31-irq_num);
+    mask = 1U << (31 - irq_num);
     LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
                 " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
                 __func__, irq_num, level,
                 uic->uicsr, mask, uic->uicsr & mask, level << irq_num);
-    if (irq_num < 0 || irq_num > 31)
+    if (irq_num < 0 || irq_num > 31) {
         return;
+    }
     sr = uic->uicsr;
 
     /* Update status register */
     if (uic->uictr & mask) {
         /* Edge sensitive interrupt */
-        if (level == 1)
+        if (level == 1) {
             uic->uicsr |= mask;
+        }
     } else {
         /* Level sensitive interrupt */
         if (level == 1) {
@@ -188,11 +190,12 @@ static void ppcuic_set_irq (void *opaque, int irq_num, int level)
     }
     LOG_UIC("%s: irq %d level %d sr %" PRIx32 " => "
                 "%08" PRIx32 "\n", __func__, irq_num, level, uic->uicsr, sr);
-    if (sr != uic->uicsr)
+    if (sr != uic->uicsr) {
         ppcuic_trigger_irq(uic);
+    }
 }
 
-static uint32_t dcr_read_uic (void *opaque, int dcrn)
+static uint32_t dcr_read_uic(void *opaque, int dcrn)
 {
     ppcuic_t *uic;
     uint32_t ret;
@@ -220,13 +223,15 @@ static uint32_t dcr_read_uic (void *opaque, int dcrn)
         ret = uic->uicsr & uic->uicer;
         break;
     case DCR_UICVR:
-        if (!uic->use_vectors)
+        if (!uic->use_vectors) {
             goto no_read;
+        }
         ret = uic->uicvr;
         break;
     case DCR_UICVCR:
-        if (!uic->use_vectors)
+        if (!uic->use_vectors) {
             goto no_read;
+        }
         ret = uic->uicvcr;
         break;
     default:
@@ -238,7 +243,7 @@ static uint32_t dcr_read_uic (void *opaque, int dcrn)
     return ret;
 }
 
-static void dcr_write_uic (void *opaque, int dcrn, uint32_t val)
+static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
 {
     ppcuic_t *uic;
 
-- 
2.20.1


