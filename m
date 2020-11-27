Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478FE2C6BD9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:12:14 +0100 (CET)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijAD-0003jO-A2
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiibZ-0002qL-4O
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:36:25 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:44207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiibW-00018V-41
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:36:24 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MGzDv-1kwEzf0uDj-00E2Mq for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020
 19:36:20 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] python 3.5 compatibility
Date: Fri, 27 Nov 2020 19:36:19 +0100
Message-Id: <20201127183619.8958-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:dFCjTAuQ7dQn4AzIIsR7hQ7gTm0DGBYL+kt96w17KkLC1JwkpuV
 u/Thgr6p7KoVlwYUnfT8t9gEjICYAULH1wsVic+4ef05Mjxyeu2nIGxy2Exn9PBfAqZ45f1
 L1zr9hsM+TiT7YiAdcIhKGt+yRrzY4SuunrBzYlCBPy6EKfu4/o5C5pzMNLJKzePie+YqRE
 OXSO8G2XZ4HOb53YsW6XQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hJapPKuzUhM=:dVDFcrmEKyRrc/rKOOcJdn
 P/NJSte5Di2nn7Q0dmJWFjrBspxmKYjDtxnKHEe0YXboZOPdlmGeouiWHIKhghuSW5q0RDKbM
 /hxcYsqsg4PlmZpAk84VbloNtoOE2A86MEjp7erAv1zoWTXTWcSGLzxyky0Ky+ojniBzXK+0O
 Coa6MoIVw9tSQZ3c5YbM77bzQOkBLwPOLfsPgr1sLr4ufJqV0/G7cRi4yl3ZfD7G44txECS2X
 FHFgVmtImrwebndMUuIuOAYe6x3E/eiFAxea5jidN38iX1BpnUbyKVHVpdjom/5cIvDFgNLPr
 U+uz3r/QP7vJPXdh1UlgE2xSsCMAUNeagxgeZb9Z3DAczwvEW8m9LRiOeoMljdMZXr86aQc3W
 L2UWKXVUa2oeCEx/uCkJc5GMaxjJqrqTq7VZoECNmEX//Mc6T1Xkfisy2ehUe
Received-SPF: none client-ip=212.227.126.133; envelope-from=info@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:04:07 -0500
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

Several stable distros are still on python-3.5, so qemu cannot be
built there, w/o backporting the whole python stack. In order to
make qemu build there, make it running w/ python-3.5. The changes
are mostly removing the new type annotations (which, IMHO, just
serve for documentation purpose) and replacing f-strings by classic
string formatting.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 configure                          |  4 +--
 scripts/block-coroutine-wrapper.py | 56 ++++++++++++++++++--------------------
 scripts/qapi/commands.py           |  2 +-
 scripts/qapi/common.py             |  2 +-
 scripts/qapi/events.py             |  2 +-
 scripts/qapi/gen.py                | 10 +++----
 scripts/qapi/main.py               |  6 ++--
 scripts/qapi/schema.py             |  2 +-
 scripts/qapi/source.py             | 10 +++----
 9 files changed, 46 insertions(+), 48 deletions(-)

diff --git a/configure b/configure
index 18c26e0389..e1119929fa 100755
--- a/configure
+++ b/configure
@@ -1866,8 +1866,8 @@ fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
-if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
-  error_exit "Cannot use '$python', Python >= 3.6 is required." \
+if ! $python -c 'import sys; sys.exit(sys.version_info < (3,5))'; then
+  error_exit "Cannot use '$python', Python >= 3.5 is required." \
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 0461fd1c45..a36f7af06f 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -32,11 +32,11 @@ def gen_header():
     copyright = re.sub('^.*Copyright', 'Copyright', __doc__, flags=re.DOTALL)
     copyright = re.sub('^(?=.)', ' * ', copyright.strip(), flags=re.MULTILINE)
     copyright = re.sub('^$', ' *', copyright, flags=re.MULTILINE)
-    return f"""\
+    return """\
 /*
  * File is generated by scripts/block-coroutine-wrapper.py
  *
-{copyright}
+"""+copyright+"""
  */
 
 #include "qemu/osdep.h"
@@ -55,7 +55,7 @@ class ParamDecl:
     def __init__(self, param_decl: str) -> None:
         m = self.param_re.match(param_decl.strip())
         if m is None:
-            raise ValueError(f'Wrong parameter declaration: "{param_decl}"')
+            raise ValueError('Wrong parameter declaration: '+param_decl)
         self.decl = m.group('decl')
         self.type = m.group('type')
         self.name = m.group('name')
@@ -107,44 +107,42 @@ def gen_wrapper(func: FuncDecl) -> str:
     bs = 'bs' if func.args[0].type == 'BlockDriverState *' else 'child->bs'
     struct_name = snake_to_camel(name)
 
-    return f"""\
+    return """\
 /*
- * Wrappers for {name}
+ * Wrappers for """+name+"""
  */
 
-typedef struct {struct_name} {{
+typedef struct """+struct_name+""" {
     BdrvPollCo poll_state;
-{ func.gen_block('    {decl};') }
-}} {struct_name};
+"""+func.gen_block('    {decl};')+"""
+} """+struct_name+""";
 
