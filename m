Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE22320E28
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:08:16 +0100 (CET)
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwtj-0000lv-9G
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:08:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlU-0000qZ-Ro; Sun, 21 Feb 2021 16:59:44 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlR-0000oR-LO; Sun, 21 Feb 2021 16:59:44 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so17109122wrz.0;
 Sun, 21 Feb 2021 13:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mxqq1fIETdh/e8tcYC6fmyKoJfUnWAtkX7IT6VSa4RM=;
 b=pnQ6YkyCYARRx1npwueB/Opd5f77HgjPTZR+0TVZjAvBZXBudSGR8fmHU8ZSHkvm5Q
 p4rkWydq8MF8ztWcXcYErEiZH4dgVT1kSYtpiOxJ3Ovr+dLSjOdpsE2x0JKx1Qn+uNUb
 RID4QNDcm4XSBov0oMvkIVNV264EpqwrrjQ/LFDmuVPUa4IFR+LhzimLMLAD8OLWUasM
 961foLvH/LtO7dkgbU6chAe1LoRW6jZl5C46N2VO9B7D6UlozalkBptEd/aDiurOKBOP
 crc8V26Jm4vkITG2ydZm1PfuplhfLpOHBRSQOqFCRCbgfcZ8/Ost4Bv/GJ5KCBEKTo6F
 ZWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mxqq1fIETdh/e8tcYC6fmyKoJfUnWAtkX7IT6VSa4RM=;
 b=Pn6o//SoUXdtoZeT94pg9d37xGe+X4YtVU7iCRxqG3ZczBpSTqYcxocAaLAd/EB4eU
 ei30092KK2WWz0WQq0CS5yFVqOPn7sSheN6SIk6gnOVuvwaCcfGxtr1KFQASsVLNMT29
 qLURMfy+oUArohPk0Prb+b50Xnkvwf6oMMGcgQ7UgXuvDOj3PTs3ObdlBbfHggpL9XhO
 nzWjMeUoNzZXXIrnjqKJ0EhrZqBfjklrjYoZd7+IAkhWUmZ4O5ZUU+8I6rNn2tUyXFSD
 bF3FYs8f2H2UIRxELZsp6BoQ79iGNbT7cS6JvVO9lpy1Jp+M3GKN254oJRKIDci0HIUI
 halw==
X-Gm-Message-State: AOAM5312gboXcOKsK50EQ70x3C2QuHUEUUam5HpufKJIoyFVOUt5C3uD
 /6MMTYfwlsthKXjqgSxmE/kf4netpTU=
X-Google-Smtp-Source: ABdhPJyL1v94OS4X+WmhKknJthaJ4y49z0lhgX9FmIe/v/gXioMyt5bnp+7EOuuc1hBPBL74/7ZROQ==
X-Received: by 2002:adf:fb03:: with SMTP id c3mr18898510wrr.395.1613944779233; 
 Sun, 21 Feb 2021 13:59:39 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 36sm27599369wrj.97.2021.02.21.13.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/8] hw/char: Introduce SH_SCI Kconfig entry
Date: Sun, 21 Feb 2021 22:59:11 +0100
Message-Id: <20210221215915.2568943-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221215915.2568943-1-f4bug@amsat.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
 qemu-block@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
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


