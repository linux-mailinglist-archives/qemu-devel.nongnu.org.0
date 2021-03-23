Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6840346DC8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:16:59 +0100 (CET)
Received: from localhost ([::1]:57634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqGg-0001mB-Lq
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqE7-000843-N8; Tue, 23 Mar 2021 19:14:21 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOqE6-0004sx-7f; Tue, 23 Mar 2021 19:14:19 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j18so22530516wra.2;
 Tue, 23 Mar 2021 16:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zpy4dUbdjK4RAyS69EYRJKkucXZnOQjnZyyP4OwZ9k8=;
 b=YRT7/3sKzfE+E5C1WM3TnMzWtfm0HE7ADQRP0jn3g8bupAmDeHZUWqpQlXFiyMfGJM
 lPPs/TksjYxKJhD58YpCE3H0+U9i2pwfyGmP2Pr9akZ9z8F/cSNa5JnvUQnFPEEAfGFZ
 OOlsOQB6jCrvZ+kvtWHgWdCxrNWeBxcSY4siY2JeGHT3zwL2/ZM9zvQyD3S+FlCdukvW
 D6tNaWrKfiRQ2GRskULdjkJnoB27d8vIZIhoSYvgwqACVY0lwn/NgWe3WCcRnAjObOYg
 EmR6TXCLO4xEdP7elx3Wym78DCokID1LDmiA0EFX/gsdkz18B0cBEyPFtdQHlfrLAuQM
 i9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zpy4dUbdjK4RAyS69EYRJKkucXZnOQjnZyyP4OwZ9k8=;
 b=TwNO3YbXNGY3nPGKjFf82lfr+DaGJPvhlNKc0XAagMivXg39r4ENmm0pYkVxEkumvn
 Ed4dKFilOjTa4vDEhO6d9FpHvb+e4W47O1jqelG0d2XoH7TWewI+tnr433HDRMubSixP
 ramx2GH5yxm40DTaleba+x6XD5FwGf3FgJ36fC2tVKb+lvKiZ6tNz1tvTex8j3fgyOBc
 s/ASsz6w6D512LvVgJnSTB9N/aJBPWaFOQWmKaFrxMjJHvqAaRXbLb2vNj0K6qb8XLbQ
 ZRBEar1fHStcc9+w1ngJLqVdTBPCzJ+oSakfRVYaCZiLIa7/JiRgA5OpSnk+rlVonLQU
 cVAQ==
X-Gm-Message-State: AOAM532ZVYmW7ALs9/smanypwjKW3IgKB01y4XpCy1AN7CMOJd4A+hL6
 QbVBQh26Rvi2HkAsg0Rq8hSju2O5AYJ3nA==
X-Google-Smtp-Source: ABdhPJyAWu5MZiiNL72Tfmi8Cs/ooJxO00UkuofDvXZzFcz0kmASd3Ss1hmswn8TVcEnpMSy8HGl1g==
X-Received: by 2002:a5d:64af:: with SMTP id m15mr276055wrp.231.1616541256265; 
 Tue, 23 Mar 2021 16:14:16 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k24sm249236wmr.48.2021.03.23.16.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 16:14:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/isa/i82378: Rename output IRQ variable
Date: Wed, 24 Mar 2021 00:13:55 +0100
Message-Id: <20210323231358.396520-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323231358.396520-1-f4bug@amsat.org>
References: <20210323231358.396520-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
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
2.26.2


