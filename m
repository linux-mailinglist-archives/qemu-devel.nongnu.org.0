Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D5D52DBD5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:50:37 +0200 (CEST)
Received: from localhost ([::1]:58062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkIG-00059R-By
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5H-0006LI-5E
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0000s5-G5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id k126so3284163wme.2
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=01yBGvrX2cZtSxy7ktXyZAlrrLplkKpLpXMVJvDOUkM=;
 b=UyuBVyc/KVG0VdORojd3NPLNSjZGyforVCB+SmufuIThwRkDvIr4yPOFdSG0spATOC
 Iz4ZLOnDQHYDc569IUL5yXzNcUznPlzzNZXsAhZwyCzBRpUONbw7Z80TEFkJnbEO6vDA
 bxu9oAo37abRaDNoWSYomalHgyfd5Es9AYxrzAnXEFHoz4e30gQ2cqgcZWj9DKf8czuP
 85jLfbU8C+I6B4YRm0hEYOGwG1uid6dSmu4wY3alUR8/jCQZG+J50xqeqpyJdO6WkLd5
 2U03CDioeePL9FeNW/AzbWk2FKc/Qoh1a4bxQMy2J7eLmuK4Y9joklxcBK0h1l7v4CIx
 E7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=01yBGvrX2cZtSxy7ktXyZAlrrLplkKpLpXMVJvDOUkM=;
 b=4rvp5yxQUlX2B/CHbVaMjMc7GKzy+lfIMyy9+MAO9NlrdvP6az2os546QNf8/fvBmj
 H6OQPO0cjGeRJEzhUBBmHEQoykaiKjH/XOv+O+xu62UlEPUGNlEfCCRJQZnqHuVWLqP6
 obMvTjVJjGTMgDzKlHd8Em2JUGwdDuRfKG27Gz0TvGC88aq8rP+51BFtT5AKR7vYnen+
 jISatn3shK5/yvWgFMPn3vmb7PmKZHFijZLsHwA8V8xILzKFOULbjInHKiXEwwLtfER0
 5XaRIddojQfihEpD1GqhkTKz5hgGJBFcb+IUIzvlmJkwVZhA30ZuM0/tVgYS1tVPEG9x
 uxQg==
X-Gm-Message-State: AOAM530Y+2Uq+OGUeJtur2BpO6R+cb0hih/TaPJCZIHk348Katl5JVDf
 2+EYgZ1/sVvvGv8rB7DM9NSQqYgPw1r9LA==
X-Google-Smtp-Source: ABdhPJxb+Ham34IJ9l343S2fP9rZUii3r2HiAwJ4lq8JdPF5c+XZFt+Vj3lgenD2qHEUwp2OaFZA4g==
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr5248552wmb.29.1652981825370; 
 Thu, 19 May 2022 10:37:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/22] hw/adc/zynq-xadc: Use qemu_irq typedef
Date: Thu, 19 May 2022 18:36:43 +0100
Message-Id: <20220519173651.399295-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Except hw/core/irq.c which implements the forward-declared opaque
qemu_irq structure, hw/adc/zynq-xadc.{c,h} are the only files not
using the typedef. Fix this single exception.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-id: 20220509202035.50335-1-philippe.mathieu.daude@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/adc/zynq-xadc.h | 3 +--
 hw/adc/zynq-xadc.c         | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/include/hw/adc/zynq-xadc.h b/include/hw/adc/zynq-xadc.h
index 2017b7a8037..c10cc4c379c 100644
--- a/include/hw/adc/zynq-xadc.h
+++ b/include/hw/adc/zynq-xadc.h
@@ -39,8 +39,7 @@ struct ZynqXADCState {
     uint16_t xadc_dfifo[ZYNQ_XADC_FIFO_DEPTH];
     uint16_t xadc_dfifo_entries;
 
-    struct IRQState *qemu_irq;
-
+    qemu_irq irq;
 };
 
 #endif /* ZYNQ_XADC_H */
diff --git a/hw/adc/zynq-xadc.c b/hw/adc/zynq-xadc.c
index cfc7bab0651..032e19cbd0a 100644
--- a/hw/adc/zynq-xadc.c
+++ b/hw/adc/zynq-xadc.c
@@ -86,7 +86,7 @@ static void zynq_xadc_update_ints(ZynqXADCState *s)
         s->regs[INT_STS] |= INT_DFIFO_GTH;
     }
 
-    qemu_set_irq(s->qemu_irq, !!(s->regs[INT_STS] & ~s->regs[INT_MASK]));
+    qemu_set_irq(s->irq, !!(s->regs[INT_STS] & ~s->regs[INT_MASK]));
 }
 
 static void zynq_xadc_reset(DeviceState *d)
@@ -262,7 +262,7 @@ static void zynq_xadc_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &xadc_ops, s, "zynq-xadc",
                           ZYNQ_XADC_MMIO_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->qemu_irq);
+    sysbus_init_irq(sbd, &s->irq);
 }
 
 static const VMStateDescription vmstate_zynq_xadc = {
-- 
2.25.1


