Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6BDFE31
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 09:23:53 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMoWF-0006TX-SR
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 03:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iMoUP-00058t-1I
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iMoUN-0005EN-TB
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:21:56 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51721)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iMoUN-0005Cv-Q8
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571728914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifHsHTBcMhSqGAy591LJdMSm21J89JLOA6i3bO9Pwso=;
 b=Xao+E5RHFNAiJmVbAKVybPdFHaAWCk9wlyPn6OvQVXqRUmHDM0lZCiLbT3BsJzfKPa9oLu
 krklQKqNC2eZcs9AT0K61iCCxRRZRTzydm3rK06HnbXE7PV+x1zRk5IxHs6OCaynOEZQeT
 u9RLmAMee5KHYsyfZgsAhc+8GBcc01I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-M2H9-JgvMzePIV6wdD9clw-1; Tue, 22 Oct 2019 03:21:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1B32801E66;
 Tue, 22 Oct 2019 07:21:51 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 575EB1B5B8;
 Tue, 22 Oct 2019 07:21:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH v3 1/6] iotests: remove 'linux' from default supported
 platforms
Date: Tue, 22 Oct 2019 09:21:30 +0200
Message-Id: <20191022072135.11188-2-thuth@redhat.com>
In-Reply-To: <20191022072135.11188-1-thuth@redhat.com>
References: <20191022072135.11188-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: M2H9-JgvMzePIV6wdD9clw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

verify_platform will check an explicit whitelist and blacklist instead.
The default will now be assumed to be allowed to run anywhere.

For tests that do not specify their platforms explicitly, this has the effe=
ct of
enabling these tests on non-linux platforms. For tests that always specifie=
d
linux explicitly, there is no change.

For Python tests on FreeBSD at least; only seven python tests fail:
045 147 149 169 194 199 211

045 and 149 appear to be misconfigurations,
147 and 194 are the AF_UNIX path too long error,
169 and 199 are bitmap migration bugs, and
211 is a bug that shows up on Linux platforms, too.

This is at least good evidence that these tests are not Linux-only. If
they aren't suitable for other platforms, they should be disabled on a
per-platform basis as appropriate.

Therefore, let's switch these on and deal with the failures.

Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 5373149ae1..7d6c2d3641 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -871,9 +871,14 @@ def verify_protocol(supported=3D[], unsupported=3D[]):
     if not_sup or (imgproto in unsupported):
         notrun('not suitable for this protocol: %s' % imgproto)
=20
-def verify_platform(supported_oses=3D['linux']):
-    if True not in [sys.platform.startswith(x) for x in supported_oses]:
-        notrun('not suitable for this OS: %s' % sys.platform)
+def verify_platform(supported=3DNone, unsupported=3DNone):
+    if unsupported is not None:
+        if any((sys.platform.startswith(x) for x in unsupported)):
+            notrun('not suitable for this OS: %s' % sys.platform)
+
+    if supported is not None:
+        if not any((sys.platform.startswith(x) for x in supported)):
+            notrun('not suitable for this OS: %s' % sys.platform)
=20
 def verify_cache_mode(supported_cache_modes=3D[]):
     if supported_cache_modes and (cachemode not in supported_cache_modes):
@@ -935,7 +940,8 @@ def execute_unittest(output, verbosity, debug):
                                     r'Ran \1 tests', output.getvalue()))
=20
 def execute_test(test_function=3DNone,
-                 supported_fmts=3D[], supported_oses=3D['linux'],
+                 supported_fmts=3D[],
+                 supported_platforms=3DNone,
                  supported_cache_modes=3D[], unsupported_fmts=3D[],
                  supported_protocols=3D[], unsupported_protocols=3D[]):
     """Run either unittest or script-style tests."""
@@ -952,7 +958,7 @@ def execute_test(test_function=3DNone,
     verbosity =3D 1
     verify_image_format(supported_fmts, unsupported_fmts)
     verify_protocol(supported_protocols, unsupported_protocols)
-    verify_platform(supported_oses)
+    verify_platform(supported=3Dsupported_platforms)
     verify_cache_mode(supported_cache_modes)
=20
     if debug:
--=20
2.18.1


