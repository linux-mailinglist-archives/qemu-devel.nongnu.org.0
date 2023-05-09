Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC2F6FC116
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:01:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGl-0008U6-D5; Tue, 09 May 2023 04:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGj-0008TN-Ag
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGh-0008Tm-PC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjDbSKJYdhl/tnptM2i+FfwrzhXDwqcfR/4uUFnE4lY=;
 b=F6Oub2H0HdSnylzJONFJBxKFaX8YgjccvtGz+lzNCMe1FUTWirv3fV+eg1raQoUFJ3Bp4W
 8hWhi850K9hjsSJMVpILzknzIlIqpaEqPr+U2NDS78Q7xW4Fj+GY1YomesV48fPyMwA6Ap
 xHXIxWt2nHghIPqmgw86VsfIEhnMAc0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-4WX0V5BBPBy1GkWZov0R8A-1; Tue, 09 May 2023 04:00:18 -0400
X-MC-Unique: 4WX0V5BBPBy1GkWZov0R8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0AD285A588;
 Tue,  9 May 2023 08:00:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC9A014171BC;
 Tue,  9 May 2023 08:00:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 33CC521E661F; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 10/17] tests/qapi-schema/doc-good: Improve argument description
 tests
Date: Tue,  9 May 2023 10:00:04 +0200
Message-Id: <20230509080011.3231661-11-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Improve the comments to better describe what they test.

Cover argument description starting on a new line indented.  This
style isn't documented in docs/devel/qapi-code-gen.rst.  qapi-gen.py
accepts it, but messes up indentation: it's stripped from the first
line, not subsequent ones.  The next commit will fix this.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-11-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 tests/qapi-schema/doc-good.json | 15 +++++++++------
 tests/qapi-schema/doc-good.out  | 16 +++++++++-------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 445471daee..34c3dcbe97 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -54,7 +54,7 @@
 ##
 # @Enum:
 #
-# @one: The _one_ {and only}
+# @one: The _one_ {and only}, description on the same line
 #
 # Features:
 # @enum-feat: Also _one_ {and only}
@@ -73,7 +73,8 @@
 # @Base:
 #
 # @base1:
-# the first member
+# description starts on a new line,
+# not indented
 ##
 { 'struct': 'Base', 'data': { 'base1': 'Enum' },
   'if': { 'all': ['IFALL1', 'IFALL2'] } }
@@ -120,7 +121,8 @@
 ##
 # @Alternate:
 #
-# @i: an integer
+# @i: description starts on the same line
+#     remainder indented the same
 #     @b is undocumented
 #
 # Features:
@@ -138,10 +140,11 @@
 ##
 # @cmd:
 #
-# @arg1: the first argument
+# @arg1:
+#     description starts on a new line,
+#     indented
 #
-# @arg2: the second
-#        argument
+# @arg2: the second argument
 #
 # Features:
 # @cmd-feat1: a feature
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index afa48dcd94..2ba72ae558 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -104,7 +104,7 @@ doc symbol=Enum
     body=
 
     arg=one
-The _one_ {and only}
+The _one_ {and only}, description on the same line
     arg=two
 
     feature=enum-feat
@@ -117,12 +117,13 @@ doc symbol=Base
     body=
 
     arg=base1
-the first member
+description starts on a new line,
+not indented
 doc symbol=Variant1
     body=
 A paragraph
 
-Another paragraph (but no @var: line)
+Another paragraph
 
 @var1 is undocumented
     arg=var1
@@ -143,7 +144,8 @@ doc symbol=Alternate
     body=
 
     arg=i
-an integer
+description starts on the same line
+remainder indented the same
 @b is undocumented
     arg=b
 
@@ -156,10 +158,10 @@ doc symbol=cmd
     body=
 
     arg=arg1
-the first argument
+description starts on a new line,
+    indented
     arg=arg2
-the second
-argument
+the second argument
     arg=arg3
 
     feature=cmd-feat1
-- 
2.39.2


