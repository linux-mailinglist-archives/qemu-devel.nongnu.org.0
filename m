Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E8321A4C
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:27:09 +0100 (CET)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECB2-0004uD-2H
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC0A-0003jm-55; Mon, 22 Feb 2021 09:15:58 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC07-0001OQ-3R; Mon, 22 Feb 2021 09:15:53 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d2so22081292edq.10;
 Mon, 22 Feb 2021 06:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hp9J4XlTFMOgSc10T5wq2uqS5gyz7FKlM3WI8mfVyY=;
 b=S4mPBzjcKzRRKyAdAa+0353S3VJ0sWtOHo4WZcFQ4AyC09wn5qMlYPVLd4Rlj7BG5i
 1WHFPycXRf3xjh53YVYDnD5QRP8Q5xM3Y0xnVPVCak1gCbOd6nIa07c1ed+ZVaa0KbVk
 Vm5dGzlzv145xYE4QwjN3dKlAQWyXG9/a/Tl8BKxby0NdbzkC8ZgJzkUumZlEiNtzX7E
 7QU4YCTaeenyTETFio5aal97TKvicUwcteUzOCF+2XLc7mr++5ao54buvOnk9oJj4vqi
 x0viOrrESBu3EqUmHMVZeXIZS6RNdG79C5o8cd0X6nQ9GM++uc3AVa2bDtCgWodZ+fro
 VYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7hp9J4XlTFMOgSc10T5wq2uqS5gyz7FKlM3WI8mfVyY=;
 b=HzAiucawgr8bji+xVUpCjvi/AqEQKllnzhWIYSViAXpOp8Hp6IrGI2N7Ja603mt69G
 6tyoFd59vdGLm6kqvoqtoKsZCq3JOxYdNPFRmGBDYFP3Pk6CHRADTpYRUaO1qLI3JL1w
 dfjCDNvbKov4oXOFqp25wnnMu4Ewbo8SuAAPjIGv7nOugid4pjRE934mBcHFI4UvGZM6
 RjxTB+8wSfEO3yJsGvYuL6WpUZoGmsR4vDQ0msJ7qy3cmpky8YWceusxAgrOyg4DV5xR
 HAkhKF86WlhKoA61fB7U+Ctw4JURntGGHGzpf2q4f3QxOrHHy2LWq//l51zTn60MTdAx
 NQAQ==
X-Gm-Message-State: AOAM533nIkKSnReBr5qs/HlFpeu2EafuFjFyzDDKMmpPjJr0r/em29R7
 wwoe4yZmfbCLNUwYimLPwtVJZqKcmbM=
X-Google-Smtp-Source: ABdhPJynDoqtorc63NNrUTyxCuQDuIUGaWXUUAoxDilYi+a+ItuTlBeNDvIk5w1W9F4CaxkjPxgprA==
X-Received: by 2002:a05:6402:605:: with SMTP id
 n5mr22736603edv.128.1614003349231; 
 Mon, 22 Feb 2021 06:15:49 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d3sm12480088edk.82.2021.02.22.06.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/8] hw/block: Introduce TC58128 eeprom Kconfig entry
Date: Mon, 22 Feb 2021 15:15:12 +0100
Message-Id: <20210222141514.2646278-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
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

Add more fine-grained selection by adding a CONFIG_TC58128
selector for the TC58128 eeprom.

As this device is only used by the Shix machine, add an entry
to the proper section in MAINTAINERS.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS          | 1 +
 hw/block/Kconfig     | 3 +++
 hw/block/meson.build | 2 +-
 hw/sh4/Kconfig       | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a03557f4f7c..a0cb89161cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1398,6 +1398,7 @@ Shix
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
+F: hw/block/tc58128.c
 F: hw/char/sh_serial.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
diff --git a/hw/block/Kconfig b/hw/block/Kconfig
index 2d17f481adc..4fcd1521668 100644
--- a/hw/block/Kconfig
+++ b/hw/block/Kconfig
@@ -22,6 +22,9 @@ config ECC
 config ONENAND
     bool
 
+config TC58128
+    bool
+
 config NVME_PCI
     bool
     default y if PCI_DEVICES
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 602ca6c8541..4bf994c64ff 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -12,7 +12,7 @@
 softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
 softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
-softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
+softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c'))
 
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index e569470a614..34c01dadde9 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -16,6 +16,7 @@ config SHIX
     bool
     select SH7750
     select SH4
+    select TC58128
 
 config SH7750
     bool
-- 
2.26.2


