Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4368F2AD4D1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:23:55 +0100 (CET)
Received: from localhost ([::1]:59754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRkg-0006UX-9E
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZO-0007Jw-U2
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kcRZM-0004es-NH
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gOj6U+5DbDGGDujK1ny/ZeusJBTzYYK5MdhIa7oxTc0=;
 b=Sr2Md9pRjeiqOxXBaj8Mu3bXKd4JmLaxpXZLBKccZryx1TjeDQMhpN1mQftAwzXkVGPXS9
 qRJxqbSVs2sqkTjb2h6bR35KPi0W3eaVq5JM2qaEfQrzrD0hIALiUIkqUZ+FYwtoLb1Kpl
 9ndgpBYpXm5tEfDN22StYk1NKAsco14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-zme3jFfCMWiC-jCWzMMd3Q-1; Tue, 10 Nov 2020 06:12:09 -0500
X-MC-Unique: zme3jFfCMWiC-jCWzMMd3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA3957204;
 Tue, 10 Nov 2020 11:12:08 +0000 (UTC)
Received: from thuth.com (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97A2110013D9;
 Tue, 10 Nov 2020 11:12:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/19] docs: add "page source" link to sphinx documentation
Date: Tue, 10 Nov 2020 12:11:28 +0100
Message-Id: <20201110111132.559399-16-thuth@redhat.com>
In-Reply-To: <20201110111132.559399-1-thuth@redhat.com>
References: <20201110111132.559399-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Add a link to the top of the sidebar in every docs page that takes the
user back to the source code in gitlab.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20201102130926.161183-5-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.18.4


