Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73342EF43
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 13:04:59 +0200 (CEST)
Received: from localhost ([::1]:48760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbL1G-0001ji-1H
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 07:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKrc-0005Op-61
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:55:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKra-0005DZ-Mk
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmosUJaBTO0T7FW+vyaHViGgY8ET9e7GN1e3bbH+2M4=;
 b=Z8f88c2tN/TBRrZOKF3zt9AxzEFydKFcd4C/nKj2eItovDiaGtdZ8dJqrAdmbAbKgDApqi
 npjC4BbCrbo/blf1hYtHDv8H17zFjxAuUhi3MVOdBZykgVkWYBUHojusjon9wgCa1RMc7B
 kcy0aFAYfhfEQ8nxP7h/pT9y6SCUjjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-utB5ShQoOdmm_Kt_Fs4GQg-1; Fri, 15 Oct 2021 06:54:54 -0400
X-MC-Unique: utB5ShQoOdmm_Kt_Fs4GQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A59C410066FF;
 Fri, 15 Oct 2021 10:54:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F9601980E;
 Fri, 15 Oct 2021 10:54:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] docs/sphinx: add 's' keyboard binding to focus search
Date: Fri, 15 Oct 2021 14:53:44 +0400
Message-Id: <20211015105344.152591-9-marcandre.lureau@redhat.com>
In-Reply-To: <20211015105344.152591-1-marcandre.lureau@redhat.com>
References: <20211015105344.152591-1-marcandre.lureau@redhat.com>
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

This is pretty ubiquitous. ('/' is already taken by some browsers for
quick search)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/conf.py                 | 4 ++++
 docs/sphinx-static/custom.js | 9 +++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 docs/sphinx-static/custom.js

diff --git a/docs/conf.py b/docs/conf.py
index f536483bc3..3161b8b127 100644
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
index 0000000000..71a8605305
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


