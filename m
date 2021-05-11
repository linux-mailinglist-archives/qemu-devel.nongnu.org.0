Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C0379E10
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 06:12:37 +0200 (CEST)
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJl6-0005eI-VF
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 00:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfS-0005ld-OF; Tue, 11 May 2021 00:06:48 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJfR-0007iK-A6; Tue, 11 May 2021 00:06:46 -0400
Received: by mail-ed1-x52c.google.com with SMTP id u13so21211593edd.3;
 Mon, 10 May 2021 21:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hns+6A5PyzY0RjxyiODZSOeQ1IcjbT0qFjGtVPHu0KY=;
 b=owJ3kv4wAoJ7sVpZlOtpHZ6ym6KtQ6mpbg5WRBmFAw1cfERfzbj4oVBgSwmOzwJt56
 vHfZbsmbEFOGzLqnSPzArYXMLvvp+JNmN8o/0s9i2g15DPdigYYAwxi7vUtZPaEC8i26
 4T8bLj6VjVBdvBj4CoNJq9z+r+j4BPKlPUUw4cyNzVgYmruedomhkrVHTd0lp1tRAmLF
 0Mo9bcsrid/9e+LvJ4IoX23nnjhQTyjfku1ccMJMqJOQS0oMho3lUxDswhRTZrfu7aGb
 VQ2DsxGi6mc9lKZ3oDqMU7P3yQOjJg2etQmD37LuGSRYSbiX7I1U9rgNH9/Vr3XRtsIX
 lGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hns+6A5PyzY0RjxyiODZSOeQ1IcjbT0qFjGtVPHu0KY=;
 b=rlkNp8/f33XUKQpICZ44BdDfRCluvvLQztXGEHCauLlS69U5RRHfFUO9S5q3tf8GiX
 lb6HzhY3YVUskux93ABPJyaR5o7Ivx/hIieNbGzCwoZzRYw2Rdid183LmcpN+4pIOZ4l
 qxY+8o995freke0aP+EHx/p4btOHeA2EXQqWI97EFm8WmZVXtFCY419qmtEovRiaDPWJ
 QpvC3iyvfdiyJ7+GD4ROOOLC3fhkMi+pYdqcNL1u9NdWIU9wsVVyUkqKktT2EhxN09n8
 eXlmruMKm0A4HAuDpl5BdIUnvLGt4XRGcZiXDYbm8sMfUK3+bxcntC5aHHpBod9JISRX
 bBhw==
X-Gm-Message-State: AOAM531yWQVxaKMid4OyRjfOtXdenChBWkVxulVORkrsx+vLpjmfaj8n
 /S3yGHMEWhOOn1BDV6LtyLyTgbmTiPaN9Q==
X-Google-Smtp-Source: ABdhPJyVAnueCpOEJA5/6jR99YSb5iuVPDLCVGLCZ/+L+doPz4ZPTKnrMYqCS1NIxP/veStUNE9DRw==
X-Received: by 2002:a05:6402:1547:: with SMTP id
 p7mr33688077edx.319.1620706003287; 
 Mon, 10 May 2021 21:06:43 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n21sm10601825ejx.74.2021.05.10.21.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:06:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] hw/isa/i82378: Rename output IRQ variable
Date: Tue, 11 May 2021 06:06:20 +0200
Message-Id: <20210511040621.2736981-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511040621.2736981-1-f4bug@amsat.org>
References: <20210511040621.2736981-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The i82378 has 2 output IRQs: "INT" and "NMI".
We do not model the NMI, so simplify I82378State by
removing the unused IRQ. To avoid keeping an array of
one element, remove the array and rename the variable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/i82378.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 817eca47053..164d6c65f64 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -32,7 +32,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(I82378State, I82378)
 struct I82378State {
     PCIDevice parent_obj;
 
-    qemu_irq out[2];
+    qemu_irq intr;
     qemu_irq *i8259;
     MemoryRegion io;
 };
@@ -88,7 +88,7 @@ static void i82378_realize(PCIDevice *pci, Error **errp)
      */
 
     /* 2 82C59 (irq) */
-    s->i8259 = i8259_init(isabus, s->out[0]);
+    s->i8259 = i8259_init(isabus, s->intr);
     isa_bus_irqs(isabus, s->i8259);
 
     /* 1 82C54 (pit) */
@@ -106,7 +106,7 @@ static void i82378_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     I82378State *s = I82378(obj);
 
-    qdev_init_gpio_out_named(dev, s->out, "intr", 1);
+    qdev_init_gpio_out_named(dev, &s->intr, "intr", 1);
     qdev_init_gpio_in(dev, i82378_request_pic_irq, 16);
 }
 
-- 
2.26.3


