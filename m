Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB762E8E2A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:53:38 +0100 (CET)
Received: from localhost ([::1]:42212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwANd-0004eR-Te
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAL7-0002oB-63
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:01 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAL5-0005pr-LV
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:00 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q18so29511990wrn.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmDPD6MXF8mA8RyDbydGI6yo0ymCSoqGu3VOAJS5hfo=;
 b=RUTfFvuFD8YJ36Hplbfhraa7GQSatpiTwfG9c3uowWZl+QAdZm8GtKaCwyDd7NjsML
 0BGQaYYT69maB44kmDRUd6qv259h6Sro0jIHFRpEVHDtSZnAe6HtxivPKH9yrW3RFGDW
 ksinoN5/cL9SqGh+g/khE4T2kPKxjLzdWgA//fRGEepCgo1Ix9czmrMrdKGjDdIWj0Vf
 GvdzsmT9a7q4F67f1rGSZo4FY4EL9hbCd2zH6MSMJ+F9hY3qjJAfm6hyDjPIrEWRTZwQ
 kM50k2McG7RfDdgoLU0/ZFxPiF2gCBN3jU3lGRmbMPg+Ic9mj9pw5gxVYjgP82p1nTds
 pLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TmDPD6MXF8mA8RyDbydGI6yo0ymCSoqGu3VOAJS5hfo=;
 b=UA9GeFEQs/YdmVROVNRJ29IXHnuY/ToyPkmoqIjP6C46kwuS7y+JT2M/iNCQsQUUZC
 /bIchSjOuKA4DZe+wiLXNUi3LxwZgXgz9KPOmixYgKkAd7162PwlJ2kj+BHSNe+Ejq65
 LGv/+dfFQz0jkp7b+2sXKwW3bWs4icicvctSoVJHolRugBWgGX0LsNQIXG9wzqU718sF
 oHpGWcE/G5OsrBkr+HdR7AlgaP5yolax5HFXaPN2Ta8OdJ+uG0wGU1oHbd/ukBdk4Hfl
 QzOHp5onxkwQGhfgJNEJXF434Ebgd2od0lf3cLPS1bRme8FyDeI+UXpMmwflTPktOjkh
 ZqPw==
X-Gm-Message-State: AOAM533I3b0rbFrkKXY8GOb6GRRyxK6OEor+LeXWfZiUZL9gq6Vi1Kkc
 bRFT6jo5Gmz6Q/rhdG0MqxknkujEst4=
X-Google-Smtp-Source: ABdhPJzw7J7eXKUnwN4xK1xSJXXn0j9xhRKnpQwmJZLvErFjuCIC7zRGRx9KbCWxfn3cZt8o+l4BgQ==
X-Received: by 2002:a5d:6106:: with SMTP id v6mr75780344wrt.173.1609707058232; 
 Sun, 03 Jan 2021 12:50:58 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id j59sm92191927wrj.13.2021.01.03.12.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:50:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/35] vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
Date: Sun,  3 Jan 2021 21:49:53 +0100
Message-Id: <20210103205021.2837760-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

These parts are common between VT82C686B and VT8231 so can be shared
in the future. Rename them to VIA prefix accordingly.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <510ddb17836a2c2e68a27cf2dcaee420bc2efbc1.1609584215.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b3170c70c3d..2a0f85dea94 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -168,22 +168,22 @@ struct VT686PMState {
     uint32_t smb_io_base;
 };
 
-struct VT686AC97State {
+struct VIAAC97State {
     PCIDevice dev;
 };
 
-struct VT686MC97State {
+struct VIAMC97State {
     PCIDevice dev;
 };
 
 #define TYPE_VT82C686B_PM_DEVICE "VT82C686B_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(VT686PMState, VT82C686B_PM_DEVICE)
 
-#define TYPE_VT82C686B_MC97_DEVICE "VT82C686B_MC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VT686MC97State, VT82C686B_MC97_DEVICE)
+#define TYPE_VIA_MC97_DEVICE "VIA_MC97"
+OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97_DEVICE)
 
-#define TYPE_VT82C686B_AC97_DEVICE "VT82C686B_AC97"
-OBJECT_DECLARE_SIMPLE_TYPE(VT686AC97State, VT82C686B_AC97_DEVICE)
+#define TYPE_VIA_AC97_DEVICE "VIA_AC97"
+OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97_DEVICE)
 
 static void pm_update_sci(VT686PMState *s)
 {
@@ -260,7 +260,7 @@ static const VMStateDescription vmstate_acpi = {
 
 static void vt82c686b_ac97_realize(PCIDevice *dev, Error **errp)
 {
-    VT686AC97State *s = VT82C686B_AC97_DEVICE(dev);
+    VIAAC97State *s = VIA_AC97_DEVICE(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -274,7 +274,7 @@ void vt82c686b_ac97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_new(devfn, TYPE_VT82C686B_AC97_DEVICE);
+    dev = pci_new(devfn, TYPE_VIA_AC97_DEVICE);
     pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
@@ -293,9 +293,9 @@ static void via_ac97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_ac97_info = {
-    .name          = TYPE_VT82C686B_AC97_DEVICE,
+    .name          = TYPE_VIA_AC97_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT686AC97State),
+    .instance_size = sizeof(VIAAC97State),
     .class_init    = via_ac97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -305,7 +305,7 @@ static const TypeInfo via_ac97_info = {
 
 static void vt82c686b_mc97_realize(PCIDevice *dev, Error **errp)
 {
-    VT686MC97State *s = VT82C686B_MC97_DEVICE(dev);
+    VIAMC97State *s = VIA_MC97_DEVICE(dev);
     uint8_t *pci_conf = s->dev.config;
 
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
@@ -318,7 +318,7 @@ void vt82c686b_mc97_init(PCIBus *bus, int devfn)
 {
     PCIDevice *dev;
 
-    dev = pci_new(devfn, TYPE_VT82C686B_MC97_DEVICE);
+    dev = pci_new(devfn, TYPE_VIA_MC97_DEVICE);
     pci_realize_and_unref(dev, bus, &error_fatal);
 }
 
@@ -337,9 +337,9 @@ static void via_mc97_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_mc97_info = {
-    .name          = TYPE_VT82C686B_MC97_DEVICE,
+    .name          = TYPE_VIA_MC97_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT686MC97State),
+    .instance_size = sizeof(VIAMC97State),
     .class_init    = via_mc97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.26.2


