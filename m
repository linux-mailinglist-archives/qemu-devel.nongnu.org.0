Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE7060C6C9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:45:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFWM-0006Dy-Qx; Tue, 25 Oct 2022 04:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwz-0004iF-LE
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1onEwj-0007uU-J5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666685145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BoWRPHViXOUIuXVQUIoysqxoheeIvwPQ5ATPj9sNMg=;
 b=QeuxYUdZaM6Lgu1Dx0qVYyCH01yE4Ya9vd6GMNeGqHqVUYZanpgUC3afUaLoqWBAGIpumh
 QXUtiPfnqkySnfjZlxuN3Xk/+BbB55Q4JdY29Plcg47Yi3hQVewNU3EPDprZsp+hL72YGg
 6Zhy4CZHPFtETl9dLKRWXs0tHClFKv8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-VDYaGstyOZKOE4sYY7DiSA-1; Tue, 25 Oct 2022 04:05:42 -0400
X-MC-Unique: VDYaGstyOZKOE4sYY7DiSA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44BEF185A7A8
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 08:05:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1948C492CA4;
 Tue, 25 Oct 2022 08:05:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1BFC821E6686; Tue, 25 Oct 2022 10:05:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 03/28] docs/devel/qapi-code-gen: Extend example for next
 commit's change
Date: Tue, 25 Oct 2022 10:05:16 +0200
Message-Id: <20221025080541.271547-4-armbru@redhat.com>
In-Reply-To: <20221025080541.271547-1-armbru@redhat.com>
References: <20221025080541.271547-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The next commit will change the code generated for some optional
members.  The example schema contains an optional member affected by
the change.  Add one that is not affected.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221018062849.3420573-4-armbru@redhat.com>
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


