Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599F321A49
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:26:07 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECA2-0003j5-Bj
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC0E-0003kK-02; Mon, 22 Feb 2021 09:15:58 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEC0C-0001R1-G0; Mon, 22 Feb 2021 09:15:57 -0500
Received: by mail-ej1-x629.google.com with SMTP id j6so2519440eja.12;
 Mon, 22 Feb 2021 06:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dt0TPWfRw0bUc8gL4xdOObbvdKva6Lo8lCu+ETr71Hk=;
 b=n6Xlc6PZ5CJvLKtZTESSyMFUU/zfypb0BdaObNmX7NcKoVzQGMD9hq9XwgBIv32Rq2
 flWSIpbmBwrxuHW90ndZfE1f4AXDZ7Uf0vTYdb8IpR01ab+AYGhZXvx74di11wIf4aQM
 ePraXJYdg+zYwrCXTwkjPK+hlQuEiTnTyMHVQbgmzY71EVYP/GoTk65xJn6RFm8TFIse
 y5FPfIca9S+I9JfLBOCWpOgcJBo1tab3IaRDGlCBkgdY2LkeYIxa1llXK6oguIUrxdPU
 gDql3axamrfuVs1Y0Xzdyy236217+e/d7KSuQJ1wBJ0uw+FJ+3/ArZvp1yixW45oZmP5
 nIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dt0TPWfRw0bUc8gL4xdOObbvdKva6Lo8lCu+ETr71Hk=;
 b=TzoW8NR6Y0LvxsozZeViRH0JESVyoO+Gi7mJpy2zYzbM4vAvhOoas2WWgCrrzFZ9OK
 ld1LxRl5emNNnDVh/xKsoP2003QaFd+GAKh09Swc0rkf5ixMSD9yDH6dVsNkSwwKNPIo
 4HLvMmPqLlCmQTyeM2ngSSlfOO5BlIh6d9ig7nqQUMPys6N9SoTHtl6A3jTJDekqWd76
 07ZOoKZBqbazSB/F9D3YjIMT8X5sma+l+wxZ3qeJAEMgrDh6P5iwON1nL6sUsZxN+Gtt
 QbdtaUdK/0DKKQfSgtB/d/WqPL0EPO8SLTtvcOZdPUOjeoev2h7bPsJYM2g1Scd/eeWL
 rKFQ==
X-Gm-Message-State: AOAM530jbxHbozESDjmfiNM9TtuSwbBRZHUwy8JVKCr9R6Oz4CECS3dJ
 YfE03aNKPO62yJkqGDZk4SBZhPsQ7sM=
X-Google-Smtp-Source: ABdhPJynYcqi1QatxIjEkXzB/cPvv/6gOAci89rFt0NzdlO2+F2Ug48nvc4u6LLtWvVwnxq/weuX8A==
X-Received: by 2002:a17:906:fb1b:: with SMTP id
 lz27mr14216709ejb.194.1614003354604; 
 Mon, 22 Feb 2021 06:15:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i13sm12279889edk.38.2021.02.22.06.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/8] hw/pci-host: Introduce SH_PCI Kconfig entry
Date: Mon, 22 Feb 2021 15:15:13 +0100
Message-Id: <20210222141514.2646278-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
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
a CONFIG_SH_PCI selector for the SH4 PCI controller.
Move the file with the other PCI host devices in hw/pci-host
and add its missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/{sh4 => pci-host}/sh_pci.c | 0
 MAINTAINERS                   | 1 +
 hw/pci-host/Kconfig           | 4 ++++
 hw/pci-host/meson.build       | 1 +
 hw/sh4/Kconfig                | 1 +
 hw/sh4/meson.build            | 1 -
 6 files changed, 7 insertions(+), 1 deletion(-)
 rename hw/{sh4 => pci-host}/sh_pci.c (100%)

diff --git a/hw/sh4/sh_pci.c b/hw/pci-host/sh_pci.c
similarity index 100%
rename from hw/sh4/sh_pci.c
rename to hw/pci-host/sh_pci.c
diff --git a/MAINTAINERS b/MAINTAINERS
index a0cb89161cb..e39997f129a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1391,6 +1391,7 @@ S: Odd Fixes
 F: hw/char/sh_serial.c
 F: hw/sh4/r2d.c
 F: hw/intc/sh_intc.c
+F: hw/pci-host/sh_pci.c
 F: hw/timer/sh_timer.c
 F: include/hw/sh4/sh_intc.h
 
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 8b8c763c28c..2ccc96f02ce 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -68,3 +68,7 @@ config PCI_POWERNV
 
 config REMOTE_PCIHOST
     bool
+
+config SH_PCI
+    bool
+    select PCI
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 1847c69905c..87a896973e7 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -10,6 +10,7 @@
 pci_ss.add(when: 'CONFIG_PCI_SABRE', if_true: files('sabre.c'))
 pci_ss.add(when: 'CONFIG_XEN_IGD_PASSTHROUGH', if_true: files('xen_igd_pt.c'))
 pci_ss.add(when: 'CONFIG_REMOTE_PCIHOST', if_true: files('remote.c'))
+pci_ss.add(when: 'CONFIG_SH_PCI', if_true: files('sh_pci.c'))
 
 # PPC devices
 pci_ss.add(when: 'CONFIG_PREP_PCI', if_true: files('prep.c'))
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 34c01dadde9..b9f0538d57f 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -11,6 +11,7 @@ config R2D
     select SM501
     select SH4
     select SH7750
+    select SH_PCI
 
 config SHIX
     bool
diff --git a/hw/sh4/meson.build b/hw/sh4/meson.build
index 303c0f42879..424d5674dea 100644
--- a/hw/sh4/meson.build
+++ b/hw/sh4/meson.build
@@ -2,7 +2,6 @@
 sh4_ss.add(files(
   'sh7750.c',
   'sh7750_regnames.c',
-  'sh_pci.c'
 ))
 sh4_ss.add(when: 'CONFIG_R2D', if_true: files('r2d.c'))
 sh4_ss.add(when: 'CONFIG_SHIX', if_true: files('shix.c'))
-- 
2.26.2


