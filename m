Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE5E6FEA6D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 05:58:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwxOX-0007jK-Jn; Wed, 10 May 2023 23:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOT-0007hG-3t
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pwxOR-0005Pa-FR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 23:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683777301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NI8cKrVi+KSLXbpSJ7gi9QJWj880h9IZXwLDWdrDas8=;
 b=VbV67YVwjKvj7UzfM970V1FOHwsymsddEapkb65ufMCzyC44zqoPscxy6u8hCc7bv2zZh8
 6xZI9847iFXZfrebD9yKCmaLJAIMxXTfGt+U+gUWZ9BbNCC1twikvil81FNlnh8wexBHYa
 bEW1kpsG8N6vc8tp4Lvmi0cDgSJTY1c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-Vx2fxC4QO5-z1dS8a2Cl2w-1; Wed, 10 May 2023 23:54:58 -0400
X-MC-Unique: Vx2fxC4QO5-z1dS8a2Cl2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5A05805F61;
 Thu, 11 May 2023 03:54:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2854340C207A;
 Thu, 11 May 2023 03:54:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 26/27] python: bump some of the dependencies
Date: Wed, 10 May 2023 23:54:34 -0400
Message-Id: <20230511035435.734312-27-jsnow@redhat.com>
In-Reply-To: <20230511035435.734312-1-jsnow@redhat.com>
References: <20230511035435.734312-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Paolo Bonzini <pbonzini@redhat.com>

The version of pyflakes that is listed in python/tests/minreqs.txt
breaks on Python 3.8 with the following message:

  AttributeError: 'FlakesChecker' object has no attribute 'CONSTANT'

Now that we do not support EOL'd Python versions anymore, we can
update to newer, fixed versions.  It is a good time to do so, before
Python packages start dropping support for Python 3.7 as well!

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg         |  4 ++--
 python/tests/minreqs.txt | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index 355e4410b7..7d75c168a8 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -35,11 +35,11 @@ packages =
 # Remember to update tests/minreqs.txt if changing anything below:
 devel =
     avocado-framework >= 90.0
-    flake8 >= 3.6.0
+    flake8 >= 5.0.4
     fusepy >= 2.0.4
     isort >= 5.1.2
     mypy >= 0.780
-    pylint >= 2.8.0
+    pylint >= 2.17.3
     tox >= 3.18.0
     urwid >= 2.1.2
     urwid-readline >= 0.13
diff --git a/python/tests/minreqs.txt b/python/tests/minreqs.txt
index 55cc6b41d8..efb9ceb937 100644
--- a/python/tests/minreqs.txt
+++ b/python/tests/minreqs.txt
@@ -23,23 +23,23 @@ fusepy==2.0.4
 avocado-framework==90.0
 
 # Linters
-flake8==3.6.0
+flake8==5.0.4
 isort==5.1.2
 mypy==0.780
-pylint==2.8.0
+pylint==2.17.3
 
 # Transitive flake8 dependencies
-mccabe==0.6.0
-pycodestyle==2.4.0
-pyflakes==2.0.0
+mccabe==0.7.0
+pycodestyle==2.9.1
+pyflakes==2.5.0
 
 # Transitive mypy dependencies
 mypy-extensions==0.4.3
 typed-ast==1.4.0
-typing-extensions==3.7.4
+typing-extensions==4.5.0
 
 # Transitive pylint dependencies
-astroid==2.5.4
+astroid==2.15.4
 lazy-object-proxy==1.4.0
 toml==0.10.0
 wrapt==1.12.1
-- 
2.40.0


