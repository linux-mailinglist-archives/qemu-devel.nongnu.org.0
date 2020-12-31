Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DDE2E8294
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:58:20 +0100 (CET)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6tf-000499-Ex
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6ln-0002Nk-3t
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:11 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6ll-0006Yx-Ky
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:50:10 -0500
Received: by mail-wr1-x435.google.com with SMTP id w5so21012686wrm.11
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBfFIOqaMVBFIfJTXjxhEPCFtIoZjvkYJY/nRro5Kjo=;
 b=geNRdEdWFGMSpaD58v+33FhERhEKgw+Zb4HcxZrdECyOU2IKq4HopNEY83dTO7gGq6
 bZsZvsew1hr6jKEcXpe2IP7iV7+VA8zLZBnITSp6mc38jgRo/7QLKr8pFoP+4oSvPugb
 SS6xBSmhuQ76JdfqfzZdBL6ZdMZzCSzKD/wXJGF4MTv1oLtNUgusTWUZ8R4ndGvPYB/t
 Oq++hWZm32xolMHqWor3p2EAEGp+JMn6p12kvvvkd2I5xODxf8//fizR3Ub+2ZFhbPz/
 8yBvzp3UxvBRrZMch4yEikLMoSjEbakZNCR+wWyxZS5IkqZKvUUjaX+8FqiH2RWfM6fK
 Fmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dBfFIOqaMVBFIfJTXjxhEPCFtIoZjvkYJY/nRro5Kjo=;
 b=eeSE8Smmealg4gCHqf0EBra9ety6BuRv4S3Pf18Oh5yBlOXI4Zw79VGWNMdNFKNY8O
 xZkfWqolfJjXUw22Cmo/KP6zdzqyfSHgbOvOV728PKARSopJJSoPUGh1ZYkChhuLtf8W
 Ui5Gacz2FAUUX+L/xidaMfgGlBvQrxJ1IXRrWp7rylsXL0/GCuoDguhi49HI2pzGoU1j
 kPq4I6q1bY+iM7avuaBRrZiUCoyQZ8LctcWCTb1ancWDoFS7v2yS69ga+10p6MkGa6er
 IJ7qPxXAUGl2bPxLtwTnrK1vQDzd2W+u+jBiYYrPvfjPMXQ8cQo6Q5GcGNw7zs7jUj9N
 hTkQ==
X-Gm-Message-State: AOAM533UINI96LQdM/MAsamARUP7NEUWD6k68NgGdU+UqvzyXdPGaZpv
 0is0xGW2Da2UWs5QAh7Jg4bdz7L7KhQ=
X-Google-Smtp-Source: ABdhPJw6EC67x8TZILuQa2tYJbOQBQnKXxE7SByf/ekTp2jl51aoKur3NcC5+TZoB9oFsE+L+kPTJA==
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr64625056wrq.369.1609455008170; 
 Thu, 31 Dec 2020 14:50:08 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id r20sm13534438wmh.15.2020.12.31.14.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:50:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/18] hw/pci-host/bonito: Rename PCI function helpers
Date: Thu, 31 Dec 2020 23:49:04 +0100
Message-Id: <20201231224911.1467352-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename PCI function related helpers as 'bonito_pci_*'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 45f31512b25..06f5e683c81 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -664,7 +664,7 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
 }
 
-static void bonito_realize(PCIDevice *dev, Error **errp)
+static void bonito_pci_realize(PCIDevice *dev, Error **errp)
 {
     PCIBonitoState *s = PCI_BONITO(dev);
     SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
@@ -778,12 +778,12 @@ PCIBus *bonito_init(qemu_irq *pic)
     return phb->bus;
 }
 
-static void bonito_class_init(ObjectClass *klass, void *data)
+static void bonito_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->realize = bonito_realize;
+    k->realize = bonito_pci_realize;
     k->vendor_id = 0xdf53;
     k->device_id = 0x00d5;
     k->revision = 0x01;
@@ -797,11 +797,11 @@ static void bonito_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static const TypeInfo bonito_info = {
+static const TypeInfo bonito_pci_info = {
     .name          = TYPE_PCI_BONITO,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIBonitoState),
-    .class_init    = bonito_class_init,
+    .class_init    = bonito_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
@@ -825,7 +825,7 @@ static const TypeInfo bonito_host_info = {
 static void bonito_register_types(void)
 {
     type_register_static(&bonito_host_info);
-    type_register_static(&bonito_info);
+    type_register_static(&bonito_pci_info);
 }
 
 type_init(bonito_register_types)
-- 
2.26.2


