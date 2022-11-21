Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0745632309
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6SB-0005AV-MK; Mon, 21 Nov 2022 08:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rj-0004t1-87
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:51 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rg-0007RE-RM
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:46 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s5so2547505wru.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/Z8xa5pV0nteWKUcNsZsbmwAjwoF7nCHZABgLKiuNBc=;
 b=u0vBJY2/GEP6mrpTUgVjizWoyzr5wGdbBlFLK3uvJCUTPN/8eQQfT8PLiImHx8UL/2
 7cyE5U8zR9oMFZvlqCcAMFyU64wJriAsr/KBljfLIzbNtpSZ2LfyqxoHeHfTxM/JRHeR
 3M7/q4Lx5+eFt0ru+i3+ufeMeWttxPoWdC+tGIc0pbxyDECXpYnO4sUi+sDX78llxb1U
 wGhEKj64Z7ZxC5N7t+fS6StsEtzeTcCDH2sj0l3LEzRQ2p/NG3Di3NhxX04L0JB7tVwn
 yJmpsUiPqckFh5EV+d+aVQpGKUpDIpnWqgJgDgRYBCFBLavz5HjQ69lxh8cm/R7nZjgx
 jInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Z8xa5pV0nteWKUcNsZsbmwAjwoF7nCHZABgLKiuNBc=;
 b=jk1NOg1QASMPzCMcpRt0B2CcYSUJKcUJG00yd9RNmukXxSZ8WayS5JXc9wXfldLVNF
 49MXX9dcqw/BayPF6+Ne99MVAVRjugV3C/5eyiij69o9nQCqWKnnsqArEK4Q8TLASHoP
 E7Wr0ZPA9gGlS9jSUaYYbpOQjUNDVpHxykzd6SaT7ivLS2DsOP487aSlAna4MxTGSOyq
 rQI1sj4R3cjENXpGuUFMFupSXy4hlWHBykWHtfu9R9H1awidknEM6o8I8C95XmS9SrRk
 k3aJ+RRPJJxkCjfmUf7hk9uYy3J6XsZ+ILc1/EXpM5WPi/dGQV7Oj1iiTdG0ddglA/9a
 d0Og==
X-Gm-Message-State: ANoB5pmPobg8ogfY4TLJvo9W8LaIVtHFEUCyLO/4XQ2ndhYzrHZyYTck
 NWZE5pnm+55cdqZLrYZxMjXNrfLT6P2t8Q==
X-Google-Smtp-Source: AA0mqf5wIBKsiAst9zmlIvWryiqsQ+d07WCx0c8KvEg4q0XMRbnOCQpAlwmryPBYBkyM4zxQoMCbjw==
X-Received: by 2002:a5d:6dd1:0:b0:236:75a8:58d with SMTP id
 d17-20020a5d6dd1000000b0023675a8058dmr11306719wrz.295.1669035762875; 
 Mon, 21 Nov 2022 05:02:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003cf4d99fd2asm13296725wmi.6.2022.11.21.05.02.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 05:02:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/intc: clean-up access to GIC multi-byte registers
Date: Mon, 21 Nov 2022 13:02:36 +0000
Message-Id: <20221121130239.1138631-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121130239.1138631-1-peter.maydell@linaro.org>
References: <20221121130239.1138631-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Alex Bennée <alex.bennee@linaro.org>

gic_dist_readb was returning a word value which just happened to work
as a result of the way we OR the data together. Lets fix it so only
the explicit byte is returned for each part of GICD_TYPER. I've
changed the return type to uint8_t although the overflow is only
detected with an explicit -Wconversion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab4..1a04144c38b 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -941,7 +941,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     gic_update(s);
 }
 
-static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
+static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
     uint32_t res;
@@ -955,6 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     cm = 1 << cpu;
     if (offset < 0x100) {
         if (offset == 0) {      /* GICD_CTLR */
+            /* We rely here on the only non-zero bits being in byte 0 */
             if (s->security_extn && !attrs.secure) {
                 /* The NS bank of this register is just an alias of the
                  * EnableGrp1 bit in the S bank version.
@@ -964,11 +965,14 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
                 return s->ctlr;
             }
         }
-        if (offset == 4)
-            /* Interrupt Controller Type Register */
-            return ((s->num_irq / 32) - 1)
-                    | ((s->num_cpu - 1) << 5)
-                    | (s->security_extn << 10);
+        if (offset == 4) {
+            /* GICD_TYPER byte 0 */
+            return ((s->num_irq / 32) - 1) | ((s->num_cpu - 1) << 5);
+        }
+        if (offset == 5) {
+            /* GICD_TYPER byte 1 */
+            return (s->security_extn << 2);
+        }
         if (offset < 0x08)
             return 0;
         if (offset >= 0x80) {
-- 
2.25.1


