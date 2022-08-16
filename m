Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A028595291
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:35:03 +0200 (CEST)
Received: from localhost ([::1]:60362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNqAI-0003bD-2v
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1R-00064f-QS; Tue, 16 Aug 2022 02:25:53 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1oNq1Q-0003ap-8Q; Tue, 16 Aug 2022 02:25:53 -0400
Received: by mail-pl1-x62c.google.com with SMTP id jm11so6118530plb.13;
 Mon, 15 Aug 2022 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=yMqYS1x2K+YOxm8GuxGhnoarBMz1ltJDvihoD3vL5Bo=;
 b=qdPLK86+huZpooMmnOdh/EXw/m/iM4c/f0FhBr5r/CNDx8zoJ/mJXQw8Yp2EPkjwsn
 oG+Pdjv6OAZyy8iYzr8LHaTnIFfTgeSmQ0N9atnG9AFGhu84JKG9dCq6MtPC1AlxmZV8
 DX1p7xJhkUKHruLpv+XxzVKHeLp4e5Wta7hwi+vaQIr5rtRICBN5QXbxepuZWHvfJAIU
 LjJyL5dkGVybJ9f2tU8wDjNBrpk816m2a/W34KMTEwu8GEmGkJvA9SIBqnZUXax814T5
 w2dWP3MeeO4l63Us/7MLYnWjdKZWrsqEMwUr9LLDZNC7ZwPxAX39msMLORrIEBGXXMjC
 GzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=yMqYS1x2K+YOxm8GuxGhnoarBMz1ltJDvihoD3vL5Bo=;
 b=WhOXaRrCYxKMa73uYZ/W1wmm9QlAZ/cTb2Sude7AVGdysF4+dGQgM5jMei3if02Wma
 YaIWOdegabrZboi1dtYtmVQmHvUeFDh9/4hwOakoEXeloKOg9jgQK4rlU+L1DEozxQuE
 /akRXEFA0pDGd14XdzZ9Y1mtmlRaOdd3MaR73gZoz+iKwSNjWwdP5Q6JSPMe3Ctc0unf
 4SRrfFp2Fp9M7hLSkvRjI8lpqbn+67SePcynw0NxP26N9343rWnZprEY00c2lWLQlN3Q
 cAY7YdYi7s51zwSs5NS//l5egPjKA2LDbW7mg94wANwZeaobBcGSpLQkSOwKs9VpnO5J
 3f3w==
X-Gm-Message-State: ACgBeo38PsgLdymRI8qoHidpohcZ83oOkDdSIaEx9H8y79wRiE16OqOW
 BXOdBPsbNbKsk4gQqeO5m48RRoWFJoqwQQ==
X-Google-Smtp-Source: AA6agR4g9aw6McAT7dxJUf2xLrPZePW3E/jyydl9L4EjrhcHSIS9CjRP04SFxt5p0rd+cxzONVF6bQ==
X-Received: by 2002:a17:90b:4c89:b0:1f5:3aee:79d1 with SMTP id
 my9-20020a17090b4c8900b001f53aee79d1mr31709685pjb.195.1660631150481; 
 Mon, 15 Aug 2022 23:25:50 -0700 (PDT)
Received: from roots.. ([106.84.129.185]) by smtp.gmail.com with ESMTPSA id
 e15-20020a170902784f00b0016f1c1f50f4sm8082868pln.235.2022.08.15.23.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 23:25:50 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: hare@suse.de, Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 stefanha@redhat.com, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, qemu-block@nongnu.org,
 damien.lemoal@opensource.wdc.com, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v7 6/8] config: add check to block layer
Date: Tue, 16 Aug 2022 14:25:20 +0800
Message-Id: <20220816062522.85714-7-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816062522.85714-1-faithilikerun@gmail.com>
References: <20220816062522.85714-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pl1-x62c.google.com
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
 block/raw-format.c               |  1 +
 include/block/block_int-common.h |  5 +++++
 3 files changed, 20 insertions(+)

diff --git a/block.c b/block.c
index bc85f46eed..affe6c597e 100644
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
+        child_bs->bl.zoned != BLK_Z_HM) {
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
index de44c7b6f4..4c44592b59 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -126,6 +126,11 @@ struct BlockDriver {
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
2.37.1


