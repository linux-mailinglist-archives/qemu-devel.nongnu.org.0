Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA89D415491
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:19:09 +0200 (CEST)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCSC-0004Vb-U3
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPn-0001dp-1p
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPh-0000tY-Hx
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632356192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09yd4UBzkttV1nDsSh++TA/2xfvjsfL1hvTmlU2J4Zs=;
 b=B6HHsDRtBbpHXVOJmeJbOVuTX1cPR1L54IysNDSwLpk8bodjtzPGJ8DLrZxosshHPnxK6U
 ixhQTuwmVWiqxFG0b3JKBH0vhCn4st9fNkbpEhoA3C6ppfJwUrF6CB5NW4cZGbKUGE/0LU
 BhLJ2RkN52x9FVhKb8HYEjpwODBC2Yc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-P7-h2pl8OTeOldpU1UjH3A-1; Wed, 22 Sep 2021 20:16:30 -0400
X-MC-Unique: P7-h2pl8OTeOldpU1UjH3A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 743E4835DE3;
 Thu, 23 Sep 2021 00:16:29 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F30B710023AB;
 Thu, 23 Sep 2021 00:16:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] iotests: add 'qemu' package location to PYTHONPATH in
 testenv
Date: Wed, 22 Sep 2021 20:16:20 -0400
Message-Id: <20210923001625.3996451-2-jsnow@redhat.com>
In-Reply-To: <20210923001625.3996451-1-jsnow@redhat.com>
References: <20210923001625.3996451-1-jsnow@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can drop the sys.path hacking in various places by doing
this. Additionally, by doing it in one place right up top, we can print
interesting warnings in case the environment does not look correct.

If we ever decide to change how the environment is crafted, all of the
"help me find my python packages" goop is all in one place, right in one
function.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/235                    |  2 --
 tests/qemu-iotests/297                    |  6 ------
 tests/qemu-iotests/300                    |  7 +++----
 tests/qemu-iotests/iotests.py             |  2 --
 tests/qemu-iotests/testenv.py             | 14 +++++++++-----
 tests/qemu-iotests/tests/mirror-top-perms |  7 +++----
 6 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/tests/qemu-iotests/235 b/tests/qemu-iotests/235
index 8aed45f9a76..4de920c3801 100755
--- a/tests/qemu-iotests/235
+++ b/tests/qemu-iotests/235
@@ -24,8 +24,6 @@ import os
 import iotests
 from iotests import qemu_img_create, qemu_io, file_path, log
 
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
-
 from qemu.machine import QEMUMachine
 
 iotests.script_initialize(supported_fmts=['qcow2'])
diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index b04cba53667..467b712280e 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -68,12 +68,6 @@ def run_linters():
     # Todo notes are fine, but fixme's or xxx's should probably just be
     # fixed (in tests, at least)
     env = os.environ.copy()
-    qemu_module_path = os.path.join(os.path.dirname(__file__),
-                                    '..', '..', 'python')
-    try:
-        env['PYTHONPATH'] += os.pathsep + qemu_module_path
-    except KeyError:
-        env['PYTHONPATH'] = qemu_module_path
     subprocess.run(('pylint-3', '--score=n', '--notes=FIXME,XXX', *files),
                    env=env, check=False)
 
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index fe94de84edd..10f9f2a8da6 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -24,12 +24,11 @@ import random
 import re
 from typing import Dict, List, Optional
 
-import iotests
-
-# Import qemu after iotests.py has amended sys.path
-# pylint: disable=wrong-import-order
 from qemu.machine import machine
 
+import iotests
+
+
 BlockBitmapMapping = List[Dict[str, object]]
 
 mig_sock = os.path.join(iotests.sock_dir, 'mig_sock')
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index ce06cf56304..b06ad76e0c5 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -36,8 +36,6 @@
 
 from contextlib import contextmanager
 
-# pylint: disable=import-error, wrong-import-position
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu.machine import qtest
 from qemu.qmp import QMPMessage
 
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 70da0d60c80..88104dace90 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -108,12 +108,16 @@ def init_directories(self) -> None:
              SAMPLE_IMG_DIR
              OUTPUT_DIR
         """
+
+        # Path where qemu goodies live in this source tree.
+        qemu_srctree_path = Path(__file__, '../../../python').resolve()
+
         self.pythonpath = os.getenv('PYTHONPATH')
-        if self.pythonpath:
-            self.pythonpath = self.source_iotests + os.pathsep + \
-                self.pythonpath
-        else:
-            self.pythonpath = self.source_iotests
+        self.pythonpath = os.pathsep.join(filter(None, (
+            self.source_iotests,
+            str(qemu_srctree_path),
+            self.pythonpath,
+        )))
 
         self.test_dir = os.getenv('TEST_DIR',
                                   os.path.join(os.getcwd(), 'scratch'))
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 2fc8dd66e0a..73138a0ef91 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -20,13 +20,12 @@
 #
 
 import os
+
+import qemu
+
 import iotests
 from iotests import qemu_img
 
-# Import qemu after iotests.py has amended sys.path
-# pylint: disable=wrong-import-order
-import qemu
-
 
 image_size = 1 * 1024 * 1024
 source = os.path.join(iotests.test_dir, 'source.img')
-- 
2.31.1


