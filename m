Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF231405A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:24:24 +0100 (CET)
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9D55-0001eq-AN
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l974K-0005Ym-8E
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l9742-0001by-FG
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:59:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612792732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VC+Huus2RfkS4dN3aMo8Q6uX73uf8rUlZd963vplIQQ=;
 b=b3NaHeUBa0gVmFG5Rz+j1i0DQ0FjnwphVygUY7ouqRdQynhx2hQL2qOfkBByTSk5Kpiewb
 QezM9KBB9xSnaU8BSlcHrpm8JVfwcS/UuhPR27B+DYZKLGfd0To7E+cnaDQiKvjBJTPoLc
 JBkAaJ/XCE5M0OByresVGahsTpZEtgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-Is7J-CrkPpSEVH-eaTw7gw-1; Mon, 08 Feb 2021 08:58:50 -0500
X-MC-Unique: Is7J-CrkPpSEVH-eaTw7gw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B56D0180E470;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 881C95D9DC;
 Mon,  8 Feb 2021 13:58:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60EF51132D67; Mon,  8 Feb 2021 14:58:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] qapi: use explicitly internal module names
Date: Mon,  8 Feb 2021 14:58:37 +0100
Message-Id: <20210208135846.3707170-8-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
References: <20210208135846.3707170-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

QAPISchemaModularCVisitor._add_system_module() prefixes './' to its name
argument to make it a module name.  Pass the module name instead.  This
will allow us to coalesce the methods to add modules later on.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210201193747.2169670-8-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message reworded]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/commands.py | 2 +-
 scripts/qapi/events.py   | 2 +-
 scripts/qapi/gen.py      | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 71744f48a3..fc5fe27c47 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -286,7 +286,7 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('init', ' * QAPI Commands initialization')
+        self._add_system_module('./init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 9851653b9d..26faa82989 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -191,7 +191,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
                              types=types))
 
     def visit_end(self) -> None:
-        self._add_system_module('emit', ' * QAPI Events emission')
+        self._add_system_module('./emit', ' * QAPI Events emission')
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "%(prefix)sqapi-emit-events.h"
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index aaed78eed5..da9d4d2d37 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -285,7 +285,8 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         self._add_module(name, blurb)
 
     def _add_system_module(self, name: Optional[str], blurb: str) -> None:
-        self._add_module(name and './' + name, blurb)
+        assert QAPISchemaModule.is_system_module(name)
+        self._add_module(name, blurb)
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
         for name in self._module:
-- 
2.26.2


