Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20BF31F03A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:44:45 +0100 (CET)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpEC-0000Dj-W9
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:44:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoy6-0002mW-VC
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoy4-0003Xs-Rk
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGpJKIil6qklX1QjgOEk8p+MTdlipOKu9XOZg4oMLR8=;
 b=Nkfn6tnrOzLE2h6/4EgxkwjqTTsF8R1mZD7cR6K6xQfZhHOxbHP6USuKBWC+pprLWvn/uS
 0LIymPMYlQKZKJM75PwNm5tw9mhv9ZV9eqb8L/ZSOmu/nol1bdIBk7haPjFngXhT35lrLK
 EJQZWybRbbSgrQWuHKASNaCE73ed3xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-UKarktHiOri9cWtsH0GHSA-1; Thu, 18 Feb 2021 14:28:02 -0500
X-MC-Unique: UKarktHiOri9cWtsH0GHSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB861020C21;
 Thu, 18 Feb 2021 19:28:01 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26D1360BE5;
 Thu, 18 Feb 2021 19:28:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/25] python: move pylintrc into setup.cfg
Date: Thu, 18 Feb 2021 14:27:18 -0500
Message-Id: <20210218192733.370968-11-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Delete the empty settings now that it's sharing a home with settings for
other tools.

pylint can now be run from this folder as "pylint qemu".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine/pylintrc | 58 ------------------------------------
 python/setup.cfg             | 29 ++++++++++++++++++
 2 files changed, 29 insertions(+), 58 deletions(-)
 delete mode 100644 python/qemu/machine/pylintrc

diff --git a/python/qemu/machine/pylintrc b/python/qemu/machine/pylintrc
deleted file mode 100644
index 3f69205000d..00000000000
--- a/python/qemu/machine/pylintrc
+++ /dev/null
@@ -1,58 +0,0 @@
-[MASTER]
-
-[MESSAGES CONTROL]
-
-# Disable the message, report, category or checker with the given id(s). You
-# can either give multiple identifiers separated by comma (,) or put this
-# option multiple times (only on the command line, not in the configuration
-# file where it should appear only once). You can also use "--disable=all" to
-# disable everything first and then reenable specific checks. For example, if
-# you want to run only the similarities checker, you can use "--disable=all
-# --enable=similarities". If you want to run only the classes checker, but have
-# no Warning level messages displayed, use "--disable=all --enable=classes
-# --disable=W".
-disable=too-many-arguments,
-        too-many-instance-attributes,
-        too-many-public-methods,
-
-[REPORTS]
-
-[REFACTORING]
-
-[MISCELLANEOUS]
-
-[LOGGING]
-
-[BASIC]
-
-# Good variable names which should always be accepted, separated by a comma.
-good-names=i,
-           j,
-           k,
-           ex,
-           Run,
-           _,
-           fd,
-           c,
-[VARIABLES]
-
-[STRING]
-
-[SPELLING]
-
-[FORMAT]
-
-[SIMILARITIES]
-
-# Ignore imports when computing similarities.
-ignore-imports=yes
-
-[TYPECHECK]
-
-[CLASSES]
-
-[IMPORTS]
-
-[DESIGN]
-
-[EXCEPTIONS]
diff --git a/python/setup.cfg b/python/setup.cfg
index e7f8ab23815..20b24372a4a 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -18,3 +18,32 @@ classifiers =
 [options]
 python_requires = >= 3.6
 packages = find_namespace:
+
+[pylint.messages control]
+# Disable the message, report, category or checker with the given id(s). You
+# can either give multiple identifiers separated by comma (,) or put this
+# option multiple times (only on the command line, not in the configuration
+# file where it should appear only once). You can also use "--disable=all" to
+# disable everything first and then reenable specific checks. For example, if
+# you want to run only the similarities checker, you can use "--disable=all
+# --enable=similarities". If you want to run only the classes checker, but have
+# no Warning level messages displayed, use "--disable=all --enable=classes
+# --disable=W".
+disable=too-many-arguments,
+        too-many-instance-attributes,
+        too-many-public-methods,
+
+[pylint.basic]
+# Good variable names which should always be accepted, separated by a comma.
+good-names=i,
+           j,
+           k,
+           ex,
+           Run,
+           _,
+           fd,
+           c,
+
+[pylint.similarities]
+# Ignore imports when computing similarities.
+ignore-imports=yes
-- 
2.29.2


