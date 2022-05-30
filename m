Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D94537A21
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:44:22 +0200 (CEST)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdor-0001CM-IQ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdYw-00007X-Er
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:55 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdYp-0001Kq-Pc
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:54 -0400
Received: by mail-pf1-x432.google.com with SMTP id f21so10336939pfa.3
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OIu+NoT4gZ0qR5vroZwrG3oH+d1OSRS6QV1jDSTNRMk=;
 b=mgzQsmjVk5neRxzN/NbKBMjCI8JQj+BhEKxodL89IhVkaAN277YuKYzfrftAD+H+3q
 kHkijyy5/8TQuMWrxtawwKtm/3+tGzpSPsIX2wjfTM4drldVt9XsHq6K4tmsLtDDb5ay
 6RiPV/YZRfB8OsO2JbSq4sUVGW+Ituh07TlLp4kyodmCLs3LreyByaTqRewc8B2EZcE/
 qy6BTcVfU29IMhq6vE65t/IE4ZzPY7FyWugnjBhj4UmLUPnB8L0n5q5gX4TFpLhbFXta
 WOEplecgwzrhjYpgt1giBZ/7ellJfcdLxpFFI2To/j5090H6p0qsvlrfbR1htzsBAzY1
 O46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OIu+NoT4gZ0qR5vroZwrG3oH+d1OSRS6QV1jDSTNRMk=;
 b=izGqMF2EAwYGk2qwBBTwBu7ZUdj0ex8zPlBytbggLgmaKO+L1DulXmY+XFP99DePqB
 Ul7woI2CAsNzbDK+4EnaXMB3TZMo8Etog9YmdB3ZNU/NVwwEflCK82q8JEMA/ID62mma
 7/XxbfeE+05D8RMrw9gGsSk72wrcS1HMrrLL9Qeqkw4uFMiTA1+pA/BawpVUAVKstTTf
 aU6mJB+CRRv3iALsgEulBSlKLXPx96mq2kIgz/DB1Tb6rMB7eqcEUlBrP5/LB5uf7eTV
 BT0TQHDCxKFplpJ4jYYjhFr1ytEF3JEhxfI+JD/ALSf/1ESrF9RxsNMVx6VcP5AdHhhP
 2ugw==
X-Gm-Message-State: AOAM533vnMN8Ym+OVkhijta52uDGjTsuSq0x3x7bzrqMqZQs6Wxt5Duy
 Ckcj6+5LR6cFap1dlMjFhRk=
X-Google-Smtp-Source: ABdhPJzbvP0MiHkjffrVpRJp6/UFD6cfPAOGikD4W2qGtGBjLHLCtXJr0PXT6IbOJQ2eEYltLvVFyg==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr56211210pfe.0.1653910066470; 
 Mon, 30 May 2022 04:27:46 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c22-20020a170902c2d600b0015e8d4eb2e8sm8849963pla.306.2022.05.30.04.27.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:27:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 02/11] hw/acpi/piix4: change smm_enabled from int to bool
Date: Mon, 30 May 2022 13:27:09 +0200
Message-Id: <20220530112718.26582-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x432.google.com
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


