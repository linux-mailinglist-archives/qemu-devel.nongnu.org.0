Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4E7148C05
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 17:29:36 +0100 (CET)
Received: from localhost ([::1]:44486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iv1pv-0008Qb-Sw
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 11:29:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iv1mk-0002Wy-GV
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:26:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iv1mh-0002qA-Gx
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:26:18 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36974)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iv1mh-0002oy-AN
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 11:26:15 -0500
Received: by mail-wr1-x430.google.com with SMTP id w15so2707959wru.4
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2020 08:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pjqazbWdiNcCJ+wujQj53AxKkZxk1XYxk3a7b11Fz8U=;
 b=B2U6z1deJMto8rwBdrU21TdOzkM4C4SWnSToXudQzO/EPYZUHxR3E/GbbBNLxgGY0d
 2iHV7SDoHYxOXLPTccBEyiBANDfinvDAzbr9O24D+MsOobyEPL4ALT6/GOWp+niOZx51
 ahIhZqqzIQXCo40Q4iN+UTiLjKm54wMTCidKBSGqY+9f5Mt8qpwmJjszcPXhY5hbl3ju
 476d4EmMqUnlt2kKFC8nsC2kd3t2b+17YI7h+vJWVBUv89SsykwNfNj89/t1B8cEZf+e
 I2nnbNjsT/US61DZgkbJuHKMv/gauD/g34WEH/VpDFznq7H7kTIFVG+2evFiJDf/OGHR
 lQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pjqazbWdiNcCJ+wujQj53AxKkZxk1XYxk3a7b11Fz8U=;
 b=BPQmLICPZMJSn03TcF9kxRmrNemW49DD36QQVG/3dy7/IS2EuSYFnsZ8BP+7QV39Fq
 RMYaiYpdAwfOFXgmZIqxN346bQt3Z9Hp0vbLfrjDMTM8rATaQThiVcCtGz7lzBv1UmZn
 yX+pS0h9dSlN8q3d8s8XYuu6fSaY0C2MiY5vMrwXhJSfNrDinvB3ONKAIwPLmfdbSQJy
 WwqxxRdbMlLlfQ5R21j9pxSWtl6RVAR/7XdOdD+RRuOcVJwUDrzBTsGOMi3wxx0ulooB
 tnozz1oG3F1RNVXFMWkJZNAq5ARGNiqpCzDoXUv0kSqhPMoj4i9vvZ5uJT4eBVCjZc0P
 y0VQ==
X-Gm-Message-State: APjAAAU5fTziGXCAdn77vs90o8xJAUva54tyQ6tTVfndwPlL4j0o07hV
 Ssa3x7w3GkARa4Cbcxjnuk4ekQMPX31Bcw==
X-Google-Smtp-Source: APXvYqzP90edk885GzNai22q3Ib+u7pLx4VRDiClOwjky7eKH4SP5umN+jPIzkTqu1vay+mQudkHhg==
X-Received: by 2002:a5d:5491:: with SMTP id h17mr5311065wrv.374.1579883173951; 
 Fri, 24 Jan 2020 08:26:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q3sm7054998wmj.38.2020.01.24.08.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 08:26:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] docs/sphinx: Add new hxtool Sphinx extension
Date: Fri, 24 Jan 2020 16:26:01 +0000
Message-Id: <20200124162606.8787-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124162606.8787-1-peter.maydell@linaro.org>
References: <20200124162606.8787-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of our documentation includes sections which are created
by assembling fragments of texinfo from a .hx source file into
a .texi file, which is then included from qemu-doc.texi or
qemu-img.texi.

For Sphinx, rather than creating a file to include, the most natural
way to handle this is to have a small custom Sphinx extension which
reads the .hx file and process it.  So instead of:
 * makefile produces foo.texi from foo.hx
 * qemu-doc.texi says '@include foo.texi'
we have:
 * qemu-doc.rst says 'hxtool-doc:: foo.hx'
 * the Sphinx extension for hxtool has code that runs to handle that
   Sphinx directive which reads the .hx file and emits the appropriate
   documentation contents

This is pretty much the same way the kerneldoc extension works right
now. It also has the advantage that it should work for third-party
services like readthedocs that expect to build the docs directly with
sphinx rather than by invoking our makefiles.

In this commit we implement the hxtool extension.

Note that syntax errors in the rST fragments will be correctly
reported to the user with the filename and line number within the
hx file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/conf.py          |   3 +-
 docs/sphinx/hxtool.py | 210 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 docs/sphinx/hxtool.py

