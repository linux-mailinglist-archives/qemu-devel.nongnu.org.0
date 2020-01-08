Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BD2134219
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 13:45:58 +0100 (CET)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipAij-0004aj-Kl
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 07:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWT-0003uL-V4
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ipAWS-0004Ns-Hv
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:17 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ipAWS-0004NJ-BS
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 07:33:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z7so3124212wrl.13
 for <qemu-devel@nongnu.org>; Wed, 08 Jan 2020 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qh4jWZJgN9CHYXZp74ZZsly2/NEoMB2jqVftu14Z+fE=;
 b=tE8L6qrChZzgiym0pYU+5CVN24I3GgKASNZKziCWOqQELRTuKc7GfuQ5tIKtm7H1St
 HhVjCPs6G9LkBOcTt9ySIU0CmMMMwRQZ1Cg1xc7PvLfmkG3evhQ9ovTv6yXcNrnXSZtD
 qF60re+tH0YGiIBFYw44tI4GWUQHGUUPlbxePJy7YE2VuJS6oHzmbUvIECI/XH+EbOFR
 ah7l44zuN0rWNEQgYz+aR95MPZ/4UNo4uDsyzQTmU4nYEtY+7eJ4tk+XJJgUASVK41iX
 j93i6fTDTulEyPY+/BNmOwBzjUMkJVpp/c2F2snaAeIIIKvUZXxHMY7Z8q2Ka2p+3MA/
 wpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qh4jWZJgN9CHYXZp74ZZsly2/NEoMB2jqVftu14Z+fE=;
 b=jskZiKQCD9rAb+oOBoVaioUGBgwqSF0cc7g93Y0B8talY6aGiE0mCRLVsCI0se5AtZ
 0VOAEcLmsnsqvrGIDD4JTKJsVyZ8EjkevI4k4j3W7ZrOGxWLw4ehn9BGUKlLOrIWDRbH
 814n9+Ipw+FdbRq6ntshGqmP4QeKjkyO3NHkFyqKfImMwc55NgIvkuNaFRD7TOoz1EnU
 DLc+pgYP0HeJJASob7KN0ZoRidJqTN27vZjPhQS77bBji2MhNhpZtaE135hcDmkZt/f5
 mNN0/W1vqrhCGpO2thFmMUSfrYcIQB5615D+okGRkXl7Wj4/gKz7KCvDxATs7hKK9evB
 cf4g==
X-Gm-Message-State: APjAAAUxENEk21INMCxNsFBq9mIk2Ud7JcA3FdVXu8Apxj14SJuMUt5H
 Znf7jt/G2Hj0qhW9NqugS1tDkF4g
X-Google-Smtp-Source: APXvYqxOTxAxFOfChmsvKZT7hZnt4cLU7CKfxqMP45qRpCpIH3zf+g/bFJrLsBPcSb/9Fcyehrkwag==
X-Received: by 2002:a05:6000:50:: with SMTP id
 k16mr4250351wrx.145.1578486795102; 
 Wed, 08 Jan 2020 04:33:15 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id o4sm4037750wrw.97.2020.01.08.04.33.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 04:33:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/38] hw/nvram/Kconfig: Add an entry for the NMC93xx EEPROM
Date: Wed,  8 Jan 2020 13:32:35 +0100
Message-Id: <1578486775-52247-19-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
References: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The NMC93xx EEPROM is only used by few NIC cards and the
Am53C974 SCSI controller.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191231183216.6781-13-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/net/Kconfig         | 2 ++
 hw/nvram/Kconfig       | 4 ++++
 hw/nvram/Makefile.objs | 2 +-
 hw/scsi/Kconfig        | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 3856417..af6a11b 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -14,6 +14,7 @@ config EEPRO100_PCI
     bool
     default y if PCI_DEVICES
     depends on PCI
+    select NMC93XX_EEPROM
 
 config PCNET_PCI
     bool
@@ -28,6 +29,7 @@ config TULIP
     bool
     default y if PCI_DEVICES
     depends on PCI
+    select NMC93XX_EEPROM
 
 config E1000_PCI
     bool
diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index ebaa749..24b0ce6 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -7,3 +7,7 @@ config AT24C
 
 config MAC_NVRAM
     bool
+
+# NMC93XX uses the NS uWire interface (similar to SPI but less configurable)
+config NMC93XX_EEPROM
+    bool
diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
index 26f7b4c..a4bdfbf 100644
--- a/hw/nvram/Makefile.objs
+++ b/hw/nvram/Makefile.objs
@@ -1,5 +1,5 @@
 common-obj-$(CONFIG_DS1225Y) += ds1225y.o
-common-obj-y += eeprom93xx.o
+common-obj-$(CONFIG_NMC93XX_EEPROM) += eeprom93xx.o
 common-obj-$(CONFIG_AT24C) += eeprom_at24c.o
 common-obj-y += fw_cfg.o
 common-obj-y += chrp_nvram.o
diff --git a/hw/scsi/Kconfig b/hw/scsi/Kconfig
index b3ba540..77d397c 100644
--- a/hw/scsi/Kconfig
+++ b/hw/scsi/Kconfig
@@ -34,6 +34,7 @@ config ESP_PCI
     default y if PCI_DEVICES
     depends on PCI
     select ESP
+    select NMC93XX_EEPROM
 
 config SPAPR_VSCSI
     bool
-- 
1.8.3.1



