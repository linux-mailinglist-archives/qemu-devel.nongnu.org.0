Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864812E8E44
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:05:55 +0100 (CET)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAZW-00023n-K1
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALG-0002sM-IV
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALF-0005tB-47
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id q75so16663115wme.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5g7GkiOKARu3D5h6eCdOE8BcvARihXVaPU6R8h4tuJw=;
 b=vfyTkT2yQUs/d1NSyDVupvQkFdgTwxYYvA8tp5G+gDekxBl1koDe8QTfOFfUG/jfKu
 5q4DafXdV1nPCciuEde4Ve8FPZYidUlMlQ0RvQgTYEFZtDIEKJFGUy9QBkeSUHoL5fhS
 if85ZdA7/tfdwqsE3k8DxgN4dKZdTQQELdHer7FYHh5F29fFfbcqA/sSDRJtS9goqPKr
 BkeOk605qfRvjb1JuOfGYGsRr8qLSeYoLAZrn23lOn0UJ1yyW+2K+Xg4ENi08/myRp/V
 8Yth5K68ShgW2IueMM30YzhlN0op+k0pK/y8n6j3ir/z/JCXn5SNnj13pcjeSQjEf/3S
 8s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5g7GkiOKARu3D5h6eCdOE8BcvARihXVaPU6R8h4tuJw=;
 b=FMlqaYt0XBe9wxZkcr0SmcDwY5k5rq+xPn/lCrxtUGiqITpCnoeSKyYzXnrq3MqUOv
 11U+sZwsjdZxfXrqphMo5zJCw1YgPPVVcIrFURaVqZX31sFOYRrH3I6gsLeGoMR9XgmR
 utig6ktT6IlXJ3KboWE51aIpu++MuHNJR3RReV+6VF3dVMg5yUa+Tyd9LrfpaHbUdL1x
 7fbtvt3CLOuprxElfzEHtxTQkieby5y7sK+zplJHxqHoK+HEKkuJQ5uUBHC22woX9Qn6
 okKh9nI9uZwPTH2ej5js//1jCNNymaR16tDlX1mRmmY3eEXZPwsafa9x1pj5V93/iBY9
 3Vmw==
X-Gm-Message-State: AOAM532gftTvlg58Lz3jLELFe9niYPv0ksz5KbDU5K8+wtju5oPQDBZ3
 /voAD1sT9HGLrk5CCrBWPdoQDMkuG4Y=
X-Google-Smtp-Source: ABdhPJwvul11hlBm4oe5zg4/zPiAQAs4HR+6cU9/d3J6tWzv4ZsWWlMBlPnGB+szm7GUjVS61KB1Tw==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr24716466wmg.68.1609707067663; 
 Sun, 03 Jan 2021 12:51:07 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id i16sm83595108wrx.89.2021.01.03.12.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/35] vt82c686: Rename VT82C686B to VT82C686B_ISA
Date: Sun,  3 Jan 2021 21:49:55 +0100
Message-Id: <20210103205021.2837760-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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

This is really the ISA bridge part so name the type accordingly.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <78db2ced4b41a8a775dbc6c97a90db683952c2cb.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 1be1169f83a..d40599c7daa 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -43,14 +43,14 @@ typedef struct SuperIOConfig {
     uint8_t data;
 } SuperIOConfig;
 
-struct VT82C686BState {
+struct VT82C686BISAState {
     PCIDevice dev;
     MemoryRegion superio;
     SuperIOConfig superio_conf;
 };
 
-#define TYPE_VT82C686B "VT82C686B"
-OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BState, VT82C686B)
+#define TYPE_VT82C686B_ISA "vt82c686b-isa"
+OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
                                   unsigned size)
@@ -117,7 +117,7 @@ static const MemoryRegionOps superio_ops = {
 
 static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    VT82C686BState *vt82c = VT82C686B(dev);
+    VT82C686BISAState *vt82c = VT82C686B_ISA(dev);
     uint8_t *pci_conf = vt82c->dev.config;
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
@@ -146,7 +146,7 @@ static void vt82c686b_isa_reset(DeviceState *dev)
 static void vt82c686b_write_config(PCIDevice *d, uint32_t address,
                                    uint32_t val, int len)
 {
-    VT82C686BState *vt686 = VT82C686B(d);
+    VT82C686BISAState *vt686 = VT82C686B_ISA(d);
 
     DPRINTF("vt82c686b_write_config  address 0x%x  val 0x%x len 0x%x\n",
            address, val, len);
@@ -434,7 +434,7 @@ static const VMStateDescription vmstate_via = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(dev, VT82C686BState),
+        VMSTATE_PCI_DEVICE(dev, VT82C686BISAState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -442,7 +442,7 @@ static const VMStateDescription vmstate_via = {
 /* init the PCI-to-ISA bridge */
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BState *vt82c = VT82C686B(d);
+    VT82C686BISAState *vt82c = VT82C686B_ISA(d);
     uint8_t *pci_conf;
     ISABus *isa_bus;
     uint8_t *wmask;
@@ -479,7 +479,7 @@ ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
 {
     PCIDevice *d;
 
-    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B);
+    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B_ISA);
     return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
 }
 
@@ -505,9 +505,9 @@ static void via_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_info = {
-    .name          = TYPE_VT82C686B,
+    .name          = TYPE_VT82C686B_ISA,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VT82C686BState),
+    .instance_size = sizeof(VT82C686BISAState),
     .class_init    = via_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.26.2


