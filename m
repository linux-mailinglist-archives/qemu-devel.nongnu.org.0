Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDA05BA20A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 22:54:54 +0200 (CEST)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYvsr-0001Ng-H9
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 16:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhp-0001rk-ET
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oYvhk-0000HU-VN
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 16:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663274602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pE5tfs+YnaYYQnXa7VeBXOzlD94dEY6sUwrEHpaytKs=;
 b=XIvJ9k0qP+GaPL6rD5ekuYG/K+jUkc0bdeWGnB0Am9Gijqw8hnsS3gKFIDadZHSlBpdp4n
 EJnFRk1JAeBq8Y8EQG7qsXen5JFgpWehpz4wDSeQkdcgdXobXPEaC2Iy+DGWeC4foe5BFI
 I7cPGzRpOrWm6XXS6kJvlHQ3fzKwJjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-1VVdKMeIOiazJN86e9Yxcw-1; Thu, 15 Sep 2022 16:43:20 -0400
X-MC-Unique: 1VVdKMeIOiazJN86e9Yxcw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59AEF811E67;
 Thu, 15 Sep 2022 20:43:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FDBB492B04;
 Thu, 15 Sep 2022 20:43:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA08421E691D; Thu, 15 Sep 2022 22:43:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com,
	jsnow@redhat.com,
	eblake@redhat.com
Subject: [PATCH 03/27] docs/devel/qapi-code-gen: Extend example for next
 commit's change
Date: Thu, 15 Sep 2022 22:42:53 +0200
Message-Id: <20220915204317.3766007-4-armbru@redhat.com>
In-Reply-To: <20220915204317.3766007-1-armbru@redhat.com>
References: <20220915204317.3766007-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The next commit will change the code generated for some optional
members.  The example schema contains an optional member affected by
the change.  Add one that is not affected.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index b56ea4546d..3a817ba498 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1357,7 +1357,7 @@ qmp_my_command(); everything else is produced by the generator. ::
 
     $ cat example-schema.json
     { 'struct': 'UserDefOne',
-      'data': { 'integer': 'int', '*string': 'str' } }
+      'data': { 'integer': 'int', '*string': 'str', '*flag': 'bool' } }
 
     { 'command': 'my-command',
       'data': { 'arg1': ['UserDefOne'] },
@@ -1412,6 +1412,8 @@ Example::
         int64_t integer;
         bool has_string;
         char *string;
+        bool has_flag;
+        bool flag;
     };
 
     void qapi_free_UserDefOne(UserDefOne *obj);
@@ -1531,6 +1533,11 @@ Example::
                 return false;
             }
         }
+        if (visit_optional(v, "flag", &obj->has_flag)) {
+            if (!visit_type_bool(v, "flag", &obj->flag, errp)) {
+                return false;
+            }
+        }
         return true;
     }
 
@@ -1916,6 +1923,12 @@ Example::
                     { "type", QLIT_QSTR("str"), },
                     {}
                 })),
+                QLIT_QDICT(((QLitDictEntry[]) {
+                    { "default", QLIT_QNULL, },
+                    { "name", QLIT_QSTR("flag"), },
+                    { "type", QLIT_QSTR("bool"), },
+                    {}
+                })),
                 {}
             })), },
             { "meta-type", QLIT_QSTR("object"), },
@@ -1949,6 +1962,12 @@ Example::
             { "name", QLIT_QSTR("str"), },
             {}
         })),
+        QLIT_QDICT(((QLitDictEntry[]) {
+            { "json-type", QLIT_QSTR("boolean"), },
+            { "meta-type", QLIT_QSTR("builtin"), },
+            { "name", QLIT_QSTR("bool"), },
+            {}
+        })),
         {}
     }));
 
-- 
2.37.2


