Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05D1399728
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 02:43:02 +0200 (CEST)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lobRt-0008BX-SQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 20:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMm-000508-4t
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lobMk-0004mG-6c
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 20:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622680661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZ1UDK/3zQdTOKonKn7mNfwnxJXNgQYOuELcuEX9k90=;
 b=A9N5wff+9DkwPlayuIA7qoEvLcF/gmLJn3kzEfwNwPjU3eSMthsBZMdUVTGblzOaHLLEdI
 0b22En+QavB3wzFcpF8UGbhALYfYhTOuzZF4iESEx0RsF+NUDFLLgioeuJu7XjLbUEvF+t
 cNYHT67iG9dRWB4zeWaOcaLRnDcpgJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-Xs3RRhx2MdeRcibfx_PRCQ-1; Wed, 02 Jun 2021 20:37:39 -0400
X-MC-Unique: Xs3RRhx2MdeRcibfx_PRCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262BF180FD6D;
 Thu,  3 Jun 2021 00:37:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1948A10013D6;
 Thu,  3 Jun 2021 00:37:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/19] scripts/qom-fuse: add static type hints
Date: Wed,  2 Jun 2021 20:37:15 -0400
Message-Id: <20210603003719.1321369-16-jsnow@redhat.com>
In-Reply-To: <20210603003719.1321369-1-jsnow@redhat.com>
References: <20210603003719.1321369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because fusepy does not have type hints, add some targeted warning
suppressions.

Namely, we need to allow subclassing something of an unknown type (in
qom_fuse.py), and we need to allow missing imports (recorded against
fuse itself) because mypy will be unable to import fusepy (even when
installed) as it has no types nor type stubs available.

Note: Until now, it was possible to run invocations like 'mypy qemu/'
from ./python and have that work. However, these targeted suppressions
require that you run 'mypy -p qemu/' instead. The correct, canonical
invocation is recorded in ./python/tests/mypy.sh and all of the various
CI invocations always use this correct form.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg     |  8 ++++++++
 scripts/qmp/qom-fuse | 26 +++++++++++++++++---------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index c9b9445af98..ba8d29fd62d 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -57,6 +57,14 @@ python_version = 3.6
 warn_unused_configs = True
 namespace_packages = True
 
+[mypy-qemu.qmp.qom_fuse]
+# fusepy has no type stubs:
+allow_subclassing_any = True
+
+[mypy-fuse]
+# fusepy has no type stubs:
+ignore_missing_imports = True
+
 [pylint.messages control]
 # Disable the message, report, category or checker with the given id(s). You
 # can either give multiple identifiers separated by comma (,) or put this
diff --git a/scripts/qmp/qom-fuse b/scripts/qmp/qom-fuse
index 0d11f731526..a5a7a304a3e 100755
--- a/scripts/qmp/qom-fuse
+++ b/scripts/qmp/qom-fuse
@@ -38,7 +38,14 @@ from errno import ENOENT, EPERM
 import os
 import stat
 import sys
-from typing import Dict
+from typing import (
+    IO,
+    Dict,
+    Iterator,
+    Mapping,
+    Optional,
+    Union,
+)
 
 import fuse
 from fuse import FUSE, FuseOSError, Operations
@@ -83,7 +90,7 @@ class QOMFuse(QOMCommand, Operations):
         self.fuse = FUSE(self, self.mount, foreground=True)
         return 0
 
-    def get_ino(self, path):
+    def get_ino(self, path: str) -> int:
         """Get an inode number for a given QOM path."""
         if path in self.ino_map:
             return self.ino_map[path]
@@ -91,7 +98,7 @@ class QOMFuse(QOMCommand, Operations):
         self.ino_count += 1
         return self.ino_map[path]
 
-    def is_object(self, path):
+    def is_object(self, path: str) -> bool:
         """Is the given QOM path an object?"""
         try:
             self.qom_list(path)
@@ -99,7 +106,7 @@ class QOMFuse(QOMCommand, Operations):
         except QMPResponseError:
             return False
 
-    def is_property(self, path):
+    def is_property(self, path: str) -> bool:
         """Is the given QOM path a property?"""
         path, prop = path.rsplit('/', 1)
         if path == '':
@@ -112,7 +119,7 @@ class QOMFuse(QOMCommand, Operations):
         except QMPResponseError:
             return False
 
-    def is_link(self, path):
+    def is_link(self, path: str) -> bool:
         """Is the given QOM path a link?"""
         path, prop = path.rsplit('/', 1)
         if path == '':
@@ -125,7 +132,7 @@ class QOMFuse(QOMCommand, Operations):
         except QMPResponseError:
             return False
 
-    def read(self, path, size, offset, fh):
+    def read(self, path: str, size: int, offset: int, fh: IO[bytes]) -> bytes:
         if not self.is_property(path):
             raise FuseOSError(ENOENT)
 
@@ -143,7 +150,7 @@ class QOMFuse(QOMCommand, Operations):
 
         return bytes(data[offset:][:size], encoding='utf-8')
 
-    def readlink(self, path):
+    def readlink(self, path: str) -> Union[bool, str]:
         if not self.is_link(path):
             return False
         path, prop = path.rsplit('/', 1)
@@ -151,7 +158,8 @@ class QOMFuse(QOMCommand, Operations):
         return prefix + str(self.qmp.command('qom-get', path=path,
                                              property=prop))
 
-    def getattr(self, path, fh=None):
+    def getattr(self, path: str,
+                fh: Optional[IO[bytes]] = None) -> Mapping[str, object]:
         if self.is_link(path):
             value = {
                 'st_mode': 0o755 | stat.S_IFLNK,
@@ -195,7 +203,7 @@ class QOMFuse(QOMCommand, Operations):
             raise FuseOSError(ENOENT)
         return value
 
-    def readdir(self, path, fh):
+    def readdir(self, path: str, fh: IO[bytes]) -> Iterator[str]:
         yield '.'
         yield '..'
         for item in self.qom_list(path):
-- 
2.31.1


