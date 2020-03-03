Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB5177C32
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:44:40 +0100 (CET)
Received: from localhost ([::1]:50072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Aet-0004mB-Eb
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AVt-0004Jk-53
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AVr-00031l-U0
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59669
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AVr-00031X-QP
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOc7HeT+1s334JGeFcRwNRegWa0ts+HD+BGwpDGZNUc=;
 b=i/WACy9RB/M1Bm9RcsRISRPW/iLQh/ESX7rvfplFoTLVGCfmo+DbOnapd+FDqQkxIM8rnV
 hpdDfplmUmNZPLO+oStIwDA1p1byeELyFavrDsUvkingJj7rjP9P2D/S8TZ3frKUyULpMX
 fqXPr8x5Mv0P/IfJm+UOPlXA2FJwxi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-SkPVNDuQPRaLy4XrTsDIxw-1; Tue, 03 Mar 2020 11:35:17 -0500
X-MC-Unique: SkPVNDuQPRaLy4XrTsDIxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB984DB64;
 Tue,  3 Mar 2020 16:35:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C16271000322;
 Tue,  3 Mar 2020 16:35:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C0F2113294C; Tue,  3 Mar 2020 17:35:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/30] qapi: Replace qmp_dispatch()'s TODO comment by an
 explanation
Date: Tue,  3 Mar 2020 17:34:59 +0100
Message-Id: <20200303163505.32041-25-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: libvir-list@redhat.com, berrange@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/qmp-dispatch.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 112d29a9ab..fb53687ce9 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -164,7 +164,11 @@ QDict *qmp_dispatch(QmpCommandList *cmds, QObject *req=
uest,
         g_assert(!ret);
         return NULL;
     } else if (!ret) {
-        /* TODO turn into assertion */
+        /*
+         * When the command's schema has no 'returns', cmd->fn()
+         * leaves @ret null.  The QMP spec calls for an the empty
+         * object then; supply it.
+         */
         ret =3D QOBJECT(qdict_new());
     }
=20
--=20
2.21.1


