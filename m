Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBCE427366
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 00:08:44 +0200 (CEST)
Received: from localhost ([::1]:52244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYy2l-0001ps-MM
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 18:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy0x-00081m-J9
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy0u-0003In-Lm
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633730807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f4cQeWqFSgHFkj9/8L5zhItGfYD45EJxwCyD65wSiGs=;
 b=gPNLdGhCZG7XLQlR88IExGY3hqe4h63KLHtXDZqy7uOxsG0yrpD12bUq6flNKOFSH0NT4q
 vmM3s+5ehOMpMq1H/YN7k4sCZQY3YKGTZPf55aJICQ3OFdrI3Ko/HFYz2257KJLb04r8Id
 V66ApvMgzldRwIhTaNL0MikaBfiHUK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590--CJ-Bqx0MOS-X4IP0Rxm8g-1; Fri, 08 Oct 2021 18:06:35 -0400
X-MC-Unique: -CJ-Bqx0MOS-X4IP0Rxm8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00797801AA7;
 Fri,  8 Oct 2021 22:06:35 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91B1560622;
 Fri,  8 Oct 2021 22:06:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] docs/sphinx: add loaded modules to generated depfile
Date: Sat,  9 Oct 2021 02:06:15 +0400
Message-Id: <20211008220620.1488179-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
References: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.051, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/sphinx/depfile.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/sphinx/depfile.py b/docs/sphinx/depfile.py
index 277fdf0f56..b6fb926df1 100644
--- a/docs/sphinx/depfile.py
+++ b/docs/sphinx/depfile.py
@@ -12,6 +12,7 @@
 
 import os
 import sphinx
+import sys
 
 __version__ = '1.0'
 
@@ -20,8 +21,17 @@ def get_infiles(env):
         yield env.doc2path(x)
         yield from ((os.path.join(env.srcdir, dep)
                     for dep in env.dependencies[x]))
+    for mod in sys.modules.values():
+        if hasattr(mod, '__file__'):
+            if mod.__file__:
+                yield mod.__file__
 
-def write_depfile(app, env):
+
+def write_depfile(app, exception):
+    if exception:
+        return
+
+    env = app.env
     if not env.config.depfile:
         return
 
@@ -42,7 +52,7 @@ def write_depfile(app, env):
 def setup(app):
     app.add_config_value('depfile', None, 'env')
     app.add_config_value('depfile_stamp', None, 'env')
-    app.connect('env-updated', write_depfile)
+    app.connect('build-finished', write_depfile)
 
     return dict(
         version = __version__,
-- 
2.33.0.721.g106298f7f9


