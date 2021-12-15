Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B615F47648C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:28:29 +0100 (CET)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbp5-00032D-Sd
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXP-00051u-Ho
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXM-0006ko-LR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/iCBe5M6HPriY9xDBWl3NX2LHiyzJRybtXTRiVxdgM=;
 b=EgvDGiB09MBgJrIVbEYBXDbn5U9wHlqmuuTEadI5YqV+ZlNF8GS/ML1egQwkWr4bMc7NTD
 rjysCurIJLm3l9kT/TAqEYHAz2lTHF+Zb46oUU+6paXEvrDuV53i33YrbR3eiQYk6CN0Rp
 /1bMl2PIzXG+mOliaJ4MBVNeoh/xwG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-ApEYCzN_M22uDS9kPWxtzQ-1; Wed, 15 Dec 2021 16:10:03 -0500
X-MC-Unique: ApEYCzN_M22uDS9kPWxtzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A3A51883627;
 Wed, 15 Dec 2021 21:10:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 819E25F4E9;
 Wed, 15 Dec 2021 21:10:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 20/24] python: adjust apidoc stubs
Date: Wed, 15 Dec 2021 16:06:30 -0500
Message-Id: <20211215210634.3779791-21-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Change the configuration for the generated apidoc stubs.

Some of the changes, as a summary:

- Collapse the hierarchy to omit the QEMU namespace page
- Add more meaningful titles to the subpackages
- Prefer source ordering in most places
- Do not index pages that do not define their own symbols (via __all__)
- Show hidden members for qemu.aqmp.protocol, since this interface is
  designed to be extended.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/index.rst               |  6 +++---
 docs/qemu.qmp.aqmp_tui.rst   |  7 -------
 docs/qemu.qmp.error.rst      |  1 +
 docs/qemu.qmp.message.rst    |  1 +
 docs/qemu.qmp.models.rst     |  1 +
 docs/qemu.qmp.protocol.rst   |  2 ++
 docs/qemu.qmp.qmp_client.rst |  1 +
 docs/qemu.qmp.qmp_shell.rst  |  7 -------
 docs/qemu.qmp.rst            |  8 ++++----
 docs/qemu.qmp.util.rst       |  1 +
 docs/qemu.rst                | 10 ----------
 11 files changed, 14 insertions(+), 31 deletions(-)
 delete mode 100644 docs/qemu.qmp.aqmp_tui.rst
 delete mode 100644 docs/qemu.qmp.qmp_shell.rst
 delete mode 100644 docs/qemu.rst

diff --git a/docs/index.rst b/docs/index.rst
index bff786a..2c7ccdb 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -3,14 +3,14 @@
    You can adapt this file completely to your liking, but it should at least
    contain the root `toctree` directive.
 
-Welcome to qemu's documentation!
-================================
+qemu.qmp library documentation
+==============================
 
 .. toctree::
    :maxdepth: 4
    :caption: Contents:
 
-   qemu
+   qemu.qmp
 
 
 Indices and tables
diff --git a/docs/qemu.qmp.aqmp_tui.rst b/docs/qemu.qmp.aqmp_tui.rst
deleted file mode 100644
index a5c55f9..0000000
--- a/docs/qemu.qmp.aqmp_tui.rst
+++ /dev/null
@@ -1,7 +0,0 @@
-qemu.qmp.aqmp\_tui module
-=========================
-
-.. automodule:: qemu.qmp.aqmp_tui
-   :members:
-   :undoc-members:
-   :show-inheritance:
diff --git a/docs/qemu.qmp.error.rst b/docs/qemu.qmp.error.rst
index 89f069d..5105330 100644
--- a/docs/qemu.qmp.error.rst
+++ b/docs/qemu.qmp.error.rst
@@ -5,3 +5,4 @@ qemu.qmp.error module
    :members:
    :undoc-members:
    :show-inheritance:
