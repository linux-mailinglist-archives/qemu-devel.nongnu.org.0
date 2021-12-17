Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D4478EE1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:04:08 +0100 (CET)
Received: from localhost ([::1]:52456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEmF-0002tA-Ik
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:04:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERr-00045C-7J
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:43:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myERj-0001nW-NK
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aRILXhOIpdiTtyMy0stLTqiN3WJFSqWP8QCKwXfAz0E=;
 b=VRBShElRiWffNivGrQChNt28ckVUtRNEmz/jH8gvkcfCQuc7a9DX9yCjEPSRiiMocO8DE5
 qJnaTqB6h9j4CTNkhakeSE+9OG5m5Bkh3Vonh/A4oHEzZmWMEhDalSXdXEZ116X+ATt/Xl
 nvnfeD9ru7WdTrLLrMZIIajwNougQJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-6oP2o7djP6C0YQC7467VGQ-1; Fri, 17 Dec 2021 09:42:49 -0500
X-MC-Unique: 6oP2o7djP6C0YQC7467VGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2557310151E0;
 Fri, 17 Dec 2021 14:42:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 148375BE37;
 Fri, 17 Dec 2021 14:42:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 20/36] docs/sphinx: add sphinx modules to include D-Bus
 documentation
Date: Fri, 17 Dec 2021 18:37:40 +0400
Message-Id: <20211217143756.1831099-21-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add a new dbus-doc directive to import D-Bus interfaces documentation
from the introspection XML. The comments annotations follow the
gtkdoc/kerneldoc style, and should be formatted with reST.

Note: I realize after the fact that I was implementing those modules
with sphinx 4, and that we have much lower requirements. Instead of
lowering the features and code (removing type annotations etc), let's
have a warning in the documentation when the D-Bus modules can't be
used, and point to the source XML file in that case.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/conf.py               |   8 +
 docs/sphinx/dbusdoc.py     | 166 +++++++++++++++
 docs/sphinx/dbusdomain.py  | 406 +++++++++++++++++++++++++++++++++++++
 docs/sphinx/dbusparser.py  | 373 ++++++++++++++++++++++++++++++++++
 docs/sphinx/fakedbusdoc.py |  25 +++
 5 files changed, 978 insertions(+)
 create mode 100644 docs/sphinx/dbusdoc.py
 create mode 100644 docs/sphinx/dbusdomain.py
 create mode 100644 docs/sphinx/dbusparser.py
 create mode 100644 docs/sphinx/fakedbusdoc.py

diff --git a/docs/conf.py b/docs/conf.py
index 763e7d243448..e79015975e6a 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -73,6 +73,12 @@
 # ones.
 extensions = ['kerneldoc', 'qmp_lexer', 'hxtool', 'depfile', 'qapidoc']
 
+if sphinx.version_info[:3] > (4, 0, 0):
+    tags.add('sphinx4')
+    extensions += ['dbusdoc']
+else:
+    extensions += ['fakedbusdoc']
+
 # Add any paths that contain templates here, relative to this directory.
 templates_path = [os.path.join(qemu_docdir, '_templates')]
 
@@ -311,3 +317,5 @@
 kerneldoc_srctree = os.path.join(qemu_docdir, '..')
 hxtool_srctree = os.path.join(qemu_docdir, '..')
 qapidoc_srctree = os.path.join(qemu_docdir, '..')
