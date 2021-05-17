Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E10383AA8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:01:35 +0200 (CEST)
Received: from localhost ([::1]:45434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligcY-0003sn-C5
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig9l-0005t2-F4
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig9i-0006RE-Oe
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+6+4m8ddXfliu1OpJ3bj+fcD6/yd7oR/PRB7u/R/uU=;
 b=Kn5/rDTtYgoBomrsCC9YRKp0W0G9L2hR5v3Kt9uZx8//ohCXTUUgCShoZLYLN5LBQX7kEi
 hGNFW7asSUFPee4jHjs58jLS6j0dBKVBrzB6+9lsgBIlM/XmhUzLFwW2OOxUZT5OexFPX/
 b6GEJXpAo/h0osk7GeLbUrbmH6eozOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-NGPaGM5KO96izkCSad1cVg-1; Mon, 17 May 2021 12:31:43 -0400
X-MC-Unique: NGPaGM5KO96izkCSad1cVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56A45801107
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:31:42 +0000 (UTC)
Received: from localhost (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FD2A5C1D1;
 Mon, 17 May 2021 16:31:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 9/9] docs: update the documentation about schema
 configuration
Date: Mon, 17 May 2021 20:30:40 +0400
Message-Id: <20210517163040.2308926-10-marcandre.lureau@redhat.com>
In-Reply-To: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.txt | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index edaaf7ec40..4a3fd02723 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -780,26 +780,31 @@ downstream command __com.redhat_drive-mirror.
 === Configuring the schema ===
 
 Syntax:
-    COND = STRING
-         | [ STRING, ... ]
+    COND = CFG-ID
+         | [ COND, ... ]
+         | { 'all: [ COND, ... ] }
+         | { 'any: [ COND, ... ] }
+         | { 'not': COND }
 
-All definitions take an optional 'if' member.  Its value must be a
-string or a list of strings.  A string is shorthand for a list
-containing just that string.  The code generated for the definition
-will then be guarded by #if STRING for each STRING in the COND list.
+    CFG-ID = STRING
+
+All definitions take an optional 'if' member. Its value must be a string, a list
+of strings or an object with a single member 'all', 'any' or 'not'. A string is
+shorthand for a list containing just that string. A list is a shorthand for a
+'all'-member object. The C code generated for the definition will then be guarded
+by an #if precessor expression generated from that condition: 'all': [COND, ...]
+will generate '(COND && ...)', 'any': [COND, ...] '(COND || ...)', 'not': COND '!COND'.
 
 Example: a conditional struct
 
  { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
-   'if': ['CONFIG_FOO', 'HAVE_BAR'] }
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
-- 
2.29.0


