Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6F26B24D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 00:45:08 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIJhD-0002zp-MX
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 18:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJdL-0006iH-Pr
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:41:08 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53078
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJdE-0002ck-6C
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:41:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600209659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lHVjiYIhCkWZfXxIpMKrKBC9TmoiCUk3ue91mlAbbaU=;
 b=GHwtqBngZGvFHF2Wc8bPE7xqnl+Tx0f6sRTYkDANUHXq747PsbU9Yaomg/+fJf1iYSSwJj
 +3Og9KeiSH2vWvXvtUcjW4SD8seoLhTCiwxao/6vVY5dVq+SE5Pm2GxcdfmfW7XFSLnXTs
 7UUFZlF3fUQw1wdP+hnl4AFfH0E7Mc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-7gylv0gjNwa4Qj59-JM-8g-1; Tue, 15 Sep 2020 18:40:55 -0400
X-MC-Unique: 7gylv0gjNwa4Qj59-JM-8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDADF89153D;
 Tue, 15 Sep 2020 22:40:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C15FF81C43;
 Tue, 15 Sep 2020 22:40:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 07/37] qapi: add pylintrc
Date: Tue, 15 Sep 2020 18:39:57 -0400
Message-Id: <20200915224027.2529813-8-jsnow@redhat.com>
In-Reply-To: <20200915224027.2529813-1-jsnow@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 18:40:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a skeleton pylintrc file. Right now, it ignores quite a few things.
Files will be removed from the known-bad list throughout this and
following series as they are repaired.

Note: Normally, pylintrc would go in the folder above the module, but as
that folder is shared by many things, it is going inside the module
folder now.

Due to some bugs in different versions of pylint (2.5.x), pylint does
not correctly recognize when it is being run from "inside" a module, and
must be run *outside* of the module.

Therefore, to run it, you must:

 > cd :/qemu/scripts
 > pylint qapi/ --rcfile=qapi/pylintrc

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc | 74 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 scripts/qapi/pylintrc

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
new file mode 100644
index 0000000000..c2bbb8e8e1
--- /dev/null
+++ b/scripts/qapi/pylintrc
@@ -0,0 +1,74 @@
+[MASTER]
+
+# Add files or directories matching the regex patterns to the blacklist. The
+# regex matches against base names, not paths.
+ignore-patterns=common.py,
+                doc.py,
+                error.py,
+                expr.py,
+                gen.py,
+                parser.py,
+                schema.py,
+                source.py,
+                types.py,
+                visit.py,
+
+
+[MESSAGES CONTROL]
+
+# Disable the message, report, category or checker with the given id(s). You
+# can either give multiple identifiers separated by comma (,) or put this
+# option multiple times (only on the command line, not in the configuration
+# file where it should appear only once). You can also use "--disable=all" to
+# disable everything first and then reenable specific checks. For example, if
+# you want to run only the similarities checker, you can use "--disable=all
+# --enable=similarities". If you want to run only the classes checker, but have
+# no Warning level messages displayed, use "--disable=all --enable=classes
+# --disable=W".
+disable=fixme,
+        missing-docstring,
+        too-many-arguments,
+        too-many-branches,
+        too-many-statements,
+        too-many-instance-attributes,
+
+[REPORTS]
+
+[REFACTORING]
+
+[MISCELLANEOUS]
+
+[LOGGING]
+
+[BASIC]
+
+# Good variable names which should always be accepted, separated by a comma.
+good-names=i,
+           j,
+           k,
+           ex,
+           Run,
+           _
+
+[VARIABLES]
+
+[STRING]
+
+[SPELLING]
+
+[FORMAT]
+
+[SIMILARITIES]
+
+# Ignore imports when computing similarities.
+ignore-imports=yes
+
+[TYPECHECK]
+
+[CLASSES]
+
+[IMPORTS]
+
+[DESIGN]
+
+[EXCEPTIONS]
-- 
2.26.2


