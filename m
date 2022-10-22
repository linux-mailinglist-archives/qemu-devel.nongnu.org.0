Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D0E609A30
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:04:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhKk-0006sl-5H
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5K-0007FV-GN; Sat, 22 Oct 2022 11:06:50 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5J-0002Fy-0v; Sat, 22 Oct 2022 11:06:50 -0400
Received: by mail-ed1-x531.google.com with SMTP id q19so16091258edd.10;
 Sat, 22 Oct 2022 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4hH7Zx094YKTH3+tfeZdWsJT5RpfWAbTwX+VLBtc4L0=;
 b=NoCzPBrxAj0d9jQwEZWqqgYkh3moPVJZv5hn35XIu9LavWm4a3SSaO04nM7tJk/mpk
 kP/vpiouwvuWt9/TV1YwmhBPOtjBvL9oOGIvrglKP4aCu4Uox1fPWQW8EW6ZuLZhcPp2
 7ZsnaAPh1RInqWa24rfOhtjk7gX0IY/YCT95ClmbOwwrHVc9AMB6oUf3vsVfmJ0U0RNM
 KzSRQTXO+TM+JETv5vqrogUwSYbq9dV5EHNTZDViS8zaGlwKrioXHkSe+2Fm1B6qSNPa
 dTvsJn7gDUdvPrGH5c7GCbEEZpD305oTMBAXPqe9RLVje1wrp1+na88WMf7y0G/7e4Dd
 PevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4hH7Zx094YKTH3+tfeZdWsJT5RpfWAbTwX+VLBtc4L0=;
 b=Tjfnqg/ST8XUb94XuyyBc8wQ6gSaQn3pYSkqVX5U077Jog99q0nv+oA0VjRIuz9jM/
 y391CsCoiIuu+4SdwZ+mkeW7KJpAj/G735Xzw37U5ZiUO6hkLDxhcyNIdFPFmJGkFNve
 5wbGDwVsgO6NfkuXXATx4UQkEmbHERMDWg+gJ7m+jZlGx8tex9VitYZafzYD9bYLGWxU
 waAU7GZGfxE9ga5jXm9iasI5tla2uRS08RP2yBOxK4OPYFD4rrBdf1so7T/l9uDoSm2m
 FrVO3ZGRC/NI0P7f1WG/pUBofXENBv3PDanORlfjwmgJ+9ZCVrpC5NWterp0m+ynFPh8
 ITfQ==
X-Gm-Message-State: ACrzQf1fLwfeaotcx1zAQ8cAHinoLEgkdP8LZAZl703iCf9YPel8g5xu
 /19sqURMTwYhZSZcycWAj8NiAXcd30i1hw==
X-Google-Smtp-Source: AMsMyM5Vw0DpNMlUWq9A0M+XMrNev0F+m7JN9NXEV+jMT3incrRu+T087bZORb0FpCC5z9kAWhu2NQ==
X-Received: by 2002:a05:6402:410:b0:451:ea13:4ed7 with SMTP id
 q16-20020a056402041000b00451ea134ed7mr23432009edv.262.1666451206961; 
 Sat, 22 Oct 2022 08:06:46 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 22/43] hw/isa/piix3: Rename piix3_reset() for sharing with
 PIIX4
Date: Sat, 22 Oct 2022 17:04:47 +0200
Message-Id: <20221022150508.26830-23-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 8dbf22eaab..5214a75891 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -156,7 +156,7 @@ static void piix3_write_config_xen(PCIDevice *dev,
     piix3_write_config(dev, address, val, len);
 }
 
-static void piix3_reset(DeviceState *dev)
+static void piix_reset(DeviceState *dev)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
     uint8_t *pci_conf = d->dev.config;
@@ -399,7 +399,7 @@ static void pci_piix3_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
-    dc->reset       = piix3_reset;
+    dc->reset       = piix_reset;
     dc->desc        = "ISA bridge";
     dc->vmsd        = &vmstate_piix3;
     dc->hotpluggable   = false;
-- 
2.38.1


