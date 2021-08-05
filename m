Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3493E16C0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:15:10 +0200 (CEST)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBe9N-0005DT-9E
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3e-0000GF-QA
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3c-0007wL-Ub
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628172552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=umrGEUQGD7nueukCn+cFOka8CcBgwo1gs4Z2jA5BtWI=;
 b=DDGFaiHvubOrCTeoqNnatjrU4TSUxoFtP6zqhEfyPiic5didMEsFkB8gx/MRmF5atBlRlR
 HS4ZZztxU79lToqlaECGY1hRtzD5z+/6Ht6dY/GF4g/fC5AIZ+QKrS5FVqy/KsExdQJ9FJ
 Ayrrx7nAWkt7ClsPaEUqzkG+X5bHz4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-Y0F91IGpMOSsOjLmbXSgAA-1; Thu, 05 Aug 2021 10:09:04 -0400
X-MC-Unique: Y0F91IGpMOSsOjLmbXSgAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC357801AC0;
 Thu,  5 Aug 2021 14:09:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8689D60BF4;
 Thu,  5 Aug 2021 14:09:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F4D811380A1; Thu,  5 Aug 2021 16:09:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] docs/devel/qapi-code-gen: Update examples to match current
 code
Date: Thu,  5 Aug 2021 16:08:58 +0200
Message-Id: <20210805140902.2110546-2-armbru@redhat.com>
In-Reply-To: <20210805140902.2110546-1-armbru@redhat.com>
References: <20210805140902.2110546-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210712150214.624281-1-armbru@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.txt | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index c1cb6f987d..233022184b 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -1496,8 +1496,12 @@ Example:
 
 
     bool visit_type_UserDefOne_members(Visitor *v, UserDefOne *obj, Error **errp);
-    bool visit_type_UserDefOne(Visitor *v, const char *name, UserDefOne **obj, Error **errp);
-    bool visit_type_UserDefOneList(Visitor *v, const char *name, UserDefOneList **obj, Error **errp);
+
+    bool visit_type_UserDefOne(Visitor *v, const char *name,
+                     UserDefOne **obj, Error **errp);
+
+    bool visit_type_UserDefOneList(Visitor *v, const char *name,
+                     UserDefOneList **obj, Error **errp);
 
     bool visit_type_q_obj_my_command_arg_members(Visitor *v, q_obj_my_command_arg *obj, Error **errp);
 
@@ -1518,7 +1522,8 @@ Example:
         return true;
     }
 
-    bool visit_type_UserDefOne(Visitor *v, const char *name, UserDefOne **obj, Error **errp)
+    bool visit_type_UserDefOne(Visitor *v, const char *name,
+                     UserDefOne **obj, Error **errp)
     {
         bool ok = false;
 
@@ -1528,6 +1533,7 @@ Example:
         if (!*obj) {
             /* incomplete */
             assert(visit_is_dealloc(v));
+            ok = true;
             goto out_obj;
         }
         if (!visit_type_UserDefOne_members(v, *obj, errp)) {
@@ -1543,7 +1549,8 @@ Example:
         return ok;
     }
 
-    bool visit_type_UserDefOneList(Visitor *v, const char *name, UserDefOneList **obj, Error **errp)
+    bool visit_type_UserDefOneList(Visitor *v, const char *name,
+                     UserDefOneList **obj, Error **errp)
     {
         bool ok = false;
         UserDefOneList *tail;
@@ -1628,11 +1635,13 @@ Example:
     $ cat qapi-generated/example-qapi-commands.c
 [Uninteresting stuff omitted...]
 
-    static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in, QObject **ret_out, Error **errp)
+
+    static void qmp_marshal_output_UserDefOne(UserDefOne *ret_in,
+                                    QObject **ret_out, Error **errp)
     {
         Visitor *v;
 
-        v = qobject_output_visitor_new(ret_out);
+        v = qobject_output_visitor_new_qmp(ret_out);
         if (visit_type_UserDefOne(v, "unused", &ret_in, errp)) {
             visit_complete(v, ret_out);
         }
@@ -1650,7 +1659,7 @@ Example:
         UserDefOne *retval;
         q_obj_my_command_arg arg = {0};
 
-        v = qobject_input_visitor_new(QOBJECT(args));
+        v = qobject_input_visitor_new_qmp(QOBJECT(args));
         if (!visit_start_struct(v, NULL, NULL, 0, errp)) {
             goto out;
         }
-- 
2.31.1


