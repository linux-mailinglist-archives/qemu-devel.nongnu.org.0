Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D1D177C40
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:47:10 +0100 (CET)
Received: from localhost ([::1]:50142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9AhJ-0001Fa-4y
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:47:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AW8-0004c1-Ur
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AW7-0003BO-9x
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:36 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31415
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AW7-00039x-64
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osNV8uUZeUP5b4gAuB1lT2GZGquG+Lh6Va7VhUXUe8c=;
 b=V8fT/5fBZIr4/YOKPrXr4/UlpDb1d+5C4OCEWBsYGcMYusmmyuAPMFwuF5TI6mf+bWGwW2
 d+v+1V42AoojrR3nfasr3HGhjkR4ehNAzbPG5goV8oQPTDOmHzoeXjD97xL6qW9yaf4eQS
 zYokQBEJfA4MjFrExeB+Eqf9AgMHmcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-DvJcA0CTPluHMqs_QZvIUQ-1; Tue, 03 Mar 2020 11:35:16 -0500
X-MC-Unique: DvJcA0CTPluHMqs_QZvIUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81DDBDB60;
 Tue,  3 Mar 2020 16:35:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C87405C1D8;
 Tue,  3 Mar 2020 16:35:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DCF561132B2C; Tue,  3 Mar 2020 17:35:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/30] qapi/introspect: Rename *qlit* to reduce confusion
Date: Tue,  3 Mar 2020 17:34:49 +0100
Message-Id: <20200303163505.32041-15-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: libvir-list@redhat.com, berrange@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We generate the value of qmp_schema_qlit from an expression tree.  The
function doing that is named to_qlit(), and its inputs are accumulated
in QAPISchemaGenIntrospectVisitor._qlits.  We call both its input and
its output "qlit".  This is confusing.

Use "tree" for input, and "qlit" only for output: rename to_qlit() to
_tree_to_qlit(), ._qlits to ._trees, ._gen_qlit() to ._gen_tree().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index b54910510d..e4fc9d90f1 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -16,7 +16,7 @@ from qapi.schema import (QAPISchemaArrayType, QAPISchemaB=
uiltinType,
                          QAPISchemaType)
=20
=20
-def to_qlit(obj, level=3D0, suppress_first_indent=3DFalse):
+def _tree_to_qlit(obj, level=3D0, suppress_first_indent=3DFalse):
=20
     def indent(level):
         return level * 4 * ' '
@@ -30,7 +30,7 @@ def to_qlit(obj, level=3D0, suppress_first_indent=3DFalse=
):
             ret +=3D indent(level) + '/* %s */\n' % comment
         if ifcond:
             ret +=3D gen_if(ifcond)
-        ret +=3D to_qlit(ifobj, level)
+        ret +=3D _tree_to_qlit(ifobj, level)
         if ifcond:
             ret +=3D '\n' + gen_endif(ifcond)
         return ret
@@ -43,7 +43,7 @@ def to_qlit(obj, level=3D0, suppress_first_indent=3DFalse=
):
     elif isinstance(obj, str):
         ret +=3D 'QLIT_QSTR(' + to_c_string(obj) + ')'
     elif isinstance(obj, list):
-        elts =3D [to_qlit(elt, level + 1).strip('\n')
+        elts =3D [_tree_to_qlit(elt, level + 1).strip('\n')
                 for elt in obj]
         elts.append(indent(level + 1) + "{}")
         ret +=3D 'QLIT_QLIST(((QLitObject[]) {\n'
@@ -53,7 +53,8 @@ def to_qlit(obj, level=3D0, suppress_first_indent=3DFalse=
):
         elts =3D []
         for key, value in sorted(obj.items()):
             elts.append(indent(level + 1) + '{ %s, %s }' %
-                        (to_c_string(key), to_qlit(value, level + 1, True)=
))
+                        (to_c_string(key),
+                         _tree_to_qlit(value, level + 1, True)))
         elts.append(indent(level + 1) + '{}')
         ret +=3D 'QLIT_QDICT(((QLitDictEntry[]) {\n'
         ret +=3D ',\n'.join(elts) + '\n'
