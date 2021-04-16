Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409D3628B0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:33:24 +0200 (CEST)
Received: from localhost ([::1]:45044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXUDT-0002hk-Lo
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXU8o-0006fa-ID
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lXU8l-0003PF-ND
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:28:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618601310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=APAYq8Ss75Dh0a4AmTZFlrV0aV31wP+2x/76K4SPQr8=;
 b=bSjbMB9fr8Lv9Ahtv7X2YfqKTabRCrfcbcfS6TqZ0UD4P2SS7vV8/NKzU94z4wZCR9k0+G
 fklSupcbhc1LjbnDb/kpSlh2ArKE2vabPnTjg6BGvngQ4dfQDLEQYMtn8tOwL8gFoUwYwe
 Wcyz+Myu8L1EM/ng9Rwecv4GneGrUFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-WEHU6uhzP-Ci5pb2um56wA-1; Fri, 16 Apr 2021 15:28:28 -0400
X-MC-Unique: WEHU6uhzP-Ci5pb2um56wA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45FE083DD22
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 19:28:27 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82B761045D01;
 Fri, 16 Apr 2021 19:28:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] [DO-NOT-MERGE] docs: enable sphinx-autodoc for
 scripts/qapi
Date: Fri, 16 Apr 2021 15:28:18 -0400
Message-Id: <20210416192819.2958482-4-jsnow@redhat.com>
In-Reply-To: <20210416192819.2958482-1-jsnow@redhat.com>
References: <20210416192819.2958482-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is just POC to prove that the docstrings, where they are written,
are correct to some minimum standard. It is included here for
reviewing/testing convenience.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/conf.py                          |  3 ++-
 docs/devel/index.rst                  |  1 +
 docs/devel/python/index.rst           |  7 +++++++
 docs/devel/python/qapi.commands.rst   |  7 +++++++
 docs/devel/python/qapi.common.rst     |  7 +++++++
 docs/devel/python/qapi.error.rst      |  7 +++++++
 docs/devel/python/qapi.events.rst     |  7 +++++++
 docs/devel/python/qapi.expr.rst       |  7 +++++++
 docs/devel/python/qapi.gen.rst        |  7 +++++++
 docs/devel/python/qapi.introspect.rst |  7 +++++++
 docs/devel/python/qapi.main.rst       |  7 +++++++
 docs/devel/python/qapi.parser.rst     |  8 ++++++++
 docs/devel/python/qapi.rst            | 26 ++++++++++++++++++++++++++
 docs/devel/python/qapi.schema.rst     |  7 +++++++
 docs/devel/python/qapi.source.rst     |  7 +++++++
 docs/devel/python/qapi.types.rst      |  7 +++++++
 docs/devel/python/qapi.visit.rst      |  7 +++++++
 17 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/python/index.rst
 create mode 100644 docs/devel/python/qapi.commands.rst
 create mode 100644 docs/devel/python/qapi.common.rst
 create mode 100644 docs/devel/python/qapi.error.rst
 create mode 100644 docs/devel/python/qapi.events.rst
 create mode 100644 docs/devel/python/qapi.expr.rst
 create mode 100644 docs/devel/python/qapi.gen.rst
 create mode 100644 docs/devel/python/qapi.introspect.rst
 create mode 100644 docs/devel/python/qapi.main.rst
 create mode 100644 docs/devel/python/qapi.parser.rst
 create mode 100644 docs/devel/python/qapi.rst
 create mode 100644 docs/devel/python/qapi.schema.rst
 create mode 100644 docs/devel/python/qapi.source.rst
 create mode 100644 docs/devel/python/qapi.types.rst
 create mode 100644 docs/devel/python/qapi.visit.rst

diff --git a/docs/conf.py b/docs/conf.py
index 8752e436ebe..628e5dceb4b 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -70,7 +70,8 @@
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
+extensions = ['kerneldoc', 'qmp_lexer', 'hxtool',
+              'depfile', 'qapidoc', 'sphinx.ext.autodoc']
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 6cf7e2d2330..01d83a2eaf4 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -42,3 +42,4 @@ Contents:
    qom
    block-coroutine-wrapper
    multi-process
