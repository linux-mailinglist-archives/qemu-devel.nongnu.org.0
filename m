Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF110288F06
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:37:01 +0200 (CEST)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvO8-0006OW-Sr
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv48-0003zJ-2Q
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv46-0003GU-3D
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0HkGlH/S1G8I1HloqL7saGuuP/XHnYpyYBQxvhdOfUY=;
 b=ehn9eeq4eY6DO7WAHW8UEPtig/xvODb7xc39R7nNq/fBYPnPCSotmT7ZHG3wdD5i9OJU54
 HYBRrt9DqHtVSIcHX/acZtggbsqNzKil7HqNesEWy+eXL8TMiYk5ElE1CuR+zsGzwRVLhr
 XIayo7Ev4fIGgIu6cwo0ejY8zZKvrkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-xasv_TYlMtiL8QsojjIHyQ-1; Fri, 09 Oct 2020 12:16:12 -0400
X-MC-Unique: xasv_TYlMtiL8QsojjIHyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74FB518A8236;
 Fri,  9 Oct 2020 16:16:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B40211A8EC;
 Fri,  9 Oct 2020 16:16:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/36] qapi: add pylintrc
Date: Fri,  9 Oct 2020 12:15:31 -0400
Message-Id: <20201009161558.107041-10-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 scripts/qapi/pylintrc | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 scripts/qapi/pylintrc

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
new file mode 100644
index 00000000000..76d54c30f85
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


