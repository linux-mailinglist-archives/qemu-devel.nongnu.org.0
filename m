Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9D5F71F2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 01:40:46 +0200 (CEST)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogaTs-0005Kr-16
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 19:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogaQx-0002t3-BX
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 19:37:43 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogaQv-0007M9-Sp
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 19:37:43 -0400
Received: by mail-qt1-x842.google.com with SMTP id s21so1963681qtx.6
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 16:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nXnrCCrFrEHRTzjU4zPgMKQljTe3AEJH6ThNJaFK9+Q=;
 b=gdLG/8hwiQYAhivNCwdR/gGa3loMyrfQjaEvDSDjtjgQT0eMkMCtlv3JNy2ib5770H
 qFqQtwd3efSl8Xr/IO66240r/OyMvVUKWXyP/fgSOHyUZNG3B8oWS5DvjnngZv0HU7Gk
 NB2bNPu6MqjvMEb5GbYFK4fQoFA2MFvGt4SLvJRX5XS7Apoy6EAM58LBdUxe34cohbVV
 +sGa1n4TotjWb05XxDPV+3SJsydQ0As2xdgQBhyvZOnAj/Q6jYMBNpDTaJVxvCLUax6b
 uJ2SMS2JGTjVqKL+PqSyifYIGi9OESUYwu3LMYHGi+9W86lLIsbhTFZs5EXCLGn+1PPR
 VtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nXnrCCrFrEHRTzjU4zPgMKQljTe3AEJH6ThNJaFK9+Q=;
 b=bHZ1gJEc6EWbCW1Ohof1pTasAWjYN9XRMyCmGxYa956kbQf60cwC5g0UMB5KhaGvNJ
 kwm6ccxe9iTAp6dwhroOrhjHYQRJvlYCk6Bcjjbwy/KS2MU0iltfCKOEqHoUw9HuTZUe
 02BUUJLvoKvrBWjygnn+CYNZ2HNBm+HHj/o1FocSckbjbP0zm3CzCzoigRhF32wicRes
 mHwzTA55PlS5C74knIwusYZDOZYBYSZkHJhz5Sl0MTVkMl7GQ5NkQ5tvHHpmyuV2xS0h
 UCwraQIfFupXyF5mf0aV4raZbVJLIcED8HnactQeZcInRMAS9ThYduTLV+IBeCf0ZbiB
 KJPQ==
X-Gm-Message-State: ACrzQf3mSZ9sciVq6iIcNLtmJAiHJ5seg88XP0CC9fYOZgTgP8PxYA81
 vBptLOXoVM0lxo1rbzW0+HwmIEY3VA==
X-Google-Smtp-Source: AMsMyM47ayvjPLxl4MVI8DahP9BUKGU2hKr9rMCxuYdKTO0z2kAC/g3fWUf0v9SONi6H6NAE/TlvKw==
X-Received: by 2002:ac8:5d88:0:b0:393:a9e3:ac82 with SMTP id
 d8-20020ac85d88000000b00393a9e3ac82mr2336207qtx.632.1665099460705; 
 Thu, 06 Oct 2022 16:37:40 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 y21-20020a05620a44d500b006b8f4ade2c9sm528032qkp.19.2022.10.06.16.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 16:37:40 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, Gregory Price <gregory.price@memverge.com>
Subject: [PATCH 1/2] hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
Date: Thu,  6 Oct 2022 19:37:01 -0400
Message-Id: <20221006233702.18532-1-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qt1-x842.google.com
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

Current code sets to STORAGE_EXPRESS and then overrides it.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
---
 hw/mem/cxl_type3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index ada2108fac..1837c1c83a 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -146,7 +146,6 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     pci_config_set_prog_interface(pci_conf, 0x10);
-    pci_config_set_class(pci_conf, PCI_CLASS_MEMORY_CXL);
 
     pcie_endpoint_cap_init(pci_dev, 0x80);
     cxl_cstate->dvsec_offset = 0x100;
@@ -335,7 +334,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
 
     pc->realize = ct3_realize;
     pc->exit = ct3_exit;
-    pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
+    pc->class_id = PCI_CLASS_MEMORY_CXL;
     pc->vendor_id = PCI_VENDOR_ID_INTEL;
     pc->device_id = 0xd93; /* LVF for now */
     pc->revision = 1;
-- 
2.37.3


