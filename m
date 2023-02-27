Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD56A4429
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:20:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe9B-00068K-7a; Mon, 27 Feb 2023 09:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe98-0005yd-Jr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:31 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe96-00007u-Lm
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l1so3304300wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=h6uxcZilk2wI+Tkmg+pnz6+NZT4eCPxaC2G9zMcXWSQ=;
 b=uhMuANSsBD1gVY23Uv8L13qMDeHiDtMvokvxRDj4GCibWeXYV3Ggc36Oeud86KhHV6
 +OArFgo3BDMpHgy6osObCFIMhj4md3xoSGn45TkQLMF0eKjGdiYvVWZmr1zRnZ9p4plf
 6Z6E3l5BbSQlyprqUefe7cZxEXAmbYnWjTBeoVrVhk0Rv7cgX9pBsJxE4kzBu5BukadP
 J87VLjnpQ6wbGevynvGm8Mm63Wxqkxn7ahn6J2sKPxYrQoz3URs/5UF57H8dGpmQhuSY
 FR0rQpD+yFmrCkrvVmqSDjNX5VQA2qFiNbVR2kHn8f2WTYJbVOnDzWhtNKjl7UieQH+a
 rwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6uxcZilk2wI+Tkmg+pnz6+NZT4eCPxaC2G9zMcXWSQ=;
 b=jw0a4FkK5WufZvYer5SXGvberHF57zd/LqzQJ/6ZDcfUZb2/Z2NHY9HvZeAIlqUv5A
 28VWTiM8ikYBE4GLIqobn1vLXxBiB9EtYsSh6XVVW6SuWLImaj3A5skM2KjBjCrhoujc
 rsJpPAZq64zZ4YT7CSu3EeIw79fYyF9jAVhYSQkSGmdKFx45RtdW0GaK8PkIP26/TQLg
 LHTiVQImLDpcLMHsd63cI9jTIYW0PISDG7oFLglVauZQwgxaEryM0wXAVnvd+clJjGOS
 6N73BnaX2kiyNPg3N5taonFdzZUl9PwwYeqsQt9/nzN5mss+8ySPAZxd5IdyJpBhpPR5
 yixg==
X-Gm-Message-State: AO0yUKVxBv9oE7qpfUx9gxjSw9xeDvLRZO+/jOOQm69tSoMMjxAnz3Uc
 boo72XdHnTQSjQzyKQpbvrwKnx/XY08BSriS
X-Google-Smtp-Source: AK7set9YYceLpKJzmiz86Roy2Pgfpb/7xKklCm3VmWunJ44Fl0e7+h/C01AcAQQXv0ZOB7gMZpXBxQ==
X-Received: by 2002:adf:fbc6:0:b0:2c5:54a7:3630 with SMTP id
 d6-20020adffbc6000000b002c554a73630mr21491287wrs.46.1677506783493; 
 Mon, 27 Feb 2023 06:06:23 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b002c56046a3b5sm7050207wrp.53.2023.02.27.06.06.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 055/126] hw/isa/i82378: Remove intermediate IRQ forwarder
Date: Mon, 27 Feb 2023 15:01:02 +0100
Message-Id: <20230227140213.35084-46-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When the i82378 model was added in commit a04ff940974 ("prep:
Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
not yet QOM'ified. This happened later in commit 747c70af78f
("i8259: Convert to qdev").

Directly dispatch ISA IRQs to 'cpu_intr' output IRQ
by removing the intermediate i82378_request_out0_irq()
handler. Rename ISA IRQs array as 'isa_irqs_in' to
emphasize these are input IRQs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210163744.32182-4-philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/i82378.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 84ce761f5f..d32653369d 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -33,7 +33,7 @@ struct I82378State {
     PCIDevice parent_obj;
 
     qemu_irq cpu_intr;
-    qemu_irq *i8259;
+    qemu_irq *isa_irqs_in;
     MemoryRegion io;
 };
 
@@ -47,18 +47,12 @@ static const VMStateDescription vmstate_i82378 = {
     },
 };
 
-static void i82378_request_out0_irq(void *opaque, int irq, int level)
-{
-    I82378State *s = opaque;
-    qemu_set_irq(s->cpu_intr, level);
-}
-
 static void i82378_request_pic_irq(void *opaque, int irq, int level)
 {
     DeviceState *dev = opaque;
     I82378State *s = I82378(dev);
 
-    qemu_set_irq(s->i8259[irq], level);
+    qemu_set_irq(s->isa_irqs_in[irq], level);
 }
 
 static void i82378_realize(PCIDevice *pci, Error **errp)
@@ -94,9 +88,8 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
      */
 
     /* 2 82C59 (irq) */
-    s->i8259 = i8259_init(isabus,
-                          qemu_allocate_irq(i82378_request_out0_irq, s, 0));
-    isa_bus_irqs(isabus, s->i8259);
+    s->isa_irqs_in = i8259_init(isabus, s->cpu_intr);
+    isa_bus_irqs(isabus, s->isa_irqs_in);
 
     /* 1 82C54 (pit) */
     pit = i8254_pit_init(isabus, 0x40, 0, NULL);
-- 
2.38.1


