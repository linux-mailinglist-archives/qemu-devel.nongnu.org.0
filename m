Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312EA5F77A9
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:48:46 +0200 (CEST)
Received: from localhost ([::1]:51670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglqP-0006kU-1W
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktt-0005PX-Pg
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktp-00036f-C4
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9FrOCpNbSrm/fB1htVisXzeVq/NUpDkNFztzawrYxLA=;
 b=NYBQCyKFrmiljk/FXUulCI948JKyzIuCcjgURJqE/ZRtkUu6c3YCNA/OEYij6oE48fY+6G
 pHqou5GR2v/cXskKUGE/vdJvc6rDf+GTiLO1OHkKv5tdZOJWc+DuxgJ+BMZtO8rv/gy9iC
 bhO8djeCCdFR20lMzb4O9Jg980Q4dJo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-2NAPaHAxP_iZsrCcsgYPpQ-1; Fri, 07 Oct 2022 06:48:08 -0400
X-MC-Unique: 2NAPaHAxP_iZsrCcsgYPpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E8AE3826244;
 Fri,  7 Oct 2022 10:48:08 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C86432024CBB;
 Fri,  7 Oct 2022 10:48:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 08/50] blkverify: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:10 +0200
Message-Id: <20221007104752.141361-9-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paolo Bonzini <pbonzini@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-8-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/blkverify.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blkverify.c b/block/blkverify.c
index e4a37af3b2..020b1ae7b6 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -258,7 +258,7 @@ blkverify_co_pwritev(BlockDriverState *bs, int64_t offset, int64_t bytes,
     return blkverify_co_prwv(bs, &r, offset, bytes, qiov, qiov, flags, true);
 }
 
-static int blkverify_co_flush(BlockDriverState *bs)
+static int coroutine_fn blkverify_co_flush(BlockDriverState *bs)
 {
     BDRVBlkverifyState *s = bs->opaque;
 
-- 
2.37.3


