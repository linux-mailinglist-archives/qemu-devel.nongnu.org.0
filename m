Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CE5EF1AC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 11:19:19 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odphO-0001W1-I7
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 05:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp33-0000ka-Fb; Thu, 29 Sep 2022 04:38:05 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1odp2w-0007lL-HK; Thu, 29 Sep 2022 04:37:37 -0400
Received: by mail-pg1-x52f.google.com with SMTP id c7so827192pgt.11;
 Thu, 29 Sep 2022 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=P5s1r+TdljxsgJm9EoSaBP3Yzp8UWe8irO8JsQPp+oo=;
 b=qfJAqeI1lnC4OJhQSDPnJFnzmHxTRc5GCTYVoWJ1kCvUFeWt1eSNbGzgAaGVhR5IoP
 0omRhPmkWoo/TlviPs8L67uOmQlvSPgn3rrfKYWGRi6CJhpu1SLY+Q/ItznBOopoCBcr
 4BRbwqupGjMnrZxREbOfJaQDCRG6yVJcZKXFgGEw/cVSXN6VeBmQg5WpRMILXES8CRQt
 KZ7FQ86D4ckNLqsTBRq7b2gX3OMD84uWA9qrf4U4hbU4GpO//3luQcdKRAYRnUah+CDB
 gNmuJh75GdRosn25bXMRyfxb2GsNWsXbxHJBrLt7zBAT+Yc9gyk1blEq7L4h/a9WBrOP
 YLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=P5s1r+TdljxsgJm9EoSaBP3Yzp8UWe8irO8JsQPp+oo=;
 b=k8iR+DqKOuMKImIW7m5pP+Ds9WNhT98HyN61m9x1VukcaN28mR+PTbCl6b5vnV/BAF
 3R4rk+52sE8dAW2QMta4VFNy/fmtR1FNZ2thdyx50SPPnT++Miwxa0hXYSOEiciu/oUy
 cOLDtN7H7tMl21LZeyzeUElNcqrPjDezpSVcod3QN2wV+/IrbqlSX6QM+L2ix5JuAriN
 eHZxvVbEY/rJszWUPOiHo3SW5AVlj6ioVriQRBLA4YRTGFf0KBWImjbsXE8NsraRWXSV
 aTPqKSjR9zs1Xreu9tIJtrRKPw5UEjgNPYFtGLcXcGPuRX0QsnsnRiHKOMdP95YH5BUQ
 4gSQ==
X-Gm-Message-State: ACrzQf2UMQ3B6azWi+/l0RDJ916ErIvgtFyZVBkL2GZK9tuoG+1ulxkF
 0iXm9BUV5RK0sbrmWLPuGgdGCGXtcag6WA==
X-Google-Smtp-Source: AMsMyM64n2ldw/7y5Dm//u+CfsWhedgtvRYe5j+ugkEnzz6lgWfx2hDNgk6YGTJRFHR8EsVBrwm64w==
X-Received: by 2002:a05:6a00:17a1:b0:542:be09:7b23 with SMTP id
 s33-20020a056a0017a100b00542be097b23mr2347622pfg.12.1664440648377; 
 Thu, 29 Sep 2022 01:37:28 -0700 (PDT)
Received: from roots.. ([112.44.202.63]) by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b0017829a3df46sm5324233plg.204.2022.09.29.01.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 01:37:28 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: damien.lemoal@opensource.wdc.com, Kevin Wolf <kwolf@redhat.com>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 dmitry.fomichev@wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v10 5/7] config: add check to block layer
Date: Thu, 29 Sep 2022 16:36:29 +0800
Message-Id: <20220929083631.61899-6-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929083631.61899-1-faithilikerun@gmail.com>
References: <20220929083631.61899-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=faithilikerun@gmail.com; helo=mail-pg1-x52f.google.com
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
index 0a6c781201..73656d87f2
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -779,6 +779,19 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
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


