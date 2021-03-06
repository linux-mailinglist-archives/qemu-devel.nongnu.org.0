Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006732FB66
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:39:13 +0100 (CET)
Received: from localhost ([::1]:45420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ1N-0002Vv-1A
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzY-0000ql-Ja; Sat, 06 Mar 2021 10:37:20 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzX-0008Mz-2x; Sat, 06 Mar 2021 10:37:20 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 124-20020a1c00820000b029010b871409cfso1135034wma.4; 
 Sat, 06 Mar 2021 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l/Phx4FGKpSmQsBkXzl/eBAwn7MJ4VQTWO4Xid9Q6lk=;
 b=eiGTFzDagAyLRjQn8psm0wyLhH4II8gNy5BWM+c1SAyw/E3/Orjx19GjWA/8MGISOy
 Qj3gJVynv7QJogT+ai5qDPHjUE/wvHQaLYcylueE4ZU9UtoZD0nhrRNci72p2dY7ucQS
 s0qctcSNSHixYqz05TsUrxdwx7l14b9ARsCgU3j3ROZH9VmhqO86Dko6HEYRGjIijlV/
 qcw3LDs5yfoxAIqStfihHuukcvNYu07BGGVgV5VGZ2wpO5nzbrWWkgal4O2S9DbSFeUl
 uwX324S0xcyp+wpht/9mXPS2WaEVOBDB9of4hO3EpO4bYuKE4CL7S5z/ngPZt6M+seBe
 qqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l/Phx4FGKpSmQsBkXzl/eBAwn7MJ4VQTWO4Xid9Q6lk=;
 b=LHnjeq2ecZlp/8L0jaOFwuWmlwnX/XBFSRjbn20HWvLdHHfMQWSrdT6yhokvGzDw0c
 T70tBn3RxA7CVv8MaGRcsXmBTKwOw0BvgZKSZZclzF7rmasxXxPOgivUrIIWG3Kvg8Ug
 r0s9hwd8cs/xmWbLKdqDqMtfZPEyoLK3lzZTf/yX3YCWw0Ono9FEcdLHFmol9H43e1Cb
 VVnES2y5+X4u1lJ+WdFlkAQ2049lrk+LcH8wOxY0MCLUD2ZiYnbCTgdzFNxpE3OdLFw0
 8ZDQxcHyDd6WZy+tIIuOI9TTizUsu/xsNpAF+mC7TzqJOXSTrkBhtnCBYYdXsVsiCHOB
 WflA==
X-Gm-Message-State: AOAM532sn9sBX8croz9/XqYusEvFj3hMj+RfvArtSqq1zrc0A3s/q19m
 u0XAkOhvQxPSu5ykpYvNNNLD/vqdFPc=
X-Google-Smtp-Source: ABdhPJxfpUQ5LRk2t62uKXIhWM66CzlkFUEimH0SucMle+D1zjm/5PvqsAvh7D1GdsNKOfLl1O3S/w==
X-Received: by 2002:a1c:2288:: with SMTP id i130mr13897572wmi.62.1615045037226; 
 Sat, 06 Mar 2021 07:37:17 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b15sm9184894wrr.47.2021.03.06.07.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:37:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] hw/block: Introduce TC58128 eeprom Kconfig entry
Date: Sat,  6 Mar 2021 16:36:18 +0100
Message-Id: <20210306153621.2393879-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add more fine-grained selection by adding a CONFIG_TC58128
selector for the TC58128 eeprom.

As this device is only used by the Shix machine, add an entry
to the proper section in MAINTAINERS.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-7-f4bug@amsat.org>
---
 MAINTAINERS          | 1 +
 hw/block/Kconfig     | 3 +++
 hw/block/meson.build | 2 +-
 hw/sh4/Kconfig       | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a722c44b1b..109890af5e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1407,6 +1407,7 @@ Shix
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


