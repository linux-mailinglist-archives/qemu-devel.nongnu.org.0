Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8073E4ACB60
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 22:34:41 +0100 (CET)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHBei-0006Os-5J
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 16:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHBb4-0004d7-DW
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:30:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHBax-0003zL-EF
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 16:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644269446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xZvziPKQ2OQ/4vGcsr2giCw7bLkC+B7bh4vPdpRobtM=;
 b=S5KCCNmgWpTnMm4pwLlThMAuFCCEJmP5JyuAh9ZmJCJhiKrDe1ydZbjMZg5Wzw91eFleXK
 TNccmTVc4ny4M/HY7MF2KtdCYWQk3IlkVhr8k2s13RElBNZeqqvbttm/8qkw5ohZR9vVgt
 nfX+Qlur3mRtWNeWmhqrK7umfqIJDZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-x1oLQHmgMHibOH--5edtqA-1; Mon, 07 Feb 2022 16:30:42 -0500
X-MC-Unique: x1oLQHmgMHibOH--5edtqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3B7383DD20;
 Mon,  7 Feb 2022 21:30:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 083F8E2E5;
 Mon,  7 Feb 2022 21:30:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Python: discourage direct setup.py install
Date: Mon,  7 Feb 2022 16:30:39 -0500
Message-Id: <20220207213039.2278569-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When invoking setup.py directly, the default behavior for 'install' is
to run the bdist_egg installation hook, which is ... actually deprecated
by setuptools. It doesn't seem to work quite right anymore.

By contrast, 'pip install' will invoke the bdist_wheel hook
instead. This leads to differences in behavior for the two approaches. I
advocate using pip in the documentation in this directory, but the
'setup.py' which has been used for quite a long time in the Python world
may deceptively appear to work at first glance.

Add an error message that will save a bit of time and frustration
that points the user towards using the supported installation
invocation.

Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/python/setup.py b/python/setup.py
index 2014f81b75..c5bc45919a 100755
--- a/python/setup.py
+++ b/python/setup.py
@@ -5,9 +5,26 @@
 """
 
 import setuptools
+from setuptools.command import bdist_egg
+import sys
 import pkg_resources
 
 
+class bdist_egg_guard(bdist_egg.bdist_egg):
+    """
+    Protect against bdist_egg from being executed
+
+    This prevents calling 'setup.py install' directly, as the 'install'
+    CLI option will invoke the deprecated bdist_egg hook. "pip install"
+    calls the more modern bdist_wheel hook, which is what we want.
+    """
+    def run(self):
+        sys.exit(
+            'Installation directly via setup.py is not supported.\n'
+            'Please use `pip install .` instead.'
+        )
+
+
 def main():
     """
     QEMU tooling installer
@@ -16,7 +33,7 @@ def main():
     # https://medium.com/@daveshawley/safely-using-setup-cfg-for-metadata-1babbe54c108
     pkg_resources.require('setuptools>=39.2')
 
-    setuptools.setup()
+    setuptools.setup(cmdclass={'bdist_egg': bdist_egg_guard})
 
 
 if __name__ == '__main__':
-- 
2.34.1


