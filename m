Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 647EF39E82E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:15:34 +0200 (CEST)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLen-00070Z-BK
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:15:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWy-00046o-VT
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWt-0006V4-IN
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X67zZQznA/dmqztz2ytUiTTb1EaymoszsnIuKjXCVEg=;
 b=ctQpGeBpCxeU1xrCYu+WWHf0nN0rqR5nyQJjltcyXseV20usQ/7Ocp6n2G+KGlLXflFRcz
 pK4+qrldHH1ib/0i+XeeoNHj+F1WbcGjtuXJ0m/Cw4oqr5jx5/FBHE1Xg6wj1Fq2CpzHo8
 MqPd9SOy5eqhFvZLLKCKssp9GqXDVkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-kyn71RS_OS2MWPcv8Vb6iA-1; Mon, 07 Jun 2021 16:07:21 -0400
X-MC-Unique: kyn71RS_OS2MWPcv8Vb6iA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEC27108C2AD;
 Mon,  7 Jun 2021 20:07:20 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDFC05C1C2;
 Mon,  7 Jun 2021 20:07:19 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/42] scripts/qmp-shell: add mypy types
Date: Mon,  7 Jun 2021 16:06:34 -0400
Message-Id: <20210607200649.1840382-28-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per my usual, this patch is annotations only. Any changes with side
effects are done elsewhere.

Note: pylint does not understand the subscripts for Collection in Python 3.6,
so use the stronger Sequence type as a workaround.
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 67 ++++++++++++++++++++++++++-----------------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 670361322c..2d0e85b5f7 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -72,10 +72,18 @@ import os
 import re
 import readline
 import sys
+from typing import (
+    Iterator,
+    List,
+    NoReturn,
+    Optional,
+    Sequence,
+)
 
 
 sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
+from qemu.qmp import QMPMessage
 
 
 class QMPCompleter:
@@ -122,25 +130,26 @@ class FuzzyJSON(ast.NodeTransformer):
 # TODO: QMPShell's interface is a bit ugly (eg. _fill_completion() and
 #       _execute_cmd()). Let's design a better one.
 class QMPShell(qmp.QEMUMonitorProtocol):
-    def __init__(self, address, pretty=False, verbose=False):
+    def __init__(self, address: str, pretty: bool = False,
+                 verbose: bool = False):
         super().__init__(self.parse_address(address))
-        self._greeting = None
+        self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
         self._pretty = pretty
         self._transmode = False
-        self._actions = list()
+        self._actions: List[QMPMessage] = []
         self._histfile = os.path.join(os.path.expanduser('~'),
                                       '.qmp-shell_history')
         self.verbose = verbose
 
-    def _fill_completion(self):
+    def _fill_completion(self) -> None:
         cmds = self.cmd('query-commands')
         if 'error' in cmds:
             return
         for cmd in cmds['return']:
             self._completer.append(cmd['name'])
 
-    def __completer_setup(self):
+    def __completer_setup(self) -> None:
         self._completer = QMPCompleter()
         self._fill_completion()
         readline.set_history_length(1024)
@@ -157,14 +166,14 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             print(f"Failed to read history '{self._histfile}': {err!s}")
         atexit.register(self.__save_history)
 
-    def __save_history(self):
+    def __save_history(self) -> None:
         try:
             readline.write_history_file(self._histfile)
         except IOError as err:
             print(f"Failed to save history file '{self._histfile}': {err!s}")
 
     @classmethod
-    def __parse_value(cls, val):
+    def __parse_value(cls, val: str) -> object:
         try:
             return int(val)
         except ValueError:
@@ -189,7 +198,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                 pass
         return val
 
-    def __cli_expr(self, tokens, parent):
+    def __cli_expr(self,
+                   tokens: Sequence[str],
+                   parent: qmp.QMPObject) -> None:
         for arg in tokens:
             (key, sep, val) = arg.partition('=')
             if sep != '=':
@@ -215,7 +226,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                 raise QMPShellError(f'Cannot set "{key}" multiple times')
             parent[optpath[-1]] = value
 
-    def __build_cmd(self, cmdline):
+    def __build_cmd(self, cmdline: str) -> Optional[QMPMessage]:
         """
         Build a QMP input object from a user provided command-line in the
         following format:
@@ -224,6 +235,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         """
         argument_regex = r'''(?:[^\s"']|"(?:\\.|[^"])*"|'(?:\\.|[^'])*')+'''
         cmdargs = re.findall(argument_regex, cmdline)
