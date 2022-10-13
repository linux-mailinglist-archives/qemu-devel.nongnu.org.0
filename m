Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE65FD7C5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 12:23:55 +0200 (CEST)
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oivNa-00042T-IE
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 06:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiurw-0004pZ-Jl
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiurn-0000as-8e
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665654659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I/Ex1Cm1YYoN8fci+8d0jMP/ApHZCV10SmQNtWPA0Rs=;
 b=cbP/RWvEQTUqNtTYBQT6eBUCwh1N6G725TDRjCLtN0vLcpNfb/MwxgZGSPE8eeZKjrB3I9
 TezhCsn5ypdp/oUXlJ6iV4a9KpnDmSLai4U4oG8DYVIuasvILPHu8p7j9hrmajdEXxKQF6
 82Nwuclbx5yEfD7EJzufvy78eJ4r/8c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-vfVzYT74MWmG57rEHUaS_w-1; Thu, 13 Oct 2022 05:50:58 -0400
X-MC-Unique: vfVzYT74MWmG57rEHUaS_w-1
Received: by mail-ej1-f72.google.com with SMTP id
 qa14-20020a170907868e00b0078db5ba61bdso626523ejc.12
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 02:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I/Ex1Cm1YYoN8fci+8d0jMP/ApHZCV10SmQNtWPA0Rs=;
 b=cS7HwlW1rM42fHgVgb4FGZki/qkL5qVbxD4z1S5K2cO0NQFxSew9k8lgqnrYdgODw5
 a64OeR+/sbZ7nPdTw51uXMPmBFwnhOurmjWcDETwsWjGsy+HmtyAPVmfprtPBU5sZAir
 VC2cUhoxTcoog9ivyOYQf0bKX6Ol6lXoJXNHqFMpqDD/vBL7XtgIMj9+XDnL4rNofqVy
 703UKq4i5JbFYrbtdwbISC8hDHusQC3fhAE3Al6s6cwJG7gpNyY/JU5NljdMfLc+BdGG
 cIMq5OTUUkvbhJ5K+O3Ok9xEm+9tzso+ApB96aGyt/EoIS/V4mjpK0dO5Ehpi5GUXbn9
 iRhw==
X-Gm-Message-State: ACrzQf3iCjmXP8WHMpEGuMQ0lPLbvt0KxCpBIRzJt2TlApjodqwshT/Y
 YUL3DNgOJcIunAn6EMz59xGS95ePdNTQ0SmCRqx2s3tKI03jLXbfPbsQbLDbbbszxjWD/LlYE1Z
 akNvDQSKknpYPiqT7q4Q/UpO/qEwgaIE4Cw0TY3+LC1z94X6/GvNbJdMxzEgv5TiJ4W0=
X-Received: by 2002:a17:907:3201:b0:741:94f2:aeaf with SMTP id
 xg1-20020a170907320100b0074194f2aeafmr25863253ejb.505.1665654657039; 
 Thu, 13 Oct 2022 02:50:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7sMDd12Y0x4smLsmkV02RUzZVpIU4Evlij7t67SQP3ZIURGiLCJ8pWjcsi1fgwjwurXZkTrg==
X-Received: by 2002:a17:907:3201:b0:741:94f2:aeaf with SMTP id
 xg1-20020a170907320100b0074194f2aeafmr25863232ejb.505.1665654656700; 
 Thu, 13 Oct 2022 02:50:56 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a056402064c00b004588ef795easm12933839edx.34.2022.10.13.02.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 02:50:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: afaria@redhat.com,
	qemu-block@nongnu.org,
	armbru@redhat.com
Subject: [PATCH v2] qapi-gen: mark coroutine QMP command functions as
 coroutine_fn
Date: Thu, 13 Oct 2022 11:50:53 +0200
Message-Id: <20221013095053.601937-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coroutine commands have to be declared as coroutine_fn, but the
marker does not show up in the qapi-comands-* headers; likewise, the
marshaling function calls the command and therefore must be coroutine_fn.
Static analysis would want coroutine_fn to match between prototype and
declaration, because in principle coroutines might be compiled to a
completely different calling convention.  So we would like to add the
marker to the header.

Unfortunately, doing so causes lots of files to fail to compile because
they do not include qemu/coroutine.h; which in principle is legitimate
because the files could be only dealing with non-coroutine commands.
There are three ways to deal with this:

- include qemu/coroutine.h in all the files that include the qapi-commands-*
  headers.  This would be a large change and in many case unnecessary,
  because only very few files deal with coroutine commands

- include qemu/coroutine.h from the headers themselves.  This is
  ugly for the same reason, and also because headers-including-headers
  make it harder to avoid world rebuilds

