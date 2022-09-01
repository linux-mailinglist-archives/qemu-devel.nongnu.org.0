Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0550A5A9D7C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:49:25 +0200 (CEST)
Received: from localhost ([::1]:57006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnNc-0006xD-5a
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2G-0002DV-BE
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:20 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2B-0001T5-8U
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:19 -0400
Received: by mail-ej1-x630.google.com with SMTP id cu2so35920006ejb.0
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J4joud6oQDBLhudQQVN9O63V6vQl5y3dy6yyCiAGhbo=;
 b=nbZ//HszUXYTTcO4zAoBgJnMx1Aao2H3c/YPAIhHB598sEsu93/k3+7kwgxanMb/96
 V4BT7PMeecS5OmOT9VNgOXXAz9HYRiAuuqXNAufkM1CSmLSqMxIxXQGCVLO9eKKNG9w3
 7qtTuj3U/Vjj6hV0mqoGYYiAmZscoPEvHHjlwP5w8ZsQ4Qxe4EAS6LOKZK0gl+rGPe0c
 CPU0y6G5sjUwVBR3md3mIlf7cnb6Wq5hw5KP/eCuHCiuIakapq7BZ75seUZj5Ncw0euy
 KXt1a75cq61r9N/syUazNAZN3GzSEcAYzsVboQEkD2xhlxM07jYWQCJBBUqzG6UDslFg
 bAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J4joud6oQDBLhudQQVN9O63V6vQl5y3dy6yyCiAGhbo=;
 b=HCVkBcMK/H5YwuvtvrPpfPqDIhVutzYqlid6j3HyHofRaQOJlByW8XhG1YtZ/FkFo7
 qrPZRyl0okxSUUGcnVr1eNT5ISw0ix45f1sNrZA1H0p+I4Lost9lshopx2PEr8QUORFw
 mCAKpTepJAgCs7rd/jGBtPmCYL9S8fAPu5Bq2YLIMPoZbGSXM6BNIGatRcSJOpYni+C7
 AJVNOVKXC7Mirg9liti56pYgAqv6r0GOASsvdbN95BLOKBfi3DHrE4bVdCiW1/9NHln0
 GGj8vb80k+AmB8+bjwtkMW/Hz+btK899MaFgzUdxIcA1hoL6CHvMuRjXbSOWoTYFIbyY
 OZZw==
X-Gm-Message-State: ACgBeo08S022USVviE5YdVDYgPQeQUEyKMJoA3RBN7WMwAliut43sUbr
 vkw5c0zbT+PQomMxMjw8gT/62whyU/A=
X-Google-Smtp-Source: AA6agR52S3ShzxXw0BE6AD6Rdn9BBOFo6rAbi30VkkMWWdWeRBYtCNYGKBadP+mQRhKhUvCoEHETLA==
X-Received: by 2002:a17:907:a062:b0:73d:dec1:6692 with SMTP id
 ia2-20020a170907a06200b0073ddec16692mr20714564ejc.685.1662049625629; 
 Thu, 01 Sep 2022 09:27:05 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:05 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 19/42] hw/isa/piix3: Rename piix3_reset() for sharing with
 PIIX4
Date: Thu,  1 Sep 2022 18:25:50 +0200
Message-Id: <20220901162613.6939-20-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index cb3fef7654..d027c5b61e 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -155,7 +155,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
     piix3_write_config(dev, address, val, len);
 }
 
-static void piix3_reset(DeviceState *dev)
+static void piix_reset(DeviceState *dev)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
@@ -398,7 +398,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
-    dc->reset       = piix3_reset;
+    dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.37.3


