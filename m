Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A7274B11
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:21:53 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpjU-0002X9-0W
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQ5-0002JG-ER
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:49 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51889
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpPx-0004aB-W4
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2giffaOrqGEsDrWJW1W81X4oET/EhvdY0U7WXfADDV4=;
 b=RlOd+vN71lJcWP8Rfmjowk+1cJH8T8LbCSXglkfzU4aAaVybXQhJ2rHgX2LRyY6iXmqtw+
 4P6tH8WqW7fxCdvPXOvnuzZWoqgRT2JjdEBZ74T0X7MaKH7r7ETorOtgKOs96twO93bb2H
 wubRuL8zp5q4/3dANvBUKUOBlTl96wQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-XYLPXVwpMWW8qd0UE6_LLg-1; Tue, 22 Sep 2020 17:01:36 -0400
X-MC-Unique: XYLPXVwpMWW8qd0UE6_LLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 790AE188C122;
 Tue, 22 Sep 2020 21:01:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883FA55765;
 Tue, 22 Sep 2020 21:01:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/38] qapi/commands.py: add notational type hints
Date: Tue, 22 Sep 2020 17:00:43 -0400
Message-Id: <20200922210101.4081073-21-jsnow@redhat.com>
In-Reply-To: <20200922210101.4081073-1-jsnow@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 17:01:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py | 66 +++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 389dd879a6..80f22d562d 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -13,19 +13,32 @@
 See the COPYING file in the top-level directory.
 """
 
+from typing import Dict, Optional, List, Set
+
 from .common import (
     c_name,
     mcgen,
 )
 from .gen import (
+    QAPIGenC,
     QAPIGenCCode,
     QAPISchemaModularCVisitor,
     build_params,
     ifcontext,
 )
+from .schema import (
+    QAPISchema,
+    QAPISchemaFeature,
+    QAPISchemaObjectType,
+    QAPISchemaType,
+)
+from .source import QAPISourceInfo
 
 
-def gen_command_decl(name, arg_type, boxed, ret_type):
+def gen_command_decl(name: str,
+                     arg_type: Optional[QAPISchemaObjectType],
+                     boxed: bool,
+                     ret_type: Optional[QAPISchemaType]) -> str:
     return mcgen('''
 %(c_type)s qmp_%(c_name)s(%(params)s);
 ''',
@@ -34,7 +47,10 @@ def gen_command_decl(name, arg_type, boxed, ret_type):
                  params=build_params(arg_type, boxed, 'Error **errp'))
 
 
-def gen_call(name, arg_type, boxed, ret_type):
+def gen_call(name: str,
+             arg_type: Optional[QAPISchemaObjectType],
+             boxed: bool,
+             ret_type: Optional[QAPISchemaType]) -> str:
     ret = ''
 
     argstr = ''
@@ -70,7 +86,7 @@ def gen_call(name, arg_type, boxed, ret_type):
     return ret
 
 
-def gen_marshal_output(ret_type):
+def gen_marshal_output(ret_type: QAPISchemaType) -> str:
     return mcgen('''
 
 static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
@@ -91,19 +107,22 @@ def gen_marshal_output(ret_type):
                  c_type=ret_type.c_type(), c_name=ret_type.c_name())
 
 
-def build_marshal_proto(name):
+def build_marshal_proto(name: str) -> str:
     return ('void qmp_marshal_%s(QDict *args, QObject **ret, Error **errp)'
             % c_name(name))
 
 
-def gen_marshal_decl(name):
+def gen_marshal_decl(name: str) -> str:
     return mcgen('''
 %(proto)s;
 ''',
                  proto=build_marshal_proto(name))
 
 
-def gen_marshal(name, arg_type, boxed, ret_type):
+def gen_marshal(name: str,
+                arg_type: Optional[QAPISchemaObjectType],
+                boxed: bool,
+                ret_type: Optional[QAPISchemaType]) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
 
     ret = mcgen('''
@@ -185,7 +204,10 @@ def gen_marshal(name, arg_type, boxed, ret_type):
     return ret
 
 
-def gen_register_command(name, success_response, allow_oob, allow_preconfig):
+def gen_register_command(name: str,
+                         success_response: bool,
+                         allow_oob: bool,
+                         allow_preconfig: bool) -> str:
     options = []
 
     if not success_response:
@@ -207,7 +229,7 @@ def gen_register_command(name, success_response, allow_oob, allow_preconfig):
     return ret
 
 
-def gen_registry(registry, prefix):
+def gen_registry(registry: str, prefix: str) -> str:
     ret = mcgen('''
 
 void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds)
@@ -224,15 +246,14 @@ def gen_registry(registry, prefix):
 
 
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
-
-    def __init__(self, prefix):
+    def __init__(self, prefix: str):
         super().__init__(
             prefix, 'qapi-commands',
             ' * Schema-defined QAPI/QMP commands', None, __doc__)
         self._regy = QAPIGenCCode(None)
-        self._visited_ret_types = {}
+        self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
 
-    def _begin_user_module(self, name):
+    def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
         commands = self._module_basename('qapi-commands', name)
         types = self._module_basename('qapi-types', name)
@@ -256,7 +277,7 @@ def _begin_user_module(self, name):
 ''',
                              types=types))
 
-    def visit_end(self):
+    def visit_end(self) -> None:
         self._add_system_module('init', ' * QAPI Commands initialization')
         self._genh.add(mcgen('''
 #include "qapi/qmp/dispatch.h"
@@ -272,9 +293,18 @@ def visit_end(self):
                                       prefix=self._prefix))
         self._genc.add(gen_registry(self._regy.get_content(), self._prefix))
 
-    def visit_command(self, name, info, ifcond, features,
-                      arg_type, ret_type, gen, success_response, boxed,
-                      allow_oob, allow_preconfig):
+    def visit_command(self,
+                      name: str,
+                      info: QAPISourceInfo,
+                      ifcond: List[str],
+                      features: List[QAPISchemaFeature],
+                      arg_type: Optional[QAPISchemaObjectType],
+                      ret_type: Optional[QAPISchemaType],
+                      gen: bool,
+                      success_response: bool,
+                      boxed: bool,
+                      allow_oob: bool,
+                      allow_preconfig: bool) -> None:
         if not gen:
             return
         # FIXME: If T is a user-defined type, the user is responsible
@@ -295,7 +325,9 @@ def visit_command(self, name, info, ifcond, features,
                                                 allow_oob, allow_preconfig))
 
 
-def gen_commands(schema, output_dir, prefix):
+def gen_commands(schema: QAPISchema,
+                 output_dir: str,
+                 prefix: str) -> None:
     vis = QAPISchemaGenCommandVisitor(prefix)
     schema.visit(vis)
     vis.write(output_dir)
-- 
2.26.2


