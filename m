Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C6139E80D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:09:26 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLYs-0006Iy-0r
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWk-0003cg-80
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWi-0006OJ-3P
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWNgd3ihg75wc6K9YcMqeNR/Xp7RpQgn6le4pkbHX8A=;
 b=Hf756SQuP8UVQbtW2ZT3d8qnUXKNm13fb2qec9gFjjGrGABqIjPyHV8aQkybDwbr1CR3gH
 JSQ/xbxj9Kmkr3Vi9y5f8TbucLYKdaE5chrO+CVe8+Dwsp62pNE53ScZOvP0A69HmQkLvM
 5Qc9Tv7Mg/u4SEKtBHF6LcG1JK+Exbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-gO6suDmIPmSNU4fOADCEnA-1; Mon, 07 Jun 2021 16:07:08 -0400
X-MC-Unique: gO6suDmIPmSNU4fOADCEnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D892E1019632;
 Mon,  7 Jun 2021 20:06:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B9A45C1C2;
 Mon,  7 Jun 2021 20:06:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/42] scripts/qmp-shell: Apply flake8 rules
Date: Mon,  7 Jun 2021 16:06:09 -0400
Message-Id: <20210607200649.1840382-3-jsnow@redhat.com>
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

A lot of fiddling around to get us below 80 columns.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 64 +++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index a00efe6fea..62a6377e06 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -88,6 +88,7 @@ class QMPCompleter(list):
                 else:
                     state -= 1
 
+
 class QMPShellError(Exception):
     pass
 
@@ -105,6 +106,7 @@ class FuzzyJSON(ast.NodeTransformer):
             node.id = 'None'
         return node
 
+
 # TODO: QMPShell's interface is a bit ugly (eg. _fill_completion() and
 #       _execute_cmd()). Let's design a better one.
 class QMPShell(qmp.QEMUMonitorProtocol):
@@ -131,8 +133,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         readline.set_history_length(1024)
         readline.set_completer(self._completer.complete)
         readline.parse_and_bind("tab: complete")
-        # XXX: default delimiters conflict with some command names (eg. query-),
-        # clearing everything as it doesn't seem to matter
+        # NB: default delimiters conflict with some command names
+        # (eg. query-), clearing everything as it doesn't seem to matter
         readline.set_completer_delims('')
         try:
             readline.read_history_file(self._histfile)
@@ -180,7 +182,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         for arg in tokens:
             (key, sep, val) = arg.partition('=')
             if sep != '=':
-                raise QMPShellError("Expected a key=value pair, got '%s'" % arg)
+                raise QMPShellError(
+                    f"Expected a key=value pair, got '{arg!s}'"
+                )
 
             value = self.__parse_value(val)
             optpath = key.split('.')
@@ -189,14 +193,16 @@ class QMPShell(qmp.QEMUMonitorProtocol):
                 curpath.append(p)
                 d = parent.get(p, {})
                 if type(d) is not dict:
-                    raise QMPShellError('Cannot use "%s" as both leaf and non-leaf key' % '.'.join(curpath))
+                    msg = 'Cannot use "{:s}" as both leaf and non-leaf key'
+                    raise QMPShellError(msg.format('.'.join(curpath)))
                 parent[p] = d
                 parent = d
             if optpath[-1] in parent:
                 if type(parent[optpath[-1]]) is dict:
-                    raise QMPShellError('Cannot use "%s" as both leaf and non-leaf key' % '.'.join(curpath))
+                    msg = 'Cannot use "{:s}" as both leaf and non-leaf key'
+                    raise QMPShellError(msg.format('.'.join(curpath)))
                 else:
-                    raise QMPShellError('Cannot set "%s" multiple times' % key)
+                    raise QMPShellError(f'Cannot set "{key}" multiple times')
             parent[optpath[-1]] = value
 
     def __build_cmd(self, cmdline):