+   :member-order: bysource
diff --git a/docs/qemu.qmp.message.rst b/docs/qemu.qmp.message.rst
index 765ae63..b824dc6 100644
--- a/docs/qemu.qmp.message.rst
+++ b/docs/qemu.qmp.message.rst
@@ -5,3 +5,4 @@ qemu.qmp.message module
    :members:
    :undoc-members:
    :show-inheritance:
+   :member-order: bysource
diff --git a/docs/qemu.qmp.models.rst b/docs/qemu.qmp.models.rst
index 55585b7..1e2f608 100644
--- a/docs/qemu.qmp.models.rst
+++ b/docs/qemu.qmp.models.rst
@@ -5,3 +5,4 @@ qemu.qmp.models module
    :members:
    :undoc-members:
    :show-inheritance:
+   :member-order: bysource
diff --git a/docs/qemu.qmp.protocol.rst b/docs/qemu.qmp.protocol.rst
index fca55ad..947e15f 100644
--- a/docs/qemu.qmp.protocol.rst
+++ b/docs/qemu.qmp.protocol.rst
@@ -5,3 +5,5 @@ qemu.qmp.protocol module
    :members:
    :undoc-members:
    :show-inheritance:
+   :private-members:
+   :member-order: bysource
diff --git a/docs/qemu.qmp.qmp_client.rst b/docs/qemu.qmp.qmp_client.rst
index 1d5beda..83b8101 100644
--- a/docs/qemu.qmp.qmp_client.rst
+++ b/docs/qemu.qmp.qmp_client.rst
@@ -5,3 +5,4 @@ qemu.qmp.qmp\_client module
    :members:
    :undoc-members:
    :show-inheritance:
+   :member-order: bysource
diff --git a/docs/qemu.qmp.qmp_shell.rst b/docs/qemu.qmp.qmp_shell.rst
deleted file mode 100644
index 0510cd3..0000000
--- a/docs/qemu.qmp.qmp_shell.rst
+++ /dev/null
@@ -1,7 +0,0 @@
-qemu.qmp.qmp\_shell module
-==========================
-
-.. automodule:: qemu.qmp.qmp_shell
-   :members:
-   :undoc-members:
-   :show-inheritance:
diff --git a/docs/qemu.qmp.rst b/docs/qemu.qmp.rst
index 305e5b0..d1d2cd3 100644
--- a/docs/qemu.qmp.rst
+++ b/docs/qemu.qmp.rst
@@ -1,10 +1,12 @@
-qemu.qmp package
-================
+qemu.qmp - Asynchronous QEMU Monitor Protocol (QMP) library
+===========================================================
 
 .. automodule:: qemu.qmp
    :members:
    :undoc-members:
    :show-inheritance:
+   :noindex:
+   :member-order: bysource
 
 Submodules
 ----------
@@ -12,7 +14,6 @@ Submodules
 .. toctree::
    :maxdepth: 4
 
-   qemu.qmp.aqmp_tui
    qemu.qmp.error
    qemu.qmp.events
    qemu.qmp.legacy
@@ -20,5 +21,4 @@ Submodules
    qemu.qmp.models
    qemu.qmp.protocol
    qemu.qmp.qmp_client
-   qemu.qmp.qmp_shell
    qemu.qmp.util
diff --git a/docs/qemu.qmp.util.rst b/docs/qemu.qmp.util.rst
index 8f2ac87..24a6f82 100644
--- a/docs/qemu.qmp.util.rst
+++ b/docs/qemu.qmp.util.rst
@@ -5,3 +5,4 @@ qemu.qmp.util module
    :members:
    :undoc-members:
    :show-inheritance:
+   :member-order: bysource
diff --git a/docs/qemu.rst b/docs/qemu.rst
deleted file mode 100644
index f33a4f4..0000000
--- a/docs/qemu.rst
+++ /dev/null
@@ -1,10 +0,0 @@
-qemu namespace
-==============
-
-Subpackages
------------
-
-.. toctree::
-   :maxdepth: 4
-
-   qemu.qmp
-- 
2.31.1


