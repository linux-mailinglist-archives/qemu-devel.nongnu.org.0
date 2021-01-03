Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C422E8E55
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:15:10 +0100 (CET)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAiT-0005fd-Ne
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALv-0003dO-1A
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:52 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALr-00065g-2C
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:49 -0500
Received: by mail-wm1-x334.google.com with SMTP id k10so15968067wmi.3
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=okh/tsWUEfl+thMVnF4caC8TcGYG7BGDE6eyhBrKnR8=;
 b=uOULFtzk2LqU+nCD0+X0AiaIaiMdBfpBOEYAstrqDhFENKOEfjvmfEc9TrgomJyp1s
 yZWj2TpeTYShKn7I8vJw8h/zIP67DWIsGZiDbKzOpxxPnffo37h+T5b4z2xqEvxUPPbB
 CYmy8H5SM7ebVZsbWhhQPbV1VanpgFgd8xOCj9zXvg81Wp/ceh0GQ+MelgT5RC1d+SVV
 /T1yoo3dr8oGFwxUcy1RvGttYaK6jQn86WOJUTeOl5nsTqEiT2YiGtQNNJJgeBIYv8d5
 zm964FpD58XhnuSPTZZ2PqhDXVUt0va/xaS3TzTZNORAQZD+F3UnCDTS9j1e+J31QpFI
 twsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=okh/tsWUEfl+thMVnF4caC8TcGYG7BGDE6eyhBrKnR8=;
 b=sBGecsaFyZLbNT8egJwfqPQuabyf6hiZuCaLWBFw7Z8/ENmA+uqTqPzYTszzeF52GK
 iu8YwR0E196IvIfFbsQO4+5gmkajd91bjRcZ0ZPmFdyHWaG3k8HtDHMXkJRqXw/cXMiA
 u4bmolfF5TsJ9Dl+MIt6ZjKVoNd+AOdZGXCrERyDnJ9m3HnmUQxo4FYmItesg8nckcEt
 CZnFKmS9/AqN0YYTB1xcoEFWHPmzDZAWvSJFcpw4JhfrQ+3gWkyJNlmpflJbwyFCqwoZ
 +fIHJ2nG1MemyNTSD/ptwA31Rp0ZCi2xaNw+H7LuQxtVIroNKh2CsXIMXgERuNYRO4Wd
 kZ7A==
X-Gm-Message-State: AOAM532Qb5AwHM3VH7896XtNOrqAcmk7Ire+XmUWNz0e8rb/u/ZGlWU/
 n5VPgoJHzqK/ucBJ5q/VnUhkgHTZaUw=
X-Google-Smtp-Source: ABdhPJwflvWW1+9AxuLmyLQ1em4cAoL1K/ipCisVffnnAXzESVLUmuNSWD3Se2L/p6Zt67gwXpVA4w==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr23887611wmi.128.1609707105672; 
 Sun, 03 Jan 2021 12:51:45 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id w8sm87247015wrl.91.2021.01.03.12.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/35] vt82c686: Use shorter name for local variable holding
 object state
Date: Sun,  3 Jan 2021 21:50:03 +0100
Message-Id: <20210103205021.2837760-18-f4bug@amsat.org>
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

Rename local variable holding object state for readability and
consistency.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <69655b23df2ecebbf0aff29726f4b4746f5b74de.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 02d6759c00b..2633cfe7dc7 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -95,8 +95,8 @@ static const MemoryRegionOps superio_ops = {
 
 static void vt82c686b_isa_reset(DeviceState *dev)
 {
-    VT82C686BISAState *vt82c = VT82C686B_ISA(dev);
-    uint8_t *pci_conf = vt82c->dev.config;
+    VT82C686BISAState *s = VT82C686B_ISA(dev);
+    uint8_t *pci_conf = s->dev.config;
 
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_IO | PCI_COMMAND_MEMORY |
@@ -112,24 +112,24 @@ static void vt82c686b_isa_reset(DeviceState *dev)
     pci_conf[0x5f] = 0x04;
     pci_conf[0x77] = 0x10; /* GPIO Control 1/2/3/4 */
 
-    vt82c->superio_conf.config[0xe0] = 0x3c;
-    vt82c->superio_conf.config[0xe2] = 0x03;
-    vt82c->superio_conf.config[0xe3] = 0xfc;
-    vt82c->superio_conf.config[0xe6] = 0xde;
-    vt82c->superio_conf.config[0xe7] = 0xfe;
-    vt82c->superio_conf.config[0xe8] = 0xbe;
+    s->superio_conf.config[0xe0] = 0x3c;
+    s->superio_conf.config[0xe2] = 0x03;
+    s->superio_conf.config[0xe3] = 0xfc;
+    s->superio_conf.config[0xe6] = 0xde;
+    s->superio_conf.config[0xe7] = 0xfe;
+    s->superio_conf.config[0xe8] = 0xbe;
 }
 
 /* write config pci function0 registers. PCI-ISA bridge */
 static void vt82c686b_write_config(PCIDevice *d, uint32_t addr,
                                    uint32_t val, int len)
 {
-    VT82C686BISAState *vt686 = VT82C686B_ISA(d);
+    VT82C686BISAState *s = VT82C686B_ISA(d);
 
     trace_via_isa_write(addr, val, len);
     pci_default_write_config(d, addr, val, len);
     if (addr == 0x85) {  /* enable or disable super IO configure */
-        memory_region_set_enabled(&vt686->superio, val & 0x2);
+        memory_region_set_enabled(&s->superio, val & 0x2);
     }
 }
 
@@ -289,7 +289,7 @@ static const VMStateDescription vmstate_via = {
 /* init the PCI-to-ISA bridge */
 static void vt82c686b_realize(PCIDevice *d, Error **errp)
 {
-    VT82C686BISAState *vt82c = VT82C686B_ISA(d);
+    VT82C686BISAState *s = VT82C686B_ISA(d);
     uint8_t *pci_conf;
     ISABus *isa_bus;
     uint8_t *wmask;
@@ -311,15 +311,15 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
         }
     }
 
-    memory_region_init_io(&vt82c->superio, OBJECT(d), &superio_ops,
-                          &vt82c->superio_conf, "superio", 2);
-    memory_region_set_enabled(&vt82c->superio, false);
+    memory_region_init_io(&s->superio, OBJECT(d), &superio_ops,
+                          &s->superio_conf, "superio", 2);
+    memory_region_set_enabled(&s->superio, false);
     /*
      * The floppy also uses 0x3f0 and 0x3f1.
      * But we do not emulate a floppy, so just set it here.
      */
     memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
-                                &vt82c->superio);
+                                &s->superio);
 }
 
 static void via_class_init(ObjectClass *klass, void *data)
-- 
2.26.2


