Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D2547409
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:58:53 +0200 (CEST)
Received: from localhost ([::1]:55974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzypQ-0003Ah-PP
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyS9-0004O0-LL
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:49 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyS8-0006DG-8Q
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k19so1472802wrd.8
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6np3BLedlg1OK/sXq/p5/V+h9dM3mgNS6yYy04B8H3I=;
 b=XxqWmOBtRoguSTwVKRqWz4XiJTU0USMSJh0ijDoYgjzNDh3M89PlxdUJrRFYMY/Dp+
 7/PEIZbTkk8jpoLqYxA3Cfh9EGROnNteKljErrlWLEff1Pco2MNQN/7NYzYcnTyyJvU8
 mKFjXL1rSFN/2trbU6n1hpyg+qnOK+fw6eLM5t+6NPNEDXlwRubj/0oIoCT6sVhPvA5O
 bcBaqFi/PO8dEI2V3gGhRLwmPU96mixXtb/+IyZSt01r4iCCopfzHwji4oKXDV6UvxJ7
 kSA44vY6K2TbNsEJiA5YlgodT5pOZbgmI0NeDNbmzvk2EvQXkYlM8qeQSXQUuC9lAr6x
 4m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6np3BLedlg1OK/sXq/p5/V+h9dM3mgNS6yYy04B8H3I=;
 b=SZM3Mbl8PFMCjHXYkHB8Jt0Sb/8IdeIuK1TvaPBpmyE1m7szKtPnscHZYMdhGahSK+
 AtQJSogTzHAcDzkHUxwFx4DwdUCtZwxP5Bf5DzDVdd/74L65ayL6XABkF5TWAZdHyUbl
 63v4WmHTBMPuUZ9Kj4X6G5CTRHX86Im28mYXrkmsIlDMJHbuH4DdavDMGx8dTi6mteQv
 98qvGxxsRxY1FSAB1JdsBTII5QFT+YD4ex+XhrAs61fXphaLnTu5+TyUGe9BYUUCwx+a
 ejjuTw4Hyb3+AKUr10x7ReBmSmk/475/TWfBGAqgaeQZCMHyKELkORJlnvseXuxz5TO3
 B1Cw==
X-Gm-Message-State: AOAM531r29BzP60TJVjr1CeiPQYnauIBaynMYnZ5pNK63DZRc+42n7T3
 v4vaYkguOMWyxjUl14InhkojUftCaiA=
X-Google-Smtp-Source: ABdhPJytxBYdE91kmtuXonm6hMiWkdPj63/saY218C6F1CtQd6/2hW/c7pI3/ArDiIyIkpLbBskKzQ==
X-Received: by 2002:adf:d1ee:0:b0:218:3e38:78dd with SMTP id
 g14-20020adfd1ee000000b002183e3878ddmr32127186wrd.85.1654943687343; 
 Sat, 11 Jun 2022 03:34:47 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 u9-20020a7bc049000000b00397243d3dbcsm1961082wmc.31.2022.06.11.03.34.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 18/49] hw/acpi/piix4: convert smm_enabled bool to qdev property
Date: Sat, 11 Jun 2022 12:32:41 +0200
Message-Id: <20220611103312.67773-19-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This allows the smm_enabled value to be set using a standard qdev property instead
of being referenced directly in piix4_pm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220528091934.15520-4-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 558c250884..316e41e1d0 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -547,6 +547,7 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
     dev = DEVICE(pci_dev);
     qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
+    qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
     if (piix4_pm) {
         *piix4_pm = dev;
     }
@@ -554,7 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s = PIIX4_PM(dev);
     s->irq = sci_irq;
     s->smi_irq = smi_irq;
-    s->smm_enabled = smm_enabled;
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
@@ -664,6 +664,7 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
+    DEFINE_PROP_BOOL("smm-enabled", PIIX4PMState, smm_enabled, false),
     DEFINE_PROP_BOOL("x-not-migrate-acpi-index", PIIX4PMState,
                       not_migrate_acpi_index, false),
     DEFINE_PROP_END_OF_LIST(),
-- 
2.36.1


