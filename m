Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6390418024
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 08:56:49 +0200 (CEST)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU1c7-0007gW-JC
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 02:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU18C-0007k0-KR
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mU183-0007Lq-77
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 02:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632551140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weyYZfucGiF64O4W9klgiTmYJQUzYM1zB2uRvK+hDwc=;
 b=hRN5h9ulywzjgSjCVoCpv0iDMUy1VX6VPHgsUw2ZZRUDkAC7ihjXt1Y7SF0jdB0K9C+Yfo
 xJ5gozlvE+o2Vugnys34mTKP2vm/7422KJgi+J/MszRNRof/jaKbxF9QWrCvAHpwYmv1Le
 ltgzVxJoQCT9gnTDNL8wra7hed1hnZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-_WzeMmRvMK-pTTYke80spQ-1; Sat, 25 Sep 2021 02:25:36 -0400
X-MC-Unique: _WzeMmRvMK-pTTYke80spQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C60E362FD;
 Sat, 25 Sep 2021 06:25:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C2DB5FC25;
 Sat, 25 Sep 2021 06:25:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5914311380CC; Sat, 25 Sep 2021 08:25:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/25] tests/qapi-schema: Drop simple union __org.qemu_x-Union1
Date: Sat, 25 Sep 2021 08:25:19 +0200
Message-Id: <20210925062525.988405-20-armbru@redhat.com>
In-Reply-To: <20210925062525.988405-1-armbru@redhat.com>
References: <20210925062525.988405-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace simple union __org.qemu_x-Union1 with flat union
__org.qemu_x-Union2, except drop it from __org.qemu_x-command, because
there it's only used to pull it into QMP.  Now drop the unused
-Union1, and rename -Union2 to -Union.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-20-armbru@redhat.com>
---
 tests/unit/test-qmp-cmds.c              | 16 +++++-----------
 tests/qapi-schema/qapi-schema-test.json |  8 +++-----
 tests/qapi-schema/qapi-schema-test.out  | 18 +++++-------------
 3 files changed, 13 insertions(+), 29 deletions(-)

diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 83c9ef5b7c..faa858624a 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -127,22 +127,16 @@ void qmp_boxed_empty(Empty1 *arg, Error **errp)
 {
 }
 
-__org_qemu_x_Union1 *qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
-                                              __org_qemu_x_StructList *b,
-                                              __org_qemu_x_Union2 *c,
-                                              __org_qemu_x_Alt *d,
-                                              Error **errp)
+void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
+                              __org_qemu_x_StructList *b,
+                              __org_qemu_x_Union *c,
+                              __org_qemu_x_Alt *d,
+                              Error **errp)
 {
-    __org_qemu_x_Union1 *ret = g_new0(__org_qemu_x_Union1, 1);
-
-    ret->type = ORG_QEMU_X_UNION1_KIND___ORG_QEMU_X_BRANCH;
-    ret->u.__org_qemu_x_branch.data = strdup("blah1");
-
     /* Also test that 'wchar-t' was munged to 'q_wchar_t' */
     if (b && b->value && !b->value->has_q_wchar_t) {
         b->value->q_wchar_t = 1;
     }
-    return ret;
 }
 
 
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index ef17ab1aae..20f4cc0cfa 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -202,11 +202,10 @@
   'data': { '__org.qemu_x-member1': '__org.qemu_x-Enum' } }
 { 'struct': '__org.qemu_x-Struct', 'base': '__org.qemu_x-Base',
   'data': { '__org.qemu_x-member2': 'str', '*wchar-t': 'int' } }
-{ 'union': '__org.qemu_x-Union1', 'data': { '__org.qemu_x-branch': 'str' } }
 { 'alternate': '__org.qemu_x-Alt1', 'data': { '__org.qemu_x-branch': 'str' } }
 { 'struct': '__org.qemu_x-Struct2',
-  'data': { 'array': ['__org.qemu_x-Union1'] } }
-{ 'union': '__org.qemu_x-Union2', 'base': '__org.qemu_x-Base',
+  'data': { 'array': ['__org.qemu_x-Union'] } }
+{ 'union': '__org.qemu_x-Union', 'base': '__org.qemu_x-Base',
   'discriminator': '__org.qemu_x-member1',
   'data': { '__org.qemu_x-value': '__org.qemu_x-Struct2' } }
 { 'alternate': '__org.qemu_x-Alt',
@@ -214,8 +213,7 @@
 { 'event': '__ORG.QEMU_X-EVENT', 'data': '__org.qemu_x-Struct' }
 { 'command': '__org.qemu_x-command',
   'data': { 'a': ['__org.qemu_x-Enum'], 'b': ['__org.qemu_x-Struct'],
-            'c': '__org.qemu_x-Union2', 'd': '__org.qemu_x-Alt' },
-  'returns': '__org.qemu_x-Union1' }
+            'c': '__org.qemu_x-Union', 'd': '__org.qemu_x-Alt' } }
 
 # test 'if' condition handling
 
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 07e4161331..9337adc9ea 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -215,21 +215,13 @@ object __org.qemu_x-Struct
     base __org.qemu_x-Base
     member __org.qemu_x-member2: str optional=False
     member wchar-t: int optional=True
-object q_obj_str-wrapper
-    member data: str optional=False
-enum __org.qemu_x-Union1Kind
-    member __org.qemu_x-branch
-object __org.qemu_x-Union1
-    member type: __org.qemu_x-Union1Kind optional=False
-    tag type
-    case __org.qemu_x-branch: q_obj_str-wrapper
 alternate __org.qemu_x-Alt1
     tag type
     case __org.qemu_x-branch: str
-array __org.qemu_x-Union1List __org.qemu_x-Union1
+array __org.qemu_x-UnionList __org.qemu_x-Union
 object __org.qemu_x-Struct2
-    member array: __org.qemu_x-Union1List optional=False
-object __org.qemu_x-Union2
+    member array: __org.qemu_x-UnionList optional=False
+object __org.qemu_x-Union
     base __org.qemu_x-Base
     tag __org.qemu_x-member1
     case __org.qemu_x-value: __org.qemu_x-Struct2
@@ -243,9 +235,9 @@ array __org.qemu_x-StructList __org.qemu_x-Struct
 object q_obj___org.qemu_x-command-arg
     member a: __org.qemu_x-EnumList optional=False
     member b: __org.qemu_x-StructList optional=False
-    member c: __org.qemu_x-Union2 optional=False
+    member c: __org.qemu_x-Union optional=False
     member d: __org.qemu_x-Alt optional=False
-command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Union1
+command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
 object TestIfStruct
     member foo: int optional=False
-- 
2.31.1


