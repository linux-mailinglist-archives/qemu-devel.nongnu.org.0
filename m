Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB855B445C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 08:01:16 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWtYJ-0005Te-I4
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 02:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt3F-0002hg-N7; Sat, 10 Sep 2022 01:29:09 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oWt3D-0004om-TG; Sat, 10 Sep 2022 01:29:09 -0400
Received: by mail-pf1-x433.google.com with SMTP id y127so3549761pfy.5;
 Fri, 09 Sep 2022 22:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WersfKtJfq9RRX6LalJZUvf6ogtYBj2HxLF2mLcz/E0=;
 b=PeWxprVFaVaQHBOuTlI4DRfPJX6we43xxADEgc2AZXnCZa3A+cEZYCc5RhfaPUJLH1
 Yxp1j2TLIM2n4LXsF9LozSKbIb06I2bqx62OiXT/1bUhBNW7I1FK0zierCJX2nJnmQmH
 eMVdfKyCzXqGPT3zs84vmJHxjYoSdH9UHMQYl1zsg4BDakGoQNI+kfRtbrZfAj7tdwWK
 jl5VQBvsoPh8LQA/MuQEoBHEJFgX5zsbVv0f+Aldqyr5OTnbS9t2tZCc8ngZ3HfO3W3C
 iRwE5PoQ1w7528KRBRxcyBMMfmbfu6OWisjINIQ+r6BVYwwjKB31/NluAexNNyU4oAfM
 7MiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WersfKtJfq9RRX6LalJZUvf6ogtYBj2HxLF2mLcz/E0=;
 b=sW2Vs6tauy+rU7iemLw1+nyc3exlfVwsr0YLzlRPShU4t8cdssul2/bXKi8sRGHw2y
 2UfcbJFzHm0hZsxyoqLf5bYioHELu5Eads5MKhpDmwivEIKFTkexwxcNTHf7x+A2Ep4S
 VXCov6YEskQaNudRcJ9o/tyCuvh0uuTT//OtfS+4MB4g+yTNoFDD+ER412tcXSEHw3AN
 aYkubO2Tpk7Las5jwV0S/oDPEqOYzh9kouD1L+8NHVaPe/iWrjpaFc1aN6IEiynQOGMD
 KvZXiSQch2FBpt8U3Pax3SSZaFAhVD03NEfYRI+R/7KXP0l4hFV+ltl06j+dl8cuj63W
 GOFg==
X-Gm-Message-State: ACgBeo1XeryisFNKJFEQYoHLOinI9pCqEIJu/oh+gHI+RWy7Fsc0f/C1
 0jrliC+332X0yYWh7yXVYhqF12gvmuvpIBWu
X-Google-Smtp-Source: AA6agR6P4qA6YnqL5eoUIybEZCXuC/IhXZthc284hWvbVugAw68yr9UCNx5ce/rO/Ssf1ltrUVqC3Q==
X-Received: by 2002:a63:455:0:b0:434:e57c:d99d with SMTP id
 82-20020a630455000000b00434e57cd99dmr14670552pge.433.1662787746021; 
 Fri, 09 Sep 2022 22:29:06 -0700 (PDT)
Received: from roots.. ([183.221.93.83]) by smtp.gmail.com with ESMTPSA id
 y6-20020aa793c6000000b00540d75197e5sm731994pff.47.2022.09.09.22.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Sep 2022 22:29:05 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 Hanna Reitz <hreitz@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v9 5/7] config: add check to block layer
Date: Sat, 10 Sep 2022 13:27:57 +0800
Message-Id: <20220910052759.27517-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220910052759.27517-1-faithilikerun@gmail.com>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
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
 block.c                          | 14 ++++++++++++++
 block/file-posix.c               | 14 ++++++++++++++
 block/raw-format.c               |  1 +
 include/block/block_int-common.h |  5 +++++
 4 files changed, 34 insertions(+)

diff --git a/block.c b/block.c
index bc85f46eed..dad2ed3959 100644
--- a/block.c
+++ b/block.c
@@ -7947,6 +7947,20 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
         return;
     }
 
+    /*
+     * Non-zoned block drivers do not follow zoned storage constraints
+     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
+     * drivers in a graph.
+     */
+    if (!parent_bs->drv->supports_zoned_children &&
+        child_bs->bl.zoned == BLK_Z_HM) {
+        error_setg(errp, "Cannot add a %s child to a %s parent",
+                   child_bs->bl.zoned == BLK_Z_HM ? "zoned" : "non-zoned",
+                   parent_bs->drv->supports_zoned_children ?
+                   "support zoned children" : "not support zoned children");
+        return;
+    }
+
     if (!QLIST_EMPTY(&child_bs->parents)) {
         error_setg(errp, "The node %s already has a parent",
                    child_bs->node_name);
diff --git a/block/file-posix.c b/block/file-posix.c
index 4edfa25d04..354de22860 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -779,6 +779,20 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             goto fail;
         }
     }
+#ifdef CONFIG_BLKZONED
+    /*
+     * The kernel page chache does not reliably work for writes to SWR zones
+     * of zoned block device because it can not guarantee the order of writes.
+     */
+    if (strcmp(bs->drv->format_name, "zoned_host_device") == 0) {
+        if (!(s->open_flags & O_DIRECT)) {
+            error_setg(errp, "driver=zoned_host_device was specified, but it "
+                             "requires cache.direct=on, which was not specified.");
+            ret = -EINVAL;
+            return ret; /* No host kernel page cache */
+        }
+    }
+#endif
 
     if (S_ISBLK(st.st_mode)) {
 #ifdef BLKDISCARDZEROES
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
index 078ddd7e67..043aa161a0 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -127,6 +127,11 @@ struct BlockDriver {
      */
     bool is_format;
 
+    /*
+     * Set to true if the BlockDriver supports zoned children.
+     */
+    bool supports_zoned_children;
+
     /*
      * Drivers not implementing bdrv_parse_filename nor bdrv_open should have
      * this field set to true, except ones that are defined only by their
-- 
2.37.3


