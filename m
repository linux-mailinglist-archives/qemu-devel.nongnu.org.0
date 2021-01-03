Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE782E8E2F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 21:56:55 +0100 (CET)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAQo-0008SW-Ro
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 15:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALa-0003PI-TY
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:31 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALZ-0005zQ-5u
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:30 -0500
Received: by mail-wm1-x332.google.com with SMTP id r4so16632552wmh.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O2gt3iQC5/uG1rR4b3ZU58jd9X7v2XF7iZC6cSzs7Hk=;
 b=o7gC1ysL9YsWwSAyvJMzLQroh/sgbA+FhjxxKkrpxG1CfbLTz5A3aH26Fvt8DcsVpz
 EjSzUMStqLlTZE2Rn9tbS2WMVWtLWwoz/k7WUYQgFBK/vG9UNnk/VV8jXdxg8HCbmbxh
 +sNFHW+0DLNP3xR4/eAzi1mOYe0Z62zlD6BzAmKgGGoQ6hGxJyGkdVwD8o7KSYIWHjmC
 9MIvZq3j/5iC2cw0/MGYbVsq6xnfIvXNJLRhNEl6+W68zCKINSy+O9PSMWzFzuglf4oT
 fJvoI4GC2GLeSqlviOs3xYcvWn0nHD2mGsALa+sFCc3MK6lW3b1r1zWG2t/xoz5sb8mj
 0M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O2gt3iQC5/uG1rR4b3ZU58jd9X7v2XF7iZC6cSzs7Hk=;
 b=FL2iSsktc62GNBtD/5P1zht0G8JLVbESH8XTsAmeBNBkEbllZsMuQWddUzkJGv1Eof
 UWEEXTY5a6RdJ5tVIwfAvgPusxzG6H2rzbpyXQpD+Ld3ExHHOkd7/Vbr2TLKvQOgkjBu
 HHsL1FITwYG5tsC3h5JLsiI/d9/dy6KqIT1B49vPkMYOk4nB9af5REFvqyVNsOXXCZ8J
 YVV8hJ3z87/QdaN8EJ4p6IMA1iMlJXnnti4hpuS45v5GqQn1f8dp4t4GhRMnzKGueq54
 pCT3e5nfuKwjGWKGp16O5CB4pNq4XRBEJzO3JFqrb29fmHaJfCLCCEBC0GwlYPAOsXLQ
 4NhA==
X-Gm-Message-State: AOAM532eCk7DE3JiuVwTNq+f6kzEwnc3Ole2dFUA5ON0RxFb97LZKonH
 Ui2c3U4qkMd5pN17v8dI0/49CB9row4=
X-Google-Smtp-Source: ABdhPJxKLGCJBhoScMbmykwz0K2/+IEs5YmogdUwphwyerumyTrByy1CPMwzEsCX4ohX0UlKNtjyNQ==
X-Received: by 2002:a05:600c:2106:: with SMTP id
 u6mr24436020wml.4.1609707086496; 
 Sun, 03 Jan 2021 12:51:26 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id l8sm30138875wmf.35.2021.01.03.12.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/35] vt82c686: Remove legacy vt82c686b_isa_init() function
Date: Sun,  3 Jan 2021 21:49:59 +0100
Message-Id: <20210103205021.2837760-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <58d7585f979f154b1f1e69fdc026eed6dbc7996f.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/isa/vt82c686.h | 3 +--
 hw/isa/vt82c686.c         | 9 ---------
 hw/mips/fuloong2e.c       | 4 +++-
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index ff80a926dcb..8d2d276fe16 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,13 +1,12 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
-
+#define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_SUPERIO "vt82c686b-superio"
 #define TYPE_VIA_AC97 "via-ac97"
 #define TYPE_VIA_MC97 "via-mc97"
 
 /* vt82c686.c */
-ISABus *vt82c686b_isa_init(PCIBus * bus, int devfn);
 I2CBus *vt82c686b_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
                           qemu_irq sci_irq);
 
diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 9567326d8e2..2912c253dca 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -49,7 +49,6 @@ struct VT82C686BISAState {
     SuperIOConfig superio_conf;
 };
 
-#define TYPE_VT82C686B_ISA "vt82c686b-isa"
 OBJECT_DECLARE_SIMPLE_TYPE(VT82C686BISAState, VT82C686B_ISA)
 
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
@@ -367,14 +366,6 @@ static void vt82c686b_realize(PCIDevice *d, Error **errp)
                                 &vt82c->superio);
 }
 
-ISABus *vt82c686b_isa_init(PCIBus *bus, int devfn)
-{
-    PCIDevice *d;
-
-    d = pci_create_simple_multifunction(bus, devfn, true, TYPE_VT82C686B_ISA);
-    return ISA_BUS(qdev_get_child_bus(DEVICE(d), "isa.0"));
-}
-
 static void via_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 8287e65c52c..435f0e5be5b 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -240,7 +240,9 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     ISABus *isa_bus;
     PCIDevice *dev;
 
-    isa_bus = vt82c686b_isa_init(pci_bus, PCI_DEVFN(slot, 0));
+    dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
+                                          TYPE_VT82C686B_ISA);
+    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(dev), "isa.0"));
     assert(isa_bus);
     *p_isa_bus = isa_bus;
     /* Interrupt controller */
-- 
2.26.2


