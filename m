Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D4C172130
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 15:49:16 +0100 (CET)
Received: from localhost ([::1]:32972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7KTT-0003Cn-KB
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 09:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j7KQ4-00088O-N0
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:45:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j7KQ1-0000SJ-GC
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:45:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47774
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j7KQ1-0000RN-Bq
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582814741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WMVfMUnjZnH1rKvonZzx4xefBLCsYINqNyExbog9+pw=;
 b=Adi+3pGbgmvwqxJGqCXhaRQgSQna/26P89AJ1IRj5kXkYH32mYsxhwIzJvB7Px4vfwwZCr
 2oncqUL3GbOde/7g+CBN07QAv4pNZSm+zJYYTnfz98F5cJjuAa/eTipQVNaPE9Eilg5Mqg
 kzUNQllprE3pwpLdhQnYkinl9o9EORA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-i_x6kfR6MZ2VO9wH5Ds12g-1; Thu, 27 Feb 2020 09:45:33 -0500
X-MC-Unique: i_x6kfR6MZ2VO9wH5Ds12g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1F6A13F8;
 Thu, 27 Feb 2020 14:45:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA7B919C7F;
 Thu, 27 Feb 2020 14:45:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1AE1811385F4; Thu, 27 Feb 2020 15:45:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] qapi: Drop conditionals for Python 2
Date: Thu, 27 Feb 2020 15:45:29 +0100
Message-Id: <20200227144531.24309-3-armbru@redhat.com>
In-Reply-To: <20200227144531.24309-1-armbru@redhat.com>
References: <20200227144531.24309-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: mdroth@linux.vnet.ibm.com, jsnow@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py         | 6 +-----
 scripts/qapi/gen.py            | 6 +-----
 scripts/qapi/parser.py         | 6 +-----
 tests/qapi-schema/test-qapi.py | 6 +-----
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index e00dcafce7..ba35abea47 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -12,7 +12,6 @@
 # See the COPYING file in the top-level directory.
=20
 import re
-import string
=20
=20
 # ENUMName -> ENUM_NAME, EnumName1 -> ENUM_NAME1
@@ -43,10 +42,7 @@ def c_enum_const(type_name, const_name, prefix=3DNone):
     return camel_to_upper(type_name) + '_' + c_name(const_name, False).upp=
er()
=20
=20
-if hasattr(str, 'maketrans'):
-    c_name_trans =3D str.maketrans('.-', '__')
-else:
-    c_name_trans =3D string.maketrans('.-', '__')
+c_name_trans =3D str.maketrans('.-', '__')
=20
=20
 # Map @name to a valid C identifier.
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index a53a705c73..317cd72601 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -15,7 +15,6 @@
 import errno
 import os
 import re
-import sys
 from contextlib import contextmanager
=20
 from qapi.common import *
@@ -54,10 +53,7 @@ class QAPIGen:
                 if e.errno !=3D errno.EEXIST:
                     raise
         fd =3D os.open(pathname, os.O_RDWR | os.O_CREAT, 0o666)
-        if sys.version_info[0] >=3D 3:
-            f =3D open(fd, 'r+', encoding=3D'utf-8')
-        else:
-            f =3D os.fdopen(fd, 'r+')
+        f =3D open(fd, 'r+', encoding=3D'utf-8')
         text =3D self.get_content()
         oldtext =3D f.read(len(text) + 1)
         if text !=3D oldtext:
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 2e3a3c5d76..cf14e5426c 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -16,7 +16,6 @@
=20
 import os
 import re
-import sys
 from collections import OrderedDict
=20
 from qapi.error import QAPIParseError, QAPISemError
@@ -30,10 +29,7 @@ class QAPISchemaParser:
         previously_included.add(os.path.abspath(fname))
=20
         try:
-            if sys.version_info[0] >=3D 3:
-                fp =3D open(fname, 'r', encoding=3D'utf-8')
-            else:
-                fp =3D open(fname, 'r')
+            fp =3D open(fname, 'r', encoding=3D'utf-8')
             self.src =3D fp.read()
         except IOError as e:
             raise QAPISemError(incl_info or QAPISourceInfo(None, None, Non=
e),
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.p=
y
index 41232c11a3..bee18ee344 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -16,15 +16,11 @@ import argparse
 import difflib
 import os
 import sys
+from io import StringIO
=20
 from qapi.error import QAPIError
 from qapi.schema import QAPISchema, QAPISchemaVisitor
=20
-if sys.version_info[0] < 3:
-    from cStringIO import StringIO
-else:
-    from io import StringIO
-
=20
 class QAPISchemaTestVisitor(QAPISchemaVisitor):
=20
--=20
2.21.1


