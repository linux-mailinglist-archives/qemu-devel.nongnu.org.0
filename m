Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B327DF9D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 06:38:32 +0200 (CEST)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNTst-0008AG-81
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 00:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTnI-0001DG-JC
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTnG-0000Zx-1X
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9zFBaWvVJPG3rjs8pj+3mSBCJfVyPtmMqFlvinO7qcw=;
 b=NCYEbJTQOjcsMVM+3LnexfMiiB7VfdDgWQDTuiuI13RSEfaboDE0fWURXnIZ0KJ0O3/BOK
 NqQKrB9Y28evkhU0+hhx+MRBGV7bdTb9fW4rQA4tUtI4qRURulACV6mpcACbaDqiDd7dty
 LqAZNOpndE2W9pUkxsr1aUU7yVN1VOo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-8O8E9vdQP5aytp8prkVFYg-1; Wed, 30 Sep 2020 00:32:37 -0400
X-MC-Unique: 8O8E9vdQP5aytp8prkVFYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF47F1DE03;
 Wed, 30 Sep 2020 04:32:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C2C7073678;
 Wed, 30 Sep 2020 04:32:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/46] qapi/common.py: Convert comments into docstrings,
 and elaborate
Date: Wed, 30 Sep 2020 00:31:24 -0400
Message-Id: <20200930043150.1454766-21-jsnow@redhat.com>
In-Reply-To: <20200930043150.1454766-1-jsnow@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As docstrings, they'll show up in documentation and IDE help.

The docstring style being targeted is the Sphinx documentation
style. Sphinx uses an extension of ReST with "domains". We use the
(implicit) Python domain, which supports a number of custom "info
fields". Those info fields are documented here:
https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#info-field-lists

Primarily, we use `:param X: descr`, `:return[s]: descr`, and `:raise[s]
Z: when`. Everything else is the Sphinx dialect of ReST.

(No, nothing checks or enforces this style that I am aware of. Sphinx
either chokes or succeeds, but does not enforce a standard of what is
otherwise inside the docstring. Pycharm does highlight when your param
fields are not aligned with the actual fields present. It does not
highlight missing return or exception statements. There is no existing
style guide I am aware of that covers a standard for a minimally
acceptable docstring. I am debating writing one.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/common.py | 53 +++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 74a2c001ed9..0ef38ea5fe0 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -15,15 +15,24 @@
 from typing import Optional, Sequence
 
 
+#: Sentinel value that causes all space to its right to be removed.
 EATSPACE = '\033EATSPACE.'
 POINTER_SUFFIX = ' *' + EATSPACE
 _C_NAME_TRANS = str.maketrans('.-', '__')
 
 
-# ENUMName -> ENUM_NAME, EnumName1 -> ENUM_NAME1
-# ENUM_NAME -> ENUM_NAME, ENUM_NAME1 -> ENUM_NAME1, ENUM_Name2 -> ENUM_NAME2
-# ENUM24_Name -> ENUM24_NAME
 def camel_to_upper(value: str) -> str:
+    """
+    Converts CamelCase to CAMEL_CASE.
+
+    Examples:
+      ENUMName -> ENUM_NAME
+      EnumName1 -> ENUM_NAME1
+      ENUM_NAME -> ENUM_NAME
+      ENUM_NAME1 -> ENUM_NAME1
+      ENUM_Name2 -> ENUM_NAME2
+      ENUM24_Name -> ENUM24_NAME
+    """
     c_fun_str = c_name(value, False)
     if value.isupper():
         return c_fun_str
@@ -45,21 +54,33 @@ def camel_to_upper(value: str) -> str:
 def c_enum_const(type_name: str,
                  const_name: str,
                  prefix: Optional[str] = None) -> str:
+    """
+    Generate a C enumeration constant name.
+
+    :param type_name: The name of the enumeration.
+    :param const_name: The name of this constant.
+    :param prefix: Optional, prefix that overrides the type_name.
+    """
     if prefix is not None:
         type_name = prefix
     return camel_to_upper(type_name) + '_' + c_name(const_name, False).upper()
 
 
-# Map @name to a valid C identifier.
-# If @protect, avoid returning certain ticklish identifiers (like
-# C keywords) by prepending 'q_'.
-#
-# Used for converting 'name' from a 'name':'type' qapi definition
-# into a generated struct member, as well as converting type names
-# into substrings of a generated C function name.
-# '__a.b_c' -> '__a_b_c', 'x-foo' -> 'x_foo'
-# protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
 def c_name(name: str, protect: bool = True) -> str:
+    """
+    Map ``name`` to a valid C identifier.
+
+    Used for converting 'name' from a 'name':'type' qapi definition
+    into a generated struct member, as well as converting type names
+    into substrings of a generated C function name.
+
+    '__a.b_c' -> '__a_b_c', 'x-foo' -> 'x_foo'
+    protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
+
+    :param name: The name to map.
+    :param protect: If true, avoid returning certain ticklish identifiers
+                    (like C keywords) by prepending ``q_``.
+    """
     # ANSI X3J11/88-090, 3.1.1
     c89_words = set(['auto', 'break', 'case', 'char', 'const', 'continue',
                      'default', 'do', 'double', 'else', 'enum', 'extern',
@@ -129,12 +150,16 @@ def decrease(self, amount: int = 4) -> None:
         self._level -= amount
 
 
+#: Global, current indent level for code generation.
 indent = Indentation()
 
 
-# Generate @code with @kwds interpolated.
-# Obey indent, and strip EATSPACE.
 def cgen(code: str, **kwds: object) -> str:
+    """
+    Generate ``code`` with ``kwds`` interpolated.
+
+    Obey `indent`, and strip `EATSPACE`.
+    """
     raw = code % kwds
     if indent:
         raw = re.sub(r'^(?!(#|$))', str(indent), raw, flags=re.MULTILINE)
-- 
2.26.2


