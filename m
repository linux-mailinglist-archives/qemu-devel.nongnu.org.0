Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB053D211
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 21:03:00 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxCZX-0006XR-I5
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 15:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCOA-0007Cz-Ug
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nxCO8-0004AZ-AE
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:51:13 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w27so11283474edl.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrOO35qYt2V3te37RfBRgK7i5bd7cvuNNbZAPeTba8M=;
 b=KfwlXeRL9BT7wL0pQQZdEg/bEwgMJtTKlmfsJrCFRRJCh+UC+ZYSvYEMqFfYoECV79
 2+5UrjtqfLNUyr5MUWD+tUphg4/UHjI5Y8CNAyO4ji5xEnooJoQIzdxtQGxCpudGjep+
 wLFXQ3lQzgIgiIFA6yqaj6yrp2GUoF9/PohRjfR22tQ1jyAm+wvUkNZBbFJNYtsCBFsa
 a2Xsyf1y0G33PjXU8JvMGqECZiNoVliGeqJeUSQSLtLMiYRzuH9fJ8qohfRUm7niQpio
 0C+7P97+NktqkXT9LktPpLt99/jZZZA+HDJ0xdSEICccMcYsYybmsSDvG1e7E2IpDGmS
 jdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrOO35qYt2V3te37RfBRgK7i5bd7cvuNNbZAPeTba8M=;
 b=k0/erGvKpA9dsWHN6PUBYQY/sN94A6w2LeJHBcImN+BLdi91/uFfT/jTYeHNAQ6uLW
 xCi5/d1NYu2ZpX6s1wyjGTLGCHKKlttR7HsCYKc3UJo+w8XzwkZf0ClV+KvIskampRZb
 Q69NRrWF2LkQa60/wPCTDTG8v59+zjbq6vdlv//8SDu35thZhhwbxKElldn9SHBeYXyV
 bqtDlvRSUqyRBd79evyXodjCKl7y7egl3eX74PGhm7XhAgL8ehl4eQ49EdNhOn7KkyCs
 HktBBzMTNd9ZLH6A4Gfx9C/do8ectjH+cHxskaiU5mKftzQ7zkBtWaWVgKyADBqLfg5n
 cC5Q==
X-Gm-Message-State: AOAM532yyeAg+Ky4Myo8lONHQAxjuRCAv40LGbI4WYfQ5d/u3CQM2004
 imQPkybKVhxmrSIkbQybZydFLFt0DNBT7A==
X-Google-Smtp-Source: ABdhPJzHcpwiExyprP2Ts2kcgGQkpbWERlG3k68jzUIq3Qbw4/RI1KrNNEZITVwQaD1zqiIOUbnXfg==
X-Received: by 2002:a05:6402:11ca:b0:42b:d282:4932 with SMTP id
 j10-20020a05640211ca00b0042bd2824932mr12449383edw.421.1654282270527; 
 Fri, 03 Jun 2022 11:51:10 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 f25-20020a170906139900b006fe8c831632sm3066160ejc.73.2022.06.03.11.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 11:51:09 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 07/11] hw/isa/piix4: Inline and remove piix4_create()
Date: Fri,  3 Jun 2022 20:50:41 +0200
Message-Id: <20220603185045.143789-8-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
References: <20220603185045.143789-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

During the previous changesets piix4_create() became a trivial
wrapper around more generic functions. Modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c                | 13 -------------
 hw/mips/malta.c               |  5 ++++-
 include/hw/southbridge/piix.h |  2 --
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index d97b245df3..15f344dbb7 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -323,16 +323,3 @@ static void piix4_register_types(void)
 }
 
 type_init(piix4_register_types)
-
-DeviceState *piix4_create(PCIBus *pci_bus)
-{
-    PCIDevice *pci;
-    DeviceState *dev;
-    int devfn = PCI_DEVFN(10, 0);
-
-    pci = pci_create_simple_multifunction(pci_bus, devfn,  true,
-                                          TYPE_PIIX4_PCI_DEVICE);
-    dev = DEVICE(pci);
-
-    return dev;
-}
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index be9f26d841..7a0ec513b0 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1237,6 +1237,7 @@ void mips_malta_init(MachineState *machine)
     int fl_idx = 0;
     int be;
     MaltaState *s;
+    PCIDevice *piix4;
     DeviceState *dev;
     DeviceState *pm_dev;
 
@@ -1400,7 +1401,9 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    dev = piix4_create(pci_bus);
+    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+                                            TYPE_PIIX4_PCI_DEVICE);
+    dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
     smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 2357ce0287..9a2dd93c2d 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,6 +70,4 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
 
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
-DeviceState *piix4_create(PCIBus *pci_bus);
-
 #endif
-- 
2.36.1


