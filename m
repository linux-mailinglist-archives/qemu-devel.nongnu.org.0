Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9E928F775
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 19:10:49 +0200 (CEST)
Received: from localhost ([::1]:50440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT6m7-0004zG-FA
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 13:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kT6WF-0004EV-RL
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 12:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kT6WE-0001c6-0Q
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 12:54:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602780861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Sj26bIfwzoSh0pwf4xCUF0bjGAIiIkNlullUUrKThk=;
 b=GNIfKh3xoshtu8uPkv1hQdP5pzJgytze2tA2nbIS15jZlHN3U7Ef3Co2+H4D9f1eg3qTY5
 zLSWzJ+WlKpisJrBloUSrv7IlUzGREmV0w39p+L8dK+hbM1komNafDdsq4TRfbo8VAmbE5
 8GTckJCRF/uE53Er/eXaX+7sSCfvKGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-NUhOTj1SM1iiwADUthbnGw-1; Thu, 15 Oct 2020 12:54:19 -0400
X-MC-Unique: NUhOTj1SM1iiwADUthbnGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A1CF80363A;
 Thu, 15 Oct 2020 16:54:18 +0000 (UTC)
Received: from localhost (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 145C419C59;
 Thu, 15 Oct 2020 16:54:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] docs: update the documentation about schema configuration
Date: Thu, 15 Oct 2020 20:52:55 +0400
Message-Id: <20201015165255.1573897-10-marcandre.lureau@redhat.com>
In-Reply-To: <20201015165255.1573897-1-marcandre.lureau@redhat.com>
References: <20201015165255.1573897-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/qapi-code-gen.txt | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 3d22a7ae21..517bc29507 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -772,26 +772,30 @@ downstream command __com.redhat_drive-mirror.
 === Configuring the schema ===
 
 Syntax:
-    COND = STRING
-         | [ STRING, ... ]
+    COND = CFG-ID
+         | [ CFG-ID, ... ]
+         | { 'all: [ CFG-ID, ... ] }
+         | { 'any: [ CFG-ID, ... ] }
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
+by an #if precessor expression.
 
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
2.28.0


