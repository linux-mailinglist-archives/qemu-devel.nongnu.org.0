Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D952F36DC
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:18:39 +0100 (CET)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNJW-00067W-Ex
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:18:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzj-0001gi-27
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:11 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzg-0006zo-49
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:10 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r7so3245881wrc.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wPGXBSDCrBYajP3jT4AxQqAAQh1tAV7hwBx6HvckSBM=;
 b=DtBF6ZgGf7sp7+L7ZUl4f6fhQM6qzo0TBHVR0ui0Kv5m4X/oym1Trea+/FryUxL+uc
 TPPs0EOsT0aovPBLVDUSXGLB5nRUqJTGguuLY1Hq8so1PXTNngcofQhom4M0uD6KqcXh
 QI2tIze8crHFLHTkQvq1nU1wHaLej1A6uy+oAGGBlYOxG63LI1/64bPxmqf8GnU+9+Ce
 eDeYuMtk0SK9zoQaO59wKt9afFj2+dZ0vYnhX1bLaXou4YYAcVX9tI1mHYk1omrgqtGM
 6xZihiyiOZ8BzhoQQDgKq7rRirED0ZIuBED89UPuCS7fn3PZEbgt9Gqo9N5lAbpxVXpT
 vMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPGXBSDCrBYajP3jT4AxQqAAQh1tAV7hwBx6HvckSBM=;
 b=tNGQhlP8B8W9ivMALGjkXX9aSoUqGiab1TP8PDobPNl2N9fWuJgQxi/+49ttu6uaqD
 KBKF1Hn65zffwHeQXotaE1BjVZJRTcL1kswHEXWbm6xg3ZvkhdVMNfzVMks5mFTlB9Fn
 Kc6s/yJZkKu1UQ0ObneVfDKYQKPvSFSGQZu2kTsfMeb6UYZEFmURZH76dOCNfdjFER/3
 OydfvrLAGzyZ4v+hT3cjqYshID5I8WpPgDLFmyXRbV6dQTEZGwdcDevHYBUuQUQrC6sE
 1JnmPdf8KzY10UjX8nSwb21LKzlhJjMfDoxLeCEfL6dPMJNwU37aeXUebpwnNrqnqTBU
 Fnwg==
X-Gm-Message-State: AOAM530F3/aaf+UyCl948WmPAyPJqeY9CJyf8O1xHHMszhTX1g5Uc8FU
 VTPk8mePM6IDcmtehrX0k1oqxc15npq8Rg==
X-Google-Smtp-Source: ABdhPJx7bRCicU4OOQ3z5+0rybDMEkgLDAXdYeK9yEcejZJuzVtiFSmWijmi44vh3x1GtZLIuV8KNg==
X-Received: by 2002:a5d:5913:: with SMTP id v19mr5274163wrd.207.1610470685193; 
 Tue, 12 Jan 2021 08:58:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] docs: Build and install all the docs in a single manual
Date: Tue, 12 Jan 2021 16:57:40 +0000
Message-Id: <20210112165750.30475-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we first converted our documentation to Sphinx, we split it into
multiple manuals (system, interop, tools, etc), which are all built
separately.  The primary driver for this was wanting to be able to
avoid shipping the 'devel' manual to end-users.  However, this is
working against the grain of the way Sphinx wants to be used and
causes some annoyances:
 * Cross-references between documents become much harder or
   possibly impossible
 * There is no single index to the whole documentation
 * Within one manual there's no links or table-of-contents info
   that lets you easily navigate to the others
 * The devel manual doesn't get published on the QEMU website
   (it would be nice to able to refer to it there)

Merely hiding our developer documentation from end users seems like
it's not enough benefit for these costs.  Combine all the
documentation into a single manual (the same way that the readthedocs
site builds it) and install the whole thing.  The previous manual
divisions remain as the new top level sections in the manual.

 * The per-manual conf.py files are no longer needed
 * The man_pages[] specifications previously in each per-manual
   conf.py move to the top level conf.py
 * docs/meson.build logic is simplified as we now only need to run
   Sphinx once for the HTML and then once for the manpages5B
 * The old index.html.in that produced the top-level page with
   links to each manual is no longer needed

