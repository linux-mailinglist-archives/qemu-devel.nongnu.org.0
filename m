Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE850B574
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:43:15 +0200 (CEST)
Received: from localhost ([::1]:56116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqks-0004R3-Fg
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9l-0004LI-Py
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9i-0002bb-QF
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id v12so3513280wrv.10
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I7pSO+EBd/yh29lG2tTeORRFQM+zqHoD6Z5G9/i+n7o=;
 b=otr7nirSXi4cADsvwacUJzdRJv2U2+LYilUEsCBYBMWPWj7ycSIhzwIgfigBt87pB+
 +WobJwbU8xBut16okixZFS1VniaKcZb9muBOnvZeFBzJ1gsmWOEq47sbULMTQMKR87aS
 VYDfWrYe42n5kz3Y77UzRsUqMv9KkawrWK3wJ/GYTWpG3bpUb7eLvLDgooZ0DwFlrqQq
 YPF8IiAjifyvD6t82fHGxHTVR/Z+tsB9TcQhT2iqnJCRK1T3l3eC2/C2ec7nHUnzMIqI
 wW3aGy9v6sciS/Ev78FgpzBLlchm75J+fIzUrP35ZYLO7raGzuy3lMt9Ms8k1ZiYXLt3
 TRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7pSO+EBd/yh29lG2tTeORRFQM+zqHoD6Z5G9/i+n7o=;
 b=INES+vwGnppKeYzba6kp7Zeyo0A3vtzpyfiMQl6VXF4KxIUKqQ3yB4meYjyq6s3aG/
 KbIqbR5h3q8LIDzKWtiGHPPuz/juC2M66acoMDG18J+STHiwQzpJbt7I2FxeZbZ/Ojk9
 zTr1dL4gZZL/DbsZTzplQthkIX8qGLRxpOHvl8EMP4sIIaQ09TacpwbDZ+V7TNasL5du
 BOt7QRDoaH9q7meFgTwYzF4xOIcJgDzu3Ks94XkEGSjBAvHLXrz9QMqtgbHK1KKOsJSa
 aRF9aVCnJJiP7dT5Z2xSRHXOe2xJORWoQzrkJ8iWmofkndLLxqUl5VpS3OMqC7KI4FXK
 gFOw==
X-Gm-Message-State: AOAM531gP8HtEF0FA6kEyxEFI6fVvbDsesc8Jyu+o8IpNqT6r8MDKGBT
 DcMKXfdmN59bAudrCnzzJsx6acBuIdZAGA==
X-Google-Smtp-Source: ABdhPJxEngKqHYQnTAPmwW4xPP2CMn7AhbPvvMuHAdQKsXVt4g7Z4gHUgUIcF6HwfAMop2pIR03ATQ==
X-Received: by 2002:adf:eacf:0:b0:20a:c8c4:ac51 with SMTP id
 o15-20020adfeacf000000b0020ac8c4ac51mr2077086wrn.510.1650621888302; 
 Fri, 22 Apr 2022 03:04:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/61] hw/intc/arm_gicv3: Keep pointers to every connected ITS
Date: Fri, 22 Apr 2022 11:03:46 +0100
Message-Id: <20220422100432.2288247-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

The GICv4 ITS VMOVP command's semantics require it to perform the
operation on every ITS connected to the same GIC that the ITS that
received the command is attached to.  This means that the GIC object
needs to keep a pointer to every ITS that is connected to it
(previously it was sufficient for the ITS to have a pointer to its
GIC).

Add a glib ptrarray to the GICv3 object which holds pointers to every
connected ITS, and make the ITS add itself to the array for the GIC
it is connected to when it is realized.

Note that currently all QEMU machine types with an ITS have exactly
one ITS in the system, so typically the length of this ptrarray will
be 1.  Multiple ITSes are typically used to improve performance on
real hardware, so we wouldn't need to have more than one unless we
were modelling a real machine type that had multile ITSes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-16-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h           | 9 +++++++++
 include/hw/intc/arm_gicv3_common.h | 2 ++
 hw/intc/arm_gicv3_common.c         | 2 ++
 hw/intc/arm_gicv3_its.c            | 2 ++
 hw/intc/arm_gicv3_its_kvm.c        | 2 ++
 5 files changed, 17 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 6e22c8072e9..69a59daf867 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -709,4 +709,13 @@ static inline void gicv3_cache_all_target_cpustates(GICv3State *s)
 
 void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s);
 
+/*
+ * The ITS should call this when it is realized to add itself
+ * to its GIC's list of connected ITSes.
+ */
+static inline void gicv3_add_its(GICv3State *s, DeviceState *its)
+{
+    g_ptr_array_add(s->itslist, its);
+}
+
 #endif /* QEMU_ARM_GICV3_INTERNAL_H */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index fc38e4b7dca..08b27789385 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -272,6 +272,8 @@ struct GICv3State {
     uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
 
     GICv3CPUState *cpu;
+    /* List of all ITSes connected to this GIC */
+    GPtrArray *itslist;
 };
 
 #define GICV3_BITMAP_ACCESSORS(BMP)                                     \
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index c797c82786b..dcc5ce28c6a 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -414,6 +414,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         cpuidx += s->redist_region_count[i];
         s->cpu[cpuidx - 1].gicr_typer |= GICR_TYPER_LAST;
     }
+
+    s->itslist = g_ptr_array_new();
 }
 
 static void arm_gicv3_finalize(Object *obj)
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index d2c0ca5f726..46d9e0169f9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1680,6 +1680,8 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    gicv3_add_its(s->gicv3, dev);
+
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
     /* set the ITS default features supported */
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 0b4cbed28b3..529c7bd4946 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -106,6 +106,8 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd, 0);
 
+    gicv3_add_its(s->gicv3, dev);
+
     gicv3_its_init_mmio(s, NULL, NULL);
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
-- 
2.25.1


