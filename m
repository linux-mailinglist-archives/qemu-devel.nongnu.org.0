Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6235189018
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 22:09:41 +0100 (CET)
Received: from localhost ([::1]:41462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEJT2-0004yI-Rv
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 17:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEJL3-0002oI-Ou
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEJL1-0002TD-ON
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:25 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:59881)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEJL0-0002Ld-Mj
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584478882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v6+YzvjRvkfMeaX6pJhdiNaWybz4FXNOlc7EglQGh5U=;
 b=bKbcmNqNbzYt4fivnbw/XL+aoOnwAJ+AgkQEWX2U3pIt2zE7eLu6VznRNJwUEw7MVhOsDb
 mMVE4rD+8MWWCCKZQsPs2SZ5ZMJE6SkStSyZcAGVu4Q2Xu6mVyA3o+B3LsSmSfAHcX79vH
 IBr2fUwmn0mW4yWlwKryVYBXEG26/bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-JzLnLX2IMP-stF13Z8R30Q-1; Tue, 17 Mar 2020 17:01:20 -0400
X-MC-Unique: JzLnLX2IMP-stF13Z8R30Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93AF6190B2A6
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 21:01:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D89715C1BB;
 Tue, 17 Mar 2020 21:01:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3B99F11366CF; Tue, 17 Mar 2020 22:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/30] qapi: Belatedly update doc comment for @wait deprecation
Date: Tue, 17 Mar 2020 22:00:48 +0100
Message-Id: <20200317210115.8864-4-armbru@redhat.com>
In-Reply-To: <20200317210115.8864-1-armbru@redhat.com>
References: <20200317210115.8864-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a9b305ba29 "socket: allow wait=3Dfalse for client socket"
deprecated use of @wait for client socket chardevs, but neglected to
update char.json's doc comment.  Make up for that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200317115459.31821-3-armbru@redhat.com>
---
 qapi/char.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qapi/char.json b/qapi/char.json
index 6907b2bfdb..daceb20f84 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -258,6 +258,7 @@
 # @server: create server socket (default: true)
 # @wait: wait for incoming connection on server
 #        sockets (default: false).
+#        Silently ignored with server: false.  This use is deprecated.
 # @nodelay: set TCP_NODELAY socket option (default: false)
 # @telnet: enable telnet protocol on server
 #          sockets (default: false)
--=20
2.21.1


