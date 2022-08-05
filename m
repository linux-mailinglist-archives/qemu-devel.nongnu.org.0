Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F78C58A804
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:25:24 +0200 (CEST)
Received: from localhost ([::1]:49316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJse2-000898-6m
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsE6-0003NV-Cv; Fri, 05 Aug 2022 03:58:34 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oJsE4-0001yZ-Oz; Fri, 05 Aug 2022 03:58:34 -0400
Received: by mail-pf1-x433.google.com with SMTP id h28so1581963pfq.11;
 Fri, 05 Aug 2022 00:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0bfoHoSanZtQiV7SoIqqkoxtM2o34+5XyFcXpFu8r9A=;
 b=fUQFgtGURTl0NzcoP52VBrgAdjzGTrIWl/s4qAGC3+HU4JmAZTZ0lvk7QhH3sKTK5W
 uBRQ61rfmX0u5qapnwM1E1a87W6iLtpHohNUdsep2CiE5Mx8qR+YRv0zuhxzOqrNAKm+
 wTj4vKuVRoenYTI4eUb0COmzkWQgDHzg+iJHiXIArmkAM8KgUz5DNrNmjq19VzKyyb8B
 bc3veWlZLE5cmRgsDOhl6eR+XLXDbds3bKtWW0JvtL2uRtwdIr1dWAOetHNDqYVkRMZM
 gPE9P/l1qwIEF9QCb/7lXKI1/GhHlV9akPHHHv5kZY5ipCoQoCJ9tVvDx7pcUkxV5GGV
 MivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0bfoHoSanZtQiV7SoIqqkoxtM2o34+5XyFcXpFu8r9A=;
 b=7TBEJCtIB0nuVyTvQ+ekvAI/FL7atcMO8PLxD1Xd5XZRxIwpRONLNO80Rt3jOwCKyk
 ajbTzdIiH7bqxLbwB50sGxf840M5gVAqZKpylmZDaScm/ikP1vKpbPJ3WSakcm4q28md
 j6Y6aXvNJibptUBDYdjo40VDXXjsxjBZ0FuZG8jLoRwQV2uAtzxMo2beGCm7IrtwOZEp
 tyfP5C6q4aaOtR4yGY0LZWVJ9x/gF2pkyuM1BBcdhRfXOJk76iOALqYvZ1TS7s6lqAKT
 utk7G2xP2pv/rGhVT8pCiJKwQsUkc2y/yi+A+0hAwyqLTWTtedwUFKTURJNEt38+hGFr
 jDUw==
X-Gm-Message-State: ACgBeo1D82pdF17lNl7dgY1ZHvGYahCl5reReGWEL9jxKkB5WUuCoRvH
 GdOi4pND2qxbigaEZWygGit8XvPzo9SUOQ==
X-Google-Smtp-Source: AA6agR7XMF5JA0sSkKJEw7j2RVggNf8mylJs4pkxPCkgWSypzTjJForxO82WbpmlX6a/7To4OBmJNQ==
X-Received: by 2002:a05:6a00:1641:b0:52d:3dde:73c5 with SMTP id
 m1-20020a056a00164100b0052d3dde73c5mr5535112pfc.24.1659686310905; 
 Fri, 05 Aug 2022 00:58:30 -0700 (PDT)
Received: from roots.. ([106.84.130.246]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b0016ee708350bsm2418564plg.14.2022.08.05.00.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:58:30 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hare@suse.de, Stefan Hajnoczi <stefanha@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 damien.lemoal@opensource.wdc.com, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v6 6/8] config: add check to block layer
Date: Fri,  5 Aug 2022 15:57:49 +0800
Message-Id: <20220805075751.77499-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805075751.77499-1-faithilikerun@gmail.com>
References: <20220805075751.77499-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x433.google.com
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c                          | 13 +++++++++++++
 block/file-posix.c               |  1 +
 block/raw-format.c               |  1 +
 include/block/block_int-common.h | 10 ++++++++++
 4 files changed, 25 insertions(+)

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
index 2627431581..7ab39eb291 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -4048,6 +4048,7 @@ static BlockDriver bdrv_zoned_host_device = {
         .format_name = "zoned_host_device",
         .protocol_name = "zoned_host_device",
         .instance_size = sizeof(BDRVRawState),
+        .is_zoned = true,
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


