Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8148D288ED9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:27:49 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvFE-0001E8-GN
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv45-0003tP-9x
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv41-0003F1-FV
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1iHAWFK5hEPkFza6aTuhnCLY5QE27kffQhXifiMaVy0=;
 b=i3QV4f+RRiFhX4T30Ri8QixUaaifEj2R/+hf/4+1Frez97isx1el01u8fBLwS1AOOtfIrA
 oFn5zF8dBZsCDF/Kc7RwhvK+zrQSJFez8mddvv7aFFIHjWqrlgct8wGaO4kekjmlOXIY0L
 qeJYCOUQ3kKOTArxB2P8MCI3kN2WBFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-NDtc3uVBPQWDWI4z9vhHNw-1; Fri, 09 Oct 2020 12:16:10 -0400
X-MC-Unique: NDtc3uVBPQWDWI4z9vhHNw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A18C61084D6A;
 Fri,  9 Oct 2020 16:16:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E25AF19936;
 Fri,  9 Oct 2020 16:16:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/36] qapi: enforce import order/styling with isort
Date: Fri,  9 Oct 2020 12:15:29 -0400
Message-Id: <20201009161558.107041-8-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While we're mucking around with imports, we might as well formalize the
style we use. Let's use isort to do it for us.

lines_after_imports=2: Use two lines after imports, to match PEP8's
desire to have "two lines before and after" class definitions, which are
likely to start immediately after imports.

force_sort_within_sections: Intermingles "from x" and "import x" style
statements, such that sorting is always performed strictly on the module
name itself.

force_grid_wrap=4: Four or more imports from a single module will force
the one-per-line style that's more git-friendly. This will generally
happen for 'typing' imports.

multi_line_output=3: Uses the one-per-line indented style for long
imports.

include_trailing_comma: Adds a comma to the last import in a group,
which makes git conflicts nicer to deal with, generally.

line_length: 72 is chosen to match PEP8's "docstrings and comments" line
length limit. If you have a single line import that exceeds 72
characters, your names are too long!

Suggested-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/.isort.cfg    | 7 +++++++
 scripts/qapi/expr.py       | 3 ++-
 scripts/qapi/introspect.py | 7 +++++--
 scripts/qapi/parser.py     | 2 +-
 scripts/qapi/schema.py     | 2 +-
 5 files changed, 16 insertions(+), 5 deletions(-)
 create mode 100644 scripts/qapi/.isort.cfg

diff --git a/scripts/qapi/.isort.cfg b/scripts/qapi/.isort.cfg
new file mode 100644
index 00000000000..643caa1fbd6
--- /dev/null
+++ b/scripts/qapi/.isort.cfg
@@ -0,0 +1,7 @@
+[settings]
+force_grid_wrap=4
+force_sort_within_sections=True
+include_trailing_comma=True
+line_length=72
+lines_after_imports=2
+multi_line_output=3
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index bb4dc55f56f..2fcaaa2497a 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -14,8 +14,9 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
-import re
 from collections import OrderedDict
+import re
+
 from .common import c_name
 from .error import QAPISemError
 
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 42016a7e668..fafec94e022 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -17,8 +17,11 @@
     mcgen,
 )
 from .gen import QAPISchemaMonolithicCVisitor
-from .schema import (QAPISchemaArrayType, QAPISchemaBuiltinType,
-                     QAPISchemaType)
+from .schema import (
+    QAPISchemaArrayType,
+    QAPISchemaBuiltinType,
+    QAPISchemaType,
+)
 
 
 def _make_tree(obj, ifcond, features, extra=None):
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 7298f5dbd14..e7b9d670ad6 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -14,9 +14,9 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+from collections import OrderedDict
 import os
 import re
-from collections import OrderedDict
 
 from .error import QAPIParseError, QAPISemError
 from .source import QAPISourceInfo
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 676185d1a71..71ebb1e396d 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -14,9 +14,9 @@
 
 # TODO catching name collisions in generated code would be nice
 
+from collections import OrderedDict
 import os
 import re
-from collections import OrderedDict
 
 from .common import c_name, pointer_suffix
 from .error import QAPIError, QAPISemError
-- 
2.26.2


