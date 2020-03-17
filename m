Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740B918900D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 22:06:29 +0100 (CET)
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEJPw-00083Z-Fj
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 17:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEJL0-0002o1-UK
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEJKy-0002C5-G3
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:45376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEJKy-00028q-BO
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584478880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NCNLTEn6nwkO0WHex16fofctkvIQtceOwnbeHuTPIA4=;
 b=DPQuOU9cvhnfyhukP8htS1v5gzwXzC8wrBKuWKSGgQqI9odJ8RYCyOpxD6nj4o1+/ZJEZI
 7h/sXHGcYlIknPmrwkfQ6dXWyrzcZvZMZGtHGjn8cxNVEynzM4l1NfDX77tmdoLTWZlHke
 gTET9dVqlDaqXC3pmBh0Psk2lzsMrXM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-nx909cNJPdWby-USHh4Otg-1; Tue, 17 Mar 2020 17:01:17 -0400
X-MC-Unique: nx909cNJPdWby-USHh4Otg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B5F107ACC4
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 21:01:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDCD319C58;
 Tue, 17 Mar 2020 21:01:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 336F81138405; Tue, 17 Mar 2020 22:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/30] docs/devel/qapi-code-gen: Fix typo in grammar
Date: Tue, 17 Mar 2020 22:00:46 +0100
Message-Id: <20200317210115.8864-2-armbru@redhat.com>
In-Reply-To: <20200317210115.8864-1-armbru@redhat.com>
References: <20200317210115.8864-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An ALTERNATIVE's value can only be a type name.  Arrays are not
supported, yet.  The text gets it right: "The form STRING is shorthand
for { 'type': STRING }."  The grammar doesn't.  Fix it.

Fixes: b6c37ebaaf074cac8fe8a4781dc3e79db23e914e
Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200309142638.19988-1-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 59d6973e1e..e73979e182 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -399,7 +399,7 @@ Syntax:
                   'data': ALTERNATIVES,
                   '*if': COND }
     ALTERNATIVES =3D { ALTERNATIVE, ... }
-    ALTERNATIVE =3D STRING : TYPE-REF
+    ALTERNATIVE =3D STRING : STRING
                 | STRING : { 'type': STRING, '*if': COND }
=20
 Member 'alternate' names the alternate type.
--=20
2.21.1


