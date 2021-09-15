Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADEC40CAE9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:45:28 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQY2J-0005AM-EL
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpM-0005YC-D3
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpK-0005bK-90
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpzFbhKZT1tsmO6esYUGCQRfRAJzdyu9F7idGBsfJzY=;
 b=I8q/gTWur+jgIFYyA3l8E8Esodcp8F7hY00o+V4JbiGrY/k0EbYswoJFM0vxlKKXTd1yiT
 AHofbSSsdNQFk4+ezsvMqmvuNaAvSBX+oOg1DQLssqVXIrG2/8078xbMbLQ3WtI5SKvgC9
 2XKvOBnNW9Oc9lo1fMc7Fq78/rxFgKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-1_0RmpZoOcWCneK3f6rwbQ-1; Wed, 15 Sep 2021 12:31:58 -0400
X-MC-Unique: 1_0RmpZoOcWCneK3f6rwbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A7929F92A;
 Wed, 15 Sep 2021 16:31:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD0057771A;
 Wed, 15 Sep 2021 16:31:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 27/27] python/aqmp: Add Coverage.py support
Date: Wed, 15 Sep 2021 12:29:55 -0400
Message-Id: <20210915162955.333025-28-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm not exposing this via the Makefile help, it's not likely to be
useful to passersby. Switch the avocado runner to the 'legacy' runner
for now, as the new runner seems to obscure coverage reports, again.

Usage is to enter your venv of choice and then:
`make check-coverage && xdg-open htmlcov/index.html`.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/.gitignore  |  5 +++++
 python/Makefile    |  9 +++++++++
 python/avocado.cfg |  3 +++
 python/setup.cfg   | 10 ++++++++++
 4 files changed, 27 insertions(+)

diff --git a/python/.gitignore b/python/.gitignore
index c8b0e67fe6..904f324bb1 100644
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
index fe27a3e12e..3334311362 100644
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
index 10dc6fb605..c7722e7ecd 100644
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
index c22d9961df..37c71d395b 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -139,3 +139,13 @@ deps =
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


