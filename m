Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8194C27DFE0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 07:07:30 +0200 (CEST)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNUKv-00041R-Kp
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 01:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNToY-0002QL-0O
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:34:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNToV-0000jy-TJ
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 00:34:01 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601440439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/abyknJ077SLyyiLDe4jq6y7p12uzRjz9MkvLvt3Og=;
 b=ZTW456ZPDQiidsNZdWkaxaSDmwPFIBZhejXyYTJD18pndAsYjUYvNlqsZTzv/6G9IDLTr3
 CXPgKxnBgFLxMgvCsls7LHomNYsfHmp3JJTCR5snak37CKwR9ueqOPw43Fi/N9GHi/APCK
 EEucHPdLLZb1H7tjQh/OEIMGo6t3rwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-6fLyPnDvN_2pWNP7ro1PUA-1; Wed, 30 Sep 2020 00:33:34 -0400
X-MC-Unique: 6fLyPnDvN_2pWNP7ro1PUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2A7185A0CD;
 Wed, 30 Sep 2020 04:33:33 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB3E77B40D;
 Wed, 30 Sep 2020 04:33:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 43/46] qapi/types.py: remove one-letter variables
Date: Wed, 30 Sep 2020 00:31:47 -0400
Message-Id: <20200930043150.1454766-44-jsnow@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
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

"John, if pylint told you to jump off a bridge, would you?"
Hey, if it looked like fun, I might.

Now that this file is clean, enable pylint checks on this file.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/pylintrc |  1 -
 scripts/qapi/types.py | 29 +++++++++++++++--------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index 8badcb11cda..b3c4cf46dbf 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -6,7 +6,6 @@ ignore-patterns=error.py,
                 expr.py,
                 parser.py,
                 schema.py,
-                types.py,
                 visit.py,
 
 
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 766822feb3a..9d1e79d503d 100644
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


