Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA67283FE6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 21:54:38 +0200 (CEST)
Received: from localhost ([::1]:38396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPWZB-0001a6-36
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 15:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWq-0008C4-1z
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPWWo-000769-4Q
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 15:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601927529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDPkvnL6sigYI+e4muH4GtIcm/8SfFIYpV2OcuVX65o=;
 b=aJxCT6C0JSyU6uj1iKFkyROa4lvZb7ksy+ljFyMS542LRXnGQqkwYhDRl6cyIritenRdvX
 hjwi0K7t7LChu/AWDRoUuYMnOa1ryEXZ2IMvwNaElx6y+DR5tyr5jZ827LjvzCRplDRMQQ
 aep/e9QGidIOGR+6Bi3BgktGHtoPvWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-p5px_ZPTOvqv95cLzcjBfQ-1; Mon, 05 Oct 2020 15:52:07 -0400
X-MC-Unique: p5px_ZPTOvqv95cLzcjBfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFFC010066FB
 for <qemu-devel@nongnu.org>; Mon,  5 Oct 2020 19:52:06 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4302D5C22B;
 Mon,  5 Oct 2020 19:52:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/36] qapi: enforce import order/styling with isort
Date: Mon,  5 Oct 2020 15:51:29 -0400
Message-Id: <20201005195158.2348217-8-jsnow@redhat.com>
In-Reply-To: <20201005195158.2348217-1-jsnow@redhat.com>
References: <20201005195158.2348217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 01:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
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
index 00000000000..6d0fd6cc0d3
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
\ No newline at end of file
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 03b31ecfc19..e73b65b6a7e 100644
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
index b036fcf9ce7..31acd2f230a 100644
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
index 68d8a1ce1cf..477ef25ccdf 100644
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
index a835ee6fde3..093f7a38d88 100644
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