Unfortunately this means that we now have to build the HTML
documentation into docs/manual in the build tree rather than directly
into docs/; otherwise it is too awkward to ensure we install only the
built manual and not also the dependency info, stamp file, etc.  The
manual still ends up in the same place in the final installed
directory, but anybody who was consulting documentation from within
the build tree will have to adjust where they're looking.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20210108161416.21129-3-peter.maydell@linaro.org
---
 docs/conf.py         | 46 ++++++++++++++++++++++++++++++-
 docs/devel/conf.py   | 15 -----------
 docs/index.html.in   | 17 ------------
 docs/interop/conf.py | 28 -------------------
 docs/meson.build     | 64 +++++++++++++++++---------------------------
 docs/specs/conf.py   | 16 -----------
 docs/system/conf.py  | 28 -------------------
 docs/tools/conf.py   | 37 -------------------------
 docs/user/conf.py    | 15 -----------
 9 files changed, 70 insertions(+), 196 deletions(-)
 delete mode 100644 docs/devel/conf.py
 delete mode 100644 docs/index.html.in
 delete mode 100644 docs/interop/conf.py
 delete mode 100644 docs/specs/conf.py
 delete mode 100644 docs/system/conf.py
 delete mode 100644 docs/tools/conf.py
 delete mode 100644 docs/user/conf.py

