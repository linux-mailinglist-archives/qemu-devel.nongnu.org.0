Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497A73EA0C6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 10:44:15 +0200 (CEST)
Received: from localhost ([::1]:37586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE6Jx-0007P1-Q8
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 04:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hr-0004gQ-Ly
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mE6Hn-0004fj-B6
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 04:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628757717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBFBtbTLctx7RvR+a/of9f/yG22h3JtdlUpU+3KGcSk=;
 b=TR9NR8yp5CEuSIDUGPaCCvPwgdt1E9ZT6/EGCl51nTe++HtMwxS6opwbQFim8deXVKBgWQ
 SdKjYXVuxl2+z5+2TS6/KyLnB1YOF0d/G0ZeayKX7XPUYgKS+A0mFHppqnMwP5vj08NkhX
 QqNaFyicitkr3ZrEW1dinZ1jOrFA3AM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-nHOBMSHAMd2TWrBV1msBtA-1; Thu, 12 Aug 2021 04:41:53 -0400
X-MC-Unique: nHOBMSHAMd2TWrBV1msBtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC93C760C0;
 Thu, 12 Aug 2021 08:41:52 +0000 (UTC)
Received: from localhost (unknown [10.39.193.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7563610016FB;
 Thu, 12 Aug 2021 08:41:52 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 1/6] block: Drop BDS comment regarding bdrv_append()
Date: Thu, 12 Aug 2021 10:41:43 +0200
Message-Id: <20210812084148.14458-2-hreitz@redhat.com>
In-Reply-To: <20210812084148.14458-1-hreitz@redhat.com>
References: <20210812084148.14458-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a comment above the BDS definition stating care must be taken
to consider handling newly added fields in bdrv_append().

Actually, this comment should have said "bdrv_swap()" as of 4ddc07cac
(nine years ago), and in any case, bdrv_swap() was dropped in
8e419aefa (six years ago).  So no such care is necessary anymore.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f1a54db0f8..12e5750fe8 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -839,12 +839,6 @@ struct BdrvChild {
     QLIST_ENTRY(BdrvChild) next_parent;
 };
 
-/*
- * Note: the function bdrv_append() copies and swaps contents of
- * BlockDriverStates, so if you add new fields to this struct, please
- * inspect bdrv_append() to determine if the new fields need to be
- * copied as well.
- */
 struct BlockDriverState {
     /* Protected by big QEMU lock or read-only after opening.  No special
      * locking needed during I/O...
-- 
2.31.1


