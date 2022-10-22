Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0F60971D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 00:46:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhXQ-0000MQ-De
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5e-0007LT-Tg; Sat, 22 Oct 2022 11:07:10 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5c-00022R-Qn; Sat, 22 Oct 2022 11:07:10 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so16074895ede.8;
 Sat, 22 Oct 2022 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rBmGLsEba9kTzDmC5mUvoRSh33a4oN55fbq6EerEIMQ=;
 b=llO8lWF8rySkguPxG0baJNUbDhCoaY9XfXkZIlzA6hWjGpCYgohh36bGOi7WhWVK4Y
 H9nsahFpDVjI16Vy5WvG0QPRqfcPDQElVV0BIekYnlp/YqU0mNxAbvwED1abdlqV07lb
 DSrHrlkDOKWjxXKY27a4nO/ePaug0Lj05efBd+/v4pXXhR1NEVRDM+bUCJ16FO+wENnL
 USn/VhLQy3qls10K5+kiPYWVgVE/XYMvE7BTHZZ45G+qHIlXE4XrShsGBx+4CgNq7TC5
 XOf+EgPe0owrjVcjnmL5yVL3WwvavNDKfgP4nzDyjO9qqAZfSBxWnfZcQrcukrXnwY60
 1ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rBmGLsEba9kTzDmC5mUvoRSh33a4oN55fbq6EerEIMQ=;
 b=m96ZvFOp1kOJODQu6CwqCwBWLQCpV9bsCHS0v3HYf+WE92RxnHycu64pgOtcn4UoI5
 zuTySisKd07DGGQnK0uwK6H9SBfowuuSV+kYG4AcOg/J15PvvQ9dJbgsHbX7zCbE3u1K
 g4k2wVFSqZVq5q9cLg1iiGIZeGwh9vkHxwvZNosvfVz12s0ls+axrooKlRr2keSd4XTA
 8vOGu0tw1usF/AQZkcC6rhe1rLqupll16Vc0ZRWE3Twx1seAQxE+VrPgUEj3gfH5ppkt
 HrrYT7m7gkxjmCQwBUcR4Eva8VIT6AH8TnOslgyXhyUpoURuoMWT+fS7UOCRhPLepG2F
 uBiw==
X-Gm-Message-State: ACrzQf3srbwGf4pmCz3WuD94WJu7fJvgcDnORpH8m/0VIdU160BwvU0r
 RuXatmpCxFMLj6ZiT7aG1CSORDjqqy8H2A==
X-Google-Smtp-Source: AMsMyM6f7vZQk6v4T4ZQVAIxt1jwJYtRoqrsP/GsL8vx2LgFS19D0kdzL0e8CXOwgXI9+yNcfrM5Dw==
X-Received: by 2002:a17:907:c15:b0:78d:9c3c:fb8f with SMTP id
 ga21-20020a1709070c1500b0078d9c3cfb8fmr20985410ejc.347.1666451227447; 
 Sat, 22 Oct 2022 08:07:07 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:07:06 -0700 (PDT)
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
Subject: [PATCH v2 30/43] hw/isa/piix4: Allow board to provide PCI interrupt
 routes
Date: Sat, 22 Oct 2022 17:04:55 +0200
Message-Id: <20221022150508.26830-31-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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

PIIX3 initializes the PIRQx route control registers to the default
values as described in the 82371AB PCI-TO-ISA/IDE XCELERATOR (PIIX4)
April 1997 manual. PIIX4, however, initializes the routes according to
the Malta™ User’s Manual, ch 6.6, which are IRQs 10 and 11. In order to
allow the reset methods to be consolidated, allow board code to specify
the routes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c  | 14 ++++++++++----
 hw/mips/malta.c |  4 ++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index fc698c23be..57b0b98bef 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -58,6 +58,8 @@ struct PIIX4State {
     MemoryRegion rcr_mem;
     uint8_t rcr;
 
+    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
+
     bool has_acpi;
     bool has_usb;
     bool smm_enabled;
@@ -123,10 +125,10 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
-    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
-    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
-    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
+    pci_conf[PIIX_PIRQCA] = d->pci_irq_reset_mappings[0];
+    pci_conf[PIIX_PIRQCB] = d->pci_irq_reset_mappings[1];
+    pci_conf[PIIX_PIRQCC] = d->pci_irq_reset_mappings[2];
+    pci_conf[PIIX_PIRQCD] = d->pci_irq_reset_mappings[3];
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
@@ -300,6 +302,10 @@ static void piix4_init(Object *obj)
 
 static Property piix4_props[] = {
     DEFINE_PROP_UINT32("smb_io_base", PIIX4State, smb_io_base, 0),
+    DEFINE_PROP_UINT8("pirqa", PIIX4State, pci_irq_reset_mappings[0], 0x80),
+    DEFINE_PROP_UINT8("pirqb", PIIX4State, pci_irq_reset_mappings[1], 0x80),
+    DEFINE_PROP_UINT8("pirqc", PIIX4State, pci_irq_reset_mappings[2], 0x80),
+    DEFINE_PROP_UINT8("pirqd", PIIX4State, pci_irq_reset_mappings[3], 0x80),
     DEFINE_PROP_BOOL("has-acpi", PIIX4State, has_acpi, true),
     DEFINE_PROP_BOOL("has-usb", PIIX4State, has_usb, true),
     DEFINE_PROP_BOOL("smm-enabled", PIIX4State, smm_enabled, false),
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 6339b0d66c..44b6b14f3d 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1403,6 +1403,10 @@ void mips_malta_init(MachineState *machine)
     piix4 = pci_new_multifunction(PCI_DEVFN(10, 0), true,
                                   TYPE_PIIX4_PCI_DEVICE);
     qdev_prop_set_uint32(DEVICE(piix4), "smb_io_base", 0x1100);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqa", 10);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqb", 10);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqc", 11);
+    qdev_prop_set_uint8(DEVICE(piix4), "pirqd", 11);
     pci_realize_and_unref(piix4, pci_bus, &error_fatal);
     isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
 
-- 
2.38.1


