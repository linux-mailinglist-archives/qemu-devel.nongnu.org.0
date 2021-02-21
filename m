Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD8320D6C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:11:10 +0100 (CET)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv4P-0002XK-TE
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwo-0003uX-BP; Sun, 21 Feb 2021 15:03:21 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwm-00081d-Li; Sun, 21 Feb 2021 15:03:18 -0500
Received: by mail-wr1-x432.google.com with SMTP id 7so16941112wrz.0;
 Sun, 21 Feb 2021 12:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+e2u3tqEz47yl0Tpv1FDkuej/YTyk4vXNRGouHyGkiY=;
 b=A6Jb5LOF2kMWFt54kbWlU5W+CmV+9YDSO8HooN54IR5HV63Nvveubt0Ktwfyja5NZQ
 AYIwF4VMpH10wB78z7f1vgKXbDdfxSLq6agixjoC87KwsO0v6iiQ1NdMMCa03/tKnMzM
 xinAnMncI8yaNEjewSkLDlPD/EC5Li9M15QMAzPJkZP9fnRKl1y4s2tEwlYX+zwny3Bo
 jjWL3ksJXWCdZXZ2AcCjJR6wOEZKRApgvobMciCIwyKN5ZLL2i1RnVTcnxuQ7cFA/Tqx
 eSmSwjfDM1nvvLRf14GrQEyjbJuDYzsIq2LiFOk5hbgAzkQTOIffE2481uSb6saI8VVS
 JRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+e2u3tqEz47yl0Tpv1FDkuej/YTyk4vXNRGouHyGkiY=;
 b=pGysblKiFi7Jy6mIWcGAsLzHRkod3yPnetbJC6jyF7jB4H/w37DDDK5rTJpfAepL9G
 nWQO0sCquXTOiW8/SsZhUfFUWMPi5Lnym7eVagX5gdARHvEsn/VSANOIaLo3jXVvT6EW
 hfjidaGfmnbPz2+s3FZqeTM1VwqxkeSxY4nbXhQECFf6+1kHQZzdyCGU7vtqysHwy7ch
 NtPuvHJFCH41B/DSkxGj9fS81GkySsJKrnPRJIB5Qmioh/VNhdzR3L23E4c7K/4qZHgJ
 Epy+ZkispquAEXYraUYTiiklhStvQ220PNJEP1Meg7NmXBdjOUnN2bWvzzPslp2YW0uU
 zlNw==
X-Gm-Message-State: AOAM533vJ2VsWi5mseGA9YMxNocbcm67DiK/RAFqu13/TSCTBNe1ncdk
 laxOSv94rpqUHrVdNipVzsNlGK2mEA4=
X-Google-Smtp-Source: ABdhPJyG0lieoNJUUhuVYthhxzdlCzRhRbDWxlYuRealSuHwrx8viGC7pryoVa6M2h9RqnlXQk0BqA==
X-Received: by 2002:adf:f80e:: with SMTP id s14mr18927038wrp.363.1613937794278; 
 Sun, 21 Feb 2021 12:03:14 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l1sm22971851wmi.48.2021.02.21.12.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:03:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] hw/char: Introduce SH_SCI Kconfig entry
Date: Sun, 21 Feb 2021 21:02:45 +0100
Message-Id: <20210221200249.2536247-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS         | 2 ++
 hw/char/Kconfig     | 3 +++
 hw/char/meson.build | 2 +-
 hw/sh4/Kconfig      | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index da10756abf7..34587d90637 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1387,6 +1387,7 @@ R2D
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
+F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
 F: include/hw/sh4/sh_intc.h
@@ -1395,6 +1396,7 @@ Shix
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


