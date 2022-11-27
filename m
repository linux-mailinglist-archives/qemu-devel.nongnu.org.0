Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C463639BD7
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 17:59:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozKyl-0001cZ-0e; Sun, 27 Nov 2022 11:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ozKyj-0001c9-EE
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 11:58:05 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1ozKyh-0005S8-U2
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 11:58:05 -0500
Received: by mail-pf1-x42b.google.com with SMTP id z17so3570392pff.1
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XfWDHTk3XwoykaRU+Dc6Rx9rSDSa9025s87SOt5k+y0=;
 b=NtUaPkJph+Ds35jO1R3/IYhCtkowba6Cb1CPUDe0vz0uE0F5CqJ3LLDxKvszJdiMLz
 7N1eWbNiEHyQra48M+zR5fMY4b0cbBkSKMQrIO6fIanQAvMVJHrjC+M/V3QvJEqfZe6u
 6Rrk44L+gysFmtpnSkgZ3UVAqM6xPSM6HjVfLAY14G3hRD6rRQuOMb8uTTiWwlcKP5qJ
 Le/IQ2I2a/J9UK2FC/eT4SmuRl9DH5jDagZHJyobhC2e4Vp7lmuwlC07SuuapwyllNmk
 mYtN2N5/vfc1y6fMF0sChw4PfAwTWZSuVPF+g0VqKScIGOZnyuyqI8Tpr1FGMnzq7H63
 Fwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XfWDHTk3XwoykaRU+Dc6Rx9rSDSa9025s87SOt5k+y0=;
 b=JX5rPrJwS9tg+NavVJPyI+Mc3xYAKwZFEti1cR6ZrPWMxZnlzS6KqYfDjI2ujbdJGK
 GDWX6Nv2gpiqlwedfO3ZBysIyfRmJbbz1Mu42mHkZddC3e24pZGvEG+tL7bNt9i3xYCW
 GpI5uDZL7xOZk2NCGfiDmWisvDiO7lT5nYm2opsHrlkNom1LIobgLuxosRlVr8FJmxrU
 p4GBk3KUwXrT47/QPAalKKQqYBhVmSDm2QBCQe0822mavQVJ1FxL46D+0nfqtnMmFxN2
 xlSf+WNx8/fnEZVttA8vLtEbs49iaBJVGDMKmAxFb8n69/Zdk85p2C+megf117qrFIvY
 VzMQ==
X-Gm-Message-State: ANoB5pnuJF2uimMSsXIwptq11Yq5CZYHusFzmGI+g2Wqj3c4prA67DYp
 LG5Z0FYPuJ8/qXy0cxvas5XBC24oWSImmUAnZmoinS65OPRiNYtMbw2+phRREXY2HXJH3GUA2e2
 sZA5tHAUtU2uU0hrTx8JNwWCyuPsKIbOObE3IRAw6Ef+O1ckBnkjJsNhMGM5+1msKoO0=
X-Google-Smtp-Source: AA0mqf7NRESKGlapi00Vm4RzrykEkrOdtzZjuiuguh+BIRB9qPLMd+uW/YSL1B3pN/rYNKxqrQcktQ==
X-Received: by 2002:a05:6a00:26c8:b0:574:c159:ce3b with SMTP id
 p8-20020a056a0026c800b00574c159ce3bmr11885831pfw.74.1669568281708; 
 Sun, 27 Nov 2022 08:58:01 -0800 (PST)
Received: from hsinchu25.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a170902ca0b00b001868ed86a95sm6975762pld.174.2022.11.27.08.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 08:58:01 -0800 (PST)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Jim Shu <jim.shu@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] hw/intc: sifive_plic: fix out-of-bound access of
 source_priority array
Date: Sun, 27 Nov 2022 16:57:46 +0000
Message-Id: <20221127165753.30533-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=jim.shu@sifive.com; helo=mail-pf1-x42b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If the number of interrupt is not multiple of 32, PLIC will have
out-of-bound access to source_priority array. Compute the number of
interrupt in the last word to avoid this out-of-bound access of array.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/sifive_plic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c2dfacf028..1cf156cf85 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -78,6 +78,7 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *plic, uint32_t addrid)
     uint32_t max_irq = 0;
     uint32_t max_prio = plic->target_priority[addrid];
     int i, j;
+    int num_irq_in_word = 32;
 
     for (i = 0; i < plic->bitfield_words; i++) {
         uint32_t pending_enabled_not_claimed =
@@ -88,7 +89,16 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *plic, uint32_t addrid)
             continue;
         }
 
-        for (j = 0; j < 32; j++) {
+        if (i == (plic->bitfield_words - 1)) {
+            /*
+             * If plic->num_sources is not multiple of 32, num-of-irq in last
+             * word is not 32. Compute the num-of-irq of last word to avoid
+             * out-of-bound access of source_priority array.
+             */
+            num_irq_in_word = plic->num_sources - ((plic->bitfield_words - 1) << 5);
+        }
+
+        for (j = 0; j < num_irq_in_word; j++) {
             int irq = (i << 5) + j;
             uint32_t prio = plic->source_priority[irq];
             int enabled = pending_enabled_not_claimed & (1 << j);
-- 
2.17.1