-static void coroutine_fn {name}_entry(void *opaque)
-{{
-    {struct_name} *s = opaque;
+static void coroutine_fn """+name+"""_entry(void *opaque)
+{
+    """+struct_name+""" *s = opaque;
 
-    s->poll_state.ret = {name}({ func.gen_list('s->{name}') });
+    s->poll_state.ret = """+name+"""("""+func.gen_list('s->{name}')+""");
     s->poll_state.in_progress = false;
 
     aio_wait_kick();
-}}
-
-int {func.name}({ func.gen_list('{decl}') })
-{{
-    if (qemu_in_coroutine()) {{
-        return {name}({ func.gen_list('{name}') });
-    }} else {{
-        {struct_name} s = {{
-            .poll_state.bs = {bs},
+}
+
+int """+func.name+"""("""+func.gen_list('{decl}')+""")
+{
+    if (qemu_in_coroutine()) {
+        return """+name+"""("""+func.gen_list('{name}')+""");
+    } else {
+        """+struct_name+""" s = {
+            .poll_state.bs = """+bs+""",
             .poll_state.in_progress = true,
+"""+func.gen_block('            .{name} = {name},')+"""
+        };
 
-{ func.gen_block('            .{name} = {name},') }
-        }};
-
-        s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
+        s.poll_state.co = qemu_coroutine_create("""+name+"""_entry, &s);
 
         return bdrv_poll_co(&s.poll_state);
-    }}
-}}"""
-
+    }
+}"""
 
 def gen_wrappers(input_code: str) -> str:
     res = ''
@@ -157,7 +155,7 @@ def gen_wrappers(input_code: str) -> str:
 
 if __name__ == '__main__':
     if len(sys.argv) < 3:
-        exit(f'Usage: {sys.argv[0]} OUT_FILE.c IN_FILE.[ch]...')
+        exit('Usage: '+sys.argv[0]+' OUT_FILE.c IN_FILE.[ch]...')
 
     with open(sys.argv[1], 'w', encoding='utf-8') as f_out:
         f_out.write(gen_header())
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 50978090b4..3b22a16759 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -256,7 +256,7 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
             prefix, 'qapi-commands',
             ' * Schema-defined QAPI/QMP commands', None, __doc__)
         self._regy = QAPIGenCCode(None)
-        self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
+        self._visited_ret_types = {}
 
     def _begin_user_module(self, name: str) -> None:
         self._visited_ret_types[self._genc] = set()
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 11b86beeab..d107d09d8e 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -147,7 +147,7 @@ class Indentation:
         """Decrease the indentation level by ``amount``, default 4."""
         if self._level < amount:
             raise ArithmeticError(
-                f"Can't remove {amount:d} spaces from {self!r}")
+                "Can't remove %d spaces from %s" % (amount, self.r))
         self._level -= amount
 
 
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 599f3d1f56..b4e6438b9d 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -162,7 +162,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
             prefix, 'qapi-events',
             ' * Schema-defined QAPI/QMP events', None, __doc__)
         self._event_enum_name = c_name(prefix + 'QAPIEvent', protect=False)
-        self._event_enum_members: List[QAPISchemaEnumMember] = []
+        self._event_enum_members = []
         self._event_emit_name = c_name(prefix + 'qapi_event_emit')
 
     def _begin_user_module(self, name: str) -> None:
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index b40f18eee3..666f50478c 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -123,7 +123,7 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 class QAPIGenCCode(QAPIGen):
     def __init__(self, fname: Optional[str]):
         super().__init__(fname)
-        self._start_if: Optional[Tuple[List[str], str, str]] = None
+        self._start_if = None
 
     def start_if(self, ifcond: List[str]) -> None:
         assert self._start_if is None
@@ -243,10 +243,10 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         self._user_blurb = user_blurb
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
-        self._genc: Optional[QAPIGenC] = None
-        self._genh: Optional[QAPIGenH] = None
-        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
-        self._main_module: Optional[str] = None
+        self._genc = None
+        self._genh = None
+        self._module = {}
+        self._main_module = None
 
     @staticmethod
     def _is_user_module(name: Optional[str]) -> bool:
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 42517210b8..2636227915 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -79,8 +79,8 @@ def main() -> int:
 
     funny_char = invalid_prefix_char(args.prefix)
     if funny_char:
-        msg = f"funny character '{funny_char}' in argument of --prefix"
-        print(f"{sys.argv[0]}: {msg}", file=sys.stderr)
+        msg = ("funny character '%s' in argument of --prefix" % funny_char)
+        print("%s: %s" % (sys.argv[0], msg), file=sys.stderr)
         return 1
 
     try:
@@ -90,6 +90,6 @@ def main() -> int:
                  unmask=args.unmask,
                  builtins=args.builtins)
     except QAPIError as err:
-        print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
+        print("%s: %s" % (sys.argv[0], str(err)), file=sys.stderr)
         return 1
     return 0
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 720449feee..027a517e47 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -26,7 +26,7 @@ from .parser import QAPISchemaParser
 
 
 class QAPISchemaEntity:
-    meta: Optional[str] = None
+    meta = None
 
     def __init__(self, name, info, doc, ifcond=None, features=None):
         assert name is None or isinstance(name, str)
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index d7a79a9b8a..b7ff61b230 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -22,9 +22,9 @@ class QAPISchemaPragma:
         # Are documentation comments required?
         self.doc_required = False
         # Whitelist of commands allowed to return a non-dictionary
-        self.returns_whitelist: List[str] = []
+        self.returns_whitelist = []
         # Whitelist of entities allowed to violate case conventions
-        self.name_case_whitelist: List[str] = []
+        self.name_case_whitelist = []
 
 
 class QAPISourceInfo:
@@ -35,11 +35,11 @@ class QAPISourceInfo:
         self.fname = fname
         self.line = line
         self.parent = parent
-        self.pragma: QAPISchemaPragma = (
+        self.pragma = (
             parent.pragma if parent else QAPISchemaPragma()
         )
-        self.defn_meta: Optional[str] = None
-        self.defn_name: Optional[str] = None
+        self.defn_meta = None
+        self.defn_name = None
 
     def set_defn(self, meta: str, name: str) -> None:
         self.defn_meta = meta
-- 
2.11.0


