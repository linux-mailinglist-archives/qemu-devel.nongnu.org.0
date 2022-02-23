Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C314C1E45
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:12:50 +0100 (CET)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzsO-0005Jl-UO
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:12:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMzpB-0001Cd-4F
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMzp6-0005t7-U8
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645654164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9fhjKS2UF+cyeo0+YKfjJ73HBzQJshvaodgG4K0w0Fg=;
 b=eM/4pvZeo9TVOZb7NaMHDZN6E+yc8bFkfgHW/bks/l0/aXLhnmUenrM20yrsNEQD+roZRw
 OBIg18/5S+yQBDtZ92NpqMbLblEkOVN5Nspv/tQVtGHMv2UzsgeEGKmoZDPD5D9ec9R7da
 fKWT+yleKXMRJiukwQ8FLuR2JFqPr9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-e_tp3NoiOAqr1A5uMOba_g-1; Wed, 23 Feb 2022 17:09:19 -0500
X-MC-Unique: e_tp3NoiOAqr1A5uMOba_g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2164B1854E26;
 Wed, 23 Feb 2022 22:09:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CC70709E5;
 Wed, 23 Feb 2022 22:09:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/6] Python: add setuptools v60.0 workaround
Date: Wed, 23 Feb 2022 17:08:58 -0500
Message-Id: <20220223220900.2226630-5-jsnow@redhat.com>
In-Reply-To: <20220223220900.2226630-1-jsnow@redhat.com>
References: <20220223220900.2226630-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setuptools v60 and later include a bundled version of distutils, a
deprecated standard library scheduled for removal in future versions of
Python. Setuptools v60 is only possible to install for Python 3.7 and later.

Python has a distutils.sysconfig.get_python_lib() function that returns
'/usr/lib/pythonX.Y' on posix systems. RPM-based systems actually use
'/usr/lib64/pythonX.Y' instead, so Fedora patches stdlib distutils for
Python 3.7 and Python 3.8 to return the correct value.

Python 3.9 and later introduce a sys.platlibdir property, which returns
the correct value on RPM-based systems.

The change to a distutils package not provided by Fedora on Python 3.7
and 3.8 causes a regression in distutils.sysconfig.get_python_lib() that
ultimately causes false positives to be emitted by pylint, because it
can no longer find the system source libraries.

Many Python tools are fairly aggressive about updating setuptools
packages, and so even though this package is a fair bit newer than
Python 3.7/3.8, it's not entirely unreasonable for a given user to have
such a modern package with a fairly old Python interpreter.

Updates to Python 3.7 and Python 3.8 are being produced for Fedora which
will fix the problem on up-to-date systems. Until then, we can force the
loading of platform-provided distutils when running the pylint
test. This is the least-invasive yet most comprehensive fix.

References:
 https://github.com/pypa/setuptools/pull/2896
 https://github.com/PyCQA/pylint/issues/5704
 https://github.com/pypa/distutils/issues/110

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20220204221804.2047468-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/tests/iotests-pylint.sh | 3 ++-
 python/tests/pylint.sh         | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/python/tests/iotests-pylint.sh b/python/tests/iotests-pylint.sh
index 4cae03424b..33c5ae900a 100755
--- a/python/tests/iotests-pylint.sh
+++ b/python/tests/iotests-pylint.sh
@@ -1,4 +1,5 @@
 #!/bin/sh -e
 
 cd ../tests/qemu-iotests/
-python3 -m linters --pylint
+# See commit message for environment variable explainer.
+SETUPTOOLS_USE_DISTUTILS=stdlib python3 -m linters --pylint
diff --git a/python/tests/pylint.sh b/python/tests/pylint.sh
index 4b10b34db7..03d64705a1 100755
--- a/python/tests/pylint.sh
+++ b/python/tests/pylint.sh
@@ -1,2 +1,3 @@
 #!/bin/sh -e
-python3 -m pylint qemu/
+# See commit message for environment variable explainer.
+SETUPTOOLS_USE_DISTUTILS=stdlib python3 -m pylint qemu/
-- 
2.34.1


