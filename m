Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6717E284
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 15:27:42 +0100 (CET)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBJNd-00073L-Lf
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 10:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jBJMh-0005yo-Pc
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:26:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jBJMg-000886-Se
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:26:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21167
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jBJMg-00087p-PQ
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 10:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583764002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gAmioLtE/UvxQLwS2kcH6iOTXYEbt0nuO/MNu+PCHJc=;
 b=UXf+pr7A2DJFYs/z/GqY85uywJHOAGtSO1xGXgMES4MepmOB5GBsUubxuiEOm58oMEbgUt
 f+LC7K38JDO1l2MGfurw8KrfLWZ/xRSGcOI7+DdWEvMEYuzmGgSBoLpGZeisLAI25SXdQk
 9CfMie9f2+IU09prfqeUcUF3qjfTsJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-C51km0jsP_-dAxZ-gvP6QA-1; Mon, 09 Mar 2020 10:26:40 -0400
X-MC-Unique: C51km0jsP_-dAxZ-gvP6QA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D469A800D5F
 for <qemu-devel@nongnu.org>; Mon,  9 Mar 2020 14:26:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-34.ams2.redhat.com
 [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A53F026568;
 Mon,  9 Mar 2020 14:26:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3651511386A6; Mon,  9 Mar 2020 15:26:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel/qapi-code-gen: Fix typo in grammar
Date: Mon,  9 Mar 2020 15:26:38 +0100
Message-Id: <20200309142638.19988-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An ALTERNATIVE's value can only be a type name.  Arrays are not
supported, yet.  The text gets it right: "The form STRING is shorthand
for { 'type': STRING }."  The grammar doesn't.  Fix it.

Fixes: b6c37ebaaf074cac8fe8a4781dc3e79db23e914e
Reported-by: John Snow <jsnow@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


