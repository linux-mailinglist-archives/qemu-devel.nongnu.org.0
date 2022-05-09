Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956B51FAA5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:58:15 +0200 (CEST)
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no15i-0001zC-MO
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fO-00055h-Se
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fN-0002pn-Bu
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HeXge5WfJ8/fiVVZWO8ojQpT8h7eMYKWb2NNZzpR868=;
 b=X393zodIiIZgHFwNEBYjXi72U+JAhEGVZnBU4bzkkawg9njnbUuC4LJjPeMhE1tdkxTtTy
 nIG//t3qvUbvNBFH7fz8vbtpmJ8i03Lj8fxvKvEMudAy92gKvQQ5sazS+/W9KRLZkCRoST
 /Oxn3aeRavmHypFXVk6jB7Z7IPZJYn8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-VhY7QFsSMgOhYN-T5RjoxA-1; Mon, 09 May 2022 06:30:59 -0400
X-MC-Unique: VhY7QFsSMgOhYN-T5RjoxA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n186-20020a1c27c3000000b00392ae974ca1so4667071wmn.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HeXge5WfJ8/fiVVZWO8ojQpT8h7eMYKWb2NNZzpR868=;
 b=2UYO7rZoj8mtpwCEvFLJ3tFrPFnKq2BKs9dWVfGybw6ux1ZM+Ev6t4cV8dnbuVO4u0
 R7+y2tKVO64n1TfTLz9GalOxERL82XAAQMUzMNOhfwVIhOOS7xD2bQztauCn2S3Y9AiI
 xagHTNiYp7ZdJrTVx5aImnBSxwSa00YE7rUN2Gv/Rn48ChFG+O45jngv7rJwCD1SpDKz
 QwJhMMCYIBsDjAFBXGybjotxeOVqy74a8UX4EBmWXsVg5QxrBI83OPS5p6bEWs0ypyHU
 fROX5EyHIHZNm8gq3hIIEzUjarvOBnLFNyckA8K1+ZGewFw9YJvz4ctAQjn+wdkPTdd2
 U+Rg==
X-Gm-Message-State: AOAM533PwJWqBKjcqFsRTHe26R6AzdOg4I9G4emv2mn8pW2pDDGtg+vx
 ZmD4SgWb9hkC6YYBaywGX6oCbvSF6ZLDj5I3UZ0sah5KRQobWGLqwyMf42yCsaT9r5eIK5xHMS4
 Xiugd0NwpSm/xbmuVQt38X4JKY1JBqkIchDjIpR7ctsK9IIaMC1VmQ6yrSLqe/ttyXJU=
X-Received: by 2002:a5d:5960:0:b0:20c:5a12:20ed with SMTP id
 e32-20020a5d5960000000b0020c5a1220edmr13235541wri.303.1652092257683; 
 Mon, 09 May 2022 03:30:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv0hW7T6GXe+IePWdtKRqgjZp0q8HmbJzAkTVjyYGLyvsGGFg/xebFuSS2XfiD/MJm5jFuEw==
X-Received: by 2002:a5d:5960:0:b0:20c:5a12:20ed with SMTP id
 e32-20020a5d5960000000b0020c5a1220edmr13235514wri.303.1652092257252; 
 Mon, 09 May 2022 03:30:57 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a7bcc94000000b003942a244f38sm16796381wma.17.2022.05.09.03.30.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/26] copy-before-write: add missing coroutine_fn
 annotations
Date: Mon,  9 May 2022 12:30:08 +0200
Message-Id: <20220509103019.215041-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/copy-before-write.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index a8a06fdc09..5ad9693b13 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -165,9 +165,9 @@ static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
  * It's guaranteed that guest writes will not interact in the region until
  * cbw_snapshot_read_unlock() called.
  */
-static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes,
-                                        int64_t *pnum, BdrvChild **file)
+static coroutine_fn BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
+                                                     int64_t offset, int64_t bytes,
+                                                     int64_t *pnum, BdrvChild **file)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BlockReq *req = g_new(BlockReq, 1);
@@ -197,7 +197,7 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
     return req;
 }
 
-static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+static coroutine_fn void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-- 
2.35.1


