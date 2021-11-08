Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B6447C80
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:06:34 +0100 (CET)
Received: from localhost ([::1]:50726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0bp-0004kE-Ci
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Xy-0007TN-Mi
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mk0Xw-0002MM-Ts
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TDpj2YlICBL+OLHMnUabr1+5cGry17swVrdRs4yk16Y=;
 b=QmhKBWaF+f1lKmgI1nqHfRJXds034Q5CkcttzQcsgK+Zul6TXJ1OxR4RZmfqW2Ytd4ffv+
 leoj5xAGl62lZucUub+J7NlKsWpAfZz38YaJixWht3uxytgSCtPKCSc+aPaJdOADFYOAAt
 JvDgVRqhW8+RT7qEAL+Oci1AN2GNR1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-xc_pSQE0MeecTZEVvpJTAA-1; Mon, 08 Nov 2021 04:02:29 -0500
X-MC-Unique: xc_pSQE0MeecTZEVvpJTAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA64015721;
 Mon,  8 Nov 2021 09:02:27 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB9A0608BA;
 Mon,  8 Nov 2021 09:02:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/11] docs/sphinx: add templates files to generated depfile
Date: Mon,  8 Nov 2021 13:01:47 +0400
Message-Id: <20211108090155.371357-4-marcandre.lureau@redhat.com>
In-Reply-To: <20211108090155.371357-1-marcandre.lureau@redhat.com>
References: <20211108090155.371357-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
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
 docs/conf.py           | 2 +-
 docs/sphinx/depfile.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index ff6e92c6e2e6..edc2bf8fcba7 100644
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
index 99539adb4892..afdcbcec6e76 100644
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