diff --git a/docs/conf.py b/docs/conf.py
index d40d8ff37ba..2ee61118725 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -224,7 +224,51 @@ latex_documents = [
 
 # -- Options for manual page output ---------------------------------------
 # Individual manual/conf.py can override this to create man pages
-man_pages = []
+man_pages = [
+    ('interop/qemu-ga', 'qemu-ga',
+     'QEMU Guest Agent',
+     ['Michael Roth <mdroth@linux.vnet.ibm.com>'], 8),
+    ('interop/qemu-ga-ref', 'qemu-ga-ref',
+     'QEMU Guest Agent Protocol Reference',
+     [], 7),
+    ('interop/qemu-qmp-ref', 'qemu-qmp-ref',
+     'QEMU QMP Reference Manual',
+     [], 7),
+    ('interop/qemu-storage-daemon-qmp-ref', 'qemu-storage-daemon-qmp-ref',
+     'QEMU Storage Daemon QMP Reference Manual',
+     [], 7),
+    ('system/qemu-manpage', 'qemu',
+     'QEMU User Documentation',
+     ['Fabrice Bellard'], 1),
+    ('system/qemu-block-drivers', 'qemu-block-drivers',
+     'QEMU block drivers reference',
+     ['Fabrice Bellard and the QEMU Project developers'], 7),
+    ('system/qemu-cpu-models', 'qemu-cpu-models',
+     'QEMU CPU Models',
+     ['The QEMU Project developers'], 7),
+    ('tools/qemu-img', 'qemu-img',
+     'QEMU disk image utility',
+     ['Fabrice Bellard'], 1),
+    ('tools/qemu-nbd', 'qemu-nbd',
+     'QEMU Disk Network Block Device Server',
+     ['Anthony Liguori <anthony@codemonkey.ws>'], 8),
+    ('tools/qemu-pr-helper', 'qemu-pr-helper',
+     'QEMU persistent reservation helper',
+     [], 8),
+    ('tools/qemu-storage-daemon', 'qemu-storage-daemon',
+     'QEMU storage daemon',
+     [], 1),
+    ('tools/qemu-trace-stap', 'qemu-trace-stap',
+     'QEMU SystemTap trace tool',
+     [], 1),
+    ('tools/virtfs-proxy-helper', 'virtfs-proxy-helper',
+     'QEMU 9p virtfs proxy filesystem helper',
+     ['M. Mohan Kumar'], 1),
+    ('tools/virtiofsd', 'virtiofsd',
+     'QEMU virtio-fs shared file system daemon',
+     ['Stefan Hajnoczi <stefanha@redhat.com>',
+      'Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>'], 1),
+]
 
 # -- Options for Texinfo output -------------------------------------------
 
diff --git a/docs/devel/conf.py b/docs/devel/conf.py
deleted file mode 100644
index 7441f87e7f5..00000000000
--- a/docs/devel/conf.py
+++ /dev/null
@@ -1,15 +0,0 @@
-# -*- coding: utf-8 -*-
-#
-# QEMU documentation build configuration file for the 'devel' manual.
-#
-# This includes the top level conf file and then makes any necessary tweaks.
-import sys
-import os
-
-qemu_docdir = os.path.abspath("..")
-parent_config = os.path.join(qemu_docdir, "conf.py")
-exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
-
-# This slightly misuses the 'description', but is the best way to get
-# the manual title to appear in the sidebar.
-html_theme_options['description'] = u'Developer''s Guide'
diff --git a/docs/index.html.in b/docs/index.html.in
deleted file mode 100644
index 33db4396ac8..00000000000
--- a/docs/index.html.in
+++ /dev/null
@@ -1,17 +0,0 @@
-<!DOCTYPE html>
-<html lang="en">
-    <head>
-        <meta charset="UTF-8">
-        <title>QEMU @VERSION@ Documentation</title>
-    </head>
-    <body>
-        <h1>QEMU @VERSION@ Documentation</h1>
-        <ul>
-            <li><a href="system/index.html">System Emulation User's Guide</a></li>
-            <li><a href="user/index.html">User Mode Emulation User's Guide</a></li>
-            <li><a href="tools/index.html">Tools Guide</a></li>
-            <li><a href="interop/index.html">System Emulation Management and Interoperability Guide</a></li>
-            <li><a href="specs/index.html">System Emulation Guest Hardware Specifications</a></li>
-        </ul>
-    </body>
-</html>
diff --git a/docs/interop/conf.py b/docs/interop/conf.py
deleted file mode 100644
index f4370aaa13f..00000000000
--- a/docs/interop/conf.py
+++ /dev/null
@@ -1,28 +0,0 @@
-# -*- coding: utf-8 -*-
-#
-# QEMU documentation build configuration file for the 'interop' manual.
-#
-# This includes the top level conf file and then makes any necessary tweaks.
-import sys
-import os
-
-qemu_docdir = os.path.abspath("..")
-parent_config = os.path.join(qemu_docdir, "conf.py")
-exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
-
-# This slightly misuses the 'description', but is the best way to get
-# the manual title to appear in the sidebar.
-html_theme_options['description'] = u'System Emulation Management and Interoperability Guide'
-
-# One entry per manual page. List of tuples
-# (source start file, name, description, authors, manual section).
-man_pages = [
-    ('qemu-ga', 'qemu-ga', u'QEMU Guest Agent',
-     ['Michael Roth <mdroth@linux.vnet.ibm.com>'], 8),
-    ('qemu-ga-ref', 'qemu-ga-ref', 'QEMU Guest Agent Protocol Reference',
-     [], 7),
-    ('qemu-qmp-ref', 'qemu-qmp-ref', 'QEMU QMP Reference Manual',
-     [], 7),
-    ('qemu-storage-daemon-qmp-ref', 'qemu-storage-daemon-qmp-ref',
-     'QEMU Storage Daemon QMP Reference Manual', [], 7),
-]
diff --git a/docs/meson.build b/docs/meson.build
index fae9849b79b..bb14eaebd3b 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -46,19 +46,11 @@ if build_docs
                           meson.source_root() / 'docs/sphinx/qmp_lexer.py',
                           qapi_gen_depends ]
 
