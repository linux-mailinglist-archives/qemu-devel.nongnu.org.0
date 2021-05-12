Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45A37EF7F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 01:20:14 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgy9F-0008Uq-9U
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 19:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2a-0001Vg-A7
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgy2Y-00064u-LP
 for qemu-devel@nongnu.org; Wed, 12 May 2021 19:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620861198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USnY7FTrbETbCxMV7iz4jh4bCI8a7wc0GV28Z1+mF/E=;
 b=gu+29V+sJPHVZmdaoT+CLfV0B3bAAuPu83bmck6b29zMh1JgHK9YSqY1DWweB/x32lQPBd
 nYcAhC8dFOsMgtlyVYya7pMg6g5LKsAEZrrLU/OpJdHgp1bfnqm0YVwbRqHnSdby+vUyIn
 UzXMppfypmcK3jX6rexPM7ljMkGYUV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-U1LniBFWMbebTqiYR5FU4Q-1; Wed, 12 May 2021 19:13:15 -0400
X-MC-Unique: U1LniBFWMbebTqiYR5FU4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA8E31005D47;
 Wed, 12 May 2021 23:13:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 367DF5D736;
 Wed, 12 May 2021 23:13:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/25] python: add MANIFEST.in
Date: Wed, 12 May 2021 19:12:23 -0400
Message-Id: <20210512231241.2816122-8-jsnow@redhat.com>
In-Reply-To: <20210512231241.2816122-1-jsnow@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When creating a source distribution via 'python3 setup.py sdist', the
VERSION and PACKAGE.rst files aren't bundled by default. Create a
MANIFEST.in file that instructs the build tools to include these so that
installation from source dists won't fail.

(This invocation is required by 'tox', as well as by the tooling needed
to upload packages to PyPI.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst  | 2 ++
 python/MANIFEST.in | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 python/MANIFEST.in

diff --git a/python/README.rst b/python/README.rst
index 7a0dc5dff4a..86364367261 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -33,6 +33,8 @@ Files in this directory
 -----------------------
 
 - ``qemu/`` Python package source directory.
+- ``MANIFEST.in`` is read by python setuptools, it specifies additional files
+  that should be included by a source distribution.
 - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
 - ``README.rst`` you are here!
 - ``VERSION`` contains the PEP-440 compliant version used to describe
diff --git a/python/MANIFEST.in b/python/MANIFEST.in
new file mode 100644
index 00000000000..2b1ee8b4e72
--- /dev/null
+++ b/python/MANIFEST.in
@@ -0,0 +1,2 @@
+include VERSION
+include PACKAGE.rst
\ No newline at end of file
-- 
2.30.2


