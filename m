Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF390274B3C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:35:02 +0200 (CEST)
Received: from localhost ([::1]:44608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpwD-0002ZH-Ln
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQa-0002qL-LP
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:02:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQY-0004g5-My
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gjv/1TCr1+x4mJxtRx4j/pu85zh+OSeH8cUFmDsVUqY=;
 b=RShr8lRA2UlEqZSCoxwLHjIyxqufJjADqR9EPtv2c9LZ0d/ejAoGOSUv3TVhx7mC8sdreU
 eR7t7+MJj3It+qFs48FEyiXMJbXzgflZ2gzNmmsyD90uSZFsYLbA3ODljT7NaYRVXacxGc
 O1XgY6Rcoi6iuidWCAHid5kx8SlMhT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-BsuXlV0WMFGXxqaiQTGs3w-1; Tue, 22 Sep 2020 17:01:56 -0400
X-MC-Unique: BsuXlV0WMFGXxqaiQTGs3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83B99185A0CA;
 Tue, 22 Sep 2020 21:01:54 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 957E855765;
 Tue, 22 Sep 2020 21:01:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 35/38] qapi/types.py: remove one-letter variables
Date: Tue, 22 Sep 2020 17:00:58 -0400
Message-Id: <20200922210101.4081073-36-jsnow@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"John, if pylint told you to jump off a bridge, would you?"
Hey, if it looked like fun, I might.

Now that this file is clean, enable pylint checks on this file.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc |  1 -
 scripts/qapi/types.py | 29 +++++++++++++++--------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index de132d03cf..cebaf600f9 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -7,7 +7,6 @@ ignore-patterns=doc.py,
                 expr.py,
                 parser.py,
                 schema.py,
-                types.py,
                 visit.py,
 
 
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 5533c5a126..78c2a5a3e9 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -49,14 +49,14 @@ def gen_enum_lookup(name: str,
     .array = (const char *const[]) {
 ''',
                 c_name=c_name(name))
-    for m in members:
-        ret += gen_if(m.ifcond)
-        index = c_enum_const(name, m.name, prefix)
+    for member in members:
+        ret += gen_if(member.ifcond)
+        index = c_enum_const(name, member.name, prefix)
         ret += mcgen('''
         [%(index)s] = "%(name)s",
 ''',
-                     index=index, name=m.name)
-        ret += gen_endif(m.ifcond)
+                     index=index, name=member.name)
+        ret += gen_endif(member.ifcond)
 
     ret += mcgen('''
     },
@@ -79,13 +79,13 @@ def gen_enum(name: str,
 ''',
                 c_name=c_name(name))
 
-    for m in enum_members:
-        ret += gen_if(m.ifcond)
+    for member in enum_members:
+        ret += gen_if(member.ifcond)
         ret += mcgen('''
     %(c_enum)s,
 ''',
-                     c_enum=c_enum_const(name, m.name, prefix))
-        ret += gen_endif(m.ifcond)
+                     c_enum=c_enum_const(name, member.name, prefix))
+        ret += gen_endif(member.ifcond)
 
     ret += mcgen('''
 } %(c_name)s;
@@ -148,11 +148,12 @@ def gen_object(name: str, ifcond: List[str],
     objects_seen.add(name)
 
     ret = ''
-    if variants:
-        for v in variants.variants:
-            if isinstance(v.type, QAPISchemaObjectType):
-                ret += gen_object(v.type.name, v.type.ifcond, v.type.base,
-                                  v.type.local_members, v.type.variants)
+    for variant in variants.variants if variants else ():
+        obj = variant.type
+        if not isinstance(obj, QAPISchemaObjectType):
+            continue
+        ret += gen_object(obj.name, obj.ifcond, obj.base,
+                          obj.local_members, obj.variants)
 
     ret += mcgen('''
 
-- 
2.26.2


