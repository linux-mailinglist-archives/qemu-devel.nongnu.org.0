Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AB64DBA1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:51:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhS-00071D-Vx; Thu, 15 Dec 2022 07:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh2-0006pV-VW
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:33 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5ngz-00045o-TA
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:31 -0500
Received: by mail-wm1-x335.google.com with SMTP id v7so13711456wmn.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0TV5qsA14dk+cYd8jhe+sXqAEhXPrpR+F1VJLlzHiEs=;
 b=QBLi2Zt/XXAjwo9Fe4WabnUrbHRkiyuc/G5PLyKA4Oj3KSdoZhLhVrF/qwyiq+Ee/s
 19ZVGX8NOChD5ZRbJllaHlOUzIbBmKjUqv6yUMo/ai7mdhMnxJzB1aILMPemFLcS9gCs
 P6baFR+DanfMYgxOriH/cRbCY9HAJtozlMDe+SGbaaQdbPGtRoZJyunJOkUhnqzIoRBg
 OJw2vfJXIVXgY00svAARYxxaQcaMvnkpPhpFNstoXBUqiBeR8gBKF0t/CJwEagTP/8gl
 Mz7KI5oGXgeyDRg7shW34qxHc+DcMnJeKWyNjYcalRYbU1Gwe1SGKDF9JyI2j3kfPYnk
 eVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0TV5qsA14dk+cYd8jhe+sXqAEhXPrpR+F1VJLlzHiEs=;
 b=FmDxFQS6MVr8GlvHiaz0xposFek/Y2sNr4qbsppX3qMj5vxr3xa/4q+koGf7fztxpt
 X+YlZvz5aP7eNrEkqd0vnuQOlr3jI2G1DW1EhooHLzE+lp7MbHKwWpC/WTG0BsXiQ3+i
 o0sx2oeUJdm2WhPYpYdHT8g2zDqgLcD2DM4Rb7cjZkQerkCCL8Vf2suduhLUzREjUf9D
 wo3N104GgTsmqYZz+zoJBBq+EzWT+P+A602ZBbN+YFtOmH0Tronbkatm/19F/t3ftXA0
 wcGeemF8a7TbiFVkZwxgucLmIrAobopUUae6pAm7NOW49Tr+24tlb+EHvYyhrZjHa9Uq
 jLlQ==
X-Gm-Message-State: ANoB5pk5UAeUcCugn+bAy4zSGDhUBnUEwfrQpbf0nb0kX4UfRrCeN9U6
 JgmvsfsFripz6vnIcqOe66s8V/X3duHbJuNj
X-Google-Smtp-Source: AA0mqf7XQb8UQfbciAmx/QfJZhxu3+8CwqMLPSLkeaflJE2cypxJUgUNQD6E8yiDJc1JYNT1vMZcew==
X-Received: by 2002:a05:600c:783:b0:3d2:2105:1761 with SMTP id
 z3-20020a05600c078300b003d221051761mr13593524wmo.25.1671108629210; 
 Thu, 15 Dec 2022 04:50:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/29] hw/intc: Convert TYPE_ARM_GIC_COMMON to 3-phase reset
Date: Thu, 15 Dec 2022 12:49:59 +0000
Message-Id: <20221215125009.980128-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Convert the TYPE_ARM_GIC_COMMON device to 3-phase reset.  This is a
simple no-behaviour-change conversion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221109161444.3397405-4-peter.maydell@linaro.org
---
 hw/intc/arm_gic_common.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 7b44d5625b6..a379cea3959 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -261,9 +261,9 @@ static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
     }
 }
 
-static void arm_gic_common_reset(DeviceState *dev)
+static void arm_gic_common_reset_hold(Object *obj)
 {
-    GICState *s = ARM_GIC_COMMON(dev);
+    GICState *s = ARM_GIC_COMMON(obj);
     int i, j;
     int resetprio;
 
@@ -364,9 +364,10 @@ static Property arm_gic_common_properties[] = {
 static void arm_gic_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
     ARMLinuxBootIfClass *albifc = ARM_LINUX_BOOT_IF_CLASS(klass);
 
-    dc->reset = arm_gic_common_reset;
+    rc->phases.hold = arm_gic_common_reset_hold;
     dc->realize = arm_gic_common_realize;
     device_class_set_props(dc, arm_gic_common_properties);
     dc->vmsd = &vmstate_gic;
-- 
2.25.1


