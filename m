Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8377F53D1E8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:54:10 +0200 (CEST)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCQz-0001Tn-KV
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO5-00077K-DH
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:10 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO0-00047r-Al
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:06 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kq6so4597400ejb.11
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRQy+p9QHBhbhdctUoVX94Tio3w4hP8sJtMALXRbrgI=;
 b=I+KWJK5wdnGCNQatXmeewgCvNV3aI++/RCNIUlAB7p9Hx1k9AOqSPUJPRRz6R6Jmib
 231VQRo86xC9Lpj1rbnu/sOexMfqcB3dU5cEO5P9/9lvXyT45Eq1wxohixxsrcq45jWa
 qivF8O0gTf1eLMwnNKzWdoyyOPAcfgSXmsq5XNhK8Vr/LlBmTTAt5wNfcmT/43id88bd
 BvB3FMRvuEb5uOAKSNry/KkhTq3m5WCATOk9JaXQ+xBa1dMsM1H1hom+83W/7PHvbmZs
 DSZBmydGZ3AcVrMrJPRSSnwi5Hn13TC0eoHPE01btkMOqNUor6rU8jumy4rao/z9aHpi
 4ElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRQy+p9QHBhbhdctUoVX94Tio3w4hP8sJtMALXRbrgI=;
 b=LgMrm6D9OZCC7aGX6cNDOwqMYYdzHGqLvQMGih6B+PbBCW+n4YA7ohSVE2xc8yp8tG
 olKx6JiPLFb21J1cFZ5cA5TscQtxHVofT6JYpJ/ww0YX23+qaDN2+oYC7vKtibLI0+r6
 pOuw5OlNECLTMATeaXpnOV5hYmSMqD3zbGHU4rge/BXgw5kwSYOReNiqT2T7niNX/6o+
 5yjZLKDK7/qkecYjiiJKt5mLbwjawdkkBHx/XokxEg2rLNPBsPwOVx2gt8VZu6Ow6xnx
 7KSTSBM7YR/4qnCqw1MObLXm6lo1SGqKzdkMOKT5OuhCVKILV1rJiLebOk1xE4kCdkkc
 +jCA==
X-Gm-Message-State: AOAM5333x5zAe71nRr6fgojJGEQFgcSyO+8Nr/aenAlakW5rv/WoLziQ
 CcgohYitU/TW74cy1KPiBMjtYjlSq9iRig==
X-Google-Smtp-Source: ABdhPJwWSK0mloEc7bHzrGOo/wz3YA1l10SFJRCPBC5y+2vHvXSH6y3kAagX+FpyzCZG5PQvXV+PZQ==
X-Received: by 2002:a17:906:99c1:b0:6fe:b01d:134 with SMTP id
 s1-20020a17090699c100b006feb01d0134mr9821740ejn.598.1654282262709; 
 Fri, 03 Jun 2022 11:51:02 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:02 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v4 01/11] hw/southbridge/piix: Aggregate all PIIX southbridge
 type names
Date: Fri,  3 Jun 2022 20:50:35 +0200
Message-Id: <20220603185045.143789-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

TYPE_PIIX3_PCI_DEVICE resides there as already, so add the remaining
ones, too.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix3.c                | 3 ---
 include/hw/isa/isa.h          | 2 --
 include/hw/southbridge/piix.h | 4 ++++
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dab901c9ad..d96ce2b788 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -35,9 +35,6 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-#define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 034d706ba1..e9fa2f5cea 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -144,6 +144,4 @@ static inline ISABus *isa_bus_from_device(ISADevice *d)
     return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
-#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
-
 #endif
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 976b4da582..3b97186f75 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -64,6 +64,10 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
+#define TYPE_PIIX3_DEVICE "PIIX3"
+#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
+#define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
+
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
-- 
2.36.1


