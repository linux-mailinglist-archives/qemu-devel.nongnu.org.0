Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBE327DFA5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 06:43:50 +0200 (CEST)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNTy1-0006kn-67
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 00:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTmw-0000UA-92
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNTmt-0000X2-Rc
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:32:21 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVgZqJ4kTCcMz0Eta7ZqVSoD/oqDzize4WWsRngyz34=;
 b=TQFpf20m5e5tiuk34RQzAnWhciTg5mxYjw37ABn5N0AK3539/uhcSFFFZb6eGqQBRqSNzc
 kA6m3s6lHC5aN7X3GbaMOD5kh4XNQHKRF4G5xiVzN6DvINARw8md7cFlyAK3BfQAaUgGyM
 7B/QSNJgcpG2u8CyRH3t4856sz4Uemw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-HMsMWO3AM1yonOBd1Xf7_A-1; Wed, 30 Sep 2020 00:32:14 -0400
X-MC-Unique: HMsMWO3AM1yonOBd1Xf7_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71CCA802B61;
 Wed, 30 Sep 2020 04:32:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1F797B40D;
 Wed, 30 Sep 2020 04:32:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/46] qapi: Remove wildcard includes
Date: Wed, 30 Sep 2020 00:31:14 -0400
Message-Id: <20200930043150.1454766-11-jsnow@redhat.com>
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

Wildcard includes become hard to manage when refactoring and dealing
with circular dependencies with strictly typed mypy.

flake8 also flags each one as a warning, as it is not smart enough to
know which names exist in the imported file.

Remove them and include things explicitly by name instead.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/commands.py   |  2 +-
 scripts/qapi/events.py     |  7 ++++++-
 scripts/qapi/gen.py        | 12 +++++++++---
 scripts/qapi/introspect.py |  7 ++++++-
 scripts/qapi/types.py      |  8 +++++++-
 scripts/qapi/visit.py      | 10 +++++++++-
 6 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index ce5926146a4..64ed5278f93 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -13,7 +13,7 @@
 See the COPYING file in the top-level directory.
 """
 
-from .common import *
+from .common import build_params, c_name, mcgen
 from .gen import QAPIGenCCode, QAPISchemaModularCVisitor, ifcontext
 
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 04672724388..6b3afa14d72 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -12,7 +12,12 @@
 See the COPYING file in the top-level directory.
 """
 
-from .common import *
+from .common import (
+    build_params,
+    c_enum_const,
+    c_name,
+    mcgen,
+)
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import QAPISchemaEnumMember
 from .types import gen_enum, gen_enum_lookup
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 14d584680dc..61b3c53b180 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -11,13 +11,19 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
-
+from contextlib import contextmanager
 import errno
 import os
 import re
-from contextlib import contextmanager
 
-from .common import *
+from .common import (
+    c_fname,
+    gen_endif,
+    gen_if,
+    guardend,
+    guardstart,
+    mcgen,
+)
 from .schema import QAPISchemaVisitor
 
 
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 2a34cd1e8ea..b036fcf9ce7 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -10,7 +10,12 @@
 See the COPYING file in the top-level directory.
 """
 
-from .common import *
+from .common import (
+    c_name,
+    gen_endif,
+    gen_if,
+    mcgen,
+)
 from .gen import QAPISchemaMonolithicCVisitor
 from .schema import (QAPISchemaArrayType, QAPISchemaBuiltinType,
                      QAPISchemaType)
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index ca9a5aacb39..53b47f9e58a 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -13,7 +13,13 @@
 # See the COPYING file in the top-level directory.
 """
 
-from .common import *
+from .common import (
+    c_enum_const,
+    c_name,
+    gen_endif,
+    gen_if,
+    mcgen,
+)
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import QAPISchemaEnumMember, QAPISchemaObjectType
 
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 7850f6e8480..ea277e7704b 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -13,7 +13,15 @@
 See the COPYING file in the top-level directory.
 """
 
-from .common import *
+from .common import (
+    c_enum_const,
+    c_name,
+    gen_endif,
+    gen_if,
+    mcgen,
+    pop_indent,
+    push_indent,
+)
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import QAPISchemaObjectType
 
-- 
2.26.2


