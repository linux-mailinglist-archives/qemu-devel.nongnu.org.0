Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD26A4456
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe9M-0006Tw-6a; Mon, 27 Feb 2023 09:06:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9F-0006Ki-RC
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe9E-00009N-9D
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so3911399wmq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Q/xrOXMKPfn2DHZUd+WXP9zhpBMTCb7v9IEh47K/bAI=;
 b=npOs5E9s8c7pR8As3Y1bvw5uMxrCHZxLzXoC6UtU1twZMTvNZtpQIMlgZQbkNJiush
 DlxZL64ZAKqOIZhtIF6bJf3oAHxwREAlRPp7OYlQIQU1mu8LUmJF+UeWL5YfDhE75rsd
 H2nYKlISoe71gV7Ikj8S5cNe3w3wp67gc3isllQOw553bn08ogvCmyCTlKbE9RyusF6M
 gqb+KHlPesJFyplbWnmDHjt933kczpIyTuUd8+nRLmILPMj8+x4WssZ0kAEhZPvMbB2W
 rmFhzGEEPWvEEQYgDKEtJx/pqPa2WkRWpgH1HPc2ZcgxhEXCUn6dHOh+0aaPk0vEOqJd
 fqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q/xrOXMKPfn2DHZUd+WXP9zhpBMTCb7v9IEh47K/bAI=;
 b=DtrkxY03e49oJssUDQA9M90DuB492m2A1ULGgKBpEzAbcG5AcY9aeU9mkQb8poLJ1t
 GrGaqKAFBaIaKY7ADicFaDB/phVu/uRs5C+l4Y9Ssflwn+/5w7DrKBCldxY6Bx7S99MF
 NQNRJn2v2lUY7kjkomSahWCO35cpGUXjSzCKw3BCkza9w7slYJu9BZkcliMQla0oqxO3
 uL66RxUhgBsnzYFk+G+M0ZBuHr0TvJFKV6VEOqZzQE/9ypsaJzMUzoLy2+QTEYE7024P
 CymobxZAqJSmmiArvSSMCiSlBOtpbU2R3oWphZcqs6taDcqQXHUhyUS9ET0N/EHJkyOF
 ZJnw==
X-Gm-Message-State: AO0yUKWqbbUeAdCeXDMFtnemP4xuKiTe30aheKjIj2XUybHeJpCMHhqT
 woTL0l3XomNf7mf40hBhOg5zSl7ohFp4JzFH
X-Google-Smtp-Source: AK7set8URFWyiSm3DD9O3ediLAcI1Gt/ucHre5+e3IXc/EqahJBfy5jjH/FX+Qn6iTULyo6UbpM9/A==
X-Received: by 2002:a05:600c:3416:b0:3eb:3cc9:9f85 with SMTP id
 y22-20020a05600c341600b003eb3cc99f85mr4227561wmp.26.1677506794278; 
 Mon, 27 Feb 2023 06:06:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adfe947000000b002c70f5627d5sm7084671wrn.63.2023.02.27.06.06.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 057/126] hw/sparc64/sun4u: Keep reference to ISA input IRQs in
 EbusState
Date: Mon, 27 Feb 2023 15:01:04 +0100
Message-Id: <20230227140213.35084-48-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Keep reference to ISA input IRQs in EbusState.

To emphasize input/output distinction, rename arrays
as isa_irqs_in / isa_irqs_out.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210163744.32182-7-philmd@linaro.org>
---
 hw/sparc64/sun4u.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 387181ff77..8fe47e2c22 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -84,7 +84,8 @@ struct EbusState {
     PCIDevice parent_obj;
 
     ISABus *isa_bus;
-    qemu_irq isa_bus_irqs[ISA_NUM_IRQS];
+    qemu_irq *isa_irqs_in;
+    qemu_irq isa_irqs_out[ISA_NUM_IRQS];
     uint64_t console_serial_base;
     MemoryRegion bar0;
     MemoryRegion bar1;
@@ -287,7 +288,7 @@ static const TypeInfo power_info = {
 static void ebus_isa_irq_handler(void *opaque, int n, int level)
 {
     EbusState *s = EBUS(opaque);
-    qemu_irq irq = s->isa_bus_irqs[n];
+    qemu_irq irq = s->isa_irqs_out[n];
 
     /* Pass ISA bus IRQs onto their gpio equivalent */
     trace_ebus_isa_irq_handler(n, level);
@@ -303,7 +304,6 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     ISADevice *isa_dev;
     SysBusDevice *sbd;
     DeviceState *dev;
-    qemu_irq *isa_irq;
     DriveInfo *fd[MAX_FD];
     int i;
 
@@ -315,9 +315,9 @@ static void ebus_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     /* ISA bus */
-    isa_irq = qemu_allocate_irqs(ebus_isa_irq_handler, s, ISA_NUM_IRQS);
-    isa_bus_irqs(s->isa_bus, isa_irq);
-    qdev_init_gpio_out_named(DEVICE(s), s->isa_bus_irqs, "isa-irq",
+    s->isa_irqs_in = qemu_allocate_irqs(ebus_isa_irq_handler, s, ISA_NUM_IRQS);
+    isa_bus_irqs(s->isa_bus, s->isa_irqs_in);
+    qdev_init_gpio_out_named(DEVICE(s), s->isa_irqs_out, "isa-irq",
                              ISA_NUM_IRQS);
 
     /* Serial ports */
-- 
2.38.1


