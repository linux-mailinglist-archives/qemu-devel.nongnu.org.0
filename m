Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9945E1B66AE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 00:19:16 +0200 (CEST)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRkBf-0000rI-Ji
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 18:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRk9w-0007Yt-Kg
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 18:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jRk9u-0006pz-Fh
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 18:17:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jRk9q-0006iO-4i
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 18:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587680240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cG4/wuUjGLtOs3lRBBHGqT0ewVHOwKkACcYzE9xIwJU=;
 b=J2KZE0BimAThLEDc987wSY2SdYQcrOXNNetESQ9JATHiEKPLuObAYJe0RDC/1p5M7EMS7y
 vc5NOwIp4tobRwf/DaFLl3GinPO6uSEbBr5Et6eK3+3I43lbACIdarcXsNB96f6qdLncMl
 yUtxCMUBKuaTMfhJNXIbxHJ+qmksaPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-0kwcC8SsMmOcgj_nhLWDDA-1; Thu, 23 Apr 2020 18:17:18 -0400
X-MC-Unique: 0kwcC8SsMmOcgj_nhLWDDA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D8E480B70A;
 Thu, 23 Apr 2020 22:17:17 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E791A1C94D;
 Thu, 23 Apr 2020 22:17:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] qcow2: Tweak comment about bitmaps vs. resize
Date: Thu, 23 Apr 2020 17:17:07 -0500
Message-Id: <20200423221707.477404-4-eblake@redhat.com>
In-Reply-To: <20200423221707.477404-1-eblake@redhat.com>
References: <20200423221707.477404-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 16:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our comment did not actually match the code.  Rewrite the comment to
be less sensitive to any future changes to qcow2-bitmap.c that might
implement scenarios that we currently reject.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 34888a793354..6b6d1c3fa8b9 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3997,7 +3997,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriver=
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


