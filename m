Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD60446469
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 14:47:05 +0100 (CET)
Received: from localhost ([::1]:33900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mizYe-0007It-IS
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizLt-0007hh-0O
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mizLr-000198-Lh
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 09:33:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636119231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXCQEoApqaksXfro1WHTSuYwZpITFwX8D1pEIqEVdtc=;
 b=hhjXDAXOAYNicVzTklijhLLKg9HqXNT8agS/l8UjnSgqqVePvR569Y7EtWC61ZLwI4FZw1
 z+qi+18+RBueXU//LcCFIh5UD1C+rfSJkD2WPyafXs64DPF3wF3WkmeO21HVsRyjKY09uZ
 7LYHE/QF+WcfzX4GUb6PnRa7/Ihm8k4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-0o4SCp1SMLyzaZPlzWmTKw-1; Fri, 05 Nov 2021 09:33:49 -0400
X-MC-Unique: 0o4SCp1SMLyzaZPlzWmTKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 502AC875048;
 Fri,  5 Nov 2021 13:33:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAE9060C17;
 Fri,  5 Nov 2021 13:33:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] docs/sphinx: add 's' keyboard binding to focus search
Date: Fri,  5 Nov 2021 17:32:19 +0400
Message-Id: <20211105133222.184722-9-marcandre.lureau@redhat.com>
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

This is pretty ubiquitous. ('/' is already taken by some browsers for
quick search)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/conf.py                 | 4 ++++
 docs/sphinx-static/custom.js | 9 +++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 docs/sphinx-static/custom.js

diff --git a/docs/conf.py b/docs/conf.py
index f536483bc3d5..3161b8b127c6 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -182,6 +182,10 @@
     'theme_overrides.css',
 ]
 
+html_js_files = [
+    'custom.js',
+]
+
 html_context = {
     "display_gitlab": True,
     "gitlab_user": "qemu-project",
diff --git a/docs/sphinx-static/custom.js b/docs/sphinx-static/custom.js
new file mode 100644
index 000000000000..71a86053051b
--- /dev/null
+++ b/docs/sphinx-static/custom.js
@@ -0,0 +1,9 @@
+document.addEventListener('keydown', (event) => {
+    // find a better way to look it up?
+    let search_input = document.getElementsByName('q')[0];
+
+    if (event.code === 'KeyS' && document.activeElement !== search_input) {
+        event.preventDefault();
+        search_input.focus();
+    }
+});
-- 
2.33.0.721.g106298f7f9


