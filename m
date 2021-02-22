Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED9321A47
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:24:52 +0100 (CET)
Received: from localhost ([::1]:54230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC8q-0002Yy-0e
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:24:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzx-0003Wd-Si; Mon, 22 Feb 2021 09:15:41 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzw-0001Jd-Bf; Mon, 22 Feb 2021 09:15:41 -0500
Received: by mail-ed1-x531.google.com with SMTP id j9so22195479edp.1;
 Mon, 22 Feb 2021 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mxqq1fIETdh/e8tcYC6fmyKoJfUnWAtkX7IT6VSa4RM=;
 b=B4AtEjrnAdfaIGiqZDLStCrNC8GREspQCY00XC6WUFFSZqalxRy7ZPSA3BgOOIJWHN
 gizOHuRDRwvs3pKPbTF2+OYQeHjQlz/XlB0kxLY2X7Ugv8CqSXPR2bmtG6c8xMimrJUI
 1IIihjIH62vxo63NfcwByPuL4JXT+okLiktyQgdECmkqXSyLF+6PLty6F7Gh17d9IxHk
 ZaGtsoLeJb7BX8dC6IP3OH2AcVM7cAOGPs0T9r8E16yEGGnbfBGuf+Lhsyhn5xpbP/Lg
 Y93CPBx6amyvcpXUE35TO49H4s6vC7GhgZBFNNPpGIPDU5QAoHHnK+hsGM5bYpiyekXU
 eblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mxqq1fIETdh/e8tcYC6fmyKoJfUnWAtkX7IT6VSa4RM=;
 b=F4xWtWR5+NbuRaVrgwXAlijePpTbps99R1DGmNkJh/zF6XLoIDPG/yWjI+Dw2ZJocj
 N7XuYsmqn/wRhsKdLvItngS6PBJy/aQo/jjEUWbQ/i7dVZuamsuVVVVTtai3NguCUnk6
 g0xS9/NZyhhlzp7NLrhQDcn6II651QatDd0f/2zXQfLS5E0kmYDFtdQiHeHwCaHZTWML
 IgfXB8Kzw7E6Bjvpep/OCK+0nQJjS2IdNi6ZaNKE/jKsB6c6CNs9dWsMFCI1t274U/UJ
 sU0gx8ecf4SH0gEorOOuSyjH12KJlIQKmfVfaYiKU4ehMZu4sROPJoW4tLAOs1jtPj+a
 YsGQ==
X-Gm-Message-State: AOAM531d+G9Qb//UXVvvqsXPxdvhWcVqRCycbwH5/dRkmBpN1V/OVmlO
 ca5wUtdla01y26o/RKyxGiCV6mKHTVk=
X-Google-Smtp-Source: ABdhPJxlb8ZgyRagiGklqOhzm1tClYC85Bc0cPnt8NeOlQPWnpwSZ81nwGIHf4uQv77p4nnUJvjiqw==
X-Received: by 2002:aa7:ce99:: with SMTP id y25mr22312671edv.167.1614003338447; 
 Mon, 22 Feb 2021 06:15:38 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g24sm10595553edq.43.2021.02.22.06.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/8] hw/char: Introduce SH_SCI Kconfig entry
Date: Mon, 22 Feb 2021 15:15:10 +0100
Message-Id: <20210222141514.2646278-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_SCI selector for the SH4 serial controller.

Add the missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS         | 2 ++
 hw/char/Kconfig     | 3 +++
 hw/char/meson.build | 2 +-
 hw/sh4/Kconfig      | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b2aa18e1fe..b53a937714a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1388,6 +1388,7 @@ R2D
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
+F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
 F: include/hw/sh4/sh_intc.h
@@ -1396,6 +1397,7 @@ Shix
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
+F: hw/char/sh_serial.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
 F: include/hw/sh4/sh_intc.h
diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 939bc447588..f6f4fffd1b7 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -50,6 +50,9 @@ config SCLPCONSOLE
 config TERMINAL3270
     bool
 
+config SH_SCI
+    bool
+
 config RENESAS_SCI
     bool
 
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 196ac91fa29..afe9a0af88c 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -31,7 +31,7 @@
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
 softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
+softmmu_ss.add(when: 'CONFIG_SH_SCI', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index c2008c6a0d2..47240aa97b7 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -20,6 +20,7 @@ config SHIX
 config SH7750
     bool
     select SH_INTC
+    select SH_SCI
 
 config SH4
     bool
-- 
2.26.2


