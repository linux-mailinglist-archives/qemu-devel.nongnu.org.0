Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C79E8572
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 11:24:58 +0100 (CET)
Received: from localhost ([::1]:54384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPOgL-0007C5-2u
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 06:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iPOeE-0005W6-CF
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iPOeD-0001DG-7F
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:22:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41622
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iPOeD-0001D5-3t
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572344564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bs0n5JYoSHvTctyXcbCXY19cUjHnJPcItocSem1xdE=;
 b=HH+V79T61iKhbwX/wcofXll7NPY4SDBWtbVtravQk3ve/UTBozTfb0utKCDQNP+1Ii5W2i
 iCrUkqe67vZIK7TsumQOcOdZZt3pL1NLYjFSU0YcN46uf7DDC0/4JcxreJvkiFLUAX81I3
 S3POT/RHKdbKmZzf4N+4n+U9NhHAeEY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-Mltw2CKxNMu_v03n5RhimQ-1; Tue, 29 Oct 2019 06:22:43 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C8171005500
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2019 10:22:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F0D1001B09
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2019 10:22:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9867D1132B3B; Tue, 29 Oct 2019 11:22:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] qapi: Fix enum doc comment checking
Date: Tue, 29 Oct 2019 11:22:18 +0100
Message-Id: <20191029102228.20740-10-armbru@redhat.com>
In-Reply-To: <20191029102228.20740-1-armbru@redhat.com>
References: <20191029102228.20740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Mltw2CKxNMu_v03n5RhimQ-1
X-Mimecast-Spam-Score: 0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enumeration type documentation comments are not checked, as
demonstrated by test doc-bad-enum-member.  This is because we neglect
to call self.doc.check() for enumeration types.  Messed up in
816a57cd6e "qapi: Fix detection of bogus member documentation".  Fix
it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191024110237.30963-10-armbru@redhat.com>
---
 scripts/qapi/schema.py                     |  4 ++++
 tests/qapi-schema/doc-bad-enum-member.err  |  1 +
 tests/qapi-schema/doc-bad-enum-member.json |  1 -
 tests/qapi-schema/doc-bad-enum-member.out  | 21 ---------------------
 4 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 9b62c8d74d..0381e3cb40 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -229,6 +229,10 @@ class QAPISchemaEnumType(QAPISchemaType):
             for m in self.members:
                 self.doc.connect_member(m)
=20
+    def check_doc(self):
+        if self.doc:
+            self.doc.check()
+
     def is_implicit(self):
         # See QAPISchema._make_implicit_enum_type() and ._def_predefineds(=
)
         return self.name.endswith('Kind') or self.name =3D=3D 'QType'
diff --git a/tests/qapi-schema/doc-bad-enum-member.err b/tests/qapi-schema/=
doc-bad-enum-member.err
index e69de29bb2..dfa1e786d7 100644
--- a/tests/qapi-schema/doc-bad-enum-member.err
+++ b/tests/qapi-schema/doc-bad-enum-member.err
@@ -0,0 +1 @@
+doc-bad-enum-member.json:3: the following documented members are not in th=
e declaration: a
diff --git a/tests/qapi-schema/doc-bad-enum-member.json b/tests/qapi-schema=
/doc-bad-enum-member.json
index 9f32fe64b4..9cab35c6e8 100644
--- a/tests/qapi-schema/doc-bad-enum-member.json
+++ b/tests/qapi-schema/doc-bad-enum-member.json
@@ -1,5 +1,4 @@
 # Members listed in the doc comment must exist in the actual schema
-# BUG: nonexistent @a is not rejected
=20
 ##
 # @Foo:
diff --git a/tests/qapi-schema/doc-bad-enum-member.out b/tests/qapi-schema/=
doc-bad-enum-member.out
index 6ca31c1e9b..e69de29bb2 100644
--- a/tests/qapi-schema/doc-bad-enum-member.out
+++ b/tests/qapi-schema/doc-bad-enum-member.out
@@ -1,21 +0,0 @@
-module None
-object q_empty
-enum QType
-    prefix QTYPE
-    member none
-    member qnull
-    member qnum
-    member qstring
-    member qdict
-    member qlist
-    member qbool
-module doc-bad-enum-member.json
-enum Foo
-    member b
-doc symbol=3DFoo
-    body=3D
-
-    arg=3Da
-a
-    arg=3Db
-b
--=20
2.21.0