@@ -206,7 +212,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
             < command-name > [ arg-name1=arg1 ] ... [ arg-nameN=argN ]
         """
-        cmdargs = re.findall(r'''(?:[^\s"']|"(?:\\.|[^"])*"|'(?:\\.|[^'])*')+''', cmdline)
+        argument_regex = r'''(?:[^\s"']|"(?:\\.|[^"])*"|'(?:\\.|[^'])*')+'''
+        cmdargs = re.findall(argument_regex, cmdline)
 
         # Transactional CLI entry/exit:
         if cmdargs[0] == 'transaction(':
@@ -215,9 +222,12 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         elif cmdargs[0] == ')' and self._transmode:
             self._transmode = False
             if len(cmdargs) > 1:
-                raise QMPShellError("Unexpected input after close of Transaction sub-shell")
-            qmpcmd = { 'execute': 'transaction',
-                       'arguments': { 'actions': self._actions } }
+                msg = 'Unexpected input after close of Transaction sub-shell'
+                raise QMPShellError(msg)
+            qmpcmd = {
+                'execute': 'transaction',
+                'arguments': {'actions': self._actions}
+            }
             self._actions = list()
             return qmpcmd
 
@@ -228,7 +238,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         # Parse and then cache this Transactional Action
         if self._transmode:
             finalize = False
-            action = { 'type': cmdargs[0], 'data': {} }
+            action = {'type': cmdargs[0], 'data': {}}
             if cmdargs[-1] == ')':
                 cmdargs.pop(-1)
                 finalize = True
@@ -237,7 +247,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             return self.__build_cmd(')') if finalize else None
 
         # Standard command: parse and return it to be executed.
-        qmpcmd = { 'execute': cmdargs[0], 'arguments': {} }
+        qmpcmd = {'execute': cmdargs[0], 'arguments': {}}
         self.__cli_expr(cmdargs[1:], qmpcmd['arguments'])
         return qmpcmd
 
@@ -278,7 +288,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             print('Connected')
             return
         version = self._greeting['QMP']['version']['qemu']
-        print('Connected to QEMU %d.%d.%d\n' % (version['major'],version['minor'],version['micro']))
+        print("Connected to QEMU {major}.{minor}.{micro}\n".format(**version))
 
     def get_prompt(self):
         if self._transmode:
@@ -307,6 +317,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
     def set_verbosity(self, verbose):
         self._verbose = verbose
 
+
 class HMPShell(QMPShell):
     def __init__(self, address):
         QMPShell.__init__(self, address)
@@ -315,7 +326,7 @@ class HMPShell(QMPShell):
     def __cmd_completion(self):
         for cmd in self.__cmd_passthrough('help')['return'].split('\r\n'):
             if cmd and cmd[0] != '[' and cmd[0] != '\t':
-                name = cmd.split()[0] # drop help text
+                name = cmd.split()[0]  # drop help text
                 if name == 'info':
                     continue
                 if name.find('|') != -1:
@@ -327,7 +338,7 @@ class HMPShell(QMPShell):
                     else:
                         name = opt[0]
                 self._completer.append(name)
-                self._completer.append('help ' + name) # help completion
+                self._completer.append('help ' + name)  # help completion
 
     def __info_completion(self):
         for cmd in self.__cmd_passthrough('info')['return'].split('\r\n'):
@@ -343,17 +354,21 @@ class HMPShell(QMPShell):
         self.__info_completion()
         self.__other_completion()
 
-    def __cmd_passthrough(self, cmdline, cpu_index = 0):
-        return self.cmd_obj({ 'execute': 'human-monitor-command', 'arguments':
-                              { 'command-line': cmdline,
-                                'cpu-index': cpu_index } })
+    def __cmd_passthrough(self, cmdline, cpu_index=0):
+        return self.cmd_obj({
+            'execute': 'human-monitor-command',
+            'arguments': {
+                'command-line': cmdline,
+                'cpu-index': cpu_index
+            }
+        })
 
     def _execute_cmd(self, cmdline):
         if cmdline.split()[0] == "cpu":
             # trap the cpu command, it requires special setting
             try:
                 idx = int(cmdline.split()[1])
-                if not 'return' in self.__cmd_passthrough('info version', idx):
+                if 'return' not in self.__cmd_passthrough('info version', idx):
                     print('bad CPU index')
                     return True
                 self.__cpu_index = idx
@@ -377,20 +392,26 @@ class HMPShell(QMPShell):
     def show_banner(self):
         QMPShell.show_banner(self, msg='Welcome to the HMP shell!')
 
+
 def die(msg):
     sys.stderr.write('ERROR: %s\n' % msg)
     sys.exit(1)
 
+
 def fail_cmdline(option=None):
     if option:
         sys.stderr.write('ERROR: bad command-line option \'%s\'\n' % option)
-    sys.stderr.write('qmp-shell [ -v ] [ -p ] [ -H ] [ -N ] < UNIX socket path> | < TCP address:port >\n')
+    sys.stderr.write(
+        'qmp-shell [ -v ] [ -p ] [ -H ] [ -N ] '
+        '< UNIX socket path> | < TCP address:port >\n'
+    )
     sys.stderr.write('    -v     Verbose (echo command sent and received)\n')
     sys.stderr.write('    -p     Pretty-print JSON\n')
     sys.stderr.write('    -H     Use HMP interface\n')
     sys.stderr.write('    -N     Skip negotiate (for qemu-ga)\n')
     sys.exit(1)
 
+
 def main():
     addr = ''
     qemu = None
@@ -440,5 +461,6 @@ def main():
         pass
     qemu.close()
 
+
 if __name__ == '__main__':
     main()
-- 
2.31.1


