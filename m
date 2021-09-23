Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337C4415492
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 02:19:17 +0200 (CEST)
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTCSJ-0004td-UL
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 20:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPn-0001dw-2F
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCPk-0000v6-Ot
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632356194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sNYoL41WoJVIOd7s72GSXkG7SUCqEjVatxXCDP+ruck=;
 b=cxBsQX9pC8vfSqfXMgxW+FyNEVGUgJ0bJi/7hVVutI7OUdEWA234h2qqMwibe5G6WgLybn
 l0SJLW84PYgZqXVgyw7WR4qVfU8B5Zo272pfK+JIoxAHWlFJffj1CFCa2SxoX5Vm1IWd1A
 Ze4vc+iQz5RpIlrNQJyMfUfHkKdX7pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-oyQETdoZN_q84-BEnPTEgw-1; Wed, 22 Sep 2021 20:16:31 -0400
X-MC-Unique: oyQETdoZN_q84-BEnPTEgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08ED61084683;
 Thu, 23 Sep 2021 00:16:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90B4610023AB;
 Thu, 23 Sep 2021 00:16:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] iotests: add warning for rogue 'qemu' packages
Date: Wed, 22 Sep 2021 20:16:21 -0400
Message-Id: <20210923001625.3996451-3-jsnow@redhat.com>
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

Add a warning for when 'iotests' runs against a qemu namespace that
isn't the one in the source tree. This might occur if you have
(accidentally) installed the Python namespace package to your local
packages.

(I'm not going to say that this is because I bit myself with this,
but. You can fill in the blanks.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/testenv.py | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 88104dace90..8a43b193af5 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -16,6 +16,8 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+import importlib.util
+import logging
 import os
 import sys
 import tempfile
@@ -25,7 +27,7 @@
 import random
 import subprocess
 import glob
-from typing import List, Dict, Any, Optional, ContextManager
+from typing import List, Dict, Any, Optional, ContextManager, cast
 
 DEF_GDB_OPTIONS = 'localhost:12345'
 
@@ -112,6 +114,22 @@ def init_directories(self) -> None:
         # Path where qemu goodies live in this source tree.
         qemu_srctree_path = Path(__file__, '../../../python').resolve()
 
+        # warn if we happen to be able to find 'qemu' packages from an
+        # unexpected location (i.e. the package is already installed in
+        # the user's environment)
+        qemu_spec = importlib.util.find_spec('qemu.qmp')
+        if qemu_spec:
+            spec_path = Path(cast(str, qemu_spec.origin))
+            try:
+                _ = spec_path.relative_to(qemu_srctree_path)
+            except ValueError:
+                self._logger.warning(
+                    "WARNING: 'qemu' package will be imported from outside "
+                    "the source tree!")
+                self._logger.warning(
+                    "Importing from: '%s'",
+                    spec_path.parents[1])
+
         self.pythonpath = os.getenv('PYTHONPATH')
         self.pythonpath = os.pathsep.join(filter(None, (
             self.source_iotests,
@@ -231,6 +249,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
 
         self.build_root = os.path.join(self.build_iotests, '..', '..')
 
+        self._logger = logging.getLogger('qemu.iotests')
         self.init_directories()
         self.init_binaries()
 
-- 
2.31.1