+        qmpcmd: QMPMessage
 
         # Transactional CLI entry/exit:
         if cmdargs[0] == 'transaction(':
@@ -261,14 +273,14 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         self.__cli_expr(cmdargs[1:], qmpcmd['arguments'])
         return qmpcmd
 
-    def _print(self, qmp_message):
+    def _print(self, qmp_message: object) -> None:
         indent = None
         if self._pretty:
             indent = 4
         jsobj = json.dumps(qmp_message, indent=indent, sort_keys=self._pretty)
         print(str(jsobj))
 
-    def _execute_cmd(self, cmdline):
+    def _execute_cmd(self, cmdline: str) -> bool:
         try:
             qmpcmd = self.__build_cmd(cmdline)
         except Exception as err:
@@ -288,11 +300,12 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         self._print(resp)
         return True
 
-    def connect(self, negotiate: bool = True):
+    def connect(self, negotiate: bool = True) -> None:
         self._greeting = super().connect(negotiate)
         self.__completer_setup()
 
-    def show_banner(self, msg='Welcome to the QMP low-level shell!'):
+    def show_banner(self,
+                    msg: str = 'Welcome to the QMP low-level shell!') -> None:
         print(msg)
         if not self._greeting:
             print('Connected')
@@ -301,12 +314,12 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         print("Connected to QEMU {major}.{minor}.{micro}\n".format(**version))
 
     @property
-    def prompt(self):
+    def prompt(self) -> str:
         if self._transmode:
             return 'TRANS> '
         return '(QEMU) '
 
-    def read_exec_command(self):
+    def read_exec_command(self) -> bool:
         """
         Read and execute a command.
 
@@ -326,7 +339,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
         return self._execute_cmd(cmdline)
 
-    def repl(self):
+    def repl(self) -> Iterator[None]:
         self.show_banner()
         while self.read_exec_command():
             yield
@@ -334,11 +347,12 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
 
 class HMPShell(QMPShell):
-    def __init__(self, address, pretty=False, verbose=False):
+    def __init__(self, address: str,
+                 pretty: bool = False, verbose: bool = False):
         super().__init__(address, pretty, verbose)
         self.__cpu_index = 0
 
-    def __cmd_completion(self):
+    def __cmd_completion(self) -> None:
         for cmd in self.__cmd_passthrough('help')['return'].split('\r\n'):
             if cmd and cmd[0] != '[' and cmd[0] != '\t':
                 name = cmd.split()[0]  # drop help text
@@ -355,21 +369,22 @@ class HMPShell(QMPShell):
                 self._completer.append(name)
                 self._completer.append('help ' + name)  # help completion
 
-    def __info_completion(self):
+    def __info_completion(self) -> None:
         for cmd in self.__cmd_passthrough('info')['return'].split('\r\n'):
             if cmd:
                 self._completer.append('info ' + cmd.split()[1])
 
-    def __other_completion(self):
+    def __other_completion(self) -> None:
         # special cases
         self._completer.append('help info')
 
-    def _fill_completion(self):
+    def _fill_completion(self) -> None:
         self.__cmd_completion()
         self.__info_completion()
         self.__other_completion()
 
-    def __cmd_passthrough(self, cmdline, cpu_index=0):
+    def __cmd_passthrough(self, cmdline: str,
+                          cpu_index: int = 0) -> QMPMessage:
         return self.cmd_obj({
             'execute': 'human-monitor-command',
             'arguments': {
@@ -378,7 +393,7 @@ class HMPShell(QMPShell):
             }
         })
 
-    def _execute_cmd(self, cmdline):
+    def _execute_cmd(self, cmdline: str) -> bool:
         if cmdline.split()[0] == "cpu":
             # trap the cpu command, it requires special setting
             try:
@@ -404,16 +419,16 @@ class HMPShell(QMPShell):
             print('%s: %s' % (resp['error']['class'], resp['error']['desc']))
         return True
 
-    def show_banner(self, msg='Welcome to the HMP shell!'):
+    def show_banner(self, msg: str = 'Welcome to the HMP shell!') -> None:
         QMPShell.show_banner(self, msg)
 
 
-def die(msg):
+def die(msg: str) -> NoReturn:
     sys.stderr.write('ERROR: %s\n' % msg)
     sys.exit(1)
 
 
-def main():
+def main() -> None:
     parser = argparse.ArgumentParser()
     parser.add_argument('-H', '--hmp', action='store_true',
                         help='Use HMP interface')
-- 
2.31.1