+dbusdoc_srctree = os.path.join(qemu_docdir, '..')
+dbus_index_common_prefix = ["org.qemu."]
diff --git a/docs/sphinx/dbusdoc.py b/docs/sphinx/dbusdoc.py
new file mode 100644
index 000000000000..be284ed08fd7
--- /dev/null
+++ b/docs/sphinx/dbusdoc.py
@@ -0,0 +1,166 @@
+# D-Bus XML documentation extension
+#
+# Copyright (C) 2021, Red Hat Inc.
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Author: Marc-André Lureau <marcandre.lureau@redhat.com>
+"""dbus-doc is a Sphinx extension that provides documentation from D-Bus XML."""
+
+import os
+import re
+from typing import (
+    TYPE_CHECKING,
+    Any,
+    Callable,
+    Dict,
+    Iterator,
+    List,
+    Optional,
+    Sequence,
+    Set,
+    Tuple,
+    Type,
+    TypeVar,
+    Union,
+)
+
+import sphinx
+from docutils import nodes
+from docutils.nodes import Element, Node
+from docutils.parsers.rst import Directive, directives
+from docutils.parsers.rst.states import RSTState
+from docutils.statemachine import StringList, ViewList
+from sphinx.application import Sphinx
+from sphinx.errors import ExtensionError
+from sphinx.util import logging
+from sphinx.util.docstrings import prepare_docstring
+from sphinx.util.docutils import SphinxDirective, switch_source_input
+from sphinx.util.nodes import nested_parse_with_titles
+
+import dbusdomain
+from dbusparser import parse_dbus_xml
+
+logger = logging.getLogger(__name__)
+
+__version__ = "1.0"
+
+
+class DBusDoc:
+    def __init__(self, sphinx_directive, dbusfile):
+        self._cur_doc = None
+        self._sphinx_directive = sphinx_directive
+        self._dbusfile = dbusfile
+        self._top_node = nodes.section()
+        self.result = StringList()
+        self.indent = ""
+
+    def add_line(self, line: str, *lineno: int) -> None:
+        """Append one line of generated reST to the output."""
+        if line.strip():  # not a blank line
+            self.result.append(self.indent + line, self._dbusfile, *lineno)
+        else:
+            self.result.append("", self._dbusfile, *lineno)
+
+    def add_method(self, method):
+        self.add_line(f".. dbus:method:: {method.name}")
+        self.add_line("")
+        self.indent += "   "
+        for arg in method.in_args:
+            self.add_line(f":arg {arg.signature} {arg.name}: {arg.doc_string}")
+        for arg in method.out_args:
+            self.add_line(f":ret {arg.signature} {arg.name}: {arg.doc_string}")
+        self.add_line("")
+        for line in prepare_docstring("\n" + method.doc_string):
+            self.add_line(line)
+        self.indent = self.indent[:-3]
+
+    def add_signal(self, signal):
+        self.add_line(f".. dbus:signal:: {signal.name}")
+        self.add_line("")
+        self.indent += "   "
+        for arg in signal.args:
+            self.add_line(f":arg {arg.signature} {arg.name}: {arg.doc_string}")
+        self.add_line("")
+        for line in prepare_docstring("\n" + signal.doc_string):
+            self.add_line(line)
+        self.indent = self.indent[:-3]
+
+    def add_property(self, prop):
+        self.add_line(f".. dbus:property:: {prop.name}")
+        self.indent += "   "
+        self.add_line(f":type: {prop.signature}")
+        access = {"read": "readonly", "write": "writeonly", "readwrite": "readwrite"}[
+            prop.access
+        ]
+        self.add_line(f":{access}:")
+        if prop.emits_changed_signal:
+            self.add_line(f":emits-changed: yes")
+        self.add_line("")
+        for line in prepare_docstring("\n" + prop.doc_string):
+            self.add_line(line)
+        self.indent = self.indent[:-3]
+
+    def add_interface(self, iface):
+        self.add_line(f".. dbus:interface:: {iface.name}")
+        self.add_line("")
+        self.indent += "   "
+        for line in prepare_docstring("\n" + iface.doc_string):
+            self.add_line(line)
+        for method in iface.methods:
+            self.add_method(method)
+        for sig in iface.signals:
+            self.add_signal(sig)
+        for prop in iface.properties:
+            self.add_property(prop)
+        self.indent = self.indent[:-3]
+
+
+def parse_generated_content(state: RSTState, content: StringList) -> List[Node]:
+    """Parse a generated content by Documenter."""
+    with switch_source_input(state, content):
+        node = nodes.paragraph()
+        node.document = state.document
+        state.nested_parse(content, 0, node)
+
+        return node.children
+
+
+class DBusDocDirective(SphinxDirective):
+    """Extract documentation from the specified D-Bus XML file"""
+
+    has_content = True
+    required_arguments = 1
+    optional_arguments = 0
+    final_argument_whitespace = True
+
+    def run(self):
+        reporter = self.state.document.reporter
+
+        try:
+            source, lineno = reporter.get_source_and_line(self.lineno)  # type: ignore
+        except AttributeError:
+            source, lineno = (None, None)
+
+        logger.debug("[dbusdoc] %s:%s: input:\n%s", source, lineno, self.block_text)
+
+        env = self.state.document.settings.env
+        dbusfile = env.config.qapidoc_srctree + "/" + self.arguments[0]
+        with open(dbusfile, "rb") as f:
+            xml_data = f.read()
+        xml = parse_dbus_xml(xml_data)
+        doc = DBusDoc(self, dbusfile)
+        for iface in xml:
+            doc.add_interface(iface)
+
+        result = parse_generated_content(self.state, doc.result)
+        return result
+
+
+def setup(app: Sphinx) -> Dict[str, Any]:
+    """Register dbus-doc directive with Sphinx"""
+    app.add_config_value("dbusdoc_srctree", None, "env")
+    app.add_directive("dbus-doc", DBusDocDirective)
+    dbusdomain.setup(app)
+
+    return dict(version=__version__, parallel_read_safe=True, parallel_write_safe=True)
diff --git a/docs/sphinx/dbusdomain.py b/docs/sphinx/dbusdomain.py
new file mode 100644
index 000000000000..2ea95af623d2
--- /dev/null
+++ b/docs/sphinx/dbusdomain.py
@@ -0,0 +1,406 @@
+# D-Bus sphinx domain extension
+#
+# Copyright (C) 2021, Red Hat Inc.
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Author: Marc-André Lureau <marcandre.lureau@redhat.com>
+
+from typing import (
+    Any,
+    Dict,
+    Iterable,
+    Iterator,
+    List,
+    NamedTuple,
+    Optional,
+    Tuple,
+    cast,
+)
+
+from docutils import nodes
+from docutils.nodes import Element, Node
+from docutils.parsers.rst import directives
+from sphinx import addnodes
+from sphinx.addnodes import desc_signature, pending_xref
+from sphinx.directives import ObjectDescription
+from sphinx.domains import Domain, Index, IndexEntry, ObjType
+from sphinx.locale import _
+from sphinx.roles import XRefRole
+from sphinx.util import nodes as node_utils
+from sphinx.util.docfields import Field, TypedField
+from sphinx.util.typing import OptionSpec
+
+
+class DBusDescription(ObjectDescription[str]):
+    """Base class for DBus objects"""
+
+    option_spec: OptionSpec = ObjectDescription.option_spec.copy()
+    option_spec.update(
+        {
+            "deprecated": directives.flag,
+        }
+    )
+
+    def get_index_text(self, modname: str, name: str) -> str:
+        """Return the text for the index entry of the object."""
+        raise NotImplementedError("must be implemented in subclasses")
+
+    def add_target_and_index(
+        self, name: str, sig: str, signode: desc_signature
+    ) -> None:
+        ifacename = self.env.ref_context.get("dbus:interface")
+        node_id = name
+        if ifacename:
+            node_id = f"{ifacename}.{node_id}"
+
+        signode["names"].append(name)
+        signode["ids"].append(node_id)
+
+        if "noindexentry" not in self.options:
+            indextext = self.get_index_text(ifacename, name)
+            if indextext:
+                self.indexnode["entries"].append(
+                    ("single", indextext, node_id, "", None)
+                )
+
+        domain = cast(DBusDomain, self.env.get_domain("dbus"))
+        domain.note_object(name, self.objtype, node_id, location=signode)
+
+
+class DBusInterface(DBusDescription):
+    """
+    Implementation of ``dbus:interface``.
+    """
+
+    def get_index_text(self, ifacename: str, name: str) -> str:
+        return ifacename
+
+    def before_content(self) -> None:
+        self.env.ref_context["dbus:interface"] = self.arguments[0]
+
+    def after_content(self) -> None:
+        self.env.ref_context.pop("dbus:interface")
+
+    def handle_signature(self, sig: str, signode: desc_signature) -> str:
+        signode += addnodes.desc_annotation("interface ", "interface ")
+        signode += addnodes.desc_name(sig, sig)
+        return sig
+
+    def run(self) -> List[Node]:
+        _, node = super().run()
+        name = self.arguments[0]
+        section = nodes.section(ids=[name + "-section"])
+        section += nodes.title(name, "%s interface" % name)
+        section += node
+        return [self.indexnode, section]
+
+
+class DBusMember(DBusDescription):
+
+    signal = False
+
+
+class DBusMethod(DBusMember):
+    """
+    Implementation of ``dbus:method``.
+    """
+
+    option_spec: OptionSpec = DBusMember.option_spec.copy()
+    option_spec.update(
+        {
+            "noreply": directives.flag,
+        }
+    )
+
+    doc_field_types: List[Field] = [
+        TypedField(
+            "arg",
+            label=_("Arguments"),
+            names=("arg",),
+            rolename="arg",
+            typerolename=None,
+            typenames=("argtype", "type"),
+        ),
+        TypedField(
+            "ret",
+            label=_("Returns"),
+            names=("ret",),
+            rolename="ret",
+            typerolename=None,
+            typenames=("rettype", "type"),
+        ),
+    ]
+
+    def get_index_text(self, ifacename: str, name: str) -> str:
+        return _("%s() (%s method)") % (name, ifacename)
+
+    def handle_signature(self, sig: str, signode: desc_signature) -> str:
+        params = addnodes.desc_parameterlist()
+        returns = addnodes.desc_parameterlist()
+
+        contentnode = addnodes.desc_content()
+        self.state.nested_parse(self.content, self.content_offset, contentnode)
+        for child in contentnode:
+            if isinstance(child, nodes.field_list):
+                for field in child:
+                    ty, sg, name = field[0].astext().split(None, 2)
+                    param = addnodes.desc_parameter()
+                    param += addnodes.desc_sig_keyword_type(sg, sg)
+                    param += addnodes.desc_sig_space()
+                    param += addnodes.desc_sig_name(name, name)
+                    if ty == "arg":
+                        params += param
+                    elif ty == "ret":
+                        returns += param
+
+        anno = "signal " if self.signal else "method "
+        signode += addnodes.desc_annotation(anno, anno)
+        signode += addnodes.desc_name(sig, sig)
+        signode += params
+        if not self.signal and "noreply" not in self.options:
+            ret = addnodes.desc_returns()
+            ret += returns
+            signode += ret
+
+        return sig
+
+
+class DBusSignal(DBusMethod):
+    """
+    Implementation of ``dbus:signal``.
+    """
+
+    doc_field_types: List[Field] = [
+        TypedField(
+            "arg",
+            label=_("Arguments"),
+            names=("arg",),
+            rolename="arg",
+            typerolename=None,
+            typenames=("argtype", "type"),
+        ),
+    ]
+    signal = True
+
+    def get_index_text(self, ifacename: str, name: str) -> str:
+        return _("%s() (%s signal)") % (name, ifacename)
+
+
+class DBusProperty(DBusMember):
+    """
+    Implementation of ``dbus:property``.
+    """
+
+    option_spec: OptionSpec = DBusMember.option_spec.copy()
+    option_spec.update(
+        {
+            "type": directives.unchanged,
+            "readonly": directives.flag,
+            "writeonly": directives.flag,
+            "readwrite": directives.flag,
+            "emits-changed": directives.unchanged,
+        }
+    )
+
+    doc_field_types: List[Field] = []
+
+    def get_index_text(self, ifacename: str, name: str) -> str:
+        return _("%s (%s property)") % (name, ifacename)
+
+    def transform_content(self, contentnode: addnodes.desc_content) -> None:
+        fieldlist = nodes.field_list()
+        access = None
+        if "readonly" in self.options:
+            access = _("read-only")
+        if "writeonly" in self.options:
+            access = _("write-only")
+        if "readwrite" in self.options:
+            access = _("read & write")
+        if access:
+            content = nodes.Text(access)
+            fieldname = nodes.field_name("", _("Access"))
+            fieldbody = nodes.field_body("", nodes.paragraph("", "", content))
+            field = nodes.field("", fieldname, fieldbody)
+            fieldlist += field
+        emits = self.options.get("emits-changed", None)
+        if emits:
+            content = nodes.Text(emits)
+            fieldname = nodes.field_name("", _("Emits Changed"))
+            fieldbody = nodes.field_body("", nodes.paragraph("", "", content))
+            field = nodes.field("", fieldname, fieldbody)
+            fieldlist += field
+        if len(fieldlist) > 0:
+            contentnode.insert(0, fieldlist)
+
+    def handle_signature(self, sig: str, signode: desc_signature) -> str:
+        contentnode = addnodes.desc_content()
+        self.state.nested_parse(self.content, self.content_offset, contentnode)
+        ty = self.options.get("type")
+
+        signode += addnodes.desc_annotation("property ", "property ")
+        signode += addnodes.desc_name(sig, sig)
+        signode += addnodes.desc_sig_punctuation("", ":")
+        signode += addnodes.desc_sig_keyword_type(ty, ty)
+        return sig
+
+    def run(self) -> List[Node]:
+        self.name = "dbus:member"
+        return super().run()
+
+
+class DBusXRef(XRefRole):
+    def process_link(self, env, refnode, has_explicit_title, title, target):
+        refnode["dbus:interface"] = env.ref_context.get("dbus:interface")
+        if not has_explicit_title:
+            title = title.lstrip(".")  # only has a meaning for the target
+            target = target.lstrip("~")  # only has a meaning for the title
+            # if the first character is a tilde, don't display the module/class
+            # parts of the contents
+            if title[0:1] == "~":
+                title = title[1:]
+                dot = title.rfind(".")
+                if dot != -1:
+                    title = title[dot + 1 :]
+        # if the first character is a dot, search more specific namespaces first
+        # else search builtins first
+        if target[0:1] == ".":
+            target = target[1:]
+            refnode["refspecific"] = True
+        return title, target
+
+
+class DBusIndex(Index):
+    """
+    Index subclass to provide a D-Bus interfaces index.
+    """
+
+    name = "dbusindex"
+    localname = _("D-Bus Interfaces Index")
+    shortname = _("dbus")
+
+    def generate(
+        self, docnames: Iterable[str] = None
+    ) -> Tuple[List[Tuple[str, List[IndexEntry]]], bool]:
+        content: Dict[str, List[IndexEntry]] = {}
+        # list of prefixes to ignore
+        ignores: List[str] = self.domain.env.config["dbus_index_common_prefix"]
+        ignores = sorted(ignores, key=len, reverse=True)
+
+        ifaces = sorted(
+            [
+                x
+                for x in self.domain.data["objects"].items()
+                if x[1].objtype == "interface"
+            ],
+            key=lambda x: x[0].lower(),
+        )
+        for name, (docname, node_id, _) in ifaces:
+            if docnames and docname not in docnames:
+                continue
+
+            for ignore in ignores:
+                if name.startswith(ignore):
+                    name = name[len(ignore) :]
+                    stripped = ignore
+                    break
+            else:
+                stripped = ""
+
+            entries = content.setdefault(name[0].lower(), [])
+            entries.append(IndexEntry(stripped + name, 0, docname, node_id, "", "", ""))
+
+        # sort by first letter
+        sorted_content = sorted(content.items())
+
+        return sorted_content, False
+
+
+class ObjectEntry(NamedTuple):
+    docname: str
+    node_id: str
+    objtype: str
+
+
+class DBusDomain(Domain):
+    """
+    Implementation of the D-Bus domain.
+    """
+
+    name = "dbus"
+    label = "D-Bus"
+    object_types: Dict[str, ObjType] = {
+        "interface": ObjType(_("interface"), "iface", "obj"),
+        "method": ObjType(_("method"), "meth", "obj"),
+        "signal": ObjType(_("signal"), "sig", "obj"),
+        "property": ObjType(_("property"), "attr", "_prop", "obj"),
+    }
+    directives = {
+        "interface": DBusInterface,
+        "method": DBusMethod,
+        "signal": DBusSignal,
+        "property": DBusProperty,
+    }
+    roles = {
+        "iface": DBusXRef(),
+        "meth": DBusXRef(),
+        "sig": DBusXRef(),
+        "prop": DBusXRef(),
+    }
+    initial_data: Dict[str, Dict[str, Tuple[Any]]] = {
+        "objects": {},  # fullname -> ObjectEntry
+    }
+    indices = [
+        DBusIndex,
+    ]
+
+    @property
+    def objects(self) -> Dict[str, ObjectEntry]:
+        return self.data.setdefault("objects", {})  # fullname -> ObjectEntry
+
+    def note_object(
+        self, name: str, objtype: str, node_id: str, location: Any = None
+    ) -> None:
+        self.objects[name] = ObjectEntry(self.env.docname, node_id, objtype)
+
+    def clear_doc(self, docname: str) -> None:
+        for fullname, obj in list(self.objects.items()):
+            if obj.docname == docname:
+                del self.objects[fullname]
+
+    def find_obj(self, typ: str, name: str) -> Optional[Tuple[str, ObjectEntry]]:
+        # skip parens
+        if name[-2:] == "()":
+            name = name[:-2]
+        if typ in ("meth", "sig", "prop"):
+            try:
+                ifacename, name = name.rsplit(".", 1)
+            except ValueError:
+                pass
+        return self.objects.get(name)
+
+    def resolve_xref(
+        self,
+        env: "BuildEnvironment",
+        fromdocname: str,
+        builder: "Builder",
+        typ: str,
+        target: str,
+        node: pending_xref,
+        contnode: Element,
+    ) -> Optional[Element]:
+        """Resolve the pending_xref *node* with the given *typ* and *target*."""
+        objdef = self.find_obj(typ, target)
+        if objdef:
+            return node_utils.make_refnode(
+                builder, fromdocname, objdef.docname, objdef.node_id, contnode
+            )
+
+    def get_objects(self) -> Iterator[Tuple[str, str, str, str, str, int]]:
+        for refname, obj in self.objects.items():
+            yield (refname, refname, obj.objtype, obj.docname, obj.node_id, 1)
+
+
+def setup(app):
+    app.add_domain(DBusDomain)
+    app.add_config_value("dbus_index_common_prefix", [], "env")
diff --git a/docs/sphinx/dbusparser.py b/docs/sphinx/dbusparser.py
new file mode 100644
index 000000000000..024553eae7b5
--- /dev/null
+++ b/docs/sphinx/dbusparser.py
@@ -0,0 +1,373 @@
+# Based from "GDBus - GLib D-Bus Library":
+#
+# Copyright (C) 2008-2011 Red Hat, Inc.
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General
+# Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
+#
+# Author: David Zeuthen <davidz@redhat.com>
+
+import xml.parsers.expat
+
+
+class Annotation:
+    def __init__(self, key, value):
+        self.key = key
+        self.value = value
+        self.annotations = []
+        self.since = ""
+
+
+class Arg:
+    def __init__(self, name, signature):
+        self.name = name
+        self.signature = signature
+        self.annotations = []
+        self.doc_string = ""
+        self.since = ""
+
+
+class Method:
+    def __init__(self, name, h_type_implies_unix_fd=True):
+        self.name = name
+        self.h_type_implies_unix_fd = h_type_implies_unix_fd
+        self.in_args = []
+        self.out_args = []
+        self.annotations = []
+        self.doc_string = ""
+        self.since = ""
+        self.deprecated = False
+        self.unix_fd = False
+
+
+class Signal:
+    def __init__(self, name):
+        self.name = name
+        self.args = []
+        self.annotations = []
+        self.doc_string = ""
+        self.since = ""
+        self.deprecated = False
+
+
+class Property:
+    def __init__(self, name, signature, access):
+        self.name = name
+        self.signature = signature
+        self.access = access
+        self.annotations = []
+        self.arg = Arg("value", self.signature)
+        self.arg.annotations = self.annotations
+        self.readable = False
+        self.writable = False
+        if self.access == "readwrite":
+            self.readable = True
+            self.writable = True
+        elif self.access == "read":
+            self.readable = True
+        elif self.access == "write":
+            self.writable = True
+        else:
+            raise ValueError('Invalid access type "{}"'.format(self.access))
+        self.doc_string = ""
+        self.since = ""
+        self.deprecated = False
+        self.emits_changed_signal = True
+
+
+class Interface:
+    def __init__(self, name):
+        self.name = name
+        self.methods = []
+        self.signals = []
+        self.properties = []
+        self.annotations = []
+        self.doc_string = ""
+        self.doc_string_brief = ""
+        self.since = ""
+        self.deprecated = False
+
+
+class DBusXMLParser:
+    STATE_TOP = "top"
+    STATE_NODE = "node"
+    STATE_INTERFACE = "interface"
+    STATE_METHOD = "method"
+    STATE_SIGNAL = "signal"
+    STATE_PROPERTY = "property"
+    STATE_ARG = "arg"
+    STATE_ANNOTATION = "annotation"
+    STATE_IGNORED = "ignored"
+
+    def __init__(self, xml_data, h_type_implies_unix_fd=True):
+        self._parser = xml.parsers.expat.ParserCreate()
+        self._parser.CommentHandler = self.handle_comment
+        self._parser.CharacterDataHandler = self.handle_char_data
+        self._parser.StartElementHandler = self.handle_start_element
+        self._parser.EndElementHandler = self.handle_end_element
+
+        self.parsed_interfaces = []
+        self._cur_object = None
+
+        self.state = DBusXMLParser.STATE_TOP
+        self.state_stack = []
+        self._cur_object = None
+        self._cur_object_stack = []
+
+        self.doc_comment_last_symbol = ""
+
+        self._h_type_implies_unix_fd = h_type_implies_unix_fd
+
+        self._parser.Parse(xml_data)
+
+    COMMENT_STATE_BEGIN = "begin"
+    COMMENT_STATE_PARAMS = "params"
+    COMMENT_STATE_BODY = "body"
+    COMMENT_STATE_SKIP = "skip"
+
+    def handle_comment(self, data):
+        comment_state = DBusXMLParser.COMMENT_STATE_BEGIN
+        lines = data.split("\n")
+        symbol = ""
+        body = ""
+        in_para = False
+        params = {}
+        for line in lines:
+            orig_line = line
+            line = line.lstrip()
+            if comment_state == DBusXMLParser.COMMENT_STATE_BEGIN:
+                if len(line) > 0:
+                    colon_index = line.find(": ")
+                    if colon_index == -1:
+                        if line.endswith(":"):
+                            symbol = line[0 : len(line) - 1]
+                            comment_state = DBusXMLParser.COMMENT_STATE_PARAMS
+                        else:
+                            comment_state = DBusXMLParser.COMMENT_STATE_SKIP
+                    else:
+                        symbol = line[0:colon_index]
+                        rest_of_line = line[colon_index + 2 :].strip()
+                        if len(rest_of_line) > 0:
+                            body += rest_of_line + "\n"
+                        comment_state = DBusXMLParser.COMMENT_STATE_PARAMS
+            elif comment_state == DBusXMLParser.COMMENT_STATE_PARAMS:
+                if line.startswith("@"):
+                    colon_index = line.find(": ")
+                    if colon_index == -1:
+                        comment_state = DBusXMLParser.COMMENT_STATE_BODY
+                        if not in_para:
+                            in_para = True
+                        body += orig_line + "\n"
+                    else:
+                        param = line[1:colon_index]
+                        docs = line[colon_index + 2 :]
+                        params[param] = docs
+                else:
+                    comment_state = DBusXMLParser.COMMENT_STATE_BODY
+                    if len(line) > 0:
+                        if not in_para:
+                            in_para = True
+                        body += orig_line + "\n"
+            elif comment_state == DBusXMLParser.COMMENT_STATE_BODY:
+                if len(line) > 0:
+                    if not in_para:
+                        in_para = True
+                    body += orig_line + "\n"
+                else:
+                    if in_para:
+                        body += "\n"
+                        in_para = False
+        if in_para:
+            body += "\n"
+
+        if symbol != "":
+            self.doc_comment_last_symbol = symbol
+            self.doc_comment_params = params
+            self.doc_comment_body = body
+
+    def handle_char_data(self, data):
+        # print 'char_data=%s'%data
+        pass
+
+    def handle_start_element(self, name, attrs):
+        old_state = self.state
+        old_cur_object = self._cur_object
+        if self.state == DBusXMLParser.STATE_IGNORED:
+            self.state = DBusXMLParser.STATE_IGNORED
+        elif self.state == DBusXMLParser.STATE_TOP:
+            if name == DBusXMLParser.STATE_NODE:
+                self.state = DBusXMLParser.STATE_NODE
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+        elif self.state == DBusXMLParser.STATE_NODE:
+            if name == DBusXMLParser.STATE_INTERFACE:
+                self.state = DBusXMLParser.STATE_INTERFACE
+                iface = Interface(attrs["name"])
+                self._cur_object = iface
+                self.parsed_interfaces.append(iface)
+            elif name == DBusXMLParser.STATE_ANNOTATION:
+                self.state = DBusXMLParser.STATE_ANNOTATION
+                anno = Annotation(attrs["name"], attrs["value"])
+                self._cur_object.annotations.append(anno)
+                self._cur_object = anno
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+
+            # assign docs, if any
+            if "name" in attrs and self.doc_comment_last_symbol == attrs["name"]:
+                self._cur_object.doc_string = self.doc_comment_body
+                if "short_description" in self.doc_comment_params:
+                    short_description = self.doc_comment_params["short_description"]
+                    self._cur_object.doc_string_brief = short_description
+                if "since" in self.doc_comment_params:
+                    self._cur_object.since = self.doc_comment_params["since"].strip()
+
+        elif self.state == DBusXMLParser.STATE_INTERFACE:
+            if name == DBusXMLParser.STATE_METHOD:
+                self.state = DBusXMLParser.STATE_METHOD
+                method = Method(
+                    attrs["name"], h_type_implies_unix_fd=self._h_type_implies_unix_fd
+                )
+                self._cur_object.methods.append(method)
+                self._cur_object = method
+            elif name == DBusXMLParser.STATE_SIGNAL:
+                self.state = DBusXMLParser.STATE_SIGNAL
+                signal = Signal(attrs["name"])
+                self._cur_object.signals.append(signal)
+                self._cur_object = signal
+            elif name == DBusXMLParser.STATE_PROPERTY:
+                self.state = DBusXMLParser.STATE_PROPERTY
+                prop = Property(attrs["name"], attrs["type"], attrs["access"])
+                self._cur_object.properties.append(prop)
+                self._cur_object = prop
+            elif name == DBusXMLParser.STATE_ANNOTATION:
+                self.state = DBusXMLParser.STATE_ANNOTATION
+                anno = Annotation(attrs["name"], attrs["value"])
+                self._cur_object.annotations.append(anno)
+                self._cur_object = anno
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+
+            # assign docs, if any
+            if "name" in attrs and self.doc_comment_last_symbol == attrs["name"]:
+                self._cur_object.doc_string = self.doc_comment_body
+                if "since" in self.doc_comment_params:
+                    self._cur_object.since = self.doc_comment_params["since"].strip()
+
+        elif self.state == DBusXMLParser.STATE_METHOD:
+            if name == DBusXMLParser.STATE_ARG:
+                self.state = DBusXMLParser.STATE_ARG
+                arg_name = None
+                if "name" in attrs:
+                    arg_name = attrs["name"]
+                arg = Arg(arg_name, attrs["type"])
+                direction = attrs.get("direction", "in")
+                if direction == "in":
+                    self._cur_object.in_args.append(arg)
+                elif direction == "out":
+                    self._cur_object.out_args.append(arg)
+                else:
+                    raise ValueError('Invalid direction "{}"'.format(direction))
+                self._cur_object = arg
+            elif name == DBusXMLParser.STATE_ANNOTATION:
+                self.state = DBusXMLParser.STATE_ANNOTATION
+                anno = Annotation(attrs["name"], attrs["value"])
+                self._cur_object.annotations.append(anno)
+                self._cur_object = anno
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+
+            # assign docs, if any
+            if self.doc_comment_last_symbol == old_cur_object.name:
+                if "name" in attrs and attrs["name"] in self.doc_comment_params:
+                    doc_string = self.doc_comment_params[attrs["name"]]
+                    if doc_string is not None:
+                        self._cur_object.doc_string = doc_string
+                    if "since" in self.doc_comment_params:
+                        self._cur_object.since = self.doc_comment_params[
+                            "since"
+                        ].strip()
+
+        elif self.state == DBusXMLParser.STATE_SIGNAL:
+            if name == DBusXMLParser.STATE_ARG:
+                self.state = DBusXMLParser.STATE_ARG
+                arg_name = None
+                if "name" in attrs:
+                    arg_name = attrs["name"]
+                arg = Arg(arg_name, attrs["type"])
+                self._cur_object.args.append(arg)
+                self._cur_object = arg
+            elif name == DBusXMLParser.STATE_ANNOTATION:
+                self.state = DBusXMLParser.STATE_ANNOTATION
+                anno = Annotation(attrs["name"], attrs["value"])
+                self._cur_object.annotations.append(anno)
+                self._cur_object = anno
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+
+            # assign docs, if any
+            if self.doc_comment_last_symbol == old_cur_object.name:
+                if "name" in attrs and attrs["name"] in self.doc_comment_params:
+                    doc_string = self.doc_comment_params[attrs["name"]]
+                    if doc_string is not None:
+                        self._cur_object.doc_string = doc_string
+                    if "since" in self.doc_comment_params:
+                        self._cur_object.since = self.doc_comment_params[
+                            "since"
+                        ].strip()
+
+        elif self.state == DBusXMLParser.STATE_PROPERTY:
+            if name == DBusXMLParser.STATE_ANNOTATION:
+                self.state = DBusXMLParser.STATE_ANNOTATION
+                anno = Annotation(attrs["name"], attrs["value"])
+                self._cur_object.annotations.append(anno)
+                self._cur_object = anno
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+
+        elif self.state == DBusXMLParser.STATE_ARG:
+            if name == DBusXMLParser.STATE_ANNOTATION:
+                self.state = DBusXMLParser.STATE_ANNOTATION
+                anno = Annotation(attrs["name"], attrs["value"])
+                self._cur_object.annotations.append(anno)
+                self._cur_object = anno
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+
+        elif self.state == DBusXMLParser.STATE_ANNOTATION:
+            if name == DBusXMLParser.STATE_ANNOTATION:
+                self.state = DBusXMLParser.STATE_ANNOTATION
+                anno = Annotation(attrs["name"], attrs["value"])
+                self._cur_object.annotations.append(anno)
+                self._cur_object = anno
+            else:
+                self.state = DBusXMLParser.STATE_IGNORED
+
+        else:
+            raise ValueError(
+                'Unhandled state "{}" while entering element with name "{}"'.format(
+                    self.state, name
+                )
+            )
+
+        self.state_stack.append(old_state)
+        self._cur_object_stack.append(old_cur_object)
+
+    def handle_end_element(self, name):
+        self.state = self.state_stack.pop()
+        self._cur_object = self._cur_object_stack.pop()
+
+
+def parse_dbus_xml(xml_data):
+    parser = DBusXMLParser(xml_data, True)
+    return parser.parsed_interfaces
diff --git a/docs/sphinx/fakedbusdoc.py b/docs/sphinx/fakedbusdoc.py
new file mode 100644
index 000000000000..a680b257547f
--- /dev/null
+++ b/docs/sphinx/fakedbusdoc.py
@@ -0,0 +1,25 @@
+# D-Bus XML documentation extension, compatibility gunk for <sphinx4
+#
+# Copyright (C) 2021, Red Hat Inc.
+#
+# SPDX-License-Identifier: LGPL-2.1-or-later
+#
+# Author: Marc-André Lureau <marcandre.lureau@redhat.com>
+"""dbus-doc is a Sphinx extension that provides documentation from D-Bus XML."""
+
+from sphinx.application import Sphinx
+from sphinx.util.docutils import SphinxDirective
+from typing import Any, Dict
+
+
+class FakeDBusDocDirective(SphinxDirective):
+    has_content = True
+    required_arguments = 1
+
+    def run(self):
+        return []
+
+
+def setup(app: Sphinx) -> Dict[str, Any]:
+    """Register a fake dbus-doc directive with Sphinx"""
+    app.add_directive("dbus-doc", FakeDBusDocDirective)
-- 
2.34.1.8.g35151cf07204


