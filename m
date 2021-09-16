Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF79C40ED27
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:12:15 +0200 (CEST)
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzc7-0007UP-2d
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQzXf-00028n-Aj
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 18:07:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQzXc-0005PV-9e
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 18:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631830055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FuL1/nsEHXkbvMbmZE/I4C5ClLsb5RmmZWABaE1bwXQ=;
 b=Pz7hL3mj7ksn7FPLYv77kJNkIgXraQZNU//TyMwQBT84FPXljG7cDwPbBa3BuCekCsSOOM
 9gar0ET8gcJF2K4ZUEQtj+vlr2qpdSzRYs1llaylA76eP69LsoOt+NcSs3j7v1K6uIlOIB
 SPuNYbESg4jtJCBe7cMuCgYcDrDsdts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-7JDCMrlhNeO9ox7LAWF2mA-1; Thu, 16 Sep 2021 18:07:33 -0400
X-MC-Unique: 7JDCMrlhNeO9ox7LAWF2mA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C2FD362F8;
 Thu, 16 Sep 2021 22:07:32 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E58F5D9C6;
 Thu, 16 Sep 2021 22:07:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] python: Update for pylint 2.10
Date: Thu, 16 Sep 2021 18:07:15 -0400
Message-Id: <20210916220716.1353698-2-jsnow@redhat.com>
In-Reply-To: <20210916220716.1353698-1-jsnow@redhat.com>
References: <20210916220716.1353698-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few new annoyances. Of note is the new warning for an unspecified
encoding when opening a text file, which actually does indicate a
potentially real problem; see
https://www.python.org/dev/peps/pep-0597/#motivation

Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
terminal output. Note that Python states: "language code and encoding
may be None if their values cannot be determined" -- use a platform
default as a backup.

Notes: Passing encoding=None will generate a suppressed warning on
Python 3.10+ that 'None' should not be passed as the encoding
argument. This behavior may be deprecated in the future and the default
switched to be a ubiquitous UTF-8. Opting in to the locale default will
be done by passing the encoding 'locale', but that isn't available in
3.6 through 3.9. Presumably this warning will be unsuppressed some time
prior to the actual switch and we can re-investigate these issues at
that time if necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20210916182248.721529-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 7 ++++++-
 python/setup.cfg               | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a7081b1845..34131884a5 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -19,6 +19,7 @@
 
 import errno
 from itertools import chain
+import locale
 import logging
 import os
 import shutil
@@ -290,8 +291,12 @@ def get_pid(self) -> Optional[int]:
         return self._subp.pid
 
     def _load_io_log(self) -> None:
+        # Assume that the output encoding of QEMU's terminal output is
+        # defined by our locale. If indeterminate, allow open() to fall
+        # back to the platform default.
+        _, encoding = locale.getlocale()
         if self._qemu_log_path is not None:
-            with open(self._qemu_log_path, "r") as iolog:
+            with open(self._qemu_log_path, "r", encoding=encoding) as iolog:
                 self._iolog = iolog.read()
 
     @property
diff --git a/python/setup.cfg b/python/setup.cfg
index 83909c1c97..0f0cab098f 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -104,6 +104,7 @@ good-names=i,
 [pylint.similarities]
 # Ignore imports when computing similarities.
 ignore-imports=yes
+ignore-signatures=yes
 
 # Minimum lines number of a similarity.
 # TODO: Remove after we opt in to Pylint 2.8.3. See commit msg.
-- 
2.31.1


