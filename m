Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CCE446435
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:36:44 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizOc-0000Iy-P6
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizL9-0005wV-Pk
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:33:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizL5-0006lE-L3
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636119183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPyqCrxhN/c0hWzf+ls7+Sg9Q/olMxoUjg3H47163bQ=;
 b=Ad76vHhDgshFo+L9bDu+XzyeF0VXz/6E0z41LMvSQeIiPpptaw7paNPd6nA/MPd7SIYgEV
 njgVfY+1nL37WQAPOWOgcq5cmhBH1IkEX+ePJU2lKJSsrkr0qj5JtDtGnO/a/gzo4itU5W
 GBrqKfjkY64IFOSQfdmDLeBCsYzruCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-s7jgni3FNF2-z_NIgIjfYw-1; Fri, 05 Nov 2021 09:32:35 -0400
X-MC-Unique: s7jgni3FNF2-z_NIgIjfYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70C3F100CCC8;
 Fri,  5 Nov 2021 13:32:33 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC25A60FFD;
 Fri,  5 Nov 2021 13:32:31 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] docs/sphinx: add loaded modules to generated depfile
Date: Fri,  5 Nov 2021 17:32:12 +0400
Message-Id: <20211105133222.184722-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211105133222.184722-1-marcandre.lureau@redhat.com>
References: <20211105133222.184722-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
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


