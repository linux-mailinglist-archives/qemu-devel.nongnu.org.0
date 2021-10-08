Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A5E427369
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 00:08:52 +0200 (CEST)
Received: from localhost ([::1]:52958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYy2t-0002JE-OZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 18:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy13-0008Dx-SQ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy12-0003lL-DT
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633730815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kQ25sZ1mvv2JgY1z9za9qTy89uXBeYCXXDglke9DOUM=;
 b=Mt4o3Odnhfdeu/Iij198EW1ZUPsVBun+hhKMW83grx3ySSSKzf4RX9gqGTX+BRuD27yQ5D
 pN9EcoKNVag41oqbyy8hGm5Y7M0fSASkpmwEBZikBnINRLkrwB13CrmDm76O9xPkAU8ThP
 WDaN5xoYO++NcDC5WKLwu9ebwGFXG0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-EihiodGTPFuL6YJVmLDMeQ-1; Fri, 08 Oct 2021 18:06:54 -0400
X-MC-Unique: EihiodGTPFuL6YJVmLDMeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19EB71006AA3;
 Fri,  8 Oct 2021 22:06:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 847EB5C1B4;
 Fri,  8 Oct 2021 22:06:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] docs/sphinx: add templates files to generated depfile
Date: Sat,  9 Oct 2021 02:06:17 +0400
Message-Id: <20211008220620.1488179-4-marcandre.lureau@redhat.com>
In-Reply-To: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
References: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
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


