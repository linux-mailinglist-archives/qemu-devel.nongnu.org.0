Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9EC40CC18
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:58:31 +0200 (CEST)
Received: from localhost ([::1]:56068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZB0-0005vr-FQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6B-0005Yq-Qn
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQZ6A-0006Ow-2N
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631728409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYQWoN0xAA6zjtNIq8rQopg0qXx6HZ93Cl16X2G9H/Y=;
 b=ipJsCyIwC49QutPAlRmsq9EtNlNO0ZBJ38dMfKuhJE7YlR8tX3b7blQO3SZ5CWGXbm1h4G
 H1CmE8/BWwLPI0NQhvM2MkFh97FLt2SA2L9DbXrJkeM7qYzce0aN8DFkRnoVSgoxFK/W1A
 I/QJuAC+3kiRw2uUqA2NZqJDfEBkpbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-WAu5s3ycPyWt8-ka8ZiB9g-1; Wed, 15 Sep 2021 13:53:26 -0400
X-MC-Unique: WAu5s3ycPyWt8-ka8ZiB9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5381E1006AAB;
 Wed, 15 Sep 2021 17:53:25 +0000 (UTC)
Received: from localhost (unknown [10.39.192.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF8A5C1C5;
 Wed, 15 Sep 2021 17:53:24 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/32] block: Drop BDS comment regarding bdrv_append()
Date: Wed, 15 Sep 2021 19:52:48 +0200
Message-Id: <20210915175318.853225-3-hreitz@redhat.com>
In-Reply-To: <20210915175318.853225-1-hreitz@redhat.com>
References: <20210915175318.853225-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
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
Message-Id: <20210812084148.14458-2-hreitz@redhat.com>
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


