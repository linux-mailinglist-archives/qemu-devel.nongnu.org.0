Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671A3320E24
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:03:44 +0100 (CET)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwpL-0003iB-Fd
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlj-00011R-36; Sun, 21 Feb 2021 16:59:59 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlh-0000uV-EQ; Sun, 21 Feb 2021 16:59:58 -0500
Received: by mail-wm1-x335.google.com with SMTP id p3so1631486wmc.2;
 Sun, 21 Feb 2021 13:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ovub84nCGVfLFxNonCbiooQfVF55Jqzk/XVkN/CYdxU=;
 b=sR7oKpvXtAn7K8N6IY4tkTbL8LfeLUefWC36luxPq+lhmAGfDPNCn3RaZg3FIu5Dcd
 vLWCHZhRqJtowAgmxub/qhmm9U45+rBdjSwtQw+3Gyqwy3bfuVELXulqJtUFwAcCVkBv
 8suxqMoBUMf7Uw5q5Gm4fXad8J1DF7u+0r/o7KQAmYqgPMNIgP50h+JaKQmFdqvsV0tY
 Ojitoh2uoQLwJnpCKI373tyxw2rY4CwBulDm6YM4+tnh/t6MSKnBBqwYHQJ1sA9rB5bX
 hU1YZMZSArJcxaMqP6JqSCekzQ+VEDQbG2M/KPWkB8H60pwqhg++yaFzuIa1p9TVC6Zq
 kQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ovub84nCGVfLFxNonCbiooQfVF55Jqzk/XVkN/CYdxU=;
 b=d51Y+wzFHYSrqLtvy4zi97g31bH2Rlu/XdBRO4jlGuvv+iLPaGZ+Zvi+FqfKyG1F8c
 bHj8aADGbnhAuEGaBIB3kk0kDbv0zC2y9zcrpn8ErlwIiHzHwDkZxR70OTDvoSWT5jqv
 1TfqX/KnZZucuqZ1yVfs+7GedwpBDYZLZLA98eOlv6ZNHwqm1K2FgBYFWbYn4YNR8e2X
 PtmUsvn7nNaWXY0AFV29jNrSFZmbji2ruqB/3NgXR/m6XkXlrB5j3cCBXIohdPxHBEPG
 LOkZdQlsP5UPPlSXMIurPWXFILCzZU6fqCchbMyPR8UFjaUVx3p4OnezTZLQJbzWzhHc
 Un7w==
X-Gm-Message-State: AOAM533OmDG8cl/uDR69BJGVxOuperSyOy873JLuRWXxARNTSH3iUSwC
 SO7KuNmOVyiuNS/y1JrzAwT5jWpMXOs=
X-Google-Smtp-Source: ABdhPJx97x1UqBm4uzB2HTO0H402DhfGr2Y97WeYzStQ4cHYBO9SGVmBdzGxvR1EtjH7WwJnpnWeIQ==
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr15626284wmg.183.1613944795028; 
 Sun, 21 Feb 2021 13:59:55 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m6sm3039018wrv.73.2021.02.21.13.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] hw/pci-host: Introduce SH_PCI Kconfig entry
Date: Sun, 21 Feb 2021 22:59:14 +0100
Message-Id: <20210221215915.2568943-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221215915.2568943-1-f4bug@amsat.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
a CONFIG_SH_PCI selector for the SH4 PCI controller.
Move the file with the other PCI host devices in hw/pci-host
and add its missing MAINTAINERS entries.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
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


