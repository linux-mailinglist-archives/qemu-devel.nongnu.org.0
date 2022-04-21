Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD64509E90
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:33:02 +0200 (CEST)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV3V-0004Jb-Lf
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpx-00030X-F9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:01 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpv-0003TJ-96
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:01 -0400
Received: by mail-wr1-x435.google.com with SMTP id g18so6190407wrb.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sDjN+WySih18ryXF6R3n9stfRQojyj640nNIa0UOxtI=;
 b=B97bjf+PebiFn+tJj+ywXJSHjx3y+nZBRVnRO8FJcyyp8PdLWH7EhiN/i+7F1ayvMY
 +rQBrSLnbzT1fJd6cAYSnQMqL6xqcTAHFW6+WacbPkIT5s91Pw/iHWy1hiZM8S3H5ErP
 YUgD1/Ldt9B2Y+gPkmDZS++vVODiFdyopD3VTQnLrJafF4yBRHxGbRf+2VCaMrN1NKT0
 sPbVtJXCuEQbGWB5uif1IT3yGoYXY57PEo6RkSTTvvKnwRRBngI+Zcf1q8kin0HLlX7t
 oELm1ggZY1WmMfcl8zXWmtHVlnPbB7y4Zjmdx71RDkFjIIIPB9nWwemlfz7Am6FLCIfi
 3qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sDjN+WySih18ryXF6R3n9stfRQojyj640nNIa0UOxtI=;
 b=1ufueq6uYvvwWYRYwoLAEk9n7I1j8+aJQQ4fWcyfzE5fOmHJGMzGk1JEa4dLUSVuYT
 lyGhCm9ErfvqRcqVhZB6BEFHjxqSqNSHpCRopE0SYtJCzDyLdlmxSPQKNHjMhDOBP2B/
 i2dRsAsX09YK+cswGwEbZN9JIz7ulzYnmS8gTAFh33dUljH5+Fp1m72CsFA1xwWDmPF+
 AUktNJqA/RksE83HlYJOgEFM1StzYWky0/syM2MjY4j/clj3rVbdJAzv1zT4+zQN7d7w
 2LixUrPDGKaMLsR6kqvmS9BEdqQ3MZX7D1i+WZy4HGotLRNBVZlrJMcAqqM5682/1mGq
 EoUw==
X-Gm-Message-State: AOAM531QlQ2/5/DWiFVyncSNPcBiT91b18OPZ4e/mymycmpPbWW5uXLO
 61ntyLY3TaXOtnNiK4+isk/leHeWwAJffg==
X-Google-Smtp-Source: ABdhPJw9ZNdVjXmhOp0PVMQ0s2Zhri0OEizW5eLqnSv+P4xorL0vP3MwdwfL2xjhLNhBmhsT2F/LNg==
X-Received: by 2002:a05:6000:16ce:b0:20a:88cf:c026 with SMTP id
 h14-20020a05600016ce00b0020a88cfc026mr18637549wrf.496.1650539936644; 
 Thu, 21 Apr 2022 04:18:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/31] hw/intc/exynos4210_gic: Remove unused
 TYPE_EXYNOS4210_IRQ_GATE
Date: Thu, 21 Apr 2022 12:18:24 +0100
Message-Id: <20220421111846.2011565-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

Now we have removed the only use of TYPE_EXYNOS4210_IRQ_GATE we can
delete the device entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-id: 20220404154658.565020-3-peter.maydell@linaro.org
---
 hw/intc/exynos4210_gic.c | 107 ---------------------------------------
 1 file changed, 107 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index bc73d1f1152..794f6b5ac72 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -373,110 +373,3 @@ static void exynos4210_gic_register_types(void)
 }
 
 type_init(exynos4210_gic_register_types)
-
-/* IRQ OR Gate struct.
- *
- * This device models an OR gate. There are n_in input qdev gpio lines and one
- * output sysbus IRQ line. The output IRQ level is formed as OR between all
- * gpio inputs.
- */
-
-#define TYPE_EXYNOS4210_IRQ_GATE "exynos4210.irq_gate"
-OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210IRQGateState, EXYNOS4210_IRQ_GATE)
-
-struct Exynos4210IRQGateState {
-    SysBusDevice parent_obj;
-
-    uint32_t n_in;      /* inputs amount */
-    uint32_t *level;    /* input levels */
-    qemu_irq out;       /* output IRQ */
-};
-
-static Property exynos4210_irq_gate_properties[] = {
-    DEFINE_PROP_UINT32("n_in", Exynos4210IRQGateState, n_in, 1),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
-static const VMStateDescription vmstate_exynos4210_irq_gate = {
-    .name = "exynos4210.irq_gate",
-    .version_id = 2,
-    .minimum_version_id = 2,
-    .fields = (VMStateField[]) {
-        VMSTATE_VBUFFER_UINT32(level, Exynos4210IRQGateState, 1, NULL, n_in),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-/* Process a change in IRQ input. */
-static void exynos4210_irq_gate_handler(void *opaque, int irq, int level)
-{
-    Exynos4210IRQGateState *s = (Exynos4210IRQGateState *)opaque;
-    uint32_t i;
-
-    assert(irq < s->n_in);
-
-    s->level[irq] = level;
-
-    for (i = 0; i < s->n_in; i++) {
-        if (s->level[i] >= 1) {
-            qemu_irq_raise(s->out);
-            return;
-        }
-    }
-
-    qemu_irq_lower(s->out);
-}
-
-static void exynos4210_irq_gate_reset(DeviceState *d)
-{
-    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(d);
-
-    memset(s->level, 0, s->n_in * sizeof(*s->level));
-}
-
-/*
- * IRQ Gate initialization.
- */
-static void exynos4210_irq_gate_init(Object *obj)
-{
-    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(sbd, &s->out);
-}
-
-static void exynos4210_irq_gate_realize(DeviceState *dev, Error **errp)
-{
-    Exynos4210IRQGateState *s = EXYNOS4210_IRQ_GATE(dev);
-
-    /* Allocate general purpose input signals and connect a handler to each of
-     * them */
-    qdev_init_gpio_in(dev, exynos4210_irq_gate_handler, s->n_in);
-
-    s->level = g_malloc0(s->n_in * sizeof(*s->level));
-}
-
-static void exynos4210_irq_gate_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->reset = exynos4210_irq_gate_reset;
-    dc->vmsd = &vmstate_exynos4210_irq_gate;
-    device_class_set_props(dc, exynos4210_irq_gate_properties);
-    dc->realize = exynos4210_irq_gate_realize;
-}
-
-static const TypeInfo exynos4210_irq_gate_info = {
-    .name          = TYPE_EXYNOS4210_IRQ_GATE,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(Exynos4210IRQGateState),
-    .instance_init = exynos4210_irq_gate_init,
-    .class_init    = exynos4210_irq_gate_class_init,
-};
-
-static void exynos4210_irq_gate_register_types(void)
-{
-    type_register_static(&exynos4210_irq_gate_info);
-}
-
-type_init(exynos4210_irq_gate_register_types)
-- 
2.25.1


