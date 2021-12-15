Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0FB476479
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:22:10 +0100 (CET)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbiz-0000VJ-6d
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:22:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXR-00051z-Fp
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXM-0006kg-La
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uMC9WY3xHvInV0vgIKMezUPUWPxqx62XoIDovZ1slY=;
 b=AVLaFjXbXlzbcpJpOLkadKPTZYkoAY0xiTWucMIuBekROVP2a1JrqLR2jCQCH21nuQdFur
 VVz6ntuYG25EKTmjKCu14nHxaAerF1s3bm8us0a58ztD5qXsOhMNgDqA5ZUfJL+kNm2NRy
 4GHzgy1MpIjDNK1AvxjSCE8qjDDrdbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-vmB9uyzYPwGHIG-kF7129Q-1; Wed, 15 Dec 2021 16:10:00 -0500
X-MC-Unique: vmB9uyzYPwGHIG-kF7129Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7418585B66C;
 Wed, 15 Dec 2021 21:09:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C35B5F4E1;
 Wed, 15 Dec 2021 21:09:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 18/24] add Sphinx documentation config stub
Date: Wed, 15 Dec 2021 16:06:28 -0500
Message-Id: <20211215210634.3779791-19-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
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

This is the result of this command:

sphinx-apidoc --separate \
              --no-toc \
              --module-first \
              --implicit-namespaces \
              --full \
              --ext-intersphinx \
              --ext-coverage \
              --ext-viewcode \
              -o docs/ \
              qemu/

(And `touch docs/_static/.gitignore`, to create an "empty" directory.)

This configuration is not yet functional, but I wanted to distinguish
between automatically generated boilerplate and intentional
configuration changes so as to document the entire process of getting
sphinx doc generation up, running, and fully configured.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/Makefile                | 20 +++++++++
 docs/conf.py                 | 80 ++++++++++++++++++++++++++++++++++++
 docs/index.rst               | 21 ++++++++++
 docs/make.bat                | 35 ++++++++++++++++
 docs/qemu.qmp.aqmp_tui.rst   |  7 ++++
 docs/qemu.qmp.error.rst      |  7 ++++
 docs/qemu.qmp.events.rst     |  7 ++++
 docs/qemu.qmp.legacy.rst     |  7 ++++
 docs/qemu.qmp.message.rst    |  7 ++++
 docs/qemu.qmp.models.rst     |  7 ++++
 docs/qemu.qmp.protocol.rst   |  7 ++++
 docs/qemu.qmp.qmp_client.rst |  7 ++++
 docs/qemu.qmp.qmp_shell.rst  |  7 ++++
 docs/qemu.qmp.rst            | 24 +++++++++++
 docs/qemu.qmp.util.rst       |  7 ++++
 docs/qemu.rst                | 10 +++++
 16 files changed, 260 insertions(+)
 create mode 100644 docs/Makefile
 create mode 100644 docs/conf.py
 create mode 100644 docs/index.rst
 create mode 100644 docs/make.bat
 create mode 100644 docs/qemu.qmp.aqmp_tui.rst
 create mode 100644 docs/qemu.qmp.error.rst
 create mode 100644 docs/qemu.qmp.events.rst
 create mode 100644 docs/qemu.qmp.legacy.rst
 create mode 100644 docs/qemu.qmp.message.rst
 create mode 100644 docs/qemu.qmp.models.rst
 create mode 100644 docs/qemu.qmp.protocol.rst
 create mode 100644 docs/qemu.qmp.qmp_client.rst
 create mode 100644 docs/qemu.qmp.qmp_shell.rst
 create mode 100644 docs/qemu.qmp.rst
 create mode 100644 docs/qemu.qmp.util.rst
 create mode 100644 docs/qemu.rst

