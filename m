Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDE5362F41
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:33:25 +0200 (CEST)
Received: from localhost ([::1]:51478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiGS-0003Q2-QD
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiE3-0001Xa-Qc; Sat, 17 Apr 2021 06:30:57 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:33635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiE2-0000rn-BH; Sat, 17 Apr 2021 06:30:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so6269614wma.0; 
 Sat, 17 Apr 2021 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qo9mc7C04yVXRYuUPrtzG1r/qxsKimgZXzxtcjqOeGs=;
 b=C9Kb5qhbFu0DU2JQIy6zdLf/jnz7EfMekOWbA1c4qigXSRO69yKPL8AiQFaysa5AYY
 oH/3RDr8jm0vLo1nsCaKbEy5wcWmg58oyb/+KZNZfPOfFcFZLDzkoVuQ4ea0XkxMCyVG
 tHt11QMT6I1LZgdrqnbg1t9odjYY3OeO1nnrskcxFN0xBmGXw4wT1ZNDJbiN30vrApO1
 gOgGME64aQq3Isfav6g0s/yJf5Lbsj/CCU8EutZQyYxzl4abisDn9hoqpBRX6LU0b3BF
 UHESzjZ6fo2LKUIyaLEMOIWhPCOfkFCb34UhnXrPy40TkaKGPG1tqrWd8enwFEzcqQFl
 H1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qo9mc7C04yVXRYuUPrtzG1r/qxsKimgZXzxtcjqOeGs=;
 b=DggTiXIu+OprQX8McVT9WyyxWVYTCu1R1W+KxOR7AwAbcz2e3neliWx2cdRJStFDSD
 ZmtmdHbK1QMkiorS5g0a2ggBdck16ykA3qcJQAqQrVgiUcThBh+tRf+M1RfvV2PZmYuY
 ma51zq710+bKQplJ34J3BcvSH+ClUG4oqSrmShsPkL29i6iq0xCn+2nuiTZw+VG6RRSR
 nuj2IDFIZ/CUW50/QNixEeuJ7yALqk+4BSNg0cqGAF0T+9xdd52vT4SFb+8La3IBevB/
 KBgs3nR/2tiNB0BGxQ4BaXASyB3jQWBQ1j2DSsXhzF1USbeJAfvMotxk7cjdvSOflnmU
 37Iw==
X-Gm-Message-State: AOAM531O+uiuvfY53yWwN0Lzf11HiPf0aioOT19dOxtRB8C3Mx0Hz3xS
 4OxY1kh6puw2S9mFX8RlCoRjaMslZbw=
X-Google-Smtp-Source: ABdhPJxHoCUDbrVVMvsui27eiMs8qKCktuSkesb9A2r7N5u2Ikg7aknAHLrwzD46xZX08TNtZ3atJw==
X-Received: by 2002:a1c:f20f:: with SMTP id s15mr12523015wmc.61.1618655451744; 
 Sat, 17 Apr 2021 03:30:51 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y17sm14860750wrq.76.2021.04.17.03.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:30:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/11] hw/pci-host: Rename Raven ASIC PCI bridge as raven.c
Date: Sat, 17 Apr 2021 12:30:21 +0200
Message-Id: <20210417103028.601124-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ASIC PCI bridge chipset from Motorola is named 'Raven'.
This chipset is used in the PowerPC Reference Platform (PReP),
but not restricted to it. Rename it accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 36055f14c59..0e8f9cbc2ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1302,7 +1302,7 @@ S: Maintained
 F: hw/ppc/prep.c
 F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
-F: hw/pci-host/prep.[hc]
+F: hw/pci-host/raven.c
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.c
 F: hw/dma/i82374.c
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 2ccc96f02ce..593d90e5588 100644
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
index 87a896973e7..2460f365471 100644
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
index d11dc30509d..ebbe95eb90f 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -73,7 +73,7 @@ config PREP
     imply PCI_DEVICES
     imply TEST_DEVICES
     select CS4231A
-    select PREP_PCI
+    select RAVEN_PCI
     select I82378
     select LSI_SCSI_PCI
     select M48T59
-- 
2.26.3


