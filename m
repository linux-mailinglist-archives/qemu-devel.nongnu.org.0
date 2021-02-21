Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F119320D70
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:11:25 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv4e-0002iT-8O
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwv-0003vn-S3; Sun, 21 Feb 2021 15:03:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuws-00083B-7F; Sun, 21 Feb 2021 15:03:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a132so11690728wmc.0;
 Sun, 21 Feb 2021 12:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SscAxapg73VCziLIrtZXdLeUi08cdYrQoTkeiIFn0cs=;
 b=AjRv+y6w3TVGocmwyhr+wYQPEnYJq2SsWxBqOly0MY68WCnw7oD1c8vzCOjBVXbpkv
 AKy2P16ZPGivpGwWUKbfM16/ZkFsm2C+YYrDhnD8NAE5C2GWJooNsIvbkkP/H74GFjM9
 Jm3yCYhw0XJtknED+8cmYugtWTEXUOEh8hA7QKTBdqb6AaTKSX3nZYfVWhdig9/S4b4O
 QYi4t860A9X4xqTpFOFiR47I7cBaMou2iA3TIm8EZ05QW5xB61AAd08uewrqjMIZJsCJ
 Y3WmonovASrwYUDV3QZD1li7A2FpcqE5ciR9lQJiJUr+ofMKtXg57EDZXV/HYYOJZpzx
 ACDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SscAxapg73VCziLIrtZXdLeUi08cdYrQoTkeiIFn0cs=;
 b=GiMhytAP8zHR9ZoAg1kfYkGJzDKDvYQM3WY0mfCpBEfYf9bnbIMpjFxkGZ7XEnmfQC
 324guoL/7WEc9/RFhQZ83oRw6ZEUhb2s32YyAihHt76jdqpLXYn+zFNoCSjr02MpSoDp
 6G5sSvTqDQ5xkZA/nx0dyIJ0UJfqUuwgqsUDmgCgvGE8RxZzDNWoQo8HP+zR+dFQWtnw
 Jf0OvbgCuIn17Qv3Ecl6Pef/FLwQuK4bCrTpin5NEW/tfgCi6WZbD+QGFiIwKS196Xcz
 Nrk/JhAXXvnG6FJj4ewvO/iTrO29UWwn0dRoF2fr+haLs+4tb6CSJn5HNMoDcW/rh/H2
 J5Hw==
X-Gm-Message-State: AOAM532JA+ALzd8auGuErKHc04LpM0Vfvg/bFB4hQ4anAnXO7MDmWBjK
 tW21mAzYjMRozUz2QuwwZKGSF22mDz8=
X-Google-Smtp-Source: ABdhPJz6sh0GBSaxwPhRzfixpEbxg+f6z8SCaSrtE/km8OKFl7gFCkA7OH/KFtXumBcX8WNsBHD3Cw==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr17569272wmz.84.1613937799216; 
 Sun, 21 Feb 2021 12:03:19 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z11sm5670270wrm.72.2021.02.21.12.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:03:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] hw/timer: Introduce SH_TIMER Kconfig entry
Date: Sun, 21 Feb 2021 21:02:46 +0100
Message-Id: <20210221200249.2536247-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
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
a CONFIG_SH_TIMER selector for the SH4 timer control unit.

Add the missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS          | 2 ++
 hw/sh4/Kconfig       | 2 +-
 hw/timer/Kconfig     | 4 ++++
 hw/timer/meson.build | 2 +-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34587d90637..cacb5d125ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1390,6 +1390,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 Shix
@@ -1399,6 +1400,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
 SPARC Machines
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 47240aa97b7..e569470a614 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -21,7 +21,7 @@ config SH7750
     bool
     select SH_INTC
     select SH_SCI
+    select SH_TIMER
 
 config SH4
     bool
-    select PTIMER
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 8749edfb6a5..18936ef55bf 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -36,6 +36,10 @@ config CMSDK_APB_DUALTIMER
     bool
     select PTIMER
 
+config SH_TIMER
+    bool
+    select PTIMER
+
 config RENESAS_TMR
     bool
 
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index be343f68fed..26c2701fd78 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -30,7 +30,7 @@
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_ost.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
-- 
2.26.2


