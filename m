Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD864C4ED
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:19:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MUM-0003RN-Se; Wed, 14 Dec 2022 02:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUG-0003Pm-Va
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MUF-0003dZ-77
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RnZ+VAAI4lVWzu20Hlb0QCdd6aRMdLgNrgr6Z8/crug=;
 b=cR7gkJ7giYqGTDlYG6W3YdZ03qXzwoIyh8whC7j+T9D4KjlgtMzX/eY/ubZVs3fXaaAQwE
 vpDdYIWRPsYjHby0Yp6ntsT2qJP+Rt8QAmHdyNstOrHTP41+3pVoR+OunwKK9srH5EfJzH
 4QJLAi174WBYcpxoWl/uRyUPo38uMR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-sg6I5jJQP1qmMTKx0X3wXA-1; Wed, 14 Dec 2022 02:47:29 -0500
X-MC-Unique: sg6I5jJQP1qmMTKx0X3wXA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B614101B42B
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0430F2026D68;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 56FE721E675B; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 03/30] docs/devel/qapi-code-gen: Extend example for next
 commit's change
Date: Wed, 14 Dec 2022 08:46:54 +0100
Message-Id: <20221214074721.731441-6-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The next commit will change the code generated for some optional
members.  The example schema contains an optional member affected by
the change.  Add one that is not affected.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221104160712.3005652-4-armbru@redhat.com>
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
2.37.3


