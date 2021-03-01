Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B2327DAF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:56:11 +0100 (CET)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGh9m-0000Ub-QB
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:56:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7S-0005XO-4K
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lGh7Q-0007Wq-C0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 06:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614599623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xepneabtMBs6KXDAhAA/tNxteramngj4xAhOLaaKo9c=;
 b=GurEYjKZpb89MJqRGTlzwv06gtN5M0vLYE/37jCIJTnyOTkwE+4kFTaIchoTeiZUbFJY/k
 Ecm2QqN8IMGMkwZNf7aIzCRrDRD1FfcCaQnyjESSATz2L73hyJlt2wok5RxAHU11+NyQ/1
 1LEuCPg9QQ+ATLyOik564p7F+4Kz+Yc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-NC6XdSJ5OVumWsdAe8d8AQ-1; Mon, 01 Mar 2021 06:53:42 -0500
X-MC-Unique: NC6XdSJ5OVumWsdAe8d8AQ-1
Received: by mail-wr1-f70.google.com with SMTP id l10so9245395wry.16
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 03:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xepneabtMBs6KXDAhAA/tNxteramngj4xAhOLaaKo9c=;
 b=JOkJ8NxB7DGC1x1zkB1neHA4IXKCk6L5JoWDy6gSzGtrVi3M9Bdz1nO4lPAsSgp45A
 /OZxML0UN6fGitniXdgjOCLwsvWCGQUfSaOSoshC/y90jgG8eqPc2UpfOb5w1G0mEn3y
 d7cNUnnDX4GxFBOMODUnNik4AMVNAviBMJIffHyga0zoGrXajPLKBmfUcKRe9TBox46j
 Js98xXPnnp+GzgxwTnFJCwxKfEOz2L+H3IC2HLo1wOXIE4bIyCzpAn5Yw/lOsC7Y4jEu
 sJSE3no7G3AiVMu0aSgn9X1QAyKelFuNNyJtdvSazma2rGW/pWnAB4hiaVHQlsMADYPn
 IOpQ==
X-Gm-Message-State: AOAM531GTaHKdRZsKrGmW4OsO18LDk3mQPisrCiraJkVP4djrLK8yPdu
 nxzc78n9sP0JiGj8g5Z6ZBFms8MIvvjgl+yrScwHBDtJ3J4/9UvNDTNAXWPIQHR87mfLKATEgmL
 +WTaLDzKYhG3Ja0gR0x0/Kliuv6w+/E/2jII7B3Bz7biazmcg0GPC8K6aV6GBH21c
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr10412733wrx.154.1614599621260; 
 Mon, 01 Mar 2021 03:53:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbSJLJuO+qUHga/oM29TRxmPqrK07VydbWzvMt7RdfoPM8pPg8OJhd2ySGk59IiVOlBfTLaw==
X-Received: by 2002:a05:6000:191:: with SMTP id
 p17mr10412706wrx.154.1614599621111; 
 Mon, 01 Mar 2021 03:53:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j20sm3089944wmp.30.2021.03.01.03.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 03:53:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	David Edmondson <david.edmondson@oracle.com>
Subject: [RFC PATCH v2 2/3] hw/block/pflash: Move code around
Date: Mon,  1 Mar 2021 12:53:28 +0100
Message-Id: <20210301115329.411762-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210301115329.411762-1-philmd@redhat.com>
References: <20210301115329.411762-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Max Reitz <mreitz@redhat.com>, haibinzhang <haibinzhang@tencent.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First do the block checks, so we know if it is read-only or not.
Then create the MemoryRegion. This will allow optimization in
the next commit.

Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 24 ++++++++++++------------
 hw/block/pflash_cfi02.c | 18 +++++++++---------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 22287a1522e..a5fa8d8b74a 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -731,18 +731,6 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
     device_len = sector_len_per_device * blocks_per_device;
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
-    if (*errp) {
-        return;
-    }
-
-    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
-
     if (pfl->blk) {
         uint64_t perm;
         pfl->ro = !blk_supports_write_perm(pfl->blk);
@@ -755,6 +743,18 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         pfl->ro = 0;
     }
 
+    memory_region_init_rom_device(
+        &pfl->mem, OBJECT(dev),
+        &pflash_cfi01_ops,
+        pfl,
+        pfl->name, total_len, errp);
+    if (*errp) {
+        return;
+    }
+
+    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+
     if (pfl->blk) {
         if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
                                          errp)) {
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 7962cff7455..4f62ce8917d 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -791,15 +791,6 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
-                                  &pflash_cfi02_ops, pfl, pfl->name,
-                                  pfl->chip_len, errp);
-    if (*errp) {
-        return;
-    }
-
-    pfl->storage = memory_region_get_ram_ptr(&pfl->orig_mem);
-
     if (pfl->blk) {
         uint64_t perm;
         pfl->ro = !blk_supports_write_perm(pfl->blk);
@@ -812,6 +803,15 @@ static void pflash_cfi02_realize(DeviceState *dev, Error **errp)
         pfl->ro = 0;
     }
 
+    memory_region_init_rom_device(&pfl->orig_mem, OBJECT(pfl),
+                                  &pflash_cfi02_ops, pfl, pfl->name,
+                                  pfl->chip_len, errp);
+    if (*errp) {
+        return;
+    }
+
+    pfl->storage = memory_region_get_ram_ptr(&pfl->orig_mem);
+
     if (pfl->blk) {
         if (!blk_check_size_and_read_all(pfl->blk, pfl->storage,
                                          pfl->chip_len, errp)) {
-- 
2.26.2


