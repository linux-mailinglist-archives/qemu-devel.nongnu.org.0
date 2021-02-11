Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3813192E3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:16:26 +0100 (CET)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHRw-0007Kg-Nf
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCS-0004Wu-Tf
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCB-0005de-AB
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EjJz7UAumK2/tFUcGTP2NPNi/Sa7gDSCL6ShEgSmEhw=;
 b=IklhRV975yYetKOejMC9IfP5jkBrzcFUSkwjmin/dCmGM9T1Lzg3u4erA9aowe1IpXfxlC
 or3H2Irm5Uk0mL/ktoxgFHNq4gqXutYsNxcSrsQEulLKGLHX655xhiRRGvJSeA4Y+l8raw
 GX4xifkMK3pKv/AYLnICryr4pgI1Uak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-zY4eUN8KPmaRHldS5hMd4g-1; Thu, 11 Feb 2021 14:00:04 -0500
X-MC-Unique: zY4eUN8KPmaRHldS5hMd4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD464102CB37;
 Thu, 11 Feb 2021 18:59:43 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37F003828;
 Thu, 11 Feb 2021 18:59:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/24] python: move pylintrc into setup.cfg
Date: Thu, 11 Feb 2021 13:58:42 -0500
Message-Id: <20210211185856.3975616-11-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Delete the empty settings now that it's sharing a home with settings for
other tools.

pylint can now be run from this folder as "pylint qemu".

Signed-off-by: John Snow <jsnow@redhat.com>
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


