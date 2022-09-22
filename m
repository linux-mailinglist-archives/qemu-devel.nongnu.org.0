Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9766B5E5F2B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 12:00:33 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obJ0S-00037z-H0
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 06:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHuA-0004VD-4N
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHu7-0003Ev-U2
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I0XBVyfDqjzvf1WZr9xGpHcqO3KsnFZvkMQO+nzqMzY=;
 b=No+XM4wXRA5NfmUHG2FGRXzmSikqry0oDt10vjFpvNnkwQwSbQsqClnoYr5tFIV/Uc8iex
 hNYNEM8Sl4zZL7p3T41KdR8QCSEsrH84UIfLkWCHrr61DoHPvhFnzUSoO3nN69qbdcJ6JU
 7JuEpz2c+NcvWB4G54kV7gKOJTzOIRE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-93CjqVwQPZavL7JP1Z5NDw-1; Thu, 22 Sep 2022 04:49:53 -0400
X-MC-Unique: 93CjqVwQPZavL7JP1Z5NDw-1
Received: by mail-ed1-f72.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so6175673edz.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=I0XBVyfDqjzvf1WZr9xGpHcqO3KsnFZvkMQO+nzqMzY=;
 b=jLR1svsVCRIQEqOV7S9eTl0ftzdUEnsaynvURG7WA5qOaIB0eiH+tU7SSERRy4om5O
 +2sX0oy7e2gD5muXNUUBbzu2fUuWTZA7u4WszzGxqhqv5+WSBKgd+Uv6QXkgPh5aMiyY
 KwcOkYY+ALt2pzEBe9bWpO8MORrddGwYLPykZ1VhVyXFPgaty8reACbZ8Yl5cnhghmW2
 EjO+ZAjLLlTbDwYWIn+TxISIQ17MPnZvfcRH0Ri4u6yv7+mxoS5pJLIHWjsRqceaXS32
 VnQiUkqFg2vnH81f9mMIEis5LZD1pqZBEQL2o0nGJd/1miIeQDKyPOrq1/o5RPgDnpJq
 QwQA==
X-Gm-Message-State: ACrzQf0bPwnFINiuNv1pxTx7KT7tuUiYyeiUrjrjtGRJzhJGPzEX56O4
 yjQCBn5NBZRC2W/a5+XXhcpyhVVbcV+4rla2Wd4Awbsu1s4eKfeVTHGcrE0Bz6oRe7NueAew4rn
 vGIdm5GiKbw9sHc8CYvD3+wL43AcmlSDcuepUOBVO8jjg3W6gxOtK1kpgMjMoKqmabUU=
X-Received: by 2002:a17:906:ef8c:b0:77c:8d9a:9aed with SMTP id
 ze12-20020a170906ef8c00b0077c8d9a9aedmr1911464ejb.704.1663836592628; 
 Thu, 22 Sep 2022 01:49:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pKH6N2UcKfR4P6+GzYa8xHSDgtkNV9bqibAD6ewNJiUWhmkbMHS1MgcEHwRYJp/GdZN6KWw==
X-Received: by 2002:a17:906:ef8c:b0:77c:8d9a:9aed with SMTP id
 ze12-20020a170906ef8c00b0077c8d9a9aedmr1911440ejb.704.1663836592322; 
 Thu, 22 Sep 2022 01:49:52 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a056402249b00b004542e65337asm3300883eda.51.2022.09.22.01.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	qemu-block@nongnu.org,
	afaria@redhat.com
Subject: [PATCH 18/26] quorum: add missing coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:16 +0200
Message-Id: <20220922084924.201610-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
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
2.37.3


