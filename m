Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D26320E27
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:06:25 +0100 (CET)
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwrw-0006qO-E8
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlh-0000xW-A2; Sun, 21 Feb 2021 16:59:57 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlc-0000rY-5U; Sun, 21 Feb 2021 16:59:54 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i9so1844459wml.5;
 Sun, 21 Feb 2021 13:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hp9J4XlTFMOgSc10T5wq2uqS5gyz7FKlM3WI8mfVyY=;
 b=s+JcQEErKuLhcwwbVb1K8peEEmJHBbNZo5HmQXN+y2mRYztqY+FJV0qYaZ2Gu+b+kN
 GOLsRENWFOY6x0rRMKfGgNVG2DRYPCD/3nzU0Zw7EHd0KGgnG4feuDqGJl63ksy8+Sg0
 Q2OmKSyAyzmRv/d5Re4/pVjDZ5fzvXu3z+EGnAK9B+dVQdHNcXeM+HJs8nU7hGOIBLwD
 6gFUAV2aspoNPTNtc2trS5rh+8S6/hLvUPR6G0r3xJeMPYKhoc9AZTDJkSvU1c4z8zeS
 hcM3NbrbXomj/IQQsS47pWE0pM3+Ai36vcTRO/ZNhsBtAnSu9lsW2vtJNzxp25IgNyPV
 ywfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7hp9J4XlTFMOgSc10T5wq2uqS5gyz7FKlM3WI8mfVyY=;
 b=h/Gua3H6w3bZxsGOeTAhFngib/8SqICfcbjpEyInbTYRyVK24Py5fuadsmPfIq0eNR
 3T337vLviQcJniJTZUu2ekTLd3y3iVuYpiYO5/zwUbqQY8OKmDTBQFQ8cYbiDj9V21KQ
 P3tVnc6S84ruEsX7KKnMJM77O1KGrL7fYD7dHvqN54YVtflLRaxLoMyarrvaH+yPpqzv
 CFmbzlBPap48fJ/41BnK3vCC4t6KQPgirJlR/NzVpenR8131o6ZS0NtLHFL8K+1+aKV5
 LUu/qwvD3TSfBHLFxIm42ZBO1FFQcpli/bm6IRspOOr9OyjmxQAqLlSz0L8CAThdywYv
 +zUA==
X-Gm-Message-State: AOAM532OPvTqkAmGnHuUMF33Bg2r3RW82tzuLvoCwOkxx/mczsIVTbKQ
 m0KbNaZkftg9CR4f88My6Qp9rXAY8Oc=
X-Google-Smtp-Source: ABdhPJwy/mIT6e06SwFw9lqOv2AmZkDMJ52kwD57gSndlIo/tJrr4XjZewSWHCaAPOPaHOehURZBHA==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr17162727wmc.152.1613944789865; 
 Sun, 21 Feb 2021 13:59:49 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y62sm27723375wmy.9.2021.02.21.13.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] hw/block: Introduce TC58128 eeprom Kconfig entry
Date: Sun, 21 Feb 2021 22:59:13 +0100
Message-Id: <20210221215915.2568943-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221215915.2568943-1-f4bug@amsat.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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


