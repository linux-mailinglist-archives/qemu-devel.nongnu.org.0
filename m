Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4927DF87
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 06:35:07 +0200 (CEST)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNTpa-0003Jo-8X
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 00:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTmt-0000MU-5F
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTmq-0000Wc-KI
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:18 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiqjiZy9IKIIyFJYbJQnJd+GloQQrNK54/uwFxerO6U=;
 b=Jf40xgg3hvWSZ4wYwHzMmVsYWBNfOTdmkvaNPMSieLgF4eV9hYQcnaizTFegkYRm/gV0tb
 6mBJJgkVVr/xHAk7EM9oEM8tVKodsl6Kz6/e9A5eg0y6RSx/P2yw+zZ1GcaMvdIhcvh+au
 8GIZ/BHlsf1mGEHS54CskAroY05T0BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-245Hdoo6MX2CvoisJ7QapQ-1; Wed, 30 Sep 2020 00:32:12 -0400
X-MC-Unique: 245Hdoo6MX2CvoisJ7QapQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE66E1074653;
 Wed, 30 Sep 2020 04:32:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78A2E73678;
 Wed, 30 Sep 2020 04:32:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/46] qapi: Prefer explicit relative imports
Date: Wed, 30 Sep 2020 00:31:13 -0400
Message-Id: <20200930043150.1454766-10-jsnow@redhat.com>
In-Reply-To: <20200930043150.1454766-1-jsnow@redhat.com>
References: <20200930043150.1454766-1-jsnow@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of the QAPI include statements are changed to be package-aware, as
explicit relative imports.

A quirk of Python packages is that the name of the package exists only
*outside* of the package. This means that to a module inside of the qapi
folder, there is inherently no such thing as the "qapi" package. The
reason these imports work is because the "qapi" package exists in the
context of the caller -- the execution shim, where sys.path includes a
directory that has a 'qapi' folder in it.

When we write "from qapi import sibling", we are NOT referencing the folder
'qapi', but rather "any package named qapi in sys.path". If you should
so happen to have a 'qapi' package in your path, it will use *that*
package.

When we write "from .sibling import foo", we always reference explicitly
our sibling module; guaranteeing consistency in *where* we are importing
these modules from.

This can be useful when working with virtual environments and packages
in development mode. In development mode, a package is installed as a
series of symlinks that forwards to your same source files. The problem
arises because code quality checkers will follow "import qapi.x" to the
"installed" version instead of the sibling file and -- even though they
are the same file -- they have different module paths, and this causes
cyclic import problems, false positive type mismatch errors, and more.

It can also be useful when dealing with hierarchical packages, e.g. if
we allow qemu.core.qmp, qemu.qapi.parser, etc.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/commands.py   |  4 ++--
 scripts/qapi/events.py     |  8 ++++----
 scripts/qapi/expr.py       |  4 ++--
 scripts/qapi/gen.py        |  4 ++--
 scripts/qapi/introspect.py |  8 ++++----
 scripts/qapi/main.py       | 14 +++++++-------
 scripts/qapi/parser.py     |  4 ++--
 scripts/qapi/schema.py     |  8 ++++----
 scripts/qapi/types.py      |  6 +++---
 scripts/qapi/visit.py      |  6 +++---
 10 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 3cf9e1110b2..ce5926146a4 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -13,8 +13,8 @@
 See the COPYING file in the top-level directory.
 """
 
-from qapi.common import *
-from qapi.gen import QAPIGenCCode, QAPISchemaModularCVisitor, ifcontext
+from .common import *
+from .gen import QAPIGenCCode, QAPISchemaModularCVisitor, ifcontext
 
 
 def gen_command_decl(name, arg_type, boxed, ret_type):
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index b544af5a1ce..04672724388 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -12,10 +12,10 @@
 See the COPYING file in the top-level directory.
 """
 
