Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990FC498F5A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 20:54:02 +0100 (CET)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5Pd-0006nL-EQ
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 14:54:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4WW-0001Ys-8P
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:57:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nC4WT-000704-Cv
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 13:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643050620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kUrOj9xZzIljSPbzU9kbPZiGwn9tVJQi2XWwxnb3tvA=;
 b=fmmT6RtXFRZ1DLT+fny7eT/LAsX0rnUghxfjmv5p0E/loe844fBZiP5bS5Yv/6SfBf7TPl
 eUzcI7rVav4ZdDJ7BDZchxzd4qvBTfHysln834B5nBrhAV7djecE4rsJe6TX2KXT/8sAPf
 5Z8e9B9/MSENKRvPCliieXOuNVuIwtw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-1RfDdw-zOI6HSIdDQD3ryQ-1; Mon, 24 Jan 2022 13:56:57 -0500
X-MC-Unique: 1RfDdw-zOI6HSIdDQD3ryQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED25E760C4;
 Mon, 24 Jan 2022 18:56:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B51034D42;
 Mon, 24 Jan 2022 18:56:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Python: setuptools v60.0 workaround
Date: Mon, 24 Jan 2022 13:56:42 -0500
Message-Id: <20220124185643.641848-2-jsnow@redhat.com>
In-Reply-To: <20220124185643.641848-1-jsnow@redhat.com>
References: <20220124185643.641848-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
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

We can force the loading of the platform-provided distutils when running
the pylint test; this is the least-invasive yet most comprehensive fix
until the dust settles upstream and the picture becomes more clear.

References: https://github.com/pypa/setuptools/pull/2896
 https://github.com/PyCQA/pylint/issues/5704
 https://github.com/pypa/distutils/issues/110

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
2.31.1


