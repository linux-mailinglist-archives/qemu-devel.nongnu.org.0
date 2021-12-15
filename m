Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C9347649C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:33:28 +0100 (CET)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbtv-0000xT-2h
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXP-00051v-Kv
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXL-0006kH-Iv
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvxcYsyaP0v5BZAHNJLsl2HEAojpbaOz0sxAR8aEhiw=;
 b=NFD0/HmlBHcm1BV9uSFSj5QeAKbjL5pIBRMCY075Sp/N/BYtEKULNRz+YylxvZ4gM5vuyS
 WsDerN551UWWo9gOJvCf0QXlmmnm0wiLw9JZ5Ack6r7KWD85eEkHjLyqLXH6ZlQrdj6bPl
 Q04zhJGwW1DciZL3pT4f2SW0Q8uN6Ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-FJeTCUBTMPOeZvh5i5BUHA-1; Wed, 15 Dec 2021 16:10:01 -0500
X-MC-Unique: FJeTCUBTMPOeZvh5i5BUHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BB80801962;
 Wed, 15 Dec 2021 21:10:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77C0847361;
 Wed, 15 Dec 2021 21:09:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 19/24] python: configure sphinx
Date: Wed, 15 Dec 2021 16:06:29 -0500
Message-Id: <20211215210634.3779791-20-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With a Sphinx project auto-generated, configure it to be something a bit
more useful. And pretty.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/conf.py | 45 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index c7ce779..7db99c2 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -9,18 +9,28 @@
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
 # documentation root, use os.path.abspath to make it absolute, like shown here.
-#
-# import os
-# import sys
-# sys.path.insert(0, '/home/jsnow/src/tmp/qemu.qmp/qemu')
+
+import os
+import sys
+sys.path.insert(0, os.path.abspath('../'))
 
 
 # -- Project information -----------------------------------------------------
 
-project = 'qemu'
-copyright = '2021, Author'
-author = 'Author'
+project = 'QEMU Monitor Protocol (QMP) Library'
+copyright = '2009-2021, QEMU Project'
+author = 'John Snow'
 
+try:
+    import setuptools_scm
+    extracted_version = setuptools_scm.get_version()
+except:
+    extracted_version = None
+finally:
+    if extracted_version:
+        version = release = extracted_version
+    else:
+        version = release = "unknown version"
 
 # -- General configuration ---------------------------------------------------
 
@@ -51,13 +61,30 @@ language = 'en'
 # This pattern also affects html_static_path and html_extra_path.
 exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']
 
+# Interpret `this` to be a cross-reference to "anything".
+default_role = 'any'
 
 # -- Options for HTML output -------------------------------------------------
 
 # The theme to use for HTML and HTML Help pages.  See the documentation for
 # a list of builtin themes.
 #
-html_theme = 'alabaster'
+html_theme = 'sphinx_rtd_theme'
+
+# https://sphinx-rtd-theme.readthedocs.io/en/stable/configuring.html#theme-options
+html_theme_options = {
+    'collapse_navigation': False,
+    'display_version': True,
+    'prev_next_buttons_location': 'both',
+}
+
+html_context = {
+    "display_gitlab": True,
+    "gitlab_user": "jsnow",
+    "gitlab_repo": "qemu.qmp",
+    "gitlab_version": "main",
+    "conf_py_path": "/docs/",
+}
 
 # Add any paths that contain custom static files (such as style sheets) here,
 # relative to this directory. They are copied after the builtin static files,
@@ -77,4 +104,4 @@ intersphinx_mapping = {
 # -- Options for todo extension ----------------------------------------------
 
 # If true, `todo` and `todoList` produce output, else they produce nothing.
-todo_include_todos = True
\ No newline at end of file
+todo_include_todos = True
-- 
2.31.1


