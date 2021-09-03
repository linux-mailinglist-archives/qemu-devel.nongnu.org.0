Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCE3FFF7D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:59:47 +0200 (CEST)
Received: from localhost ([::1]:44764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7rF-0005KU-1G
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mM7Wd-0005Fs-29
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mM7WM-0008WT-Vs
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630669089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=csKFDYtmzTtAFzYO9ldkN7ZN87u3W2BvkvQrnK0mLCo=;
 b=R5BfiEOwAVuNXqNT7HX1w2501STCD3ktCkZ0PnvajOcwk4mwC7t26gW6iTGScRfxU39bTG
 dQ3QPA8VSF844FpzAjajnPLlHxRbW5/4oC6SvMpaikAe2YqgZ7b1wpKurIk2EwnjdDVPZN
 ipmwIsNcO2D7xS1wpAr9ZBcxSzItQos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-ytnSyFExOz2CTxLfnCCOgw-1; Fri, 03 Sep 2021 07:38:07 -0400
X-MC-Unique: ytnSyFExOz2CTxLfnCCOgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E457A835DE0;
 Fri,  3 Sep 2021 11:38:06 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3AFE1B5C2;
 Fri,  3 Sep 2021 11:38:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] include/block.h: remove outdated comment
Date: Fri,  3 Sep 2021 13:38:00 +0200
Message-Id: <20210903113800.59970-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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
v2:
+ add "block jobs" to the external request sources

 include/block/block.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 3477290f9a..de40758e71 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -749,9 +749,7 @@ bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
  * bdrv_drained_begin:
  *
  * Begin a quiesced section for exclusive access to the BDS, by disabling
- * external request sources including NBD server and device model. Note that
- * this doesn't block timers or coroutines from submitting more requests, which
- * means block_job_pause is still necessary.
+ * external request sources including NBD server, block jobs, and device model.
  *
  * This function can be recursive.
  */
-- 
2.31.1