diff --git a/docs/Makefile b/docs/Makefile
new file mode 100644
index 0000000..d4bb2cb
--- /dev/null
+++ b/docs/Makefile
@@ -0,0 +1,20 @@
+# Minimal makefile for Sphinx documentation
+#
+
+# You can set these variables from the command line, and also
+# from the environment for the first two.
+SPHINXOPTS    ?=3D
+SPHINXBUILD   ?=3D sphinx-build
+SOURCEDIR     =3D .
+BUILDDIR      =3D _build
+
+# Put it first so that "make" without argument is like "make help".
+help:
+=09@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
+
+.PHONY: help Makefile
+
+# Catch-all target: route all unknown targets to Sphinx using the new
+# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
+%: Makefile
+=09@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
diff --git a/docs/conf.py b/docs/conf.py
new file mode 100644
index 0000000..c7ce779
--- /dev/null
+++ b/docs/conf.py
@@ -0,0 +1,80 @@
+# Configuration file for the Sphinx documentation builder.
+#
+# This file only contains a selection of the most common options. For a fu=
ll
+# list see the documentation:
+# https://www.sphinx-doc.org/en/master/usage/configuration.html
+
+# -- Path setup ----------------------------------------------------------=
----
+
+# If extensions (or modules to document with autodoc) are in another direc=
tory,
+# add these directories to sys.path here. If the directory is relative to =
the
+# documentation root, use os.path.abspath to make it absolute, like shown =
here.
+#
+# import os
+# import sys
+# sys.path.insert(0, '/home/jsnow/src/tmp/qemu.qmp/qemu')
+
+
+# -- Project information -------------------------------------------------=
----
+
+project =3D 'qemu'
+copyright =3D '2021, Author'
+author =3D 'Author'
+
+
+# -- General configuration -----------------------------------------------=
----
+
+# Add any Sphinx extension module names here, as strings. They can be
+# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
+# ones.
+extensions =3D [
+    'sphinx.ext.autodoc',
+    'sphinx.ext.viewcode',
+    'sphinx.ext.todo',
+    'sphinx.ext.intersphinx',
+    'sphinx.ext.coverage',
+    'sphinx.ext.viewcode',
+]
+
+# Add any paths that contain templates here, relative to this directory.
+templates_path =3D ['_templates']
+
+# The language for content autogenerated by Sphinx. Refer to documentation
+# for a list of supported languages.
+#
+# This is also used if you do content translation via gettext catalogs.
+# Usually you set "language" from the command line for these cases.
+language =3D 'en'
+
+# List of patterns, relative to source directory, that match files and
+# directories to ignore when looking for source files.
+# This pattern also affects html_static_path and html_extra_path.
+exclude_patterns =3D ['_build', 'Thumbs.db', '.DS_Store']
+
+
+# -- Options for HTML output ---------------------------------------------=
----
+
+# The theme to use for HTML and HTML Help pages.  See the documentation fo=
r
+# a list of builtin themes.
+#
+html_theme =3D 'alabaster'
+
+# Add any paths that contain custom static files (such as style sheets) he=
re,
+# relative to this directory. They are copied after the builtin static fil=
es,
+# so a file named "default.css" will overwrite the builtin "default.css".
+html_static_path =3D ['_static']
+
+
+# -- Extension configuration ---------------------------------------------=
----
+
+# -- Options for intersphinx extension -----------------------------------=
----
+
+# Example configuration for intersphinx: refer to the Python standard libr=
ary.
+intersphinx_mapping =3D {
+    'python': ('https://docs.python.org/3', None),
+}
+
+# -- Options for todo extension ------------------------------------------=
----
+
+# If true, `todo` and `todoList` produce output, else they produce nothing=
.
+todo_include_todos =3D True
\ No newline at end of file
diff --git a/docs/index.rst b/docs/index.rst
new file mode 100644
index 0000000..bff786a
--- /dev/null
+++ b/docs/index.rst
@@ -0,0 +1,21 @@
+.. qemu documentation master file, created by
+   sphinx-quickstart on Mon Dec 13 16:50:29 2021.
+   You can adapt this file completely to your liking, but it should at lea=
st
+   contain the root `toctree` directive.
+
+Welcome to qemu's documentation!
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. toctree::
+   :maxdepth: 4
+   :caption: Contents:
+
+   qemu
+
+
+Indices and tables
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+* :ref:`genindex`
+* :ref:`modindex`
+* :ref:`search`
diff --git a/docs/make.bat b/docs/make.bat
new file mode 100644
index 0000000..2119f51
--- /dev/null
+++ b/docs/make.bat
@@ -0,0 +1,35 @@
+@ECHO OFF=0D
+=0D
+pushd %~dp0=0D
+=0D
+REM Command file for Sphinx documentation=0D
+=0D
+if "%SPHINXBUILD%" =3D=3D "" (=0D
+=09set SPHINXBUILD=3Dsphinx-build=0D
+)=0D
+set SOURCEDIR=3D.=0D
+set BUILDDIR=3D_build=0D
+=0D
+if "%1" =3D=3D "" goto help=0D
+=0D
+%SPHINXBUILD% >NUL 2>NUL=0D
+if errorlevel 9009 (=0D
+=09echo.=0D
+=09echo.The 'sphinx-build' command was not found. Make sure you have Sphin=
x=0D
+=09echo.installed, then set the SPHINXBUILD environment variable to point=
=0D
+=09echo.to the full path of the 'sphinx-build' executable. Alternatively y=
ou=0D
+=09echo.may add the Sphinx directory to PATH.=0D
+=09echo.=0D
+=09echo.If you don't have Sphinx installed, grab it from=0D
+=09echo.http://sphinx-doc.org/=0D
+=09exit /b 1=0D
+)=0D
+=0D
+%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%=0D
+goto end=0D
+=0D
+:help=0D
+%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%=0D
+=0D
+:end=0D
+popd=0D
diff --git a/docs/qemu.qmp.aqmp_tui.rst b/docs/qemu.qmp.aqmp_tui.rst
new file mode 100644
index 0000000..a5c55f9
--- /dev/null
+++ b/docs/qemu.qmp.aqmp_tui.rst
@@ -0,0 +1,7 @@
+qemu.qmp.aqmp\_tui module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+.. automodule:: qemu.qmp.aqmp_tui
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.error.rst b/docs/qemu.qmp.error.rst
new file mode 100644
index 0000000..89f069d
--- /dev/null
+++ b/docs/qemu.qmp.error.rst
@@ -0,0 +1,7 @@
+qemu.qmp.error module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp.error
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.events.rst b/docs/qemu.qmp.events.rst
new file mode 100644
index 0000000..a4b9fd3
--- /dev/null
+++ b/docs/qemu.qmp.events.rst
@@ -0,0 +1,7 @@
+qemu.qmp.events module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp.events
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.legacy.rst b/docs/qemu.qmp.legacy.rst
new file mode 100644
index 0000000..83abd38
--- /dev/null
+++ b/docs/qemu.qmp.legacy.rst
@@ -0,0 +1,7 @@
+qemu.qmp.legacy module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp.legacy
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.message.rst b/docs/qemu.qmp.message.rst
new file mode 100644
index 0000000..765ae63
--- /dev/null
+++ b/docs/qemu.qmp.message.rst
@@ -0,0 +1,7 @@
+qemu.qmp.message module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp.message
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.models.rst b/docs/qemu.qmp.models.rst
new file mode 100644
index 0000000..55585b7
--- /dev/null
+++ b/docs/qemu.qmp.models.rst
@@ -0,0 +1,7 @@
+qemu.qmp.models module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp.models
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.protocol.rst b/docs/qemu.qmp.protocol.rst
new file mode 100644
index 0000000..fca55ad
--- /dev/null
+++ b/docs/qemu.qmp.protocol.rst
@@ -0,0 +1,7 @@
+qemu.qmp.protocol module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp.protocol
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.qmp_client.rst b/docs/qemu.qmp.qmp_client.rst
new file mode 100644
index 0000000..1d5beda
--- /dev/null
+++ b/docs/qemu.qmp.qmp_client.rst
@@ -0,0 +1,7 @@
+qemu.qmp.qmp\_client module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+.. automodule:: qemu.qmp.qmp_client
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.qmp_shell.rst b/docs/qemu.qmp.qmp_shell.rst
new file mode 100644
index 0000000..0510cd3
--- /dev/null
+++ b/docs/qemu.qmp.qmp_shell.rst
@@ -0,0 +1,7 @@
+qemu.qmp.qmp\_shell module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+.. automodule:: qemu.qmp.qmp_shell
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.qmp.rst b/docs/qemu.qmp.rst
new file mode 100644
index 0000000..305e5b0
--- /dev/null
+++ b/docs/qemu.qmp.rst
@@ -0,0 +1,24 @@
+qemu.qmp package
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp
+   :members:
+   :undoc-members:
+   :show-inheritance:
+
+Submodules
+----------
+
+.. toctree::
+   :maxdepth: 4
+
+   qemu.qmp.aqmp_tui
+   qemu.qmp.error
+   qemu.qmp.events
+   qemu.qmp.legacy
+   qemu.qmp.message
+   qemu.qmp.models
+   qemu.qmp.protocol
+   qemu.qmp.qmp_client
+   qemu.qmp.qmp_shell
+   qemu.qmp.util
diff --git a/docs/qemu.qmp.util.rst b/docs/qemu.qmp.util.rst
new file mode 100644
index 0000000..8f2ac87
--- /dev/null
+++ b/docs/qemu.qmp.util.rst
@@ -0,0 +1,7 @@
+qemu.qmp.util module
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. automodule:: qemu.qmp.util
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/qemu.rst b/docs/qemu.rst
new file mode 100644
index 0000000..f33a4f4
--- /dev/null
+++ b/docs/qemu.rst
@@ -0,0 +1,10 @@
+qemu namespace
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Subpackages
+-----------
+
+.. toctree::
+   :maxdepth: 4
+
+   qemu.qmp
--=20
2.31.1