@@ -79,7 +80,7 @@ class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithic=
CVisitor):
             ' * QAPI/QMP schema introspection', __doc__)
         self._unmask =3D unmask
         self._schema =3D None
-        self._qlits =3D []
+        self._trees =3D []
         self._used_types =3D []
         self._name_map =3D {}
         self._genc.add(mcgen('''
@@ -108,9 +109,9 @@ extern const QLitObject %(c_name)s;
 const QLitObject %(c_name)s =3D %(c_string)s;
 ''',
                              c_name=3Dc_name(name),
-                             c_string=3Dto_qlit(self._qlits)))
+                             c_string=3D_tree_to_qlit(self._trees)))
         self._schema =3D None
-        self._qlits =3D []
+        self._trees =3D []
         self._used_types =3D []
         self._name_map =3D {}
=20
@@ -144,7 +145,7 @@ const QLitObject %(c_name)s =3D %(c_string)s;
             return '[' + self._use_type(typ.element_type) + ']'
         return self._name(typ.name)
=20
-    def _gen_qlit(self, name, mtype, obj, ifcond, features):
+    def _gen_tree(self, name, mtype, obj, ifcond, features):
         extra =3D {}
         if mtype not in ('command', 'event', 'builtin', 'array'):
             if not self._unmask:
@@ -159,9 +160,9 @@ const QLitObject %(c_name)s =3D %(c_string)s;
         if ifcond:
             extra['if'] =3D ifcond
         if extra:
-            self._qlits.append((obj, extra))
+            self._trees.append((obj, extra))
         else:
-            self._qlits.append(obj)
+            self._trees.append(obj)
=20
     def _gen_member(self, member):
         ret =3D {'name': member.name, 'type': self._use_type(member.type)}
@@ -180,17 +181,17 @@ const QLitObject %(c_name)s =3D %(c_string)s;
                 {'if': variant.ifcond})
=20
     def visit_builtin_type(self, name, info, json_type):
-        self._gen_qlit(name, 'builtin', {'json-type': json_type}, [], None=
)
+        self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None=
)
=20
     def visit_enum_type(self, name, info, ifcond, features, members, prefi=
x):
-        self._gen_qlit(name, 'enum',
+        self._gen_tree(name, 'enum',
                        {'values':
                         [(m.name, {'if': m.ifcond}) for m in members]},
                        ifcond, features)
=20
     def visit_array_type(self, name, info, ifcond, element_type):
         element =3D self._use_type(element_type)
-        self._gen_qlit('[' + element + ']', 'array', {'element-type': elem=
ent},
+        self._gen_tree('[' + element + ']', 'array', {'element-type': elem=
ent},
                        ifcond, None)
=20
     def visit_object_type_flat(self, name, info, ifcond, features,
@@ -200,10 +201,10 @@ const QLitObject %(c_name)s =3D %(c_string)s;
             obj.update(self._gen_variants(variants.tag_member.name,
                                           variants.variants))
=20
-        self._gen_qlit(name, 'object', obj, ifcond, features)
+        self._gen_tree(name, 'object', obj, ifcond, features)
=20
     def visit_alternate_type(self, name, info, ifcond, features, variants)=
:
-        self._gen_qlit(name, 'alternate',
+        self._gen_tree(name, 'alternate',
                        {'members': [
                            ({'type': self._use_type(m.type)}, {'if': m.ifc=
ond})
                            for m in variants.variants]},
@@ -218,11 +219,11 @@ const QLitObject %(c_name)s =3D %(c_string)s;
                'ret-type': self._use_type(ret_type)}
         if allow_oob:
             obj['allow-oob'] =3D allow_oob
-        self._gen_qlit(name, 'command', obj, ifcond, features)
+        self._gen_tree(name, 'command', obj, ifcond, features)
=20
     def visit_event(self, name, info, ifcond, features, arg_type, boxed):
         arg_type =3D arg_type or self._schema.the_empty_object_type
-        self._gen_qlit(name, 'event', {'arg-type': self._use_type(arg_type=
)},
+        self._gen_tree(name, 'event', {'arg-type': self._use_type(arg_type=
)},
                        ifcond, features)
=20
=20
--=20
2.21.1


