Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C729E288ED6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:27:33 +0200 (CEST)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvEy-0000WC-RP
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv45-0003uW-Qj
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv42-0003FE-63
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+XO8wBJyyOlh0DOIqFwPn8JUVzvKdWGYYfKMPpS9/s=;
 b=KuDEoHWe4kUZkgyLj9cB76Wz4vomw6RU1JjUKli3f1+DUZsLtmgeVY84dUJHkTJ7D3wDEb
 o9EN4b33n90iM1jac9yF5Nb3wJPc+5Ff75IQSHpExguoMPIb0nT2yaovr+j790bx+m1Qtj
 k7byEIleL60f2v1up0+jpqLc1Vtbziw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-G2RTpIn0Mdml5V3xFRnnYw-1; Fri, 09 Oct 2020 12:16:11 -0400
X-MC-Unique: G2RTpIn0Mdml5V3xFRnnYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E905804024;
 Fri,  9 Oct 2020 16:16:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB6311A92A;
 Fri,  9 Oct 2020 16:16:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/36] qapi: delint using flake8
Date: Fri,  9 Oct 2020 12:15:30 -0400
Message-Id: <20201009161558.107041-9-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Petty style guide fixes and line length enforcement.  Not a big win, not
a big loss, but flake8 passes 100% on the qapi module, which gives us an
easy baseline to enforce hereafter.

A note on the flake8 exception: flake8 will warn on *any* bare except,
but pylint's is context-aware and will suppress the warning if you
re-raise the exception.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/.flake8     |  2 ++
 scripts/qapi/commands.py |  3 ++-
 scripts/qapi/schema.py   |  8 +++++---
 scripts/qapi/visit.py    | 16 +++++++++++-----
 4 files changed, 20 insertions(+), 9 deletions(-)
 create mode 100644 scripts/qapi/.flake8

diff --git a/scripts/qapi/.flake8 b/scripts/qapi/.flake8
new file mode 100644
index 00000000000..6b158c68b84
--- /dev/null
+++ b/scripts/qapi/.flake8
@@ -0,0 +1,2 @@
+[flake8]
+extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index e06c10afcd0..cde0c1e7770 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -65,7 +65,8 @@ def gen_call(name, arg_type, boxed, ret_type):
 def gen_marshal_output(ret_type):
     return mcgen('''
 
-static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in, QObject **ret_out, Error **errp)
+static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
+                                QObject **ret_out, Error **errp)
 {
     Visitor *v;
 
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 71ebb1e396d..afd750989e1 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -536,7 +536,7 @@ def set_defined_in(self, name):
             v.set_defined_in(name)
 
     def check(self, schema, seen):
-        if not self.tag_member: # flat union
+        if not self.tag_member:  # flat union
             self.tag_member = seen.get(c_name(self._tag_name))
             base = "'base'"
             # Pointing to the base type when not implicit would be
@@ -824,7 +824,7 @@ def __init__(self, fname):
         self._entity_dict = {}
         self._module_dict = OrderedDict()
         self._schema_dir = os.path.dirname(fname)
-        self._make_module(None) # built-ins
+        self._make_module(None)  # built-ins
         self._make_module(fname)
         self._predefining = True
         self._def_predefineds()
@@ -968,7 +968,9 @@ def _make_implicit_object_type(self, name, info, ifcond, role, members):
             # But it's not tight: the disjunction need not imply it.  We
             # may end up compiling useless wrapper types.
             # TODO kill simple unions or implement the disjunction
-            assert (ifcond or []) == typ._ifcond # pylint: disable=protected-access
+
+            # pylint: disable=protected-access
+            assert (ifcond or []) == typ._ifcond
         else:
             self._def_entity(QAPISchemaObjectType(
                 name, info, None, ifcond, None, None, members, None))
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index ea277e7704b..9fdbe5b9ef3 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -31,7 +31,9 @@ def gen_visit_decl(name, scalar=False):
     if not scalar:
         c_type += '*'
     return mcgen('''
-bool visit_type_%(c_name)s(Visitor *v, const char *name, %(c_type)sobj, Error **errp);
+
+bool visit_type_%(c_name)s(Visitor *v, const char *name,
+                 %(c_type)sobj, Error **errp);
 ''',
                  c_name=c_name(name), c_type=c_type)
 
@@ -125,7 +127,8 @@ def gen_visit_object_members(name, base, members, variants):
 def gen_visit_list(name, element_type):
     return mcgen('''
 
-bool visit_type_%(c_name)s(Visitor *v, const char *name, %(c_name)s **obj, Error **errp)
+bool visit_type_%(c_name)s(Visitor *v, const char *name,
+                 %(c_name)s **obj, Error **errp)
 {
     bool ok = false;
     %(c_name)s *tail;
@@ -158,7 +161,8 @@ def gen_visit_list(name, element_type):
 def gen_visit_enum(name):
     return mcgen('''
 
-bool visit_type_%(c_name)s(Visitor *v, const char *name, %(c_name)s *obj, Error **errp)
+bool visit_type_%(c_name)s(Visitor *v, const char *name,
+                 %(c_name)s *obj, Error **errp)
 {
     int value = *obj;
     bool ok = visit_type_enum(v, name, &value, &%(c_name)s_lookup, errp);
@@ -172,7 +176,8 @@ def gen_visit_enum(name):
 def gen_visit_alternate(name, variants):
     ret = mcgen('''
 
-bool visit_type_%(c_name)s(Visitor *v, const char *name, %(c_name)s **obj, Error **errp)
+bool visit_type_%(c_name)s(Visitor *v, const char *name,
+                 %(c_name)s **obj, Error **errp)
 {
     bool ok = false;
 
@@ -247,7 +252,8 @@ def gen_visit_alternate(name, variants):
 def gen_visit_object(name, base, members, variants):
     return mcgen('''
 
-bool visit_type_%(c_name)s(Visitor *v, const char *name, %(c_name)s **obj, Error **errp)
+bool visit_type_%(c_name)s(Visitor *v, const char *name,
+                 %(c_name)s **obj, Error **errp)
 {
     bool ok = false;
 
-- 
2.26.2