-  configure_file(output: 'index.html',
-                 input: files('index.html.in'),
-                 configuration: {'VERSION': meson.project_version()},
-                 install_dir: qemu_docdir)
-  manuals = [ 'devel', 'interop', 'tools', 'specs', 'system', 'user' ]
   man_pages = {
-    'interop' : {
         'qemu-ga.8': (have_tools ? 'man8' : ''),
         'qemu-ga-ref.7': 'man7',
         'qemu-qmp-ref.7': 'man7',
         'qemu-storage-daemon-qmp-ref.7': (have_tools ? 'man7' : ''),
-    },
-    'tools': {
         'qemu-img.1': (have_tools ? 'man1' : ''),
         'qemu-nbd.8': (have_tools ? 'man8' : ''),
         'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
@@ -66,53 +58,47 @@ if build_docs
         'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
         'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
         'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
-    },
-    'system': {
         'qemu.1': 'man1',
         'qemu-block-drivers.7': 'man7',
         'qemu-cpu-models.7': 'man7'
-    },
   }
 
   sphinxdocs = []
   sphinxmans = []
-  foreach manual : manuals
-    private_dir = meson.current_build_dir() / (manual + '.p')
-    output_dir = meson.current_build_dir() / manual
-    input_dir = meson.current_source_dir() / manual
 
