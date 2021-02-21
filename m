Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A1320D85
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:15:10 +0100 (CET)
Received: from localhost ([::1]:44882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv8G-0005Wo-VN
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwy-000422-1I; Sun, 21 Feb 2021 15:03:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuww-00084n-8Q; Sun, 21 Feb 2021 15:03:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id r3so5274492wro.9;
 Sun, 21 Feb 2021 12:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DggX1m2mxe8Ghm6QtFBVtBRStF24z4AQO4nQOdJ8O1M=;
 b=ME1tbfFA+GeMbwIcO5XlEqyxdL901SsKzG+y9Y0eaeIkNdGC0I7OCZ1QbYfn+Dd/s1
 JcMabj2b7dKJvOb5ekSMAdJYG4NTPKtbefUeXlfvHxNmzPAkPfj3fi6eEqQJsIGFMIiH
 MRQoBS9SlhDMu/pJzttwSiVNoF1IafOs0FrEJ2oB+4i0bMySTbCqbgl69boScmR/I7H0
 rulfOHKOUNPUFr+2bzaDOwl9aWhqXUlImuvgznlI/GI+MhczC6ymF0EDZR6mbgHg8+Kc
 SaBu/hhoBXKgFXFjMEXuxzTPViaiWGGayoz0xNh0oybQBJoWvY69SnpTXXBA+P0H3MeJ
 UWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DggX1m2mxe8Ghm6QtFBVtBRStF24z4AQO4nQOdJ8O1M=;
 b=SL06E+USOP4Or0oJ+9ij/HtmOVbPxiZ2GPxoYV9FzctCztwo1TTjeKCYqlsgnDlkLV
 Iz1aKGXVkOHQyYurWtJB/BhooXbob0jZiNlax+Az+G56EfrnasN4d5NlehhtrcnmBgGu
 N/rk7RfUPk6SO+b3hYGvmZSNZwDmawd4ysTTH0A4k1Pn1H/tzWQZNUU9uMvQPbq1hLL9
 dxVZiVHjzx3QlDIbvtTLSLMudjEN8iYUHQZkkz9OWlqff08hvVeMkdC4K5Bgp0rCbvZb
 JaQ2/nAmwIgbqjMkmvBDajcv3NsPjgJS3/CnlmimNw4b/l/re4g82NUz8NrCIPH3C2Wz
 nt9Q==
X-Gm-Message-State: AOAM5334z6ROOHbBzkoOKtCT72PDM0gZ8SkJPV3ZMj97X4RAGvoJyENF
 ZIFqgnRJiq5ZvaNiTzDHWeuIdkOy2yQ=
X-Google-Smtp-Source: ABdhPJxfdfshbSla1A3QUVtbOUToVmcjnu4v2jLsHNIb+bh8YNSd83iXf5/yAEfq/MGnJGekzXCD4g==
X-Received: by 2002:a5d:4ec6:: with SMTP id s6mr1628279wrv.416.1613937804328; 
 Sun, 21 Feb 2021 12:03:24 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m2sm22074858wml.34.2021.02.21.12.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:03:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/8] hw/block: Introduce TC58128 eeprom Kconfig entry
Date: Sun, 21 Feb 2021 21:02:47 +0100
Message-Id: <20210221200249.2536247-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

Add more fine-grained selection by adding a CONFIG_TC58128
selector for the TC58128 eeprom.

As this device is only used by the Shix machine, add an entry
to the proper section in MAINTAINERS.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS          | 1 +
 hw/block/meson.build | 2 +-
 hw/sh4/Kconfig       | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cacb5d125ab..6117ad414a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1397,6 +1397,7 @@ Shix
 M: Yoshinori Sato <ysato@users.sourceforge.jp>
 R: Magnus Damm <magnus.damm@gmail.com>
 S: Odd Fixes
+F: hw/block/tc58128.c
 F: hw/char/sh_serial.c
 F: hw/sh4/shix.c
 F: hw/intc/sh_intc.c
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


