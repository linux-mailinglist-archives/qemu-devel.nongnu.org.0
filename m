Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A114289FF4
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 12:13:31 +0200 (CEST)
Received: from localhost ([::1]:41362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRBsY-0006ho-Du
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 06:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRBbF-0008Ah-R7
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 05:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kRBav-0002kR-IS
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 05:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602323715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z422DjruzhSBV8FzouqoP+9b4hrlMFjtvsmigpNd8DA=;
 b=e9GyS7A4lMPDi0jTRgiujDZGjlX83foaAQpbNVi+GmxoaUp7P1EtRxRxvYXlK8KGTbi9ti
 QjZz/WkC7eACfc0ZwV2tGPlZGZzet/y6BJuZm2ACnjBwWXf5f76ZrfV7oLeMfTRRWfQnpH
 Jk26Pkbr0UQi/EV8z3oj5ZFX9QNymJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-_AP0vboWPNKdzZUgmYM4OA-1; Sat, 10 Oct 2020 05:55:09 -0400
X-MC-Unique: _AP0vboWPNKdzZUgmYM4OA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DC481868412;
 Sat, 10 Oct 2020 09:55:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DBE855786;
 Sat, 10 Oct 2020 09:55:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B5C3F112CE1D; Sat, 10 Oct 2020 11:55:04 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/34] qapi: add pylintrc
Date: Sat, 10 Oct 2020 11:54:39 +0200
Message-Id: <20201010095504.796182-10-armbru@redhat.com>
In-Reply-To: <20201010095504.796182-1-armbru@redhat.com>
References: <20201010095504.796182-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 02:57:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Using `pylint --generate-rcfile > pylintrc`, generate a skeleton
pylintrc file. Sections that are not presently relevant (by the end of
this series) are removed leaving just the empty section as a search
engine / documentation hint to future authors.

I am targeting pylint 2.6.0. In the future (and hopefully before 5.2 is
released), I aim to have gitlab CI running the specific targeted
versions of pylint, mypy, flake8, etc in a job.

2.5.x will work if you additionally pass --disable=bad-whitespace.
This warning was removed from 2.6.x, for lack of consistent support.

Right now, quite a few modules are ignored as they are known to fail as
of this commit. modules will be removed from the known-bad list
throughout this and following series as they are repaired.

Note: Normally, pylintrc would go in the folder above the module, but as
that folder is shared by many things, it is going inside the module
folder (for now). Due to a bug in pylint 2.5+, pylint does not
correctly recognize when it is being run from "inside" a package, and
must be run *outside* of the package.

Therefore, to run it, you must:

 > pylint scripts/qapi/ --rcfile=scripts/qapi/pylintrc

Signed-off-by: John Snow <jsnow@redhat.com>
Tested-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20201009161558.107041-10-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/pylintrc | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 scripts/qapi/pylintrc

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
new file mode 100644
index 0000000000..76d54c30f8
--- /dev/null
+++ b/scripts/qapi/pylintrc
@@ -0,0 +1,73 @@
+[MASTER]
+
+# Add files or directories matching the regex patterns to the ignore list.
+# The regex matches against base names, not paths.
+ignore-patterns=common.py,
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
+# Ignore import statements themselves when computing similarities.
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


