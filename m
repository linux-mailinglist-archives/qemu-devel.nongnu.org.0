Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF648447C79
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:04:05 +0100 (CET)
Received: from localhost ([::1]:44514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0ZQ-0000Ny-RJ
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:04:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Xj-0006qB-Gy
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Xg-0002Kq-SF
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPyqCrxhN/c0hWzf+ls7+Sg9Q/olMxoUjg3H47163bQ=;
 b=IGiJoRSfMjaHbxB3gqxGnsaLifupm7hY0DCOMBdVNMj83czuafFwNfYFZpHoPb+UEiYeeV
 e+jGmXfG33/bbSWUUf5J5DD73/XbslvIeqHZNHdOwE0rtA831zcfx+ZDU3W9qwXQokfWbE
 DjfLNl89PU2rVZ5iS6ykUnXn6Sx0X6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-VtQNggE1MsWagupEIopPag-1; Mon, 08 Nov 2021 04:02:12 -0500
X-MC-Unique: VtQNggE1MsWagupEIopPag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59CF887D549;
 Mon,  8 Nov 2021 09:02:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4EA2D60657;
 Mon,  8 Nov 2021 09:02:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/11] docs/sphinx: add loaded modules to generated depfile
Date: Mon,  8 Nov 2021 13:01:45 +0400
Message-Id: <20211108090155.371357-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211108090155.371357-1-marcandre.lureau@redhat.com>
References: <20211108090155.371357-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/sphinx/depfile.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/sphinx/depfile.py b/docs/sphinx/depfile.py
index 277fdf0f5680..b6fb926df11d 100644
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