- only define the affected prototypes if coroutine_fn is defined,
  meaning that the .c file has already included qemu/coroutine.h.
  This is what the patch goes for.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/commands.py | 39 +++++++++++++++++++++++++++------------
 ui/console.c             |  1 +
 2 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 38ca38a7b9..956a0d968f 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -41,11 +41,13 @@
 def gen_command_decl(name: str,
                      arg_type: Optional[QAPISchemaObjectType],
                      boxed: bool,
-                     ret_type: Optional[QAPISchemaType]) -> str:
+                     ret_type: Optional[QAPISchemaType],
+                     coroutine: bool) -> str:
     return mcgen('''
-%(c_type)s qmp_%(c_name)s(%(params)s);
+%(c_type)s %(coroutine_fn)sqmp_%(c_name)s(%(params)s);
 ''',
                  c_type=(ret_type and ret_type.c_type()) or 'void',
+                 coroutine_fn='coroutine_fn ' if coroutine else '',
                  c_name=c_name(name),
                  params=build_params(arg_type, boxed, 'Error **errp'))
 
@@ -157,16 +159,21 @@ def gen_marshal_output(ret_type: QAPISchemaType) -> str:
                  c_type=ret_type.c_type(), c_name=ret_type.c_name())
 
 
-def build_marshal_proto(name: str) -> str:
-    return ('void qmp_marshal_%s(QDict *args, QObject **ret, Error **errp)'
-            % c_name(name))
+def build_marshal_proto(name: str,
+                        coroutine: bool) -> str:
+    return ('void %(coroutine_fn)sqmp_marshal_%(c_name)s(%(params)s)' % {
+        'coroutine_fn': 'coroutine_fn ' if coroutine else '',
+        'c_name': c_name(name),
+        'params': 'QDict *args, QObject **ret, Error **errp',
+    })
 
 
-def gen_marshal_decl(name: str) -> str:
+def gen_marshal_decl(name: str,
+                     coroutine: bool) -> str:
     return mcgen('''
 %(proto)s;
 ''',
-                 proto=build_marshal_proto(name))
+                 proto=build_marshal_proto(name, coroutine))
 
 
 def gen_trace(name: str) -> str:
@@ -181,7 +188,8 @@ def gen_marshal(name: str,
                 arg_type: Optional[QAPISchemaObjectType],
                 boxed: bool,
                 ret_type: Optional[QAPISchemaType],
-                gen_tracing: bool) -> str:
+                gen_tracing: bool,
+                coroutine: bool) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
     if have_args:
         assert arg_type is not None
@@ -195,7 +203,7 @@ def gen_marshal(name: str,
     bool ok = false;
     Visitor *v;
 ''',
-                proto=build_marshal_proto(name))
+                proto=build_marshal_proto(name, coroutine))
 
     if ret_type:
         ret += mcgen('''
@@ -314,6 +322,7 @@ def _begin_user_module(self, name: str) -> None:
 #include "qapi/qmp/qdict.h"
 #include "qapi/dealloc-visitor.h"
 #include "qapi/error.h"
+#include "qemu/coroutine.h"
 #include "%(visit)s.h"
 #include "%(commands)s.h"
 
@@ -345,6 +354,7 @@ def visit_begin(self, schema: QAPISchema) -> None:
                              c_prefix=c_name(self._prefix, protect=False)))
         self._genc.add(mcgen('''
 #include "qemu/osdep.h"
+#include "qemu/coroutine.h"
 #include "%(prefix)sqapi-commands.h"
 #include "%(prefix)sqapi-init-commands.h"
 
@@ -388,10 +398,15 @@ def visit_command(self,
                            self._genh, self._genc):
                 self._genc.add(gen_marshal_output(ret_type))
         with ifcontext(ifcond, self._genh, self._genc):
-            self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
-            self._genh.add(gen_marshal_decl(name))
+            if coroutine:
+                self._genh.add('#ifdef coroutine_fn\n')
+            self._genh.add(gen_command_decl(name, arg_type, boxed,
+                                            ret_type, coroutine))
+            self._genh.add(gen_marshal_decl(name, coroutine))
+            if coroutine:
+                self._genh.add('#endif\n')
             self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
-                                       self._gen_tracing))
+                                       self._gen_tracing, coroutine))
             if self._gen_tracing:
                 self._gen_trace_events.add(gen_trace(name))
         with self._temp_module('./init'):
diff --git a/ui/console.c b/ui/console.c
index 49da6a91df..61a3d62398 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -26,6 +26,7 @@
 #include "ui/console.h"
 #include "hw/qdev-core.h"
 #include "qapi/error.h"
+#include "qemu/coroutine.h"
 #include "qapi/qapi-commands-ui.h"
 #include "qemu/fifo8.h"
 #include "qemu/main-loop.h"
-- 
2.37.3


