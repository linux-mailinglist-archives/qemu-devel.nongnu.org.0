Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CBC284042
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 22:05:00 +0200 (CEST)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWjD-0007yY-0L
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 16:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWx-0008Sm-9F
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWv-00077a-5O
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6SmEiOP/z4ply0fDRdNq6utv3W5C6KekYtKiLV6btY=;
 b=AT80dBE5eexBwVRUnaocGrDZFlKPn8Z4cEc7JJM515YU/uZSJdtkaGkSUDmvhx1mIPID3u
 F+813CG9BlR3sceC0woEA0qtQmht62q//ncJs2Krzq17Lb9JujxfEY0fJ8Svsl1OenhRhM
 zbWf1SvRINbZKbwAFM91BM3OcVACUOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-pvaL-dl5Nv-RQmEw1AyUmQ-1; Mon, 05 Oct 2020 15:52:14 -0400
X-MC-Unique: pvaL-dl5Nv-RQmEw1AyUmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B482D344F1
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFE9F5C1BD;
 Mon,  5 Oct 2020 19:52:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/36] qapi/common.py: delint with pylint
Date: Mon,  5 Oct 2020 15:51:34 -0400
Message-Id: <20201005195158.2348217-13-jsnow@redhat.com>
In-Reply-To: <20201005195158.2348217-1-jsnow@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At this point, that just means using a consistent strategy for constant names.
constants get UPPER_CASE and names not used externally get a leading underscore.

As a preference, while renaming constants to be UPPERCASE, move them to
the head of the file. Generally, it's nice to be able to audit the code
that runs on import in one central place.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/common.py | 18 ++++++++----------
 scripts/qapi/schema.py | 14 +++++++-------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index b35318b72cf..a417b6029c8 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -14,6 +14,11 @@
 import re
 
 
+EATSPACE = '\033EATSPACE.'
+POINTER_SUFFIX = ' *' + EATSPACE
+_C_NAME_TRANS = str.maketrans('.-', '__')
+
+
 # ENUMName -> ENUM_NAME, EnumName1 -> ENUM_NAME1
 # ENUM_NAME -> ENUM_NAME, ENUM_NAME1 -> ENUM_NAME1, ENUM_Name2 -> ENUM_NAME2
 # ENUM24_Name -> ENUM24_NAME
@@ -42,9 +47,6 @@ def c_enum_const(type_name, const_name, prefix=None):
     return camel_to_upper(type_name) + '_' + c_name(const_name, False).upper()
 
 
-c_name_trans = str.maketrans('.-', '__')
-
-
 # Map @name to a valid C identifier.
 # If @protect, avoid returning certain ticklish identifiers (like
 # C keywords) by prepending 'q_'.
@@ -82,17 +84,13 @@ def c_name(name, protect=True):
                      'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
     # namespace pollution:
     polluted_words = set(['unix', 'errno', 'mips', 'sparc', 'i386'])
-    name = name.translate(c_name_trans)
+    name = name.translate(_C_NAME_TRANS)
     if protect and (name in c89_words | c99_words | c11_words | gcc_words
                     | cpp_words | polluted_words):
         return 'q_' + name
     return name
 
 
-eatspace = '\033EATSPACE.'
-pointer_suffix = ' *' + eatspace
-
-
 class Indentation:
     """
     Indentation level management.
@@ -132,12 +130,12 @@ def decrease(self, amount: int = 4) -> None:
 
 
 # Generate @code with @kwds interpolated.
-# Obey indent, and strip eatspace.
+# Obey indent, and strip EATSPACE.
 def cgen(code, **kwds):
     raw = code % kwds
     if indent:
         raw = re.sub(r'^(?!(#|$))', str(indent), raw, flags=re.MULTILINE)
-    return re.sub(re.escape(eatspace) + r' *', '', raw)
+    return re.sub(re.escape(EATSPACE) + r' *', '', raw)
 
 
 def mcgen(code, **kwds):
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index cfc52e1ae44..74c6b96d391 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -18,7 +18,7 @@
 import os
 import re
 
-from .common import c_name, pointer_suffix
+from .common import POINTER_SUFFIX, c_name
 from .error import QAPIError, QAPISemError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
@@ -309,7 +309,7 @@ def is_implicit(self):
         return True
 
     def c_type(self):
-        return c_name(self.name) + pointer_suffix
+        return c_name(self.name) + POINTER_SUFFIX
 
     def json_type(self):
         return 'array'
@@ -430,7 +430,7 @@ def c_name(self):
 
     def c_type(self):
         assert not self.is_implicit()
-        return c_name(self.name) + pointer_suffix
+        return c_name(self.name) + POINTER_SUFFIX
 
     def c_unboxed_type(self):
         return c_name(self.name)
@@ -504,7 +504,7 @@ def connect_doc(self, doc=None):
             v.connect_doc(doc)
 
     def c_type(self):
-        return c_name(self.name) + pointer_suffix
+        return c_name(self.name) + POINTER_SUFFIX
 
     def json_type(self):
         return 'value'
@@ -896,7 +896,7 @@ def _def_builtin_type(self, name, json_type, c_type):
         self._make_array_type(name, None)
 
     def _def_predefineds(self):
-        for t in [('str',    'string',  'char' + pointer_suffix),
+        for t in [('str',    'string',  'char' + POINTER_SUFFIX),
                   ('number', 'number',  'double'),
                   ('int',    'int',     'int64_t'),
                   ('int8',   'int',     'int8_t'),
@@ -909,8 +909,8 @@ def _def_predefineds(self):
                   ('uint64', 'int',     'uint64_t'),
                   ('size',   'int',     'uint64_t'),
                   ('bool',   'boolean', 'bool'),
-                  ('any',    'value',   'QObject' + pointer_suffix),
-                  ('null',   'null',    'QNull' + pointer_suffix)]:
+                  ('any',    'value',   'QObject' + POINTER_SUFFIX),
+                  ('null',   'null',    'QNull' + POINTER_SUFFIX)]:
             self._def_builtin_type(*t)
         self.the_empty_object_type = QAPISchemaObjectType(
             'q_empty', None, None, None, None, None, [], None)
-- 
2.26.2


