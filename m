Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0B3EDD0C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 20:24:56 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFhI7-0004wm-HQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 14:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mFhGr-0003UC-P4
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:23:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mFhGp-0001ok-JN
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 14:23:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629138213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sE5Jbi6bD5AprIB8GgAXuslMi28r5DMxwdfV3Pz97Ts=;
 b=ckfM9ycTugq7EjxRGE8Dt2zbqQagEjpHgr5wakf+Di0r69Xvv92Vi3l+7yN+Oh7xnnmRop
 LwiNtuz1dOV0QUwh0jZ+EVCM5xX5sdY/xbOsQj5ukp9TxsxLUQGF7FTfK9BG1JjElT6/0f
 mvUpeUI3GPRbQGiStA/cogThMnXp0Hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-h9KHVYDXO1--T1BQ2MMhiQ-1; Mon, 16 Aug 2021 14:23:32 -0400
X-MC-Unique: h9KHVYDXO1--T1BQ2MMhiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 880E6760C1;
 Mon, 16 Aug 2021 18:23:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3707E620DE;
 Mon, 16 Aug 2021 18:23:25 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] include/block.h: remove outdated comment in bdrv_drained_begin
Date: Mon, 16 Aug 2021 20:23:25 +0200
Message-Id: <20210816182325.24517-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a couple of errors in bdrv_drained_begin header comment:
- block_job_pause does not exist anymore, it has been replaced
  with job_pause in b15de82867
- job_pause is automatically invoked as a .drained_begin callback
  (child_job_drained_begin) by the child_job BdrvChildClass struct
  in blockjob.c. So no additional pause should be required.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/block.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 3477290f9a..1b0d05b545 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -749,9 +749,7 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
  * bdrv_drained_begin:
  *
  * Begin a quiesced section for exclusive access to the BDS, by disabling
- * external request sources including NBD server and device model. Note that
- * this doesn't block timers or coroutines from submitting more requests, which
- * means block_job_pause is still necessary.
+ * external request sources including NBD server and device model.
  *
  * This function can be recursive.
  */
-- 
2.31.1


