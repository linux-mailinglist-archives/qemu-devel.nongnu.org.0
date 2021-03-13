Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286AC33A0BE
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:52:06 +0100 (CET)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAIv-0000ZP-35
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFc-0005kY-D8
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFa-0006nB-Ut
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:40 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l11so6618910wrp.7
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NdWkTYFq4CcNFJEVWCc6s/+3/xKpysVoHg6G3a/oBtM=;
 b=dFvUMEYf1j1/Wrw/e6nUs3LozpmXPldk8DDVFe93AoggoMniod8Z1lopJ87uSQShxv
 UnQtExh650xd7SEiPX1Cn3AKRFkBR0lBTxPdZfnFbh0onty6v99Afm6Izz9yuTBMnFn+
 KiszKVqoNYSg5qPsiCDSfgPI8HOSBCH0iOefSHGx+rX0oja10Jgz0jRMeqAqGAYDmMte
 TKADyjfjTlZqxqwATQUHNfT8Hrc//vPFnXODKFNqfizeNFse5HMObVWE2Z8+gQbBe2p7
 uoehjXx486IdFM3PFsHevtelwV5UM72vN2fB23CxGPJ/p5xyQUGmhQwcvNSnKPzxkjQh
 k7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NdWkTYFq4CcNFJEVWCc6s/+3/xKpysVoHg6G3a/oBtM=;
 b=tBLVOvDhvZkalXy9n5OOlMs0nw3QbQn3BdGhPfRFevIsnUCIZdnYLTlfCxfx+LID6V
 maCzqa9IAWzX6Wjy8slaC/68YM2bUKHfsJJ0WlwgZN5TsmRLVAMCUg94WTJmhPuSSUWh
 /UuRHgQBcvoIk8jPf67/8HAqTdALnEA+khHfi2WzCOBgcyFPQfk5ebOrgvAEu9TjXs7I
 l5nipTwbp9YHUJ9TSulPeV1smFcTbNQ50DAySHxHOTB+tyDfRQu3CSmga2wz+ji6yq4V
 lGPlxhNtBnbPRzX2yQGQtOMI5NCSLdydxJr/vQolJ1o2NLLzkcwdP0n4aF+MicwSkjri
 hY4g==
X-Gm-Message-State: AOAM532c3n8dVH3EkLGZJMPlKOVkYLWOXzIlv7cVJ6hWJPIDnLGLm8wV
 sFhb/kCZNEQg93RCtkMXJOCB7Q4TJG+e0g==
X-Google-Smtp-Source: ABdhPJxQAeIvP1o92Kti5erMo9ukbM96BO1lIRiTQLdJLcWjWuYzb//x0xKRFFI6cE+zyrLaubzSCQ==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr20684883wrc.162.1615664916929; 
 Sat, 13 Mar 2021 11:48:36 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v18sm14511057wrf.41.2021.03.13.11.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:48:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/27] hw/mips/gt64xxx: Initialize ISD I/O memory region in
 DeviceRealize()
Date: Sat, 13 Mar 2021 20:48:03 +0100
Message-Id: <20210313194829.2193621-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ISD I/O region belongs to the TYPE_GT64120_PCI_HOST_BRIDGE,
so initialize it before it is realized, not after.
Rename the region as 'gt64120-isd' so it is clearer to realize
it belongs to the GT64120 in the memory tree view.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210309142630.728014-2-f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 588e6f99301..6eb73e77057 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1196,6 +1196,14 @@ static void gt64120_reset(DeviceState *dev)
     gt64120_pci_mapping(s);
 }
 
+static void gt64120_realize(DeviceState *dev, Error **errp)
+{
+    GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
+
+    memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
+                          "gt64120-isd", 0x1000);
+}
+
 PCIBus *gt64120_register(qemu_irq *pic)
 {
     GT64120State *d;
@@ -1214,8 +1222,6 @@ PCIBus *gt64120_register(qemu_irq *pic)
                                      get_system_io(),
                                      PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    memory_region_init_io(&d->ISD_mem, OBJECT(dev), &isd_mem_ops, d,
-                          "isd-mem", 0x1000);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
     return phb->bus;
@@ -1270,6 +1276,7 @@ static void gt64120_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->realize = gt64120_realize;
     dc->reset = gt64120_reset;
     dc->vmsd = &vmstate_gt64120;
 }
-- 
2.26.2


