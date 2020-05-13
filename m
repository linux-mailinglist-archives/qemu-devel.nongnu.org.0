Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD721D1745
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 16:15:07 +0200 (CEST)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYsA5-00034J-LT
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 10:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYs9L-00020Q-Q4
 for qemu-devel@nongnu.org; Wed, 13 May 2020 10:14:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47972
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYs9J-0005hK-Rt
 for qemu-devel@nongnu.org; Wed, 13 May 2020 10:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589379256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nftte3U2PQ4cw+ehd01BD2KVk9z7+pAxNHx3nP6h2nk=;
 b=K1+vv3ip8RHvu5kuD+oP7QTsbg+HE86wPL26gwXw/mzaf9TBYJ+0UYPUeUqiSVFxyIseYN
 WeVaTKO4YVQTif9Fu8/joDgSS8/R+WOWycSnCW/B38mtufGU4jXymD2OD7bJ8VtK2iTBPS
 TNZ8lZdCPu6QrNIamqJLA4ZrFDAhgKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-2cfHrQL5O_S8tw14Ja7q6w-1; Wed, 13 May 2020 10:14:12 -0400
X-MC-Unique: 2cfHrQL5O_S8tw14Ja7q6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26101005510;
 Wed, 13 May 2020 14:14:10 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-145.phx2.redhat.com [10.3.116.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C23B6E6E8;
 Wed, 13 May 2020 14:14:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] bitmaps: Add myself as maintainer
Date: Wed, 13 May 2020 09:14:07 -0500
Message-Id: <20200513141407.185198-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 03:05:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: vsementsov@virtuozzo.com, jsnow@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dirty bitmaps are important to incremental backups, including exposure
over NBD where I'm already maintainer.  Also, I'm aware that lately I
have been doing as much code/review on bitmaps as John Snow, who is
hoping to scale back on this front.

Signed-off-by: Eric Blake <eblake@redhat.com>

---
This still leaves John as maintainer for: IDE, Floppy, and Block Jobs,
which I did not feel comfortable taking on at this time.

If this patch makes sense, I'm happy to take on my recent 'qemu-img
bitmap' series as my first bitmap-related pull request, once it has
sufficient review.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a8dc1e69d42..f7caf7c0cc7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2002,6 +2002,7 @@ T: git https://repo.or.cz/qemu/armbru.git block-next

 Dirty Bitmaps
 M: John Snow <jsnow@redhat.com>
+M: Eric Blake <eblake@redhat.com>
 R: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Supported
-- 
2.26.2


