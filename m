Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A62A325A0B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 00:06:47 +0100 (CET)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPiY-000147-1f
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 18:06:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPf0-0006ZO-IT
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:03:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPey-00071D-Ce
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614294183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=//g/7OffRCofFHIb1cBxIBJjHhepgsuxtwRomhT/GoA=;
 b=b+ueRqSmgpmg6lJCWCr7AtA6HD7W9Xk95c54oowMBDVx4WFoALpnfU7zMgq3R6M4A/bDQT
 lQ1jFqVBB8RNIMp9FTS2IdouRCcoW1JGpzC5xKnRMz7eArMIwCTAwohM4DFONb+07R5TjJ
 9+mP4SQAkS4M9mDYVH+fz3FHvCCU3G4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-e2VJ5zZxPZKMI58rycymug-1; Thu, 25 Feb 2021 18:03:02 -0500
X-MC-Unique: e2VJ5zZxPZKMI58rycymug-1
Received: by mail-ed1-f69.google.com with SMTP id i4so3625604edt.11
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 15:03:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=//g/7OffRCofFHIb1cBxIBJjHhepgsuxtwRomhT/GoA=;
 b=Bas3cnHKb2i8Si0vAeQ33LLvAYVQEhhQN6Bn/pwOguc/4Z3+lhS/NSjexI/xdEYDin
 PrAiWxi7LuvV9hs/ldaa2BHp2hMxIe0pOHu62XbchfriAay3Y4+Zu+1oGJScpFgBBoyT
 TvQSOW7zsI/Fwla5XYbne6ji3ko3/ePEYkWmjpEeuzN1htX5lAAb5g9KAJs6QtDytUBd
 ILA+BS5Pa5I+kZDnvj31xUsJQJnCrV3SpaEqtEYUtC4MqKc1TqN5FkB6f0nE7ZaNtL4r
 RGNLsZueJezNQaVJMHP2sT05Dwcz10R+3I7oj7LCov/1ARx6+RD2MbgV4IGpe+BVLxky
 R6TQ==
X-Gm-Message-State: AOAM5336ZbVELdExtrazpkFF38CJ3A/QN0vQbp7ewjroQQBm1Lx99JGQ
 cB+2oilG0YqCmKqUgNIwrH45lla9s/RBGFq13tRJ0HWaYME6Idx8+byqL83qpt2WqyI6gjW24gy
 GJaQGyYtiNB7Bbd4M8BP6iEXx5MAdgKmr0OVXNAMvsZAXBXsWBLk38SvXh0s95A1J
X-Received: by 2002:a17:906:2558:: with SMTP id
 j24mr5124001ejb.447.1614294179147; 
 Thu, 25 Feb 2021 15:02:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPDh0PhxbKHclw/uq42wtixE2aZ/PRB1a3t+RYQmspwOdw8VMv297eHl8H+OHOW1CDhdInwQ==
X-Received: by 2002:a17:906:2558:: with SMTP id
 j24mr5123967ejb.447.1614294178954; 
 Thu, 25 Feb 2021 15:02:58 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t25sm4591954edt.41.2021.02.25.15.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 15:02:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	David Edmondson <david.edmondson@oracle.com>
Subject: [RFC PATCH 3/3] hw/block/pflash: use
 memory_region_init_rom_device_from_file()
Date: Fri, 26 Feb 2021 00:02:38 +0100
Message-Id: <20210225230238.3719051-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210225230238.3719051-1-philmd@redhat.com>
References: <20210225230238.3719051-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Xu Yandong <xuyandong2@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Zheng Xiang <zhengxiang9@huawei.com>,
 haibinzhang <haibinzhang@tencent.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the block drive is read-only we will model a "protected" flash
device. We can thus use memory_region_init_rom_device_from_file()
which mmap the backing file when creating the MemoryRegion.
If the same backing file is used by multiple QEMU instances, this
reduces the memory footprint (this is often the case with the
CODE flash image from OVMF and AAVMF).

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 20 ++++++++++++++------
 hw/block/pflash_cfi02.c | 18 ++++++++++++++----
 2 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index a5fa8d8b74a..5757391df1c 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -743,11 +743,19 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->ro = 0;
     }
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
+    if (pfl->blk && pfl->ro) {
+        memory_region_init_rom_device_from_file(&pfl->mem, OBJECT(dev),
+                                                &pflash_cfi01_ops, pfl,
+                                                pfl->name, total_len,
+                                                qemu_real_host_page_size,
+                                                RAM_SHARED,
+                                                blk_bs(pfl->blk)->filename,
+                                                true, errp);
+    } else {
+        memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
+                                      &pflash_cfi01_ops, pfl,
+                                      pfl->name, total_len, errp);
+    }
     if (*errp) {
         return;
     }
@@ -755,7 +763,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
 
-    if (pfl->blk) {
+    if (pfl->blk && !pfl->ro) {
         if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
                                          errp)) {
             vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 4f62ce8917d..d57f64d7732 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -803,16 +803,26 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         pfl->ro = 0;
     }
 
-    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
-                                  &pflash_cfi02_ops, pfl, pfl->name,
-                                  pfl->chip_len, errp);
+    if (pfl->blk && pfl->ro) {
+        memory_region_init_rom_device_from_file(&pfl->orig_mem, OBJECT(pfl),
+                                                &pflash_cfi02_ops, pfl,
+                                                pfl->name, pfl->chip_len,
+                                                qemu_real_host_page_size,
+                                                RAM_SHARED,
+                                                blk_bs(pfl->blk)->filename,
+                                                true, errp);
+    } else {
+        memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
+                                      &pflash_cfi02_ops, pfl, pfl->name,
+                                      pfl->chip_len, errp);
+    }
     if (*errp) {
         return;
     }
 
     pfl->storage = memory_region_get_ram_ptr(&pfl->orig_mem);
 
-    if (pfl->blk) {
+    if (pfl->blk && !pfl->ro) {
         if (!blk_check_size_and_read_all(pfl->blk, pfl->storage,
                                          pfl->chip_len, errp)) {
             vmstate_unregister_ram(&pfl->orig_mem, DEVICE(pfl));
-- 
2.26.2


