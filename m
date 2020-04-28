Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D41BCC6D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 21:32:00 +0200 (CEST)
Received: from localhost ([::1]:47060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTVxX-0007mO-CL
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 15:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTVt2-00024n-4T
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:27:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTVsz-0000kW-Rh
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:27:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25071
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jTVsz-0000k9-Ck
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588102036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FR0wKtryIUTIUFtw94opMcW6TWeMpFTYkq8g1QpLP28=;
 b=d2jNlpY/izMTJnrsV0t+oD+I3vQMT4naHuh8tuTVVxaDn1gExcdunkDk4avX583fDU1KJV
 BX+J8BI7d2iwbw0/wNvfjOB2b89jgUf9LYhVVIJGkevfkLWLrgauhAQUjHgmXmWW4OXoKs
 P6vKLMNxud5xmyvxHh8LSLSI+8muAxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-h3vQcJ6mO0OP7SO7ch-Hkg-1; Tue, 28 Apr 2020 15:27:14 -0400
X-MC-Unique: h3vQcJ6mO0OP7SO7ch-Hkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EC7E46B;
 Tue, 28 Apr 2020 19:27:13 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7620A10002B6;
 Tue, 28 Apr 2020 19:27:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] qcow2: Tweak comment about bitmaps vs. resize
Date: Tue, 28 Apr 2020 14:26:48 -0500
Message-Id: <20200428192648.749066-4-eblake@redhat.com>
In-Reply-To: <20200428192648.749066-1-eblake@redhat.com>
References: <20200428192648.749066-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our comment did not actually match the code.  Rewrite the comment to
be less sensitive to any future changes to qcow2-bitmap.c that might
implement scenarios that we currently reject.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3e8b3d022b80..ad934109a813 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3999,7 +3999,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriver=
State *bs, int64_t offset,
         goto fail;
     }

-    /* cannot proceed if image has bitmaps */
+    /* See qcow2-bitmap.c for which bitmap scenarios prevent a resize. */
     if (qcow2_truncate_bitmaps_check(bs, errp)) {
         ret =3D -ENOTSUP;
         goto fail;
--=20
2.26.2


