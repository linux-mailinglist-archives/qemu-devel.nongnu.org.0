Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD842EF35
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:57:36 +0200 (CEST)
Received: from localhost ([::1]:33162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKu7-0007x5-Am
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKr0-00046B-Hr
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKqz-0004j9-2q
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQ25sZ1mvv2JgY1z9za9qTy89uXBeYCXXDglke9DOUM=;
 b=JU5a+2YGPv3TgDZH0/15eS7IfmMwxS/+8X2Ry2c0u9ixs+fxKf6Vg1aZUIYbj1fcmqTZ7d
 S5nnDGcDJmfbuF/nw12oIrrp9T+kz5XNCAEahFSODm+4GzGJ6wyelvXt71jS6Y06lkf3af
 SY64digDq0m8nA5GDW2/USk57LfLDyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-owL7XSW6PyWf-Zra79at-g-1; Fri, 15 Oct 2021 06:54:16 -0400
X-MC-Unique: owL7XSW6PyWf-Zra79at-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74C7F10A8E00;
 Fri, 15 Oct 2021 10:54:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41A775DA61;
 Fri, 15 Oct 2021 10:54:13 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] docs/sphinx: add templates files to generated depfile
Date: Fri, 15 Oct 2021 14:53:39 +0400
Message-Id: <20211015105344.152591-4-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/conf.py           | 2 +-
 docs/sphinx/depfile.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index ff6e92c6e2..edc2bf8fcb 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -74,7 +74,7 @@
 extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
 
 # Add any paths that contain templates here, relative to this directory.
-templates_path = ['_templates']
+templates_path = [os.path.join(qemu_docdir, '_templates')]
 
 # The suffix(es) of source filenames.
 # You can specify multiple suffix as a list of string:
diff --git a/docs/sphinx/depfile.py b/docs/sphinx/depfile.py
index 99539adb48..afdcbcec6e 100644
--- a/docs/sphinx/depfile.py
+++ b/docs/sphinx/depfile.py
@@ -27,7 +27,7 @@ def get_infiles(env):
             if mod.__file__:
                 yield mod.__file__
     # this is perhaps going to include unused files:
-    for static_path in env.config.html_static_path:
+    for static_path in env.config.html_static_path + env.config.templates_path:
         for path in Path(static_path).rglob('*'):
             yield str(path)
 
-- 
2.33.0.721.g106298f7f9


