Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620943329BD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:08:45 +0100 (CET)
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdyW-0006fE-Au
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJp-000402-D2
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:42 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJn-0005xQ-3f
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id x9so20450252edd.0
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVB7ePXcQjZw4uETcObG8sFKSRsuTJl6nrIlWHavPsM=;
 b=Oa1mRk2S+YDQ4qA1OBgVLC+5cxUzHGUx9hBqoe2c9FEDs7LtqS72Nd/D0AOsE2CM1J
 MQXXrSSIilXP2TxoDFS+XUxBXqlKi3Oqz8OJrVvovhgcxnz0FJO4XXPtHR55WWR9fAU0
 GHPRrlMXbowfdMcwC0+3iUDc97IFSYOotRHfhcUoI/9LHrMeiWpJ4AAnJD+BxKkHHitj
 u5O1tPc2fW4g8B0dAfXIcYi4w/AdwqiiiscfZp97r42dkrR1/3U75ruatMVHLcidpnV2
 yM5xMYvdueAv/40EEW1mYzstDBBXrmPpEYaH8Ht3GCyCOf0LSHtzryKuhr87Xwy8nYq2
 d3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EVB7ePXcQjZw4uETcObG8sFKSRsuTJl6nrIlWHavPsM=;
 b=d+2ZBa2t0aAc8ZWBuDg1Kg3K0kO9/tOZmxUFFNMj+OaQPXp3hkdIzASOoyKmeX6k04
 BvcyzknThbORu3EQgp6bs+4dqZmTQ1SFfrKlHxGaXL1J9FgldRo7b7wsjyBYpV1MvdC9
 D4cx7i6sd5+gf68PJksTa5slv5lWV3KXMFUgcOE0gkMJDlG4kW/Uzn53HO3vbc7jPLHr
 6i8PqqaVuiO8la86qVotaMbpNwhInP0QhwhyZBhpALVCjpsHYfNNwOFrFwD5NyYETD0P
 6uKF4Yw8YceJDwLbu44dwH1MHur1o9xKPTgYzzBNwcGelrxSa9dL/RQUdhWSPO6J0MOY
 PB0Q==
X-Gm-Message-State: AOAM531DJ5n8bkEySTZuY91Ob9xr9O6Sm8v8eCNIJ9uiVXzB0XcKv6rd
 ypZwwlVkxgrdk2jl2uzmoKVtDKSYfjU=
X-Google-Smtp-Source: ABdhPJx1XLXIp2cWD2NoiJAPf3mjBP+R3DmREU2o4gkHTTuR0Rq0Z51VBBM06z0f0OfAZJdzhWFLJA==
X-Received: by 2002:aa7:dc04:: with SMTP id b4mr4360579edu.221.1615299997608; 
 Tue, 09 Mar 2021 06:26:37 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u16sm9361089edq.4.2021.03.09.06.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:26:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 1/6] hw/mips/gt64xxx: Initialize ISD I/O memory region
 in DeviceRealize()
Date: Tue,  9 Mar 2021 15:26:25 +0100
Message-Id: <20210309142630.728014-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142630.728014-1-f4bug@amsat.org>
References: <20210309142630.728014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ISD I/O region belongs to the TYPE_GT64120_PCI_HOST_BRIDGE,
so initialize it before it is realized, not after.
Rename the region as 'gt64120-isd' so it is clearer to realize
it belongs to the GT64120 in the memory tree view.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


