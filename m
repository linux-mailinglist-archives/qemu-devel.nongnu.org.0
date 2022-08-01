Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D89586255
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 03:42:10 +0200 (CEST)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIKRd-0006jd-CY
	for lists+qemu-devel@lfdr.de; Sun, 31 Jul 2022 21:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJV-0003Qk-6K; Sun, 31 Jul 2022 21:33:45 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oIKJT-0000dX-Ft; Sun, 31 Jul 2022 21:33:44 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x2-20020a17090ab00200b001f4da5cdc9cso3523625pjq.0; 
 Sun, 31 Jul 2022 18:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=GKVrcwEXCl2prSJ6/7KlSnZxGgo82D1bXh5Xv9PM7A0=;
 b=oLKUcU8qwFYLSm8ce+GuSPJD4lQOq+jxdy5DKngX1GiSMzZvUHiql5Q+xcxSSCHa6P
 5bsXj6sCRD7h6TKRy8shvlJVU5aZMdBfYEGZtJWp2OlerJW27Vo2ci0LBdGIx5k/PCKb
 Dvqs+GtxCofEeXGYlTXyUwAldj7ggg/FK/t6mf9X+KCF101V38D/UravvTnk8YrVNO5L
 akC5+tbr6bEW23KI1xxZrsoVtf7Tn+lRV7ZdOXVatc3BTlQ2yRAn/6YaVy6J748/U56w
 UYO6FfZYbf7MLUbO24DN518pOve81tg0aoNiP1E7nNlejL6aG7Fa8gB+roEgnHSadnB4
 xyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=GKVrcwEXCl2prSJ6/7KlSnZxGgo82D1bXh5Xv9PM7A0=;
 b=zwtDBJGkWFH3TU+/LmD1QmO5nVVoybtL3eBCitYirLTfveemlGpxGJQRCkg38Ixwuu
 hQs74ZbQUZ+1PvIW/EACxVtqB1jeGAAccAvGOjoo2GSWJTTspAEVUqd6emW6YdnjVdgi
 tHv8v13zHdrJZfHoEFf2+0rYjg9jHu4IdbOk6NbYWyZOVc8UNwkLAzKgpUI8k0WYrv1v
 JVaYIzTxt27RjP1w9XTuumXwc0Km4qapp5v2uUCem5OiWjpH/1bfu5DHL6cpEpU70eqf
 CeQR5qBippzBAcWXD/0kQk5m6kFIP33umFN1wtfCoYXM3AKlfYUVCfuAe2NkQQJV7KJQ
 5L3w==
X-Gm-Message-State: ACgBeo3ZZy1lS+uFtW0eynnac09ER0cPFzM/IVU82/Ev0aguwIq307e7
 4MKo14FI3KQtCGRRRY+xxqMbZD6IHlvUziwz
X-Google-Smtp-Source: AA6agR4BVSUKf+vLgrcNwEJG7S5m1so1mRZzsD6fav/yyml4YFyA2/7PmPV4+v0QzmUdx5GKjV/DGQ==
X-Received: by 2002:a17:903:40c7:b0:16e:e32d:259c with SMTP id
 t7-20020a17090340c700b0016ee32d259cmr4635424pld.67.1659317621217; 
 Sun, 31 Jul 2022 18:33:41 -0700 (PDT)
Received: from roots.. ([106.84.131.7]) by smtp.gmail.com with ESMTPSA id
 63-20020a620642000000b00528c8ed356dsm7269625pfg.96.2022.07.31.18.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 18:33:41 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, dmitry.fomichev@wdc.com, hare@suse.de,
 stefanha@redhat.com, mst@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org, fam@euphon.net, kwolf@redhat.com, hreitz@redhat.com,
 eblake@redhat.com, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v5 07/11] config: add check to block layer
Date: Mon,  1 Aug 2022 09:33:33 +0800
Message-Id: <20220801013333.10644-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Putting zoned/non-zoned BlockDrivers on top of each other is not
allowed.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
---
 block.c                          | 13 +++++++++++++
 block/file-posix.c               |  2 ++
 block/raw-format.c               |  1 +
 include/block/block_int-common.h | 10 ++++++++++
 4 files changed, 26 insertions(+)

diff --git a/block.c b/block.c
index bc85f46eed..8a259b158c 100644
--- a/block.c
+++ b/block.c
@@ -7947,6 +7947,19 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
         return;
     }
 
+    /*
+     * Non-zoned block drivers do not follow zoned storage constraints
+     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
+     * drivers in a graph.
+     */
+    if (!parent_bs->drv->supports_zoned_children && child_bs->drv->is_zoned) {
+        error_setg(errp, "Cannot add a %s child to a %s parent",
+                   child_bs->drv->is_zoned ? "zoned" : "non-zoned",
+                   parent_bs->drv->supports_zoned_children ?
+                   "support zoned children" : "not support zoned children");
+        return;
+    }
+
     if (!QLIST_EMPTY(&child_bs->parents)) {
         error_setg(errp, "The node %s already has a parent",
                    child_bs->node_name);
diff --git a/block/file-posix.c b/block/file-posix.c
index 6c045eb6e8..8eb0b7bc9b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -4023,6 +4023,8 @@ static BlockDriver bdrv_zoned_host_device = {
         .format_name = "zoned_host_device",
         .protocol_name = "zoned_host_device",
         .instance_size = sizeof(BDRVRawState),
+        .is_zoned = true,
+        .supports_zoned_children = true,
         .bdrv_needs_filename = true,
         .bdrv_probe_device  = hdev_probe_device,
         .bdrv_parse_filename = zoned_host_device_parse_filename,
diff --git a/block/raw-format.c b/block/raw-format.c
index 6b20bd22ef..9441536819 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -614,6 +614,7 @@ static void raw_child_perm(BlockDriverState *bs, BdrvChild *c,
 BlockDriver bdrv_raw = {
     .format_name          = "raw",
     .instance_size        = sizeof(BDRVRawState),
+    .supports_zoned_children = true,
     .bdrv_probe           = &raw_probe,
     .bdrv_reopen_prepare  = &raw_reopen_prepare,
     .bdrv_reopen_commit   = &raw_reopen_commit,
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index de44c7b6f4..0476cd0491 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -126,6 +126,16 @@ struct BlockDriver {
      */
     bool is_format;
 
+    /*
+     * Set to true if the BlockDriver is a zoned block driver.
+     */
+    bool is_zoned;
+
+    /*
+     * Set to true if the BlockDriver supports zoned children.
+     */
+    bool supports_zoned_children;
+
     /*
      * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
      * this field set to true, except ones that are defined only by their
-- 
2.37.1


