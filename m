Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF95416510
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:15:01 +0200 (CEST)
Received: from localhost ([::1]:51866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTTFM-0005yM-Ij
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT8J-0005Q4-Ky
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTT89-0003Un-ES
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:07:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632420450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZ4cC/7v/qxYlGzLlH72C5MQYwtyyCkS4n6qF7epGOk=;
 b=JtWxMxLEjVrlO7L6EDnZZS8SpUgsr+TCu3mJo0ZgwTNOKdN5AJIFgQMrM9UaRw/vpY3XNu
 JQi88Vc9jyk9gaGthloQbR9puKABsp3+tphQrXh1FGLeaxFtYkq8PqRwWiCAq6sGTCIEo+
 MTOb+E0NbDq6QybaDaZuVpnbxENf+mk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-ATqZj1YDOXettLNuJJTLrw-1; Thu, 23 Sep 2021 14:07:27 -0400
X-MC-Unique: ATqZj1YDOXettLNuJJTLrw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ACF61084683;
 Thu, 23 Sep 2021 18:07:26 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F14A060BE5;
 Thu, 23 Sep 2021 18:07:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] iotests: add 'qemu' package location to PYTHONPATH in
 testenv
Date: Thu, 23 Sep 2021 14:07:10 -0400
Message-Id: <20210923180715.4168522-2-jsnow@redhat.com>
In-Reply-To: <20210923180715.4168522-1-jsnow@redhat.com>
References: <20210923180715.4168522-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can drop the sys.path hacking in various places by doing
this. Additionally, by doing it in one place right up top, we can print
interesting warnings in case the environment does not look correct. (See
next commit.)

If we ever decide to change how the environment is crafted, all of the
"help me find my python packages" goop is all in one place, right in one
function.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/235                    |  2 --
 tests/qemu-iotests/297                    |  6 ------
 tests/qemu-iotests/300                    |  7 +++----
 tests/qemu-iotests/iotests.py             |  2 --
 tests/qemu-iotests/testenv.py             | 15 +++++++++------
 tests/qemu-iotests/tests/mirror-top-perms |  7 +++----
 6 files changed, 15 insertions(+), 24 deletions(-)

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
index 70da0d60c80..99a57a69f3a 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -108,12 +108,15 @@ def init_directories(self) -> None:
              SAMPLE_IMG_DIR
              OUTPUT_DIR
         """
-        self.pythonpath = os.getenv('PYTHONPATH')
-        if self.pythonpath:
-            self.pythonpath = self.source_iotests + os.pathsep + \
-                self.pythonpath
-        else:
-            self.pythonpath = self.source_iotests
+
+        # Path where qemu goodies live in this source tree.
+        qemu_srctree_path = Path(__file__, '../../../python').resolve()
+
+        self.pythonpath = os.pathsep.join(filter(None, (
+            self.source_iotests,
+            str(qemu_srctree_path),
+            os.getenv('PYTHONPATH'),
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


