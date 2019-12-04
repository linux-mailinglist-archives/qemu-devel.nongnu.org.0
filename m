Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96806112973
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 11:41:37 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icS6A-0007l6-Vt
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 05:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1icR5Y-0007FG-9P
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1icR5F-00009t-8f
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59425
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1icR5F-0008Mr-4J
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575452189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dc9Zi859fZ/6PNfDggKzxG0kjve40PrhKYv1nIJAHo0=;
 b=et88UFRFcVj4gGwEtEhVP2ZTbRBehzBTZ6rJNxab+433PbB8wF62HyNTcLRRtymRRr7j1B
 tqudrdNtvleQ4NqLFwph7QXtRcAHNDiIzMaBeo96/YMJ+V/V9QXNn2V5WDfInE+R95GXrG
 ciSdDVFV6lOEpJuaa/HK1a3qxK967mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-J9p1byTTM3a4AA3TGpsfHA-1; Wed, 04 Dec 2019 04:36:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D8CC800D5A
 for <qemu-devel@nongnu.org>; Wed,  4 Dec 2019 09:36:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B43C1001938;
 Wed,  4 Dec 2019 09:36:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8BC8911366CF; Wed,  4 Dec 2019 10:36:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/18] io: Fix Error usage in a comment <example>
Date: Wed,  4 Dec 2019 10:36:10 +0100
Message-Id: <20191204093625.14836-4-armbru@redhat.com>
In-Reply-To: <20191204093625.14836-1-armbru@redhat.com>
References: <20191204093625.14836-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: J9p1byTTM3a4AA3TGpsfHA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
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


