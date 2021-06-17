Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595CA3AB7F7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:55:11 +0200 (CEST)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuMH-0008EU-VT
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuK8-0005Rt-Nd
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltuK6-0001EO-Jj
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623945173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=89AuW0Rgv4XY04Hqa6QlcztfP9x0mangy4Utb9Cf6Go=;
 b=jUyXHeEifEyswDTUnlxMMSRNviKtCMKUKTqiEu9FVZPEah9In5JQ/pTuf9Wb4eNid61jML
 O8oJ6xjoZ7ZgsJvUuzL6fDyUSZRIbObZ8HcToaSlnQh83EjPZXMXfEALmq5FuzUsM2iIEA
 fTtsAWNt0ZyFPRr8zpzsQ1TySzDRS1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-edWOnpQeNySwOZVjTxEXxg-1; Thu, 17 Jun 2021 11:52:52 -0400
X-MC-Unique: edWOnpQeNySwOZVjTxEXxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FB9100D926;
 Thu, 17 Jun 2021 15:52:51 +0000 (UTC)
Received: from localhost (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A358F19D9D;
 Thu, 17 Jun 2021 15:52:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/6] block: Drop BDS comment regarding bdrv_append()
Date: Thu, 17 Jun 2021 17:52:42 +0200
Message-Id: <20210617155247.442150-2-mreitz@redhat.com>
In-Reply-To: <20210617155247.442150-1-mreitz@redhat.com>
References: <20210617155247.442150-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a comment above the BDS definition stating care must be taken
to consider handling newly added fields in bdrv_append().

Actually, this comment should have said "bdrv_swap()" as of 4ddc07cac
(nine years ago), and in any case, bdrv_swap() was dropped in
8e419aefa (six years ago).  So no such care is necessary anymore.

Signed-off-by: Max Reitz <mreitz@redhat.com>
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


