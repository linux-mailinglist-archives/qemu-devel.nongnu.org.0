Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C733AC8CC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:29:17 +0200 (CEST)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBkS-0007An-Ht
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBh5-0004XI-8D
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBgz-00005m-SN
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624011940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ijsB8fWSpudeCKobYIakHfTMJ8v6PseczxmRdJ1z4s=;
 b=FHjdGQWGwkKHWejEkJPXOMMhWE2EryvWBgV9NhZeBCtzvTv8fvHmfsAfl7xVgeB56h6jf+
 YDYNwi2qq8pd3Yxl6DPexbgLO7WyM5EegGRCbYFz2A7BAThKb4wGi+805qYt3AxKcMyexU
 KqRUznH+mUp5ALNZxIxikowtl6cGZW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-xXXspC9cNEui_hiQ6wr_-Q-1; Fri, 18 Jun 2021 06:25:39 -0400
X-MC-Unique: xXXspC9cNEui_hiQ6wr_-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 775AA802B7E
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:25:38 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2262C60583;
 Fri, 18 Jun 2021 10:25:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/11] docs: update the documentation upfront about schema
 configuration
Date: Fri, 18 Jun 2021 14:24:57 +0400
Message-Id: <20210618102507.3761128-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Update the documentation describing the changes in this series.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.txt | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index c1cb6f987d..ec815ab47b 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -781,25 +781,31 @@ downstream command __com.redhat_drive-mirror.
 
 Syntax:
     COND = STRING
-         | [ STRING, ... ]
+         | { 'all: [ COND, ... ] }
+         | { 'any: [ COND, ... ] }
+         | { 'not': COND }
 
 All definitions take an optional 'if' member.  Its value must be a
-string or a list of strings.  A string is shorthand for a list
-containing just that string.  The code generated for the definition
-will then be guarded by #if STRING for each STRING in the COND list.
+string, or an object with a single member 'all', 'any' or 'not'.
+
+The C code generated for the definition will then be guarded by an #if
+preprocessing directive with an operand generated from that condition:
+
+ * STRING will generate defined(STRING)
+ * { 'all': [COND, ...] } will generate (COND && ...)
+ * { 'any': [COND, ...] } will generate (COND || ...)
+ * { 'not': COND } will generate !COND
 
 Example: a conditional struct
 
  { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
-   'if': ['defined(CONFIG_FOO)', 'defined(HAVE_BAR)'] }
+   'if': { 'all': [ 'CONFIG_FOO', 'HAVE_BAR' ] } }
 
 gets its generated code guarded like this:
 
- #if defined(CONFIG_FOO)
- #if defined(HAVE_BAR)
+ #if defined(CONFIG_FOO) && defined(HAVE_BAR)
  ... generated code ...
- #endif /* defined(HAVE_BAR) */
- #endif /* defined(CONFIG_FOO) */
+ #endif /* defined(HAVE_BAR) && defined(CONFIG_FOO) */
 
 Individual members of complex types, commands arguments, and
 event-specific data can also be made conditional.  This requires the
@@ -810,7 +816,7 @@ member 'bar'
 
 { 'struct': 'IfStruct', 'data':
   { 'foo': 'int',
-    'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
+    'bar': { 'type': 'int', 'if': 'IFCOND'} } }
 
 A union's discriminator may not be conditional.
 
@@ -822,7 +828,7 @@ value 'bar'
 
 { 'enum': 'IfEnum', 'data':
   [ 'foo',
-    { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
+    { 'name' : 'bar', 'if': 'IFCOND' } ] }
 
 Likewise, features can be conditional.  This requires the longhand
 form of FEATURE.
@@ -832,7 +838,7 @@ Example: a struct with conditional feature 'allow-negative-numbers'
 { 'struct': 'TestType',
   'data': { 'number': 'int' },
   'features': [ { 'name': 'allow-negative-numbers',
-                  'if': 'defined(IFCOND)' } ] }
+                  'if': 'IFCOND' } ] }
 
 Please note that you are responsible to ensure that the C code will
 compile with an arbitrary combination of conditions, since the
-- 
2.29.0


