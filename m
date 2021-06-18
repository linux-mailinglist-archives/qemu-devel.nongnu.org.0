Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD6A3AD61F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:47:29 +0200 (CEST)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luOCu-0004a1-03
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZM-0000Rr-EG
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZF-0006rT-43
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0LrtyL9vjmtqOxOUikLUZBSNC+lnQxib7/RIqxAtT8=;
 b=VJhMs3YFfV6Tq8VzJfWIORZy/+FSKnQ7UJ1oqAap01YU0dSxJFiWoAdjShzvNpdWM6ECj8
 16/cPdSv4HPDAXY6fiCfOvBKQU3il91SOCikLaRjNXi9gCjD3LQxqwx13h7BWcckWft1Zl
 rKqTUyL+QFhFFrmFvpn3qH0Wp5DChxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-1FU7TCAuMFSBNq1YLGVtVw-1; Fri, 18 Jun 2021 19:06:26 -0400
X-MC-Unique: 1FU7TCAuMFSBNq1YLGVtVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E019B343D0;
 Fri, 18 Jun 2021 23:06:25 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB5531000358;
 Fri, 18 Jun 2021 23:06:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 67/72] scripts/qmp-shell: remove double-underscores
Date: Fri, 18 Jun 2021 19:04:50 -0400
Message-Id: <20210618230455.2891199-68-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They're not needed; single underscore is enough to express intent that
these methods are "internal". double underscore is used as a weak name
mangling, but that isn't beneficial for us here.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-38-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 52 +++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 82fe16cff8..40ff9e0a82 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -171,7 +171,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         for cmd in cmds['return']:
             self._completer.append(cmd['name'])
 
-    def __completer_setup(self) -> None:
+    def _completer_setup(self) -> None:
         self._completer = QMPCompleter()
         self._fill_completion()
         readline.set_history_length(1024)
@@ -196,7 +196,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             LOG.warning(msg)
 
     @classmethod
-    def __parse_value(cls, val: str) -> object:
+    def _parse_value(cls, val: str) -> object:
         try:
             return int(val)
         except ValueError:
@@ -221,9 +221,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                 pass
         return val
 
-    def __cli_expr(self,
-                   tokens: Sequence[str],
-                   parent: qmp.QMPObject) -> None:
+    def _cli_expr(self,
+                  tokens: Sequence[str],
+                  parent: qmp.QMPObject) -> None:
         for arg in tokens:
             (key, sep, val) = arg.partition('=')
             if sep != '=':
@@ -231,7 +231,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                     f"Expected a key=value pair, got '{arg!s}'"
                 )
 
-            value = self.__parse_value(val)
+            value = self._parse_value(val)
             optpath = key.split('.')
             curpath = []
             for path in optpath[:-1]:
@@ -249,7 +249,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                 raise QMPShellError(f'Cannot set "{key}" multiple times')
             parent[optpath[-1]] = value
 
-    def __build_cmd(self, cmdline: str) -> Optional[QMPMessage]:
+    def _build_cmd(self, cmdline: str) -> Optional[QMPMessage]:
         """
         Build a QMP input object from a user provided command-line in the
         following format:
@@ -289,13 +289,13 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             if cmdargs[-1] == ')':
                 cmdargs.pop(-1)
                 finalize = True
-            self.__cli_expr(cmdargs[1:], action['data'])
+            self._cli_expr(cmdargs[1:], action['data'])
             self._actions.append(action)
-            return self.__build_cmd(')') if finalize else None
+            return self._build_cmd(')') if finalize else None
 
         # Standard command: parse and return it to be executed.
         qmpcmd = {'execute': cmdargs[0], 'arguments': {}}
-        self.__cli_expr(cmdargs[1:], qmpcmd['arguments'])
+        self._cli_expr(cmdargs[1:], qmpcmd['arguments'])
         return qmpcmd
 
     def _print(self, qmp_message: object) -> None:
@@ -306,7 +306,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
     def _execute_cmd(self, cmdline: str) -> bool:
         try:
-            qmpcmd = self.__build_cmd(cmdline)
+            qmpcmd = self._build_cmd(cmdline)
         except QMPShellError as err:
             print(
                 f"Error while parsing command line: {err!s}\n"
@@ -329,7 +329,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
     def connect(self, negotiate: bool = True) -> None:
         self._greeting = super().connect(negotiate)
-        self.__completer_setup()
+        self._completer_setup()
 
     def show_banner(self,
                     msg: str = 'Welcome to the QMP low-level shell!') -> None:
@@ -377,10 +377,10 @@ class HMPShell(QMPShell):
     def __init__(self, address: qmp.SocketAddrT,
                  pretty: bool = False, verbose: bool = False):
         super().__init__(address, pretty, verbose)
-        self.__cpu_index = 0
+        self._cpu_index = 0
 
-    def __cmd_completion(self) -> None:
-        for cmd in self.__cmd_passthrough('help')['return'].split('\r\n'):
+    def _cmd_completion(self) -> None:
+        for cmd in self._cmd_passthrough('help')['return'].split('\r\n'):
             if cmd and cmd[0] != '[' and cmd[0] != '\t':
                 name = cmd.split()[0]  # drop help text
                 if name == 'info':
@@ -396,22 +396,22 @@ class HMPShell(QMPShell):
                 self._completer.append(name)
                 self._completer.append('help ' + name)  # help completion
 
-    def __info_completion(self) -> None:
-        for cmd in self.__cmd_passthrough('info')['return'].split('\r\n'):
+    def _info_completion(self) -> None:
+        for cmd in self._cmd_passthrough('info')['return'].split('\r\n'):
             if cmd:
                 self._completer.append('info ' + cmd.split()[1])
 
-    def __other_completion(self) -> None:
+    def _other_completion(self) -> None:
         # special cases
         self._completer.append('help info')
 
     def _fill_completion(self) -> None:
-        self.__cmd_completion()
-        self.__info_completion()
-        self.__other_completion()
+        self._cmd_completion()
+        self._info_completion()
+        self._other_completion()
 
-    def __cmd_passthrough(self, cmdline: str,
-                          cpu_index: int = 0) -> QMPMessage:
+    def _cmd_passthrough(self, cmdline: str,
+                         cpu_index: int = 0) -> QMPMessage:
         return self.cmd_obj({
             'execute': 'human-monitor-command',
             'arguments': {
@@ -425,14 +425,14 @@ class HMPShell(QMPShell):
             # trap the cpu command, it requires special setting
             try:
                 idx = int(cmdline.split()[1])
-                if 'return' not in self.__cmd_passthrough('info version', idx):
+                if 'return' not in self._cmd_passthrough('info version', idx):
                     print('bad CPU index')
                     return True
-                self.__cpu_index = idx
+                self._cpu_index = idx
             except ValueError:
                 print('cpu command takes an integer argument')
                 return True
-        resp = self.__cmd_passthrough(cmdline, self.__cpu_index)
+        resp = self._cmd_passthrough(cmdline, self._cpu_index)
         if resp is None:
             print('Disconnected')
             return False
-- 
2.31.1


