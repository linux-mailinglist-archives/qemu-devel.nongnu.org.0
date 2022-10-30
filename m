Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B579612D94
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGox-0001zG-5x; Sun, 30 Oct 2022 18:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGon-0001kl-Np
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGol-0007id-4R
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:13 -0400
Received: by mail-wr1-x42f.google.com with SMTP id cl5so2015158wrb.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOfIdKogUdxZbqa2JfgUg0XucLPxUOAfMZ6+8R29910=;
 b=E9qamUIvY6JSOGNLovjCLd12twSmwnQOWTbiiTJzSEvQVlqYF9xUErEwiP3VAIjRBT
 3hfB0Ng5amgjj7EQjMnm/3lQm3tlL94KjSwFdMRVrDHuj2cc/BiNFHo6bK0TzrFQns+2
 L1SKy7KQVUls0tiJNc4fUgJYN4JN4Sn/SFuTB/8AfqyveQJPwybz56PfFDwGdojtFm2i
 auxccKpZIQ7pILIWyB+HQnV8274frqfLne+Rl8Fx6bRxcHcHI/aEkED20UVGsvQ89G7R
 ia4KvzyGqBGSySNjrBWlYnhw4wbSJVRnoTt+WPTEJUs6m5+r8Nuv8hLni7BT4NlXV+7f
 ExXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOfIdKogUdxZbqa2JfgUg0XucLPxUOAfMZ6+8R29910=;
 b=m4U+/we0kgElzB7qV1xPRy9z/nzecIKaKmyjCAS6+nQZJBIXM9uAbWEeMap/EQYnTG
 Q2jNdw5InWlH+DYpz8Uhw4+9xyVxuN1/XtFT6JwGd7z5GKBtk8GF0TdPc4QUx3+oA1QP
 nLYDelsN+82ohoreouKuZXLAruV9OGtEXALhpp9Ktk8RLnsHv40J79BwXlEBqv1ezBXj
 T7RhVmTCWjA3Cwy+C8ldwusgzZ5rbvcMQDdxLYQHIi00MIl+ZaAO3sFFDOLt0KoUYOPX
 /uowChtM6ec8GoE5MDx1i5kJCboG9zjp7tzFx2GLD+dl3uoM8eMFNdS1/B29RqEbex1U
 HTZQ==
X-Gm-Message-State: ACrzQf2fSIVAGJbEg8vQ2Ln1biG8Oq8aPbihI0ibT6ZpoXe0an2acdPZ
 hcpKyi2ymRwT1bU3v6nphVMgJcwy4sycHQ==
X-Google-Smtp-Source: AMsMyM49poc+73otybmj7DemMB0Uw6F4Mp2UiZTTgrrth5o82mCuOyKQVs7Qz/8LyFTxjE1VAirvjg==
X-Received: by 2002:adf:f781:0:b0:236:5559:215b with SMTP id
 q1-20020adff781000000b002365559215bmr6097170wrp.16.1667169009573; 
 Sun, 30 Oct 2022 15:30:09 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6282000000b00236cb3fec8fsm1710909wru.9.2022.10.30.15.30.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 13/55] hw/isa/vt82c686: Create rtc-time alias in boards instead
Date: Sun, 30 Oct 2022 23:27:59 +0100
Message-Id: <20221030222841.42377-14-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

According to good QOM practice, an object should only deal with objects
of its own sub tree. Having devices create an alias on the machine
object doesn't respect this good practice. To resolve this, create the
alias in the machine's code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220901114127.53914-14-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c   | 2 --
 hw/mips/fuloong2e.c | 4 ++++
 hw/ppc/pegasos2.c   | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 48cd4d0036..3f9bd0c04d 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -632,8 +632,6 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(&s->rtc),
-                              "date");
     isa_connect_gpio_out(ISA_DEVICE(&s->rtc), 0, s->rtc.isairq);
 
     for (i = 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 3c46215616..b478483706 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -295,6 +295,10 @@ static void mips_fuloong2e_init(MachineState *machine)
     pci_dev = pci_create_simple_multifunction(pci_bus,
                                               PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
                                               true, TYPE_VT82C686B_ISA);
+    object_property_add_alias(OBJECT(machine), "rtc-time",
+                              object_resolve_path_component(OBJECT(pci_dev),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
 
     dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 474723ee27..49809b2b75 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -161,6 +161,10 @@ static void pegasos2_init(MachineState *machine)
     /* VIA VT8231 South Bridge (multifunction PCI device) */
     via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
+    object_property_add_alias(OBJECT(machine), "rtc-time",
+                              object_resolve_path_component(OBJECT(via),
+                                                            "rtc"),
+                              "date");
     qdev_connect_gpio_out(DEVICE(via), 0,
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
-- 
2.37.3