-from qapi.common import *
-from qapi.gen import QAPISchemaModularCVisitor, ifcontext
-from qapi.schema import QAPISchemaEnumMember
-from qapi.types import gen_enum, gen_enum_lookup
+from .common import *
+from .gen import QAPISchemaModularCVisitor, ifcontext
+from .schema import QAPISchemaEnumMember
+from .types import gen_enum, gen_enum_lookup
 
 
 def build_event_send_proto(name, arg_type, boxed):
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2942520399a..03b31ecfc19 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -16,8 +16,8 @@
 
 import re
 from collections import OrderedDict
-from qapi.common import c_name
-from qapi.error import QAPISemError
+from .common import c_name
+from .error import QAPISemError
 
 
 # Names must be letters, numbers, -, and _.  They must start with letter,
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index fc19b2aeb9b..14d584680dc 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -17,8 +17,8 @@
 import re
 from contextlib import contextmanager
 
-from qapi.common import *
-from qapi.schema import QAPISchemaVisitor
+from .common import *
+from .schema import QAPISchemaVisitor
 
 
 class QAPIGen:
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 23652be8102..2a34cd1e8ea 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -10,10 +10,10 @@
 See the COPYING file in the top-level directory.
 """
 
-from qapi.common import *
-from qapi.gen import QAPISchemaMonolithicCVisitor
-from qapi.schema import (QAPISchemaArrayType, QAPISchemaBuiltinType,
-                         QAPISchemaType)
+from .common import *
+from .gen import QAPISchemaMonolithicCVisitor
+from .schema import (QAPISchemaArrayType, QAPISchemaBuiltinType,
+                     QAPISchemaType)
 
 
 def _make_tree(obj, ifcond, features, extra=None):
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 9210a0e1a80..1b168a9771a 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -11,13 +11,13 @@
 import re
 import sys
 
-from qapi.commands import gen_commands
-from qapi.error import QAPIError
-from qapi.events import gen_events
-from qapi.introspect import gen_introspect
-from qapi.schema import QAPISchema
-from qapi.types import gen_types
-from qapi.visit import gen_visit
+from .commands import gen_commands
+from .error import QAPIError
+from .events import gen_events
+from .introspect import gen_introspect
+from .schema import QAPISchema
+from .types import gen_types
+from .visit import gen_visit
 
 
 DEFAULT_OUTPUT_DIR = ''
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 02983979965..a9388eaf765 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -18,8 +18,8 @@
 import re
 from collections import OrderedDict
 
-from qapi.error import QAPIParseError, QAPISemError
-from qapi.source import QAPISourceInfo
+from .error import QAPIParseError, QAPISemError
+from .source import QAPISourceInfo
 
 
 class QAPISchemaParser:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 78309a00f0a..a835ee6fde3 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -18,10 +18,10 @@
 import re
 from collections import OrderedDict
 
-from qapi.common import c_name, pointer_suffix
-from qapi.error import QAPIError, QAPISemError
-from qapi.expr import check_exprs
-from qapi.parser import QAPISchemaParser
+from .common import c_name, pointer_suffix
+from .error import QAPIError, QAPISemError
+from .expr import check_exprs
+from .parser import QAPISchemaParser
 
 
 class QAPISchemaEntity:
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 3640f17cd67..ca9a5aacb39 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -13,9 +13,9 @@
 # See the COPYING file in the top-level directory.
 """
 
-from qapi.common import *
-from qapi.gen import QAPISchemaModularCVisitor, ifcontext
-from qapi.schema import QAPISchemaEnumMember, QAPISchemaObjectType
+from .common import *
+from .gen import QAPISchemaModularCVisitor, ifcontext
+from .schema import QAPISchemaEnumMember, QAPISchemaObjectType
 
 
 # variants must be emitted before their container; track what has already
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index cdabc5fa283..7850f6e8480 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -13,9 +13,9 @@
 See the COPYING file in the top-level directory.
 """
 
-from qapi.common import *
-from qapi.gen import QAPISchemaModularCVisitor, ifcontext
-from qapi.schema import QAPISchemaObjectType
+from .common import *
+from .gen import QAPISchemaModularCVisitor, ifcontext
+from .schema import QAPISchemaObjectType
 
 
 def gen_visit_decl(name, scalar=False):
-- 
2.26.2