+   python/index
diff --git a/docs/devel/python/index.rst b/docs/devel/python/index.rst
new file mode 100644
index 00000000000..31c470154b3
--- /dev/null
+++ b/docs/devel/python/index.rst
@@ -0,0 +1,7 @@
+qapi
+====
+
+.. toctree::
+   :maxdepth: 4
+
+   qapi
diff --git a/docs/devel/python/qapi.commands.rst b/docs/devel/python/qapi.commands.rst
new file mode 100644
index 00000000000..018f7b08a9c
--- /dev/null
+++ b/docs/devel/python/qapi.commands.rst
@@ -0,0 +1,7 @@
+qapi.commands module
+====================
+
+.. automodule:: qapi.commands
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.common.rst b/docs/devel/python/qapi.common.rst
new file mode 100644
index 00000000000..128a90d74be
--- /dev/null
+++ b/docs/devel/python/qapi.common.rst
@@ -0,0 +1,7 @@
+qapi.common module
+==================
+
+.. automodule:: qapi.common
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.error.rst b/docs/devel/python/qapi.error.rst
new file mode 100644
index 00000000000..980e32b63de
--- /dev/null
+++ b/docs/devel/python/qapi.error.rst
@@ -0,0 +1,7 @@
+qapi.error module
+=================
+
+.. automodule:: qapi.error
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.events.rst b/docs/devel/python/qapi.events.rst
new file mode 100644
index 00000000000..1fce85b044e
--- /dev/null
+++ b/docs/devel/python/qapi.events.rst
@@ -0,0 +1,7 @@
+qapi.events module
+==================
+
+.. automodule:: qapi.events
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.expr.rst b/docs/devel/python/qapi.expr.rst
new file mode 100644
index 00000000000..0660270629c
--- /dev/null
+++ b/docs/devel/python/qapi.expr.rst
@@ -0,0 +1,7 @@
+qapi.expr module
+================
+
+.. automodule:: qapi.expr
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.gen.rst b/docs/devel/python/qapi.gen.rst
new file mode 100644
index 00000000000..7b495fd4bf2
--- /dev/null
+++ b/docs/devel/python/qapi.gen.rst
@@ -0,0 +1,7 @@
+qapi.gen module
+===============
+
+.. automodule:: qapi.gen
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.introspect.rst b/docs/devel/python/qapi.introspect.rst
new file mode 100644
index 00000000000..f65ebfccd1b
--- /dev/null
+++ b/docs/devel/python/qapi.introspect.rst
@@ -0,0 +1,7 @@
+qapi.introspect module
+======================
+
+.. automodule:: qapi.introspect
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.main.rst b/docs/devel/python/qapi.main.rst
new file mode 100644
index 00000000000..1255fcda633
--- /dev/null
+++ b/docs/devel/python/qapi.main.rst
@@ -0,0 +1,7 @@
+qapi.main module
+================
+
+.. automodule:: qapi.main
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.parser.rst b/docs/devel/python/qapi.parser.rst
new file mode 100644
index 00000000000..1a8f7b347eb
--- /dev/null
+++ b/docs/devel/python/qapi.parser.rst
@@ -0,0 +1,8 @@
+qapi.parser module
+==================
+
+.. automodule:: qapi.parser
+   :members:
+   :undoc-members:
+   :show-inheritance:
+   :private-members:
diff --git a/docs/devel/python/qapi.rst b/docs/devel/python/qapi.rst
new file mode 100644
index 00000000000..c762019aad3
--- /dev/null
+++ b/docs/devel/python/qapi.rst
@@ -0,0 +1,26 @@
+qapi package
+============
+
+.. automodule:: qapi
+   :members:
+   :undoc-members:
+   :show-inheritance:
+
+Submodules
+----------
+
+.. toctree::
+
+   qapi.commands
+   qapi.common
+   qapi.error
+   qapi.events
+   qapi.expr
+   qapi.gen
+   qapi.introspect
+   qapi.main
+   qapi.parser
+   qapi.schema
+   qapi.source
+   qapi.types
+   qapi.visit
diff --git a/docs/devel/python/qapi.schema.rst b/docs/devel/python/qapi.schema.rst
new file mode 100644
index 00000000000..a08f75ed720
--- /dev/null
+++ b/docs/devel/python/qapi.schema.rst
@@ -0,0 +1,7 @@
+qapi.schema module
+==================
+
+.. automodule:: qapi.schema
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.source.rst b/docs/devel/python/qapi.source.rst
new file mode 100644
index 00000000000..e61e9f60212
--- /dev/null
+++ b/docs/devel/python/qapi.source.rst
@@ -0,0 +1,7 @@
+qapi.source module
+==================
+
+.. automodule:: qapi.source
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.types.rst b/docs/devel/python/qapi.types.rst
new file mode 100644
index 00000000000..6eea827557d
--- /dev/null
+++ b/docs/devel/python/qapi.types.rst
@@ -0,0 +1,7 @@
+qapi.types module
+=================
+
+.. automodule:: qapi.types
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.visit.rst b/docs/devel/python/qapi.visit.rst
new file mode 100644
index 00000000000..84307cbc236
--- /dev/null
+++ b/docs/devel/python/qapi.visit.rst
@@ -0,0 +1,7 @@
+qapi.visit module
+=================
+
+.. automodule:: qapi.visit
+   :members:
+   :undoc-members:
+   :show-inheritance:
-- 
2.30.2


