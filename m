Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79F310DF24
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Nov 2019 20:58:51 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ib8tG-0008Ne-JB
	for lists+qemu-devel@lfdr.de; Sat, 30 Nov 2019 14:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ib8ds-0006Tn-Qu
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 14:43:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ib8dq-00059D-SW
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 14:42:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49679
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ib8do-00055R-RR
 for qemu-devel@nongnu.org; Sat, 30 Nov 2019 14:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575142972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dc9Zi859fZ/6PNfDggKzxG0kjve40PrhKYv1nIJAHo0=;
 b=f/3QvFNp0KwEb8biJJ3ToPU0HjUgPAHaki9xt9M/+pO5fpUjTZ8I0iO2Gje9p00uFIXach
 t+LKBKjgL1ZWB8xSUPtBtqYm7ye8BE3WLUCkbCKa9tDFJgnL5nQTU959NdW4KBMZ6h4c/q
 ckl5Vycn9f8DATPpi80IAL32h5rXbnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-sNA1v2rQPBq7gX7qOtKxUA-1; Sat, 30 Nov 2019 14:42:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6A6B184CABC;
 Sat, 30 Nov 2019 19:42:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84BD319C58;
 Sat, 30 Nov 2019 19:42:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1951011366DB; Sat, 30 Nov 2019 20:42:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/21] io: Fix Error usage in a comment <example>
Date: Sat, 30 Nov 2019 20:42:25 +0100
Message-Id: <20191130194240.10517-7-armbru@redhat.com>
In-Reply-To: <20191130194240.10517-1-armbru@redhat.com>
References: <20191130194240.10517-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: sNA1v2rQPBq7gX7qOtKxUA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: vsementsov@virtuozzo.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/io/task.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/io/task.h b/include/io/task.h
index 5cb9faf9f2..1abbfb8b65 100644
--- a/include/io/task.h
+++ b/include/io/task.h
@@ -119,7 +119,7 @@ typedef void (*QIOTaskWorker)(QIOTask *task,
  *   gboolean myobject_operation_timer(gpointer opaque)
  *   {
  *      QIOTask *task =3D QIO_TASK(opaque);
- *      Error *err;*
+ *      Error *err =3D NULL;
  *
  *      ...check something important...
  *       if (err) {
--=20
2.21.0


