Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29905473F8
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:53:28 +0200 (CEST)
Received: from localhost ([::1]:44842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzykB-0003ir-Q8
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyS5-00047j-D6
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyS3-0006HY-QP
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id s1so1463996wra.9
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lDRaKNNA8Q7YJavQnTT5p+gRVU17PGzMwXMx9brphZ0=;
 b=JTHv5TCubVcG/ViYB6wVAybazBk86BXZiPn4zUZdfdIeoo0ZtUDQY3pTOtd81NN8K7
 32WgYt/TkPUudIjR1s8uchG8W5SMV7+o0qkSa2Ao9P2r+FY7IEFZ8xi2504sKUFdP/Lz
 f/bq5mXMX6oKDhAYm0NxYK6A92CNc+gHqSfOjDw11oQpNHIUxHNWOPB1UH0kl6OH0dHl
 rhpRqMIWGMwZmaY/Ivrzify92HlYI4eIawSvek52ICubOSCzdGTD7QK8WwUHT/NAnzha
 vfa1VbUcd3IFOMUHrRrva3hf0gtUu9VAKpq1HVCFJEs8MGzFX42nM88co9joXt8hlmwp
 dWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lDRaKNNA8Q7YJavQnTT5p+gRVU17PGzMwXMx9brphZ0=;
 b=UqaGINVvjfMw0OAvHIcbO8lHFqtip8sseCuTJBFoPoCeH5/AOKJGHis+iSh9eFTyrG
 Y+v9zlWrwLL0bYeWC9dlX2pDpewHi9YzqexdPbUr75Bz/pSLG5bpgxs8s6RssGgedMcW
 dhl2yOPczAQ8s8VXs1suXyTwmQnGo4erjmpDxfdC7bxEkHKepvvxkpLSdNsHkLbbmZjP
 pOSFLSNw8BU4VQrTgi2n5QWwft//ZAE5G+gcChNPOKrvGTkua7TldzDK/g/xbZDeJImD
 VAPoe9HtUQpUmqe/mO3J4u9CV3PcbAYDftag6RiozH9MXULa7Vf8/i9J2uuYCqa24Ta2
 YcSw==
X-Gm-Message-State: AOAM533aPeaPFHdGgb/l5azq2X7S/3yxqJQbP165q9kYxgdeycSxQt/l
 2Y5DX9m5YBIPcca1GuTByRYUG0FfYVg=
X-Google-Smtp-Source: ABdhPJyO7HAKkLKpaLgTRBtws/s2ya2VcM+SUTiuG8cibwdqVN7jTilGv9AnbypqTk3iS3zMes8gew==
X-Received: by 2002:a5d:484d:0:b0:215:e7bf:3e71 with SMTP id
 n13-20020a5d484d000000b00215e7bf3e71mr39936645wrs.435.1654943682178; 
 Sat, 11 Jun 2022 03:34:42 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b0039c5328ad92sm5802881wmq.41.2022.06.11.03.34.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:41 -0700 (PDT)
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
Subject: [PULL 17/49] hw/acpi/piix4: change smm_enabled from int to bool
Date: Sat, 11 Jun 2022 12:32:40 +0200
Message-Id: <20220611103312.67773-18-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

This is in preparation for conversion to a qdev property.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220528091934.15520-3-mark.cave-ayland@ilande.co.uk>
[PMD: Change simm_enabled from int to bool, suggested by Ani Sinha]
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 4 ++--
 include/hw/southbridge/piix.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index bf20fa139b..558c250884 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -74,7 +74,7 @@ struct PIIX4PMState {
 
     qemu_irq irq;
     qemu_irq smi_irq;
-    int smm_enabled;
+    bool smm_enabled;
     bool smm_compat;
     Notifier machine_ready;
     Notifier powerdown_notifier;
@@ -538,7 +538,7 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
 
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
-                      int smm_enabled, DeviceState **piix4_pm)
+                      bool smm_enabled, DeviceState **piix4_pm)
 {
     PCIDevice *pci_dev;
     DeviceState *dev;
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index f63f83e5c6..ff8d96ae8c 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -19,7 +19,7 @@
 
 I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                       qemu_irq sci_irq, qemu_irq smi_irq,
-                      int smm_enabled, DeviceState **piix4_pm);
+                      bool smm_enabled, DeviceState **piix4_pm);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


