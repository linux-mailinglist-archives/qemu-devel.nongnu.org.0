Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE22189027
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 22:13:31 +0100 (CET)
Received: from localhost ([::1]:41510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEJWk-0001oE-AB
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 17:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEJLF-0002vV-8M
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEJLA-0002sq-3f
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:37 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:58800)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEJL9-0002mK-Og
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584478887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=69dMY/Yoqz6512HkpdKN5+8T4hw4E2weHp0HpMBh+Gs=;
 b=d45icWmGIYPrmreMGbKOVIUb9Z1RhLmzNmAr/W/OBSEf/Nm1lO5Rg4scJnonnLv18qS79x
 T/pmSSV4YPX9gERwNIzAwmv3ftvCvJrH+gAukTV6X5ForFsWmmSJ1rr52BGmEqSUWT+yZl
 b/jfzP5PU/l7SLD4WSItpop20qasQGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-oZ4CL7CvPcq0N1zRAJdmDg-1; Tue, 17 Mar 2020 17:01:24 -0400
X-MC-Unique: oZ4CL7CvPcq0N1zRAJdmDg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E29A800D5E
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 21:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09AE960BE0;
 Tue, 17 Mar 2020 21:01:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 700B31135A64; Tue, 17 Mar 2020 22:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/30] qapi/schema: Rename QAPISchemaObjectType{Variant,
 Variants}
Date: Tue, 17 Mar 2020 22:01:04 +0100
Message-Id: <20200317210115.8864-20-armbru@redhat.com>
In-Reply-To: <20200317210115.8864-1-armbru@redhat.com>
References: <20200317210115.8864-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

QAPISchemaObjectTypeVariants represents both object type and alternate
type variants.  Rename to QAPISchemaVariants.

Rename QAPISchemaObjectTypeVariant the same way.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200317115459.31821-19-armbru@redhat.com>
---
 scripts/qapi/schema.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 0acf8b466f..033c84c4a0 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -338,7 +338,7 @@ class QAPISchemaObjectType(QAPISchemaType):
             assert isinstance(m, QAPISchemaObjectTypeMember)
             m.set_defined_in(name)
         if variants is not None:
-            assert isinstance(variants, QAPISchemaObjectTypeVariants)
+            assert isinstance(variants, QAPISchemaVariants)
             variants.set_defined_in(name)
         self._base_name =3D base
         self.base =3D None
@@ -449,7 +449,7 @@ class QAPISchemaAlternateType(QAPISchemaType):
=20
     def __init__(self, name, info, doc, ifcond, features, variants):
         super().__init__(name, info, doc, ifcond, features)
-        assert isinstance(variants, QAPISchemaObjectTypeVariants)
+        assert isinstance(variants, QAPISchemaVariants)
         assert variants.tag_member
         variants.set_defined_in(name)
         variants.tag_member.set_defined_in(self.name)
@@ -512,7 +512,7 @@ class QAPISchemaAlternateType(QAPISchemaType):
             self.name, self.info, self.ifcond, self.features, self.variant=
s)
=20
=20
-class QAPISchemaObjectTypeVariants:
+class QAPISchemaVariants:
     def __init__(self, tag_name, info, tag_member, variants):
         # Flat unions pass tag_name but not tag_member.
         # Simple unions and alternates pass tag_member but not tag_name.
@@ -522,7 +522,7 @@ class QAPISchemaObjectTypeVariants:
         assert (isinstance(tag_name, str) or
                 isinstance(tag_member, QAPISchemaObjectTypeMember))
         for v in variants:
-            assert isinstance(v, QAPISchemaObjectTypeVariant)
+            assert isinstance(v, QAPISchemaVariant)
         self._tag_name =3D tag_name
         self.info =3D info
         self.tag_member =3D tag_member
@@ -572,8 +572,8 @@ class QAPISchemaObjectTypeVariants:
             cases =3D {v.name for v in self.variants}
             for m in self.tag_member.type.members:
                 if m.name not in cases:
-                    v =3D QAPISchemaObjectTypeVariant(m.name, self.info,
-                                                    'q_empty', m.ifcond)
+                    v =3D QAPISchemaVariant(m.name, self.info,
+                                          'q_empty', m.ifcond)
                     v.set_defined_in(self.tag_member.defined_in)
                     self.variants.append(v)
         if not self.variants:
@@ -681,7 +681,7 @@ class QAPISchemaObjectTypeMember(QAPISchemaMember):
                                         self.describe)
=20
=20
-class QAPISchemaObjectTypeVariant(QAPISchemaObjectTypeMember):
+class QAPISchemaVariant(QAPISchemaObjectTypeMember):
     role =3D 'branch'
=20
     def __init__(self, name, info, typ, ifcond=3DNone):
@@ -987,7 +987,7 @@ class QAPISchema:
             None))
=20
     def _make_variant(self, case, typ, ifcond, info):
-        return QAPISchemaObjectTypeVariant(case, info, typ, ifcond)
+        return QAPISchemaVariant(case, info, typ, ifcond)
=20
     def _make_simple_variant(self, case, typ, ifcond, info):
         if isinstance(typ, list):
@@ -996,7 +996,7 @@ class QAPISchema:
         typ =3D self._make_implicit_object_type(
             typ, info, self.lookup_type(typ),
             'wrapper', [self._make_member('data', typ, None, info)])
-        return QAPISchemaObjectTypeVariant(case, info, typ, ifcond)
+        return QAPISchemaVariant(case, info, typ, ifcond)
=20
     def _def_union_type(self, expr, info, doc):
         name =3D expr['union']
@@ -1026,7 +1026,7 @@ class QAPISchema:
         self._def_entity(
             QAPISchemaObjectType(name, info, doc, ifcond, features,
                                  base, members,
-                                 QAPISchemaObjectTypeVariants(
+                                 QAPISchemaVariants(
                                      tag_name, info, tag_member, variants)=
))
=20
     def _def_alternate_type(self, expr, info, doc):
@@ -1040,7 +1040,7 @@ class QAPISchema:
         tag_member =3D QAPISchemaObjectTypeMember('type', info, 'QType', F=
alse)
         self._def_entity(
             QAPISchemaAlternateType(name, info, doc, ifcond, features,
-                                    QAPISchemaObjectTypeVariants(
+                                    QAPISchemaVariants(
                                         None, info, tag_member, variants))=
)
=20
     def _def_command(self, expr, info, doc):
--=20
2.21.1