diff --git a/docs/conf.py b/docs/conf.py
index 259c6049da7..ee7faa6b4e7 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -54,7 +54,7 @@ needs_sphinx = '1.3'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['kerneldoc', 'qmp_lexer']
+extensions = ['kerneldoc', 'qmp_lexer', 'hxtool']
 
 # Add any paths that contain templates here, relative to this directory.
 templates_path = ['_templates']
@@ -221,3 +221,4 @@ texinfo_documents = [
 # find everything.
 kerneldoc_bin = os.path.join(qemu_docdir, '../scripts/kernel-doc')
 kerneldoc_srctree = os.path.join(qemu_docdir, '..')
+hxtool_srctree = os.path.join(qemu_docdir, '..')
diff --git a/docs/sphinx/hxtool.py b/docs/sphinx/hxtool.py
new file mode 100644
index 00000000000..5d6736f3002
--- /dev/null
+++ b/docs/sphinx/hxtool.py
@@ -0,0 +1,210 @@
+# coding=utf-8
+#
+# QEMU hxtool .hx file parsing extension
+#
+# Copyright (c) 2020 Linaro
+#
+# This work is licensed under the terms of the GNU GPLv2 or later.
+# See the COPYING file in the top-level directory.
+"""hxtool is a Sphinx extension that implements the hxtool-doc directive"""
+
+# The purpose of this extension is to read fragments of rST
+# from .hx files, and insert them all into the current document.
+# The rST fragments are delimited by SRST/ERST lines.
+# The conf.py file must set the hxtool_srctree config value to
+# the root of the QEMU source tree.
+# Each hxtool-doc:: directive takes one argument which is the
+# path of the .hx file to process, relative to the source tree.
+
+import os
+import re
+from enum import Enum
+
+from docutils import nodes
+from docutils.statemachine import ViewList
+from docutils.parsers.rst import directives, Directive
+from sphinx.errors import ExtensionError
+from sphinx.util.nodes import nested_parse_with_titles
+import sphinx
+
+# Sphinx up to 1.6 uses AutodocReporter; 1.7 and later
+# use switch_source_input. Check borrowed from kerneldoc.py.
+Use_SSI = sphinx.__version__[:3] >= '1.7'
+if Use_SSI:
+    from sphinx.util.docutils import switch_source_input
+else:
+    from sphinx.ext.autodoc import AutodocReporter
+
+__version__ = '1.0'
+
+# We parse hx files with a state machine which may be in one of three
+# states: reading the C code fragment, inside a texi fragment,
+# or inside a rST fragment.
+class HxState(Enum):
+    CTEXT = 1
+    TEXI = 2
+    RST = 3
+
+def serror(file, lnum, errtext):
+    """Raise an exception giving a user-friendly syntax error message"""
+    raise ExtensionError('%s line %d: syntax error: %s' % (file, lnum, errtext))
+
+def parse_directive(line):
+    """Return first word of line, if any"""
+    return re.split('\W', line)[0]
+
+def parse_defheading(file, lnum, line):
+    """Handle a DEFHEADING directive"""
+    # The input should be "DEFHEADING(some string)", though note that
+    # the 'some string' could be the empty string. If the string is
+    # empty we ignore the directive -- these are used only to add
+    # blank lines in the plain-text content of the --help output.
+    #
+    # Return the heading text
+    match = re.match(r'DEFHEADING\((.*)\)', line)
+    if match is None:
+        serror(file, lnum, "Invalid DEFHEADING line")
+    return match.group(1)
+
+def parse_archheading(file, lnum, line):
+    """Handle an ARCHHEADING directive"""
+    # The input should be "ARCHHEADING(some string, other arg)",
+    # though note that the 'some string' could be the empty string.
+    # As with DEFHEADING, empty string ARCHHEADINGs will be ignored.
+    #
+    # Return the heading text
+    match = re.match(r'ARCHHEADING\((.*),.*\)', line)
+    if match is None:
+        serror(file, lnum, "Invalid ARCHHEADING line")
+    return match.group(1)
+
+class HxtoolDocDirective(Directive):
+    """Extract rST fragments from the specified .hx file"""
+    required_argument = 1
+    optional_arguments = 1
+    option_spec = {
+        'hxfile': directives.unchanged_required
+    }
+    has_content = False
+
+    def run(self):
+        env = self.state.document.settings.env
+        hxfile = env.config.hxtool_srctree + '/' + self.arguments[0]
+
+        # Tell sphinx of the dependency
+        env.note_dependency(os.path.abspath(hxfile))
+
+        state = HxState.CTEXT
+        # We build up lines of rST in this ViewList, which we will
+        # later put into a 'section' node.
+        rstlist = ViewList()
+        current_node = None
+        node_list = []
+
+        with open(hxfile) as f:
+            lines = (l.rstrip() for l in f)
+            for lnum, line in enumerate(lines, 1):
+                directive = parse_directive(line)
+
+                if directive == 'HXCOMM':
+                    pass
+                elif directive == 'STEXI':
+                    if state == HxState.RST:
+                        serror(hxfile, lnum, 'expected ERST, found STEXI')
+                    elif state == HxState.TEXI:
+                        serror(hxfile, lnum, 'expected ETEXI, found STEXI')
+                    else:
+                        state = HxState.TEXI
+                elif directive == 'ETEXI':
+                    if state == HxState.RST:
+                        serror(hxfile, lnum, 'expected ERST, found ETEXI')
+                    elif state == HxState.CTEXT:
+                        serror(hxfile, lnum, 'expected STEXI, found ETEXI')
+                    else:
+                        state = HxState.CTEXT
+                elif directive == 'SRST':
+                    if state == HxState.RST:
+                        serror(hxfile, lnum, 'expected ERST, found SRST')
+                    elif state == HxState.TEXI:
+                        serror(hxfile, lnum, 'expected ETEXI, found SRST')
+                    else:
+                        state = HxState.RST
+                elif directive == 'ERST':
+                    if state == HxState.TEXI:
+                        serror(hxfile, lnum, 'expected ETEXI, found ERST')
+                    elif state == HxState.CTEXT:
+                        serror(hxfile, lnum, 'expected SRST, found ERST')
+                    else:
+                        state = HxState.CTEXT
+                elif directive == 'DEFHEADING' or directive == 'ARCHHEADING':
+                    if directive == 'DEFHEADING':
+                        heading = parse_defheading(hxfile, lnum, line)
+                    else:
+                        heading = parse_archheading(hxfile, lnum, line)
+                    if heading == "":
+                        continue
+                    # Put the accumulated rST into the previous node,
+                    # and then start a fresh section with this heading.
+                    if len(rstlist) > 0:
+                        if current_node is None:
+                            # We had some rST fragments before the first
+                            # DEFHEADING. We don't have a section to put
+                            # these in, so rather than magicing up a section,
+                            # make it a syntax error.
+                            serror(hxfile, lnum,
+                                   'first DEFHEADING must precede all rST text')
+                        self.do_parse(rstlist, current_node)
+                        rstlist = ViewList()
+                    if current_node is not None:
+                        node_list.append(current_node)
+                    section_id = 'hxtool-%d' % env.new_serialno('hxtool')
+                    current_node = nodes.section(ids=[section_id])
+                    current_node += nodes.title(heading, heading)
+                else:
+                    # Not a directive: put in output if we are in rST fragment
+                    if state == HxState.RST:
+                        # Sphinx counts its lines from 0
+                        rstlist.append(line, hxfile, lnum - 1)
+
+        if current_node is None:
+            # We don't have multiple sections, so just parse the rst
+            # fragments into a dummy node so we can return the children.
+            current_node = nodes.section()
+            self.do_parse(rstlist, current_node)
+            return current_node.children
+        else:
+            # Put the remaining accumulated rST into the last section, and
+            # return all the sections.
+            if len(rstlist) > 0:
+                self.do_parse(rstlist, current_node)
+            node_list.append(current_node)
+            return node_list
+
+    # This is from kerneldoc.py -- it works around an API change in
+    # Sphinx between 1.6 and 1.7. Unlike kerneldoc.py, we use
+    # sphinx.util.nodes.nested_parse_with_titles() rather than the
+    # plain self.state.nested_parse(), and so we can drop the saving
+    # of title_styles and section_level that kerneldoc.py does,
+    # because nested_parse_with_titles() does that for us.
+    def do_parse(self, result, node):
+        if Use_SSI:
+            with switch_source_input(self.state, result):
+                nested_parse_with_titles(self.state, result, node)
+        else:
+            save = self.state.memo.reporter
+            self.state.memo.reporter = AutodocReporter(result, self.state.memo.reporter)
+            try:
+                nested_parse_with_titles(self.state, result, node)
+            finally:
+                self.state.memo.reporter = save
+
+def setup(app):
+    """ Register hxtool-doc directive with Sphinx"""
+    app.add_config_value('hxtool_srctree', None, 'env')
+    app.add_directive('hxtool-doc', HxtoolDocDirective)
+
+    return dict(
+        version = __version__,
+        parallel_read_safe = True,
+        parallel_write_safe = True
+    )
-- 
2.20.1


