Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC533C5ECF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:04:40 +0200 (CEST)
Received: from localhost ([::1]:47930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xU7-00054t-E4
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m2xRs-0001tm-Mw
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:02:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m2xRr-0006vB-3I
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626102138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3TWvN2BLPJ97DByz6rcuPQlXr6wmZbGKSvkp1RPwrDc=;
 b=XA4M2BrxzE3WlgxsoofBDiyzlfKtMPp2LIRPDZEYbVkdH3LZLhiCVUI79GsjRlTsOrB6sT
 eaIcttgS/JAsZllmaUL5K1vwdfnoU9q1YU3m0RRKAu3eO3AqYeQcu6iEQ98ZjEMrzZsNUK
 b6qFXs+K5bNqZAYps8pcNuI8M7PsXLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-34nT4yYsMnapgHXmlUWv3g-1; Mon, 12 Jul 2021 11:02:17 -0400
X-MC-Unique: 34nT4yYsMnapgHXmlUWv3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F182100CCC2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 15:02:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-19.ams2.redhat.com
 [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10AD81971B;
 Mon, 12 Jul 2021 15:02:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9E941113865F; Mon, 12 Jul 2021 17:02:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel/qapi-code-gen: Update examples to match current
 code
Date: Mon, 12 Jul 2021 17:02:14 +0200
Message-Id: <20210712150214.624281-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


