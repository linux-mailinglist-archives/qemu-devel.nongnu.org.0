Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA65F772C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:09:29 +0200 (CEST)
Received: from localhost ([::1]:59874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglEO-0002tS-Ia
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:09:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktx-0005Py-0C
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktu-00038m-Fc
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbGNOJtmGcJZVbdtIp/SMVAjuVFmTs6b8bZWQZgV0HQ=;
 b=dvZLNGCMdY0grEhjXPRBW2iWB5BOMRJMWIN+3lyOQYJK0I6APh7+UVIYEZwrRoYjMjDrhW
 Fp1gUJvmPRmRxNvGqwCpp5U5NF7tJVqiCn00mO51Gmdl8suEh1PKHonWDVPZ455MuEG2fH
 3T2jJuTDIrpidVaN6+R02vs+/w8GmT4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-ZJDqSsOPM-ul1JB4CMc9cA-1; Fri, 07 Oct 2022 06:48:16 -0400
X-MC-Unique: ZJDqSsOPM-ul1JB4CMc9cA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 628643826253;
 Fri,  7 Oct 2022 10:48:16 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19052024CBB;
 Fri,  7 Oct 2022 10:48:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 16/50] copy-before-write: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:18 +0200
Message-Id: <20221007104752.141361-17-kwolf@redhat.com>
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-16-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/copy-before-write.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c24b8dd117..afbdd04489 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -203,9 +203,9 @@ static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
  * It's guaranteed that guest writes will not interact in the region until
  * cbw_snapshot_read_unlock() called.
  */
-static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
-                                        int64_t offset, int64_t bytes,
-                                        int64_t *pnum, BdrvChild **file)
+static coroutine_fn BlockReq *
+cbw_snapshot_read_lock(BlockDriverState *bs, int64_t offset, int64_t bytes,
+                       int64_t *pnum, BdrvChild **file)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BlockReq *req = g_new(BlockReq, 1);
@@ -240,7 +240,8 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
     return req;
 }
 
-static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
+static coroutine_fn void
+cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-- 
2.37.3


