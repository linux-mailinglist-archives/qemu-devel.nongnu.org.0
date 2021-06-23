Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2947F3B1D27
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:06:27 +0200 (CEST)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4SQ-0003ew-7b
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4O1-0004cW-Nq
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lw4Nz-0004hq-VX
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRsSsPdDoGjMQrtVP0keNQ3Q32IjWHg+hNxsqr3kJ20=;
 b=QYiy7rFwl0u1xIxa4k5AmXe5R/hSTxGIniQCMstzVyJdff5ysasCbPgJPXx79aTF6SingT
 2D4hWxzMFB8MVwuMaW8cQbVyA5+H2a0MVRvr9xnHjE4iyvayva6xBrpsZSY+KDUTiJl7RL
 p1CB41II/GQIS09P2V3PKRO0A+ZN5J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-t8jeDepjPvOcubU3uAEYiQ-1; Wed, 23 Jun 2021 11:01:49 -0400
X-MC-Unique: t8jeDepjPvOcubU3uAEYiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20E12800C60;
 Wed, 23 Jun 2021 15:01:48 +0000 (UTC)
Received: from localhost (ovpn-113-73.ams2.redhat.com [10.36.113.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD8CC5C1D1;
 Wed, 23 Jun 2021 15:01:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/6] block: Drop BDS comment regarding bdrv_append()
Date: Wed, 23 Jun 2021 17:01:38 +0200
Message-Id: <20210623150143.188184-2-mreitz@redhat.com>
In-Reply-To: <20210623150143.188184-1-mreitz@redhat.com>
References: <20210623150143.188184-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a comment above the BDS definition stating care must be taken
to consider handling newly added fields in bdrv_append().

Actually, this comment should have said "bdrv_swap()" as of 4ddc07cac
(nine years ago), and in any case, bdrv_swap() was dropped in
8e419aefa (six years ago).  So no such care is necessary anymore.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 057d88b1fc..a8f9598102 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -832,12 +832,6 @@ struct BdrvChild {
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


