Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9451FA97
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:55:19 +0200 (CEST)
Received: from localhost ([::1]:47486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no12s-0000XJ-NY
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fX-0005E7-9u
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fV-0002qB-BL
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqtILOyZNJAH6lSpTMECSN6V7UXBlL2LcrOyrAYW4Co=;
 b=dEloNm5a0U9PiLMK7oLajnaI+zIR5HNZPqsoHfhe2HdXKBmhzi1pegnQwvvy7ri8lB64x+
 oJ6nZRIMgtSGK9cMcRQSw470vOoPbd+hr/Q4lFyg/LIVos2A1Qsl8dk9/CphcTmBBVE/Qn
 t4RBhYwLGvRT5EiOYxAMfIJjZ23wyyo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-2y-sExdfMxW3__VO2p_diA-1; Mon, 09 May 2022 06:31:07 -0400
X-MC-Unique: 2y-sExdfMxW3__VO2p_diA-1
Received: by mail-wm1-f71.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso3724441wml.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WqtILOyZNJAH6lSpTMECSN6V7UXBlL2LcrOyrAYW4Co=;
 b=4p4kl7GN216IDZJzECzH9+GKhvzRAJYyHOOP4iyU/hKzWTWhYuHEkxi0fVSaUAEoBo
 2fq8Sm3jHEcnWOlp7cSRSkOs4YTXkyj+cVTJBPWtwI6xGRYWh9aTkn1Ma7DdMVWBiHEI
 RM6/dsDFZUikhQTAOXxDgTQbXynhBZ69nl2VLpBfH43BYB8WqShf5kL0e7GrkZAZB7LE
 LrnhyOCIkTLYtaRZUeL9EHTGKzcNednk0DDFvXxD+jsxmZ1cmdCxFCIG/sGnqGY9DqnK
 dvgN1rpYZMFXkCcnMbIQQs1E5So5n0tPoAA1ue2lyR/6RlVeEc6UWSmRU032Q8XmNA6z
 CD6A==
X-Gm-Message-State: AOAM531ca6tlvR7H/0lQdqjjU7WURy7C2hKKHzep8ABif57MnUUDNUwQ
 8FfHKQUvOZfakDVG8iPbL8IMP0QkzDryfRap3l+EL88L+rW5EwhAoUuWCdA7uBfXRCdXWDxq7H2
 7W8+AxQEDNbiDfiOhO1VQ8ZPL8OXNlULk9/ZY06yAAJyndBVfgWE2yvzMVoWR222W0XI=
X-Received: by 2002:a5d:59a5:0:b0:20c:5603:c0c3 with SMTP id
 p5-20020a5d59a5000000b0020c5603c0c3mr13321705wrr.521.1652092265634; 
 Mon, 09 May 2022 03:31:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5vDUuUAoWPZQwz2rl5ktT1xi3qJBAu2pAVtYkUEsYagGS8owatIWn/cGF6bloaBVFjWdzpA==
X-Received: by 2002:a5d:59a5:0:b0:20c:5603:c0c3 with SMTP id
 p5-20020a5d59a5000000b0020c5603c0c3mr13321649wrr.521.1652092264931; 
 Mon, 09 May 2022 03:31:04 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c064300b003942a244f31sm16462969wmm.10.2022.05.09.03.31.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/26] quorum: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:11 +0200
Message-Id: <20220509103019.215041-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
 block/quorum.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/block/quorum.c b/block/quorum.c
index f33f30d36b..5ff69d7443 100644
--- a/block/quorum.c
+++ b/block/quorum.c
@@ -161,11 +161,10 @@ static bool quorum_64bits_compare(QuorumVoteValue *a, QuorumVoteValue *b)
     return a->l == b->l;
 }
 
-static QuorumAIOCB *quorum_aio_get(BlockDriverState *bs,
-                                   QEMUIOVector *qiov,
-                                   uint64_t offset,
-                                   uint64_t bytes,
-                                   int flags)
+static QuorumAIOCB *coroutine_fn quorum_aio_get(BlockDriverState *bs,
+                                                QEMUIOVector *qiov,
+                                                uint64_t offset, uint64_t bytes,
+                                                int flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = g_new(QuorumAIOCB, 1);
@@ -273,7 +272,7 @@ static void quorum_report_bad_versions(BDRVQuorumState *s,
     }
 }
 
-static void quorum_rewrite_entry(void *opaque)
+static void coroutine_fn quorum_rewrite_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -574,7 +573,7 @@ free_exit:
     quorum_free_vote_list(&acb->votes);
 }
 
-static void read_quorum_children_entry(void *opaque)
+static void coroutine_fn read_quorum_children_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -602,7 +601,7 @@ static void read_quorum_children_entry(void *opaque)
     }
 }
 
-static int read_quorum_children(QuorumAIOCB *acb)
+static int coroutine_fn read_quorum_children(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int i;
@@ -643,7 +642,7 @@ static int read_quorum_children(QuorumAIOCB *acb)
     return acb->vote_ret;
 }
 
-static int read_fifo_child(QuorumAIOCB *acb)
+static int coroutine_fn read_fifo_child(QuorumAIOCB *acb)
 {
     BDRVQuorumState *s = acb->bs->opaque;
     int n, ret;
@@ -664,8 +663,9 @@ static int read_fifo_child(QuorumAIOCB *acb)
     return ret;
 }
 
-static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
-                            QEMUIOVector *qiov, BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_preadv(BlockDriverState *bs,
+                                         int64_t offset, int64_t bytes,
+                                         QEMUIOVector *qiov, BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
@@ -684,7 +684,7 @@ static int quorum_co_preadv(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return ret;
 }
 
-static void write_quorum_entry(void *opaque)
+static void coroutine_fn write_quorum_entry(void *opaque)
 {
     QuorumCo *co = opaque;
     QuorumAIOCB *acb = co->acb;
@@ -715,9 +715,9 @@ static void write_quorum_entry(void *opaque)
     }
 }
 
-static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
-                             int64_t bytes, QEMUIOVector *qiov,
-                             BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                          int64_t bytes, QEMUIOVector *qiov,
+                                          BdrvRequestFlags flags)
 {
     BDRVQuorumState *s = bs->opaque;
     QuorumAIOCB *acb = quorum_aio_get(bs, qiov, offset, bytes, flags);
@@ -746,8 +746,9 @@ static int quorum_co_pwritev(BlockDriverState *bs, int64_t offset,
     return ret;
 }
 
-static int quorum_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                   int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn quorum_co_pwrite_zeroes(BlockDriverState *bs,
+                                                int64_t offset, int64_t bytes,
+                                                BdrvRequestFlags flags)
 
 {
     return quorum_co_pwritev(bs, offset, bytes, NULL,
-- 
2.35.1


