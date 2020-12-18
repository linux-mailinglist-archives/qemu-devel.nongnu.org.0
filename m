Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C142DE675
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:23:43 +0100 (CET)
Received: from localhost ([::1]:39188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHba-0005o5-VP
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRl-0002O7-2x
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRY-0005Lg-Hy
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vxhts5e2n+UdsdcV0xw0bup7B4SRoxXIwLetgSH5hgM=;
 b=gCOYjpez9breIBsZN0PwtS+vTeDof/Xd0L7n36xZsTb/5DEYG8h44C3qKinrUZzi/uLNgy
 yrN1XOSyRPizQOOp/MSUP0oP2z3EMN1f2W5WUNs4LO/192t2/EeiC+9G0xc3+HaUUkl73W
 1MLQnlGKrcJUcr3ALdDtAJ9rqJZ4tZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-xP7HUCl7PCa3DsU-WbWrxQ-1; Fri, 18 Dec 2020 10:13:05 -0500
X-MC-Unique: xP7HUCl7PCa3DsU-WbWrxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E7351005D44;
 Fri, 18 Dec 2020 15:13:04 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F60F10016FF;
 Fri, 18 Dec 2020 15:13:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/30] block: simplify comment to BDRV_REQ_SERIALISING
Date: Fri, 18 Dec 2020 16:12:24 +0100
Message-Id: <20201218151249.715731-6-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

1. BDRV_REQ_NO_SERIALISING doesn't exist already, don't mention it.

2. We are going to add one more user of BDRV_REQ_SERIALISING, so
   comment about backup becomes a bit confusing here. The use case in
   backup is documented in block/backup.c, so let's just drop
   duplication here.

3. The fact that BDRV_REQ_SERIALISING is only for write requests is
   omitted. Add a note.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Message-Id: <20201021145859.11201-2-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 5b81e33e94..a3f3dcc88f 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -63,16 +63,7 @@ typedef enum {
      * content. */
     BDRV_REQ_WRITE_UNCHANGED    = 0x40,
 
-    /*
-     * BDRV_REQ_SERIALISING forces request serialisation for writes.
-     * It is used to ensure that writes to the backing file of a backup process
-     * target cannot race with a read of the backup target that defers to the
-     * backing file.
-     *
-     * Note, that BDRV_REQ_SERIALISING is _not_ opposite in meaning to
-     * BDRV_REQ_NO_SERIALISING. A more descriptive name for the latter might be
-     * _DO_NOT_WAIT_FOR_SERIALISING, except that is too long.
-     */
+    /* Forces request serialisation. Use only with write requests. */
     BDRV_REQ_SERIALISING        = 0x80,
 
     /* Execute the request only if the operation can be offloaded or otherwise
-- 
2.29.2