-    this_manual = custom_target(manual + ' manual',
+  private_dir = meson.current_build_dir() / 'manual.p'
+  output_dir = meson.current_build_dir() / 'manual'
+  input_dir = meson.current_source_dir()
+
+  this_manual = custom_target('QEMU manual',
                 build_by_default: build_docs,
-                output: [manual + '.stamp'],
-                input: [files('conf.py'), files(manual / 'conf.py')],
-                depfile: manual + '.d',
+                output: 'docs.stamp',
+                input: files('conf.py'),
+                depfile: 'docs.d',
                 depend_files: sphinx_extn_depends,
                 command: [SPHINX_ARGS, '-Ddepfile=@DEPFILE@',
                           '-Ddepfile_stamp=@OUTPUT0@',
                           '-b', 'html', '-d', private_dir,
                           input_dir, output_dir])
-    sphinxdocs += this_manual
-    if build_docs and manual != 'devel'
-      install_subdir(output_dir, install_dir: qemu_docdir)
-    endif
+  sphinxdocs += this_manual
+  install_subdir(output_dir, install_dir: qemu_docdir, strip_directory: true)
 
-    these_man_pages = []
-    install_dirs = []
-    foreach page, section : man_pages.get(manual, {})
-      these_man_pages += page
-      install_dirs += section == '' ? false : get_option('mandir') / section
-    endforeach
-    if these_man_pages.length() > 0
-      sphinxmans += custom_target(manual + ' man pages',
-                         build_by_default: build_docs,
-                         output: these_man_pages,
-                         input: this_manual,
-                         install: build_docs,
-                         install_dir: install_dirs,
-                         command: [SPHINX_ARGS, '-b', 'man', '-d', private_dir,
-                                   input_dir, meson.current_build_dir()])
-    endif
+  these_man_pages = []
+  install_dirs = []
+  foreach page, section : man_pages
+    these_man_pages += page
+    install_dirs += section == '' ? false : get_option('mandir') / section
   endforeach
+
+  sphinxmans += custom_target('QEMU man pages',
+                              build_by_default: build_docs,
+                              output: these_man_pages,
+                              input: this_manual,
+                              install: build_docs,
+                              install_dir: install_dirs,
+                              command: [SPHINX_ARGS, '-b', 'man', '-d', private_dir,
+                                        input_dir, meson.current_build_dir()])
+
   alias_target('sphinxdocs', sphinxdocs)
   alias_target('html', sphinxdocs)
   alias_target('man', sphinxmans)
diff --git a/docs/specs/conf.py b/docs/specs/conf.py
deleted file mode 100644
index 4d56f3ae13c..00000000000
--- a/docs/specs/conf.py
+++ /dev/null
@@ -1,16 +0,0 @@
-# -*- coding: utf-8 -*-
-#
-# QEMU documentation build configuration file for the 'specs' manual.
-#
-# This includes the top level conf file and then makes any necessary tweaks.
-import sys
-import os
-
-qemu_docdir = os.path.abspath("..")
-parent_config = os.path.join(qemu_docdir, "conf.py")
-exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
-
-# This slightly misuses the 'description', but is the best way to get
-# the manual title to appear in the sidebar.
-html_theme_options['description'] = \
-    u'System Emulation Guest Hardware Specifications'
diff --git a/docs/system/conf.py b/docs/system/conf.py
deleted file mode 100644
index 6251849fefc..00000000000
--- a/docs/system/conf.py
+++ /dev/null
@@ -1,28 +0,0 @@
-# -*- coding: utf-8 -*-
-#
-# QEMU documentation build configuration file for the 'system' manual.
-#
-# This includes the top level conf file and then makes any necessary tweaks.
-import sys
-import os
-
-qemu_docdir = os.path.abspath("..")
-parent_config = os.path.join(qemu_docdir, "conf.py")
-exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
-
-# This slightly misuses the 'description', but is the best way to get
-# the manual title to appear in the sidebar.
-html_theme_options['description'] = u'System Emulation User''s Guide'
-
-# One entry per manual page. List of tuples
-# (source start file, name, description, authors, manual section).
-man_pages = [
-    ('qemu-manpage', 'qemu', u'QEMU User Documentation',
-     ['Fabrice Bellard'], 1),
-    ('qemu-block-drivers', 'qemu-block-drivers',
-     u'QEMU block drivers reference',
-     ['Fabrice Bellard and the QEMU Project developers'], 7),
-    ('qemu-cpu-models', 'qemu-cpu-models',
-     u'QEMU CPU Models',
-     ['The QEMU Project developers'], 7)
-]
diff --git a/docs/tools/conf.py b/docs/tools/conf.py
deleted file mode 100644
index 7072d993246..00000000000
--- a/docs/tools/conf.py
+++ /dev/null
@@ -1,37 +0,0 @@
-# -*- coding: utf-8 -*-
-#
-# QEMU documentation build configuration file for the 'tools' manual.
-#
-# This includes the top level conf file and then makes any necessary tweaks.
-import sys
-import os
-
-qemu_docdir = os.path.abspath("..")
-parent_config = os.path.join(qemu_docdir, "conf.py")
-exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
-
-# This slightly misuses the 'description', but is the best way to get
-# the manual title to appear in the sidebar.
-html_theme_options['description'] = \
-    u'Tools Guide'
-
-# One entry per manual page. List of tuples
-# (source start file, name, description, authors, manual section).
-man_pages = [
-    ('qemu-img', 'qemu-img', u'QEMU disk image utility',
-     ['Fabrice Bellard'], 1),
-    ('qemu-storage-daemon', 'qemu-storage-daemon', u'QEMU storage daemon',
-     [], 1),
-    ('qemu-nbd', 'qemu-nbd', u'QEMU Disk Network Block Device Server',
-     ['Anthony Liguori <anthony@codemonkey.ws>'], 8),
-    ('qemu-pr-helper', 'qemu-pr-helper', 'QEMU persistent reservation helper',
-     [], 8),
-    ('qemu-trace-stap', 'qemu-trace-stap', u'QEMU SystemTap trace tool',
-     [], 1),
-    ('virtfs-proxy-helper', 'virtfs-proxy-helper',
-     u'QEMU 9p virtfs proxy filesystem helper',
-     ['M. Mohan Kumar'], 1),
-    ('virtiofsd', 'virtiofsd', u'QEMU virtio-fs shared file system daemon',
-     ['Stefan Hajnoczi <stefanha@redhat.com>',
-      'Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>'], 1),
-]
diff --git a/docs/user/conf.py b/docs/user/conf.py
deleted file mode 100644
index 4b09aedd454..00000000000
--- a/docs/user/conf.py
+++ /dev/null
@@ -1,15 +0,0 @@
-# -*- coding: utf-8 -*-
-#
-# QEMU documentation build configuration file for the 'user' manual.
-#
-# This includes the top level conf file and then makes any necessary tweaks.
-import sys
-import os
-
-qemu_docdir = os.path.abspath("..")
-parent_config = os.path.join(qemu_docdir, "conf.py")
-exec(compile(open(parent_config, "rb").read(), parent_config, 'exec'))
-
-# This slightly misuses the 'description', but is the best way to get
-# the manual title to appear in the sidebar.
-html_theme_options['description'] = u'User Mode Emulation User''s Guide'
-- 
2.20.1


