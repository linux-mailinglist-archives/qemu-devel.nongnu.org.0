Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28732A2B44
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 14:12:38 +0100 (CET)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZZdV-0007xR-Uk
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 08:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZZar-0004Rp-50
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZZam-0003Nr-0v
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:09:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604322586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3hvqOjW7rYuo8tMqhIffzq8DNC5WH0yrkHpYl34dHk=;
 b=i9Z6ZpVJIGNZMuxntnmP9g+0t1EmdXi9OcoUR5A9S9+r2CPqqIbD/XC6EOOfPxgYkVq5vR
 vP2+BdLvq5rqci+uKlqCocR6Qq7t4XgTJTqEP3I7MJs64OOA/yR6ZpO+tqiE1UplEiy2Cw
 DOKqrcM60s03A3Kpim00BUpl618+4Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-8Mc2rZUtMNCknw2gfm3o_A-1; Mon, 02 Nov 2020 08:09:44 -0500
X-MC-Unique: 8Mc2rZUtMNCknw2gfm3o_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB3FB1868407;
 Mon,  2 Nov 2020 13:09:43 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-114-136.ams2.redhat.com [10.36.114.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2A3D1002C27;
 Mon,  2 Nov 2020 13:09:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] docs: add "page source" link to sphinx documentation
Date: Mon,  2 Nov 2020 13:09:26 +0000
Message-Id: <20201102130926.161183-5-berrange@redhat.com>
In-Reply-To: <20201102130926.161183-1-berrange@redhat.com>
References: <20201102130926.161183-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a link to the top of the sidebar in every docs page that takes the
user back to the source code in gitlab.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/_templates/editpage.html         | 5 +++++
 docs/conf.py                          | 1 +
 docs/devel/_templates/editpage.html   | 5 +++++
 docs/interop/_templates/editpage.html | 5 +++++
 docs/specs/_templates/editpage.html   | 5 +++++
 docs/system/_templates/editpage.html  | 5 +++++
 docs/tools/_templates/editpage.html   | 5 +++++
 docs/user/_templates/editpage.html    | 5 +++++
 8 files changed, 36 insertions(+)
 create mode 100644 docs/_templates/editpage.html
 create mode 100644 docs/devel/_templates/editpage.html
 create mode 100644 docs/interop/_templates/editpage.html
 create mode 100644 docs/specs/_templates/editpage.html
 create mode 100644 docs/system/_templates/editpage.html
 create mode 100644 docs/tools/_templates/editpage.html
 create mode 100644 docs/user/_templates/editpage.html

diff --git a/docs/_templates/editpage.html b/docs/_templates/editpage.html
new file mode 100644
index 0000000000..4319b0f5ac
--- /dev/null
+++ b/docs/_templates/editpage.html
@@ -0,0 +1,5 @@
+<div id="editpage">
+  <ul>
+    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/{{pagename}}.rst">Page source</a></li>
+  </ul>
+</div>
diff --git a/docs/conf.py b/docs/conf.py
index e584f68393..d40d8ff37b 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -177,6 +177,7 @@ html_theme_options = {
 html_sidebars = {
     '**': [
         'about.html',
+        'editpage.html',
         'navigation.html',
         'searchbox.html',
     ]
diff --git a/docs/devel/_templates/editpage.html b/docs/devel/_templates/editpage.html
new file mode 100644
index 0000000000..a86d22bca8
--- /dev/null
+++ b/docs/devel/_templates/editpage.html
@@ -0,0 +1,5 @@
+<div id="editpage">
+  <ul>
+    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/{{pagename}}.rst">Page source</a></li>
+  </ul>
+</div>
diff --git a/docs/interop/_templates/editpage.html b/docs/interop/_templates/editpage.html
new file mode 100644
index 0000000000..215e562681
--- /dev/null
+++ b/docs/interop/_templates/editpage.html
@@ -0,0 +1,5 @@
+<div id="editpage">
+  <ul>
+    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/{{pagename}}.rst">Page source</a></li>
+  </ul>
+</div>
diff --git a/docs/specs/_templates/editpage.html b/docs/specs/_templates/editpage.html
new file mode 100644
index 0000000000..aaa468aa98
--- /dev/null
+++ b/docs/specs/_templates/editpage.html
@@ -0,0 +1,5 @@
+<div id="editpage">
+  <ul>
+    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/specs/{{pagename}}.rst">Page source</a></li>
+  </ul>
+</div>
diff --git a/docs/system/_templates/editpage.html b/docs/system/_templates/editpage.html
new file mode 100644
index 0000000000..6586b2e257
--- /dev/null
+++ b/docs/system/_templates/editpage.html
@@ -0,0 +1,5 @@
+<div id="editpage">
+  <ul>
+    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/system/{{pagename}}.rst">Page source</a></li>
+  </ul>
+</div>
diff --git a/docs/tools/_templates/editpage.html b/docs/tools/_templates/editpage.html
new file mode 100644
index 0000000000..2a9c8fc92b
--- /dev/null
+++ b/docs/tools/_templates/editpage.html
@@ -0,0 +1,5 @@
+<div id="editpage">
+  <ul>
+    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/tools/{{pagename}}.rst">Page source</a></li>
+  </ul>
+</div>
diff --git a/docs/user/_templates/editpage.html b/docs/user/_templates/editpage.html
new file mode 100644
index 0000000000..1f5ee01e60
--- /dev/null
+++ b/docs/user/_templates/editpage.html
@@ -0,0 +1,5 @@
+<div id="editpage">
+  <ul>
+    <li><a href="https://gitlab.com/qemu-project/qemu/-/blob/master/docs/user/{{pagename}}.rst">Page source</a></li>
+  </ul>
+</div>
-- 
2.28.0


