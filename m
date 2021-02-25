Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BBE325A0C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 00:07:10 +0100 (CET)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPiv-0001LR-Oo
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 18:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPew-0006Ru-8j
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:03:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPet-0006ys-LA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614294176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJG0er+QNebAk4w+3LZsO8sLinAOdx+C5yOC5sTpKQE=;
 b=RWMuNXStdqGEU5Fc9VXSJaRAL1AA4+F5bPLnj/2Z+xhBDNOjyGHz8QNlaGMbM3Jmp3W36D
 U2vvCnKK2jIMr4ksNBnNvcgOxSDCmUwovaFF44ypziPuREY5uq8L3wigCPw7S0G5zk5gB1
 Ta43HJkuLy9VDpc/gAlpT7RsxZCoNno=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-Ad0DP5XqOPSP-HaDK547qw-1; Thu, 25 Feb 2021 18:02:55 -0500
X-MC-Unique: Ad0DP5XqOPSP-HaDK547qw-1
Received: by mail-ej1-f69.google.com with SMTP id ml13so3257898ejb.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 15:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJG0er+QNebAk4w+3LZsO8sLinAOdx+C5yOC5sTpKQE=;
 b=RX6qy7Oq1fv6zB4hgAx9vgzmaeM1NK/QIrkuwyj7ZYEf/UyNcSfD2Py872a/BLLQYD
 6rtmAuST5xZ+jFlXHPmIQiFiBNNWxDWLjLL5s23ye8qAw14IeNfTMbWDwa60fqBwDlQM
 byz6PSLiBvEtsuW0DLGAJ4Xh7DAnkMdX+GS+3s2QxvjJCq+Hftb+uA3UJmr2R8CV1UVs
 V8hf2b9ne3D19aBdjDh1jW/n8jfCquRlL4WE4I96TkN7DLSB0IV2eRSPcSR9mjXG/T68
 iitd/VR1Nzy2fRBrXOe7V/sdAL9/H2ObcpcKuTz77g0KFEinYJxyGC8xAsDrAI7GSAeF
 ceAw==
X-Gm-Message-State: AOAM533PUQlaHlxLIMfBGeBr+junCLUl4qxeOBksQYaRNi+AyXgOEvRS
 LWvuiPr/Jo4JVBIwhCmyF9SaGPp/lIJzRMzNH92SJEuaf8co2+Tq30IlY61Q3bRPD7k3J+pRL+B
 YTm4FjVxjcvsck4l9nvyLR2ky/8ownHLar3/UCaMh/AxZ3t/gBRLy6RX4paJ6CJLO
X-Received: by 2002:a17:906:3510:: with SMTP id
 r16mr5259878eja.186.1614294173513; 
 Thu, 25 Feb 2021 15:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRF6AYpnGCVCg3wn6q8pITbe5nkeK/eQVx9U0JsXetVKsyh8lYFLsBBieZs9vqr6mtZ/H9Hw==
X-Received: by 2002:a17:906:3510:: with SMTP id
 r16mr5259841eja.186.1614294173309; 
 Thu, 25 Feb 2021 15:02:53 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i13sm3906372ejj.2.2021.02.25.15.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 15:02:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	David Edmondson <david.edmondson@oracle.com>
Subject: [RFC PATCH 2/3] hw/block/pflash: Move code around
Date: Fri, 26 Feb 2021 00:02:37 +0100
Message-Id: <20210225230238.3719051-3-philmd@redhat.com>
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

First do the block checks, so we know if it is read-only or not.
Then create the MemoryRegion. This will allow optimization in
the next commit.

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


