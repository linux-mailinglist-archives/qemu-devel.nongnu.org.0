Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C033C3F60
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:03:44 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gc2-0000qH-Uy
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gYz-0006Mu-Jg
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:33 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gYy-0000OP-2p
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:33 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m2so11051354wrq.2
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQmgDwB2NZFiGAsM79pRGtZmuEHi29z7ud0aLRyYnZo=;
 b=WE9djIeII77bdT2A9/7DJKGgnpJQeTZ1JDXnVVeY5a1c5/H6BYx3+bECLgLYSHkEFD
 FRJjeusiBqW7uYqH7i1RutdWZg/Qat49JyVm4QmZctQlqB/242MpqH85wKNM3Ldl/nFq
 7oeI/ISh3xEAojrw2LacwHFLtJJld1TBZR9fVY5YiCsZ8GoRV9atPGHz9HCOShYkyYcC
 BQpP3TF7pHUwesJhWExW3Vr1bjxUbOMgw9sxcIqcpanhuzGFSHllx+5YurwE603nVftr
 hW+EuRlsVhtmxMJ1lv31RQPmpQMT/z/HsTVG4UY+YnuaXIY+ILl4igUjjthvlz5fKX2m
 /qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AQmgDwB2NZFiGAsM79pRGtZmuEHi29z7ud0aLRyYnZo=;
 b=kbJAsH3IWJH5+r7OMaIi659LvC2PYJd2mqM7LS8R4ptqlmPzMYNl1HSdcobkqteVSm
 oM9BYtmkVoEputSuZrMF5bUNV9mNXyZSwD5Rux0UGaa0Y/7CtSb54BpvZtvKfXEhSTDc
 M90G5mJYdh+w4gp2tgj+tDqrOq0Mvh5s3fz6NSx8UmJgYMd2EZmcPXxl2klMb6RAXzsM
 IV6xFuF6uzp99A1CHLAm+J2eW/zfiYE1o0dVInx4uo+y4qUFZthkJIvwUdC6kaEmbt90
 L1VvzRc7raGDuYc3FVrhW1IfJgNs/NPqtZMtesuwaSeUrVNVGhOfgnFHmbi7KUN02OhO
 uYUw==
X-Gm-Message-State: AOAM532YtXEmCIb6ptB3ZxWTsWNW5Cr4uGg37ACiSWLkROuCoj44P4g1
 Ex9rtDGSPJOw/zNnK7MQ8ipiSc659vu5BB90
X-Google-Smtp-Source: ABdhPJxbts48yQ0czzgj+0MsBCjkICjtu9Rqg5qXs2BREB4fisSJKhQcgbXs3oTs0fov9QM8Ujo1ag==
X-Received: by 2002:adf:b60b:: with SMTP id f11mr35493567wre.203.1626037230383; 
 Sun, 11 Jul 2021 14:00:30 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id s24sm12867272wra.33.2021.07.11.14.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/19] hw/pci-host: Rename Raven ASIC PCI bridge as raven.c
Date: Sun, 11 Jul 2021 22:59:58 +0200
Message-Id: <20210711210016.2710100-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ASIC PCI bridge chipset from Motorola is named 'Raven'.
This chipset is used in the PowerPC Reference Platform (PReP),
but not restricted to it. Rename it accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210417103028.601124-5-f4bug@amsat.org>
---
 hw/pci-host/{prep.c => raven.c} | 0
 MAINTAINERS                     | 2 +-
 hw/pci-host/Kconfig             | 2 +-
 hw/pci-host/meson.build         | 2 +-
 hw/ppc/Kconfig                  | 2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename hw/pci-host/{prep.c => raven.c} (100%)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/raven.c
similarity index 100%
rename from hw/pci-host/prep.c
rename to hw/pci-host/raven.c
diff --git a/MAINTAINERS b/MAINTAINERS
index 40d095dbbde..36eb0cb9c3c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1304,7 +1304,7 @@ S: Maintained
 F: hw/ppc/prep.c
 F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
-F: hw/pci-host/prep.[hc]
+F: hw/pci-host/raven.c
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.c
 F: hw/dma/i82374.c
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 79c20bf28bb..84494400b86 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -6,7 +6,7 @@ config XEN_IGD_PASSTHROUGH
     default y
     depends on XEN && PCI_I440FX
 
-config PREP_PCI
+config RAVEN_PCI
     bool
     select PCI
     select OR_IRQ
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 1698d3a1920..4c4f39c15c6 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -13,7 +13,7 @@
 pci_ss.add(when: 'CONFIG_SH_PCI', if_true: files('sh_pci.c'))
 
 # PPC devices
-pci_ss.add(when: 'CONFIG_PREP_PCI', if_true: files('prep.c'))
+pci_ss.add(when: 'CONFIG_RAVEN_PCI', if_true: files('raven.c'))
 pci_ss.add(when: 'CONFIG_GRACKLE_PCI', if_true: files('grackle.c'))
 # NewWorld PowerMac
 pci_ss.add(when: 'CONFIG_UNIN_PCI', if_true: files('uninorth.c'))
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 7fcafec60a4..322a7eb031e 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -85,7 +85,7 @@ config PREP
     imply PCI_DEVICES
     imply TEST_DEVICES
     select CS4231A
-    select PREP_PCI
+    select RAVEN_PCI
     select I82378
     select LSI_SCSI_PCI
     select M48T59
-- 
2.31.1


