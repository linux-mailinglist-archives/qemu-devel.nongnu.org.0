Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10A6EE2AE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:18:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIVN-0006dh-4f; Tue, 25 Apr 2023 09:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUt-0006Kv-Kl
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUs-0006Zk-6H
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8FGnLv9hOieBHK1nF0Jh6FzEm+T4TuP6lDC0AACalE=;
 b=AVUpIRmJES4wixQgU6cfHmX8sAd33d3BZ2mwwrvDKY3GgOjAwT1ZhjU9zXFxcDHyV/u/o/
 8t5egeQLepQnqipj57BmzQ1CWnhKh5fGPDg7qotWBPxwblHCQO1sxY+0rOChydeN0FVgbX
 eAqn70GkrADctOY4Z1yFvHpb760Zsbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-qBwxS0IrNziQ0FyuBzCfgQ-1; Tue, 25 Apr 2023 09:14:14 -0400
X-MC-Unique: qBwxS0IrNziQ0FyuBzCfgQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBC2A185A78B;
 Tue, 25 Apr 2023 13:14:13 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EBDE40C201F;
 Tue, 25 Apr 2023 13:14:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 10/25] include/block: fixup typos
Date: Tue, 25 Apr 2023 15:13:44 +0200
Message-Id: <20230425131359.259007-11-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Fixup a few minor typos

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20230313003744.55476-1-wilfred.mallawa@opensource.wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/aio-wait.h         | 2 +-
 include/block/block_int-common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index da13357bb8..6e43e3b7bb 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -63,7 +63,7 @@ extern AioWait global_aio_wait;
  * @ctx: the aio context, or NULL if multiple aio contexts (for which the
  *       caller does not hold a lock) are involved in the polling condition.
  * @cond: wait while this conditional expression is true
- * @unlock: whether to unlock and then lock again @ctx. This apples
+ * @unlock: whether to unlock and then lock again @ctx. This applies
  * only when waiting for another AioContext from the main loop.
  * Otherwise it's ignored.
  *
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index f01bb8b617..013d419444 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1260,7 +1260,7 @@ extern QemuOptsList bdrv_create_opts_simple;
 /*
  * Common functions that are neither I/O nor Global State.
  *
- * See include/block/block-commmon.h for more information about
+ * See include/block/block-common.h for more information about
  * the Common API.
  */
 
-- 
2.40.0


