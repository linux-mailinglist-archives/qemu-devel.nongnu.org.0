Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8834467DD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:26:45 +0100 (CET)
Received: from localhost ([::1]:49648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2zE-0008Hi-6Z
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2ue-0002Te-Nk; Fri, 05 Nov 2021 13:22:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2uV-0007EU-Fi; Fri, 05 Nov 2021 13:21:55 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6934159wmd.1; 
 Fri, 05 Nov 2021 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOdSvE7B+V3yJN993wQb7M8J5BQsaGVtUf2KFSGPdGo=;
 b=A1eqCaDugkUYsUbS/i+GBK6GjR0EuLjgxR+xu2r17EbgaGhEAINocCh4Q6n07C2tDy
 9HPvEAZ38wFpB1MNkdGu0FmZam7q/EnRWnSncJo+/m2RJIvxiMt9R0tmVweGZ7ztj8GL
 6BuJu2akeUESKGOmKBm2R15EGP2EnJehKtTgxC4jSrVMvRdXF/5Era73LSA8QvlBa2iT
 rfnZwO4BFU8hsdo6NNv2RqM5vfLtQraPbUqtjr6ww172kRatsohVF7axXUPAak/SRNnF
 iPVySQBoJto/BnkWaP+Vc1Y+3LQW+OMWOb8d2EtEQH/aMsgxMk53z3ZZZVTwCcXAhC6W
 3Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IOdSvE7B+V3yJN993wQb7M8J5BQsaGVtUf2KFSGPdGo=;
 b=ZMls6nbXNUxBvNPh9s8PCu0WDzqZBhBIetlhkqmI0B7Ct1bUpHaQpXdlbDZqqSjv/n
 VIft7PFNCbQcdKpTsRMYlWh+fnnlM214Y2BJ2h1uUaO2Av4qiNrbzqKOd591H8+6i25k
 YrhxAw0gCePpclJtAjf6J7/LKHLnuvD/sGJlX0QsZ53maFWxQfJN00ZcgulqUGF7t2xV
 6uv5pqkT2FDxxA+QqWaIzZqFTfEvfriYCPpg+nUkWiVTHTmSbKg0f7fEZF0ru+5g/yA0
 DKfRaqB7sUMuwiTW938j/bya4jm/ajZ/TPUZpPZdIBzrYCrWCTyQgMWqr890ECSY+ZqZ
 lGMQ==
X-Gm-Message-State: AOAM531chUqbjoVbE2BqIpJ8kn+Ya0tdqKJMkbzRR3y9Q4SQAQafyhEF
 LauYMZWhOmADAgKtaz1hhWUYc6HMxBQ=
X-Google-Smtp-Source: ABdhPJydUANBy2qlKlDDoncrwZW9FQohQBIjND9xVC++HE8vbZd3xtzzN55+t2dEWXzBiMRApzgpMg==
X-Received: by 2002:a05:600c:511c:: with SMTP id
 o28mr33057350wms.96.1636132903802; 
 Fri, 05 Nov 2021 10:21:43 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a4sm7648091wmg.10.2021.11.05.10.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:21:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/input/pckbd: Rename i8042_setup_a20_line() and its a20
 irq argument
Date: Fri,  5 Nov 2021 18:21:27 +0100
Message-Id: <20211105172127.224462-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105172127.224462-1-f4bug@amsat.org>
References: <20211105172127.224462-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'a20_out' is an input IRQ, rename it as 'a20_input'.
i8042_setup_a20_line() doesn't take a Device parameter
but an ISADevice one. Rename it as i8042_isa_*() to
make it explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/input/i8042.h | 2 +-
 hw/i386/pc.c             | 2 +-
 hw/input/pckbd.c         | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 1d90432daef..3534fcc4b43 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -21,6 +21,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
                    hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
-void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
+void i8042_isa_setup_a20_line(ISADevice *dev, qemu_irq a20_input);
 
 #endif /* HW_INPUT_I8042_H */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2592a821486..06ef74ca22b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1043,7 +1043,7 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl, bool no_vmport)
     port92 = isa_create_simple(isa_bus, TYPE_PORT92);
 
     a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
-    i8042_setup_a20_line(i8042, a20_line[0]);
+    i8042_isa_setup_a20_line(i8042, a20_line[0]);
     qdev_connect_gpio_out_named(DEVICE(port92),
                                 PORT92_A20_LINE, 0, a20_line[1]);
     g_free(a20_line);
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index baba62f357a..7b842c8f3b5 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -680,9 +680,9 @@ void i8042_isa_mouse_fake_event(ISAKBDState *isa)
     ps2_mouse_fake_event(s->mouse);
 }
 
-void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
+void i8042_isa_setup_a20_line(ISADevice *dev, qemu_irq a20_input)
 {
-    qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
+    qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_input);
 }
 
 static const VMStateDescription vmstate_kbd_isa = {
-- 
2.31.1


