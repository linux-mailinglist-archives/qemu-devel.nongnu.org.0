Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50F313FD9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:03:49 +0100 (CET)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ClA-0007W2-2t
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:03:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wo-0004jL-JY; Mon, 08 Feb 2021 08:51:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l96wY-0008L9-Qf; Mon, 08 Feb 2021 08:51:18 -0500
Received: by mail-wm1-x32e.google.com with SMTP id j21so10610483wmj.0;
 Mon, 08 Feb 2021 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ymgca9dXIBWh4OYOFB4RihA4VVSB+doofzMZFtWgb/M=;
 b=XEcEW2QEsqIK/urB0eT6rjCAhu/ZzOOusqghDDaRGvWe1tx6o3XfF+e84xUu9mY5zs
 0Nkgbcm2GFUnj016QtOoKNug2K/hyb4o1o1WhrbakZY2MjT6nN3plfxfhx4bo6gFOIwt
 Hx8xJLtA++dQ+rulzuAUmSgXJ23fxk4ZA5mgcK+mplT/i1sbUX6iIp1t3uHeTpvTMf42
 /AarRFo3wTqgQnJgyJoXejc1VCq0Dk/zzIp22vtZGyIKzam+ukA7zciPO6FacUgQGztL
 59hGXPJTiXFoOUF5pJtnXryOkufY3X8g3fN7GJl9uYpWXeAVodNv1MsSz7zcrOyUCWb+
 WZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ymgca9dXIBWh4OYOFB4RihA4VVSB+doofzMZFtWgb/M=;
 b=tObTYhQ+zus1AvtZTsC2+O32j1QKeXfs5+MsjvyMcl7S/jaCMqPVS6lfqcPYgFKE0n
 GIngG0I0+lUijOjUe1IOKVExP1JZ1S2kBbGXCx7vFMxmc2t6zp3xq07fbjnXZ5MbrcD/
 PLdnvRFQ9nL7MnrgOjIUpxCvbvWKx2uFHujI05Rsr3Yk1iwNCgE+aSdCXNZK83TgZxp5
 Sm2pkTJP0DW0FNkgZNRL0HqnfTuW2Fy1ENDz/FZwNPLgFbjSpXT2JE7YZC4CfTZptMBH
 dDnPcrDQhwbohb/nxsy9EOUALnPRbZJGLu6iWJe87B39SPfwGtrFmk/4pKwgUkh/Epmi
 +ldg==
X-Gm-Message-State: AOAM532ZwclrU21Nmx4UYV/uFcfs3hNd9LIBI69CADzxbJK+LpgQXor2
 jChLi3MD9zl7qGBWD5+4ioTRBNXINnA=
X-Google-Smtp-Source: ABdhPJxhOxbbJ7dYS/BC6/g5z8li9GPE4mohlkGa9ZmlIjo8sIKV/LleANEokU8p9LP9sSzOXhQRSg==
X-Received: by 2002:a1c:9dcd:: with SMTP id g196mr13268465wme.30.1612792255257; 
 Mon, 08 Feb 2021 05:50:55 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b2sm9058955wrv.73.2021.02.08.05.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:50:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/sh4/Kconfig: Rename CONFIG_SH4 -> CONFIG_SH4_DEVICES
Date: Mon,  8 Feb 2021 14:50:45 +0100
Message-Id: <20210208135048.2601693-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208135048.2601693-1-f4bug@amsat.org>
References: <20210208135048.2601693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. As CONFIG_SH4 is only used to select
peripherals, rename it CONFIG_SH4_DEVICES.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/meson.build | 2 +-
 hw/char/meson.build  | 2 +-
 hw/intc/meson.build  | 2 +-
 hw/sh4/Kconfig       | 6 +++---
 hw/timer/meson.build | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/block/meson.build b/hw/block/meson.build
index 602ca6c8541..f1deee2d648 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -12,7 +12,7 @@
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
+softmmu_ss.add(when: 'CONFIG_SH4_DEVICES', if_true: files('tc58128.c'))
 softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 196ac91fa29..370f5d5ad17 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -31,7 +31,7 @@
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
 softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
+softmmu_ss.add(when: 'CONFIG_SH4_DEVICES', if_true: files('sh_serial.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
 softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 53cba115690..7f2a0fed2e3 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -47,7 +47,7 @@
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
-specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
+specific_ss.add(when: 'CONFIG_SH4_DEVICES', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 4cbce3a0ed5..c20b86e3fde 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -9,16 +9,16 @@ config R2D
     select USB_OHCI_PCI
     select PCI
     select SM501
-    select SH4
+    select SH4_DEVICES
 
 config SHIX
     bool
     select SH7750
-    select SH4
+    select SH4_DEVICES
 
 config SH7750
     bool
 
-config SH4
+config SH4_DEVICES
     bool
     select PTIMER
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index be343f68fed..a0fa3845d80 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -30,7 +30,7 @@
 softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_ost.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SH4_DEVICES', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
-- 
2.26.2


