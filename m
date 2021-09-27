Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA3B419F7F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:51:58 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwfL-0007t1-Py
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJP-0007BW-Px
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJN-0000Dd-Sb
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifIsu/ICCbj/chY4OpnCe5zr18vtEXwudS721wHZnXk=;
 b=UQmUSWl6wEqHwPsDCXmtv4fcwhdIEhyseU2qJMxArxgu0KOqoJP72Ta2jsxqnGOBZGrH5F
 ZjJSb+MkJub10jKky+Q0gSgXaAy+xALbH0aTP/RLtVcQmC3q/b4uy+flTxOAlCk1zP89Hs
 bzO5vsBBfk72WYahA4qKMJq6Wgpt5+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-cff4gzXfNUOnl7Q2T9Fz_Q-1; Mon, 27 Sep 2021 15:29:11 -0400
X-MC-Unique: cff4gzXfNUOnl7Q2T9Fz_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2B881084681;
 Mon, 27 Sep 2021 19:29:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CAA160871;
 Mon, 27 Sep 2021 19:29:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/32] python/aqmp: Add Coverage.py support
Date: Mon, 27 Sep 2021 15:25:08 -0400
Message-Id: <20210927192513.744199-28-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

I'm not exposing this via the Makefile help, it's not likely to be
useful to passersby. Switch the avocado runner to the 'legacy' runner
for now, as the new runner seems to obscure coverage reports, again.

Usage is to enter your venv of choice and then:
`make check-coverage && xdg-open htmlcov/index.html`.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210915162955.333025-28-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/.gitignore  |  5 +++++
 python/Makefile    |  9 +++++++++
 python/avocado.cfg |  3 +++
 python/setup.cfg   | 10 ++++++++++
 4 files changed, 27 insertions(+)

diff --git a/python/.gitignore b/python/.gitignore
index c8b0e67fe6c..904f324bb11 100644
--- a/python/.gitignore
+++ b/python/.gitignore
@@ -15,3 +15,8 @@ qemu.egg-info/
 .venv/
 .tox/
 .dev-venv/
+
+# Coverage.py reports
+.coverage
+.coverage.*
+htmlcov/
diff --git a/python/Makefile b/python/Makefile
index fe27a3e12ee..33343113625 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -92,6 +92,13 @@ check:
 check-tox:
 	@tox $(QEMU_TOX_EXTRA_ARGS)
 
+.PHONY: check-coverage
+check-coverage:
+	@coverage run -m avocado --config avocado.cfg run tests/*.py
+	@coverage combine
+	@coverage html
+	@coverage report
+
 .PHONY: clean
 clean:
 	python3 setup.py clean --all
@@ -100,3 +107,5 @@ clean:
 .PHONY: distclean
 distclean: clean
 	rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
+	rm -f .coverage .coverage.*
+	rm -rf htmlcov/
diff --git a/python/avocado.cfg b/python/avocado.cfg
index 10dc6fb6054..c7722e7ecd3 100644
--- a/python/avocado.cfg
+++ b/python/avocado.cfg
@@ -1,3 +1,6 @@
+[run]
+test_runner = runner
+
 [simpletests]
 # Don't show stdout/stderr in the test *summary*
 status.failure_fields = ['status']
diff --git a/python/setup.cfg b/python/setup.cfg
index 8481fa7c923..4fd0c68a5b7 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -140,3 +140,13 @@ deps =
     .[fuse]  # Workaround to trigger tox venv rebuild
 commands =
     make check
+
+# Coverage.py [https://coverage.readthedocs.io/en/latest/] is a tool for
+# measuring code coverage of Python programs. It monitors your program,
+# noting which parts of the code have been executed, then analyzes the
+# source to identify code that could have been executed but was not.
+
+[coverage:run]
+concurrency = multiprocessing
+source = qemu/
+parallel = true
-- 
2.31.1


