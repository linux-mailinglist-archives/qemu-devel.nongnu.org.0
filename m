Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51232FB74
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:43:00 +0100 (CET)
Received: from localhost ([::1]:60078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ51-0008T8-3a
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzd-00011y-Ec
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:25 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzb-0008P6-P7
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:25 -0500
Received: by mail-wr1-x432.google.com with SMTP id d15so5892816wrv.5
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mBQy7H34qbQ/oVKhr/I/dCedDrf+dnuJzMZjQP4qUxI=;
 b=Ox5nKYGWL8Hezra+cdZ/vy0FmNHFXwWjyJ5VyqcwtqPEvdmQ9E1wZnW5NRCjiAqVUx
 SEWcWfvGSnDZt3JDMYDRa3jlBNWkzXDzLrPOgIQxfvXHunH9mtKr3tXi8lyeyYPsOiSd
 IOtUEEq0FGmA28gMdqX07bY2SsHPQkMU3EKqWxaaDSECuGLsq+aC7cV+lsyl235AVgmw
 6Xl42pVllm38HoOGkfF+Jsq4xUjlt+P/1DBHj3g44WF7gHXA6aKHhtrYLViTKjpcDpMM
 yRzS4oh8o1JRnXJrOb3gKZ4yEHBHxA1NlHGhRaryQBKucMDcmswGwqTwalmyKMRL8SH2
 bzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mBQy7H34qbQ/oVKhr/I/dCedDrf+dnuJzMZjQP4qUxI=;
 b=ho4PcSdafZOijhS09Ul0tBZ/jiKjv2Xxp9rjHcnYc0YzY0lovED8c7mLALqjOa+Gpb
 SwY913d3ub1Fi055yqO55Q/zCgMo2DpOeYGnJJ5b8ewqJksmVeJsKgE/68Dy9VOA5Gn4
 2s6Ylr0SY0hFEYJC5RKXCcBxJBY1UALF7/eaWjSs0JSTF8PtLuPMS2YYM/QS2BjIKM4x
 Q8gvasLZLJJOWdc734HQkQlbX/AxF2n5k51cc3hu8zWXe9ay4YDMH5OLqa3xgqrDdQxh
 pkM9DiO+hTfg2CcqUbIzUKkRqrMYpbtp7z9am/HoZF6V2rEtdT8ZxUF6JfyU7exw68Cy
 JHYg==
X-Gm-Message-State: AOAM531ib4m7oxtTc5vwyOK02CMaQmPfEvDhRM1P5orWBAn90HfOUW2F
 dF/NfxSUovkwT5c3CUPLlZLK9lbxfqA=
X-Google-Smtp-Source: ABdhPJylrEzB1C3fRidTNqS28czEWEjWRP65plQNL2TbxRByY06Hn0AGELwIBXaWOmY+lE3lq6iacQ==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr15048027wrr.30.1615045042223; 
 Sat, 06 Mar 2021 07:37:22 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z82sm9168036wmg.19.2021.03.06.07.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:37:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/14] hw/pci-host: Introduce SH_PCI Kconfig entry
Date: Sat,  6 Mar 2021 16:36:19 +0100
Message-Id: <20210306153621.2393879-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-8-f4bug@amsat.org>
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
index 109890af5e0..f22d83c1782 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1400,6 +1400,7 @@ S: Odd Fixes
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


