Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A491A50B4DA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:19:44 +0200 (CEST)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqO7-0002ui-Po
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9b-0004E3-A8
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:47 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9Y-0002Zi-Vq
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u3so10334631wrg.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LtCQjZwy+MRjUms9uMTdrmBqMtKUGnilvU+NhBGq9yg=;
 b=smQ2s+/ho0xJoSSucvSUaEqSmHtBWj99DVg1pOvSzMcMZoOCTChZfO/uwQ9QaS/SML
 pTg5SMrKdreV+hGdZJsvL0p8/HShd4tvqYSNj+Kq//BZcBqV8EViZb3MQrlUEAIRM/O/
 qdG0BAlaxD3P0XCI7MPwF6xIJH/b52nALXSgibMplC/K4Y03tyuRU6FqHLtSHgru8vuJ
 WwvF8t8IOW819OYU20/c277Lxv1w1cXUIxAjLi1P4cuTjOfCgm1R804Z+NdSZ1Ap9T3s
 iWkWsiypJHLrX+z8O2p6fTc1NPToeT2JSxBXE1p77VpcLDwGJ1H06j/Dv7kGV4XOSGW2
 m3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LtCQjZwy+MRjUms9uMTdrmBqMtKUGnilvU+NhBGq9yg=;
 b=vBw/A2nS5RBUnEtDU0yGiWXxth7bZgZIQKcSFQYMJmGIoaHhPR/UU2Ey3KP1ekCgIE
 kPerXeUtT9jSGOjFTBiLJfQu6nEF0QxjiBR5QxR23uTL/U+g9WnIr1jBd5uAwXwvsj1/
 rXCKeOI419Rk1DEkI5FYkd/HjvXfodueNvRPIXeGBU4qNT5yxZO7bSPvM+hTjSZOzbrS
 NuxBqcA271xrwfay5X47k9R+TH2CIU335uo/t1fK9EQGQAQuRsur2bK1WopokXJIRAPs
 l4Od56xiJxJpJeLJ7oeqzR5/y1rPW41gp6g8JVEkkgr/rp+wZ+8nDe6U0y6qd6G1SVCc
 QOag==
X-Gm-Message-State: AOAM533bwBE3rhH5v8M9+E1eT3tfgbgR3/GUyB1OYJCeJXDskH+ZsSlY
 K9qUeW+fZ0LchbXzdu7ag3yES+yLc3F5iQ==
X-Google-Smtp-Source: ABdhPJw0rRqidZPK6xXMdzF4Bl8mNbxRZxW5UFEPU1/ifI+4QQdsyGR46C3Y3CB5ZwAjnPKrt+zCDw==
X-Received: by 2002:a05:6000:1a8a:b0:20a:af19:ad12 with SMTP id
 f10-20020a0560001a8a00b0020aaf19ad12mr3082692wry.4.1650621879520; 
 Fri, 22 Apr 2022 03:04:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/61] target/arm/cpu.c: ignore VIRQ and VFIQ if no EL2
Date: Fri, 22 Apr 2022 11:03:36 +0100
Message-Id: <20220422100432.2288247-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

In a GICv3, it is impossible for the GIC to deliver a VIRQ or VFIQ to
the CPU unless the CPU has EL2, because VIRQ and VFIQ are only
configurable via EL2-only system registers.  Moreover, in our
implementation we were only calculating and updating the state of the
VIRQ and VFIQ lines in gicv3_cpuif_virt_irq_fiq_update() when those
EL2 system registers changed.  We were therefore able to assert in
arm_cpu_set_irq() that we didn't see a VIRQ or VFIQ line update if
EL2 wasn't present.

This assumption no longer holds with GICv4:
 * even if the CPU does not have EL2 the guest is able to cause the
   GIC to deliver a virtual LPI by programming the ITS (which is a
   silly thing for it to do, but possible)
 * because we now need to recalculate the state of the VIRQ and VFIQ
   lines in more cases than just "some EL2 GIC sysreg was written",
   we will see calls to arm_cpu_set_irq() for "VIRQ is 0, VFIQ is 0"
   even if the guest is not using the virtual LPI parts of the ITS

Remove the assertions, and instead simply ignore the state of the
VIRQ and VFIQ lines if the CPU does not have EL2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-6-peter.maydell@linaro.org
---
 target/arm/cpu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3609de08882..fa13fce355a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -694,6 +694,16 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
         [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
     };
 
+    if (!arm_feature(env, ARM_FEATURE_EL2) &&
+        (irq == ARM_CPU_VIRQ || irq == ARM_CPU_VFIQ)) {
+        /*
+         * The GIC might tell us about VIRQ and VFIQ state, but if we don't
+         * have EL2 support we don't care. (Unless the guest is doing something
+         * silly this will only be calls saying "level is still 0".)
+         */
+        return;
+    }
+
     if (level) {
         env->irq_line_state |= mask[irq];
     } else {
@@ -702,11 +712,9 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
 
     switch (irq) {
     case ARM_CPU_VIRQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
         arm_cpu_update_virq(cpu);
         break;
     case ARM_CPU_VFIQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
         arm_cpu_update_vfiq(cpu);
         break;
     case ARM_CPU_IRQ:
-- 
2.25.1


