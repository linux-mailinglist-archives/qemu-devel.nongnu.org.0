Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D32C5473E5
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:45:05 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzyc4-0002DD-7V
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyS0-0003ut-2c
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyRy-0006HE-I0
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:34:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h5so1537434wrb.0
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hINH/dDezmBfjoGGH2J6xkOiuvulvOYeQ1iTcTCy22c=;
 b=qGmU4gme/5kcF5CEOVGg3HS/iB09qyzrKnrJY7QZR9y6QiolLFhk6zHguEAOKXPjqr
 Bz3/OkpHKAOpIT+K8/iclvZKuQYvCXpWYshqw4N/gGiEkGb59slpkb1MHXRopt/wwx4R
 0RSnFTGq+pe1g3UTKi9Dz0ke/0rjXallrWPILr+a4zo6AKmiTEII5tohfcpI5uy38WCb
 NmfMTTEJAXG838c6ZL9hJztwTezvn8gYX9EjACLot3miS8qqMJ7iSZC/MFzwTf3j0LnN
 wZbP7jeUskCAYhTFOaaLhSzKjsZmzRHQB5PhvnwmO0mFgPTz/cKFe1F7CW4mNJt/jYnk
 Ca7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hINH/dDezmBfjoGGH2J6xkOiuvulvOYeQ1iTcTCy22c=;
 b=2WyXBFNLzEuEu+P6FfTx8essqRjvpl9i/FVP5zoZRkhJiXz17yVThlCUjA6NmEJJjF
 aH9lYhA2Ln8huBHVRTNVrhDU+FEic0Ti8WEHSsVuJkWpGebcXk5XjiBu8o/owRPgketE
 Y1ICzDwnd43wyp1+ka7qR6NX4fXl21uJwXKB/MgMgyv45LzikKEWuehBIE0EYUR76Jpg
 WEJAXi2JBHfFtbkSGjIjjAQAUoVCZxiqCwY3Q6vYtugAgIzgAYSoeKhPCQWZXdjLwFv2
 ui13xqdfNoQqpLJwCKSEmVGEBrHEy2De3eD24BdUNKX9rTc8+GAoorDBSBYyXlmyTZfQ
 2N5g==
X-Gm-Message-State: AOAM533NgZWBwkBaRLf+XB3LZUupiPwz2Mlqf80H3DyWoCBAoxKpSLuU
 Q0ZoRy9oFHP/cXEAbeJs2s3KJAvoq6c=
X-Google-Smtp-Source: ABdhPJz+ZMJnx1jaU5sjRYt60BakkyQCGTxpMT9T6kvsISqJl66Y79xaBLfULXeuwhMOYy1UHb5p7Q==
X-Received: by 2002:a5d:6d08:0:b0:217:1292:ddb8 with SMTP id
 e8-20020a5d6d08000000b002171292ddb8mr34520427wrq.693.1654943676977; 
 Sat, 11 Jun 2022 03:34:36 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 d9-20020adffd89000000b002102d4ed579sm2142260wrr.39.2022.06.11.03.34.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:34:36 -0700 (PDT)
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
Subject: [PULL 16/49] hw/acpi/piix4: move xen_enabled() logic from
 piix4_pm_init() to piix4_pm_realize()
Date: Sat, 11 Jun 2022 12:32:39 +0200
Message-Id: <20220611103312.67773-17-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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

This logic can be included as part of piix4_pm_realize() and does not need to
be handled externally.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220528091934.15520-2-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index fe5625d07a..bf20fa139b 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -525,6 +525,10 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     s->machine_ready.notify = piix4_pm_machine_ready;
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 
+    if (xen_enabled()) {
+        s->use_acpi_hotplug_bridge = false;
+    }
+
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
                                    pci_get_bus(dev), s);
     qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
@@ -551,9 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s->irq = sci_irq;
     s->smi_irq = smi_irq;
     s->smm_enabled = smm_enabled;
-    if (xen_enabled()) {
-        s->use_acpi_hotplug_bridge = false;
-    }
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
-- 
2.36.1


