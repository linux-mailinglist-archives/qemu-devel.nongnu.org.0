Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7949B5F96CB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 04:28:37 +0200 (CEST)
Received: from localhost ([::1]:48322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohiWy-0005n3-JS
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 22:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQh-0002ft-Oo; Sun, 09 Oct 2022 22:22:08 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ohiQg-0006Km-26; Sun, 09 Oct 2022 22:22:07 -0400
Received: by mail-pf1-x429.google.com with SMTP id w2so9676967pfb.0;
 Sun, 09 Oct 2022 19:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mhtI1h8pCcI8Jw0NrKOs5Qx0fV6LmR6axseaT+0RKJ8=;
 b=Yn+mU73XrYTjt1RAAp52MaIYIk0ICEAVXNULK7P3s8+aLdlX+fpY5MFBxZCqxOPRnG
 2s2T8ekHekGwZiVnI+U/mNXuRt8q1Z9WWs4lWIjySjtOZ64iNHmun4neALybgW8NHhxL
 3V2MKWOt6BMLPUPOpUvd1k+qdp2sZ21VCIDFtoWhjpCVK+1VdYklfsrh4K645kRfpN1O
 jw5zf8pV7/RC97Us167DAgovuEPqLlvfmq9gVFnKdRUEEfkLtegZmMcTDj/wb4i3ZoWx
 r37Ud73HjF1e1iv2YUbv+UrUQfjydWR8iChOVZvq0rIx9X1dIYLaLIrXSwq6qIdcvbTW
 qjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mhtI1h8pCcI8Jw0NrKOs5Qx0fV6LmR6axseaT+0RKJ8=;
 b=0SB0C/3ERd3QVKTdt85DNffSSktaYDWsRlDfQ151FFd+td9xxlKMuMqLApAWxFJ8JF
 9Wn++vJRTSm6bCPYtaSOj/Su7qRdjgN1QP98ayX39lD7MZgFZYqAH89wTBuA+575cX32
 GxZCcMQCHLkoglZuJESyC5CLc7iSQgKIqhrkq00qYCf2v+1B4UVThQ/k0nTUVmlkSWTN
 nT6tCGUcOPbhweZiW0LuMwcOEgZ/9gPxSbsaDFW+MxLRk56gJWshteLsr9xJ4TOlSdLh
 ntxmbTn0kUNoh0+y0/Jrz3BYL2/lPGUdCJO8Vd7Yc7btVoCzn8ykfKhT43Ph+SlcL0m/
 z+UA==
X-Gm-Message-State: ACrzQf0sUJNoURMpsTSe2Mlm2tUeQrZBvkRZIxhChUx3jbj7a3F+gZzf
 uaUtThYiWZ1VeBs8WuCacCrHyMKGkzh8mCYaLT4=
X-Google-Smtp-Source: AMsMyM46a9AcOjqlDJkkuV/TGTWuSIG7U+RbHj3gdR8rGR7aw5FiSarr9mK9PBLFWcJaJe0j89WjcA==
X-Received: by 2002:a05:6a00:3392:b0:547:f861:1fad with SMTP id
 cm18-20020a056a00339200b00547f8611fadmr17464344pfb.16.1665368522858; 
 Sun, 09 Oct 2022 19:22:02 -0700 (PDT)
Received: from roots.. ([112.44.203.212]) by smtp.gmail.com with ESMTPSA id
 l12-20020a170902f68c00b00178323e689fsm5372740plg.171.2022.10.09.19.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 19:22:02 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 dmitry.fomichev@wdc.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 hare@suse.de, damien.lemoal@opensource.wdc.com,
 Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v11 5/7] config: add check to block layer
Date: Mon, 10 Oct 2022 10:21:14 +0800
Message-Id: <20221010022116.41942-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010022116.41942-1-faithilikerun@gmail.com>
References: <20221010022116.41942-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=faithilikerun@gmail.com; helo=mail-pf1-x429.google.com
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

Putting zoned/non-zoned BlockDrivers on top of each other is not
allowed.

Signed-off-by: Sam Li <faithilikerun@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c                          | 17 +++++++++++++++++
 block/file-posix.c               | 13 +++++++++++++
 block/raw-format.c               |  1 +
 include/block/block_int-common.h |  5 +++++
 4 files changed, 36 insertions(+)
 mode change 100644 => 100755 block.c
 mode change 100644 => 100755 block/file-posix.c

diff --git a/block.c b/block.c
old mode 100644
new mode 100755
index bc85f46eed..bf2f2918e7
--- a/block.c
+++ b/block.c
@@ -7947,6 +7947,23 @@ void bdrv_add_child(BlockDriverState *parent_bs, BlockDriverState *child_bs,
         return;
     }
 
+    /*
+     * Non-zoned block drivers do not follow zoned storage constraints
+     * (i.e. sequential writes to zones). Refuse mixing zoned and non-zoned
+     * drivers in a graph.
+     */
+    if (!parent_bs->drv->supports_zoned_children &&
+        /* The host-aware model allows zoned storage constraints and random
+         * write. Allow mixing host-aware and non-zoned drivers. Using
+         * host-aware device as a regular device. */
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
old mode 100644
new mode 100755
index 226f5d48f5..a9d347292e
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -778,6 +778,19 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
             goto fail;
         }
     }
+#ifdef CONFIG_BLKZONED
+    /*
+     * The kernel page cache does not reliably work for writes to SWR zones
+     * of zoned block device because it can not guarantee the order of writes.
+     */
+    if (strcmp(bs->drv->format_name, "zoned_host_device") == 0) {
+        if (!(s->open_flags & O_DIRECT)) {
+            error_setg(errp, "driver=zoned_host_device was specified, but it "
+                             "requires cache.direct=on, which was not specified.");
+            return -EINVAL; /* No host kernel page cache */
+        }
+    }
+#endif
 
     if (S_ISBLK(st.st_mode)) {
 #ifdef BLKDISCARDZEROES
diff --git a/block/raw-format.c b/block/raw-format.c
index 618c6b1ec2..b885688434 100644
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
index cdc06e77a6..37dddc603c 100644
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


