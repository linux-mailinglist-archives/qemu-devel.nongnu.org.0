Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EFD4B2D21
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 19:50:49 +0100 (CET)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIb0K-00047q-St
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 13:50:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nIamy-000812-Iw
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 13:37:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nIamt-0004ei-Py
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 13:36:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644604615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J5ef6i/mbyNM0l9bIy34qCbfHrdVkcKLN/NaLJw1vqc=;
 b=f52kZR6/3K0j1rmF5ESR4ZHzmjGPWxtfYBq4LXfPAPCYyJqp5rARgCtshQHPC1xSmXBki2
 G3uxCSlkMKOeSRAHkq0WfLDfGXCIqZtRukDnb8yW+FmOgfSIKe5/KksoazPpexw40CEV5X
 tBod1TeDd8b4sMgT4fGhv3+cMxfBi30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-DXRuAnPQMQ-NWJN_G6WefQ-1; Fri, 11 Feb 2022 13:36:52 -0500
X-MC-Unique: DXRuAnPQMQ-NWJN_G6WefQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE1E1015DCE;
 Fri, 11 Feb 2022 18:36:51 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D247753E7;
 Fri, 11 Feb 2022 18:36:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] scripts/qapi: minor delinting
Date: Fri, 11 Feb 2022 13:36:50 -0500
Message-Id: <20220211183650.2946895-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Get isort and pylint tools passing again.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/pylintrc    | 15 +++++----------
 scripts/qapi/types.py    |  6 +++++-
 scripts/qapi/visit.py    |  6 +++++-
 4 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 869d799ed22..38ca38a7b9d 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -25,8 +25,8 @@
     QAPIGenC,
     QAPISchemaModularCVisitor,
     build_params,
-    ifcontext,
     gen_special_features,
+    ifcontext,
 )
 from .schema import (
     QAPISchema,
diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index b259531a726..1fed2e69620 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -34,16 +34,11 @@ disable=fixme,
 
 [BASIC]
 
-# Good variable names which should always be accepted, separated by a comma.
-good-names=i,
-           j,
-           k,
-           ex,
-           Run,
-           _,
-           fp,  # fp = open(...)
-           fd,  # fd = os.open(...)
-           ch,
+# Good variable names regexes, separated by a comma. If names match any regex,
+# they will always be accepted
+
+# Allow just about anything, as per Markus's preference.
+good-names-rgxs=^[_a-z][_a-z0-9]?$
 
 [VARIABLES]
 
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 3013329c248..477d0270013 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -16,7 +16,11 @@
 from typing import List, Optional
 
 from .common import c_enum_const, c_name, mcgen
-from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
+from .gen import (
+    QAPISchemaModularCVisitor,
+    gen_special_features,
+    ifcontext,
+)
 from .schema import (
     QAPISchema,
     QAPISchemaEnumMember,
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index e13bbe42925..380fa197f58 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -21,7 +21,11 @@
     indent,
     mcgen,
 )
-from .gen import QAPISchemaModularCVisitor, gen_special_features, ifcontext
+from .gen import (
+    QAPISchemaModularCVisitor,
+    gen_special_features,
+    ifcontext,
+)
 from .schema import (
     QAPISchema,
     QAPISchemaEnumMember,
-- 
2.34.1


