Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BA639E869
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:28:42 +0200 (CEST)
Received: from localhost ([::1]:52264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLrV-0002CD-Kv
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXU-0005Bg-9J
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:08:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLX9-0006bT-I5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:08:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCrZyO1qNkd4rITWYizcF326ntxeg9vgg3xUH2rFyZY=;
 b=hi5V/jHZu7wAg9VDG+mkQQmx0zBhfRjKW1gqskzNsR/zceRnDcG+XMVX4FqBfi+LyTw7lb
 5yBX/WpwkfPQABMm4C24xvqDCMT0RWWZ6SHV2kbAczXGsQQfpcSldJDPzlm/r1fUKFm2yx
 qurnALqXQF39DVlB/1ZKPYTX8Wh3kto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-ZGjCfHpdOvqiflp_J2r9EQ-1; Mon, 07 Jun 2021 16:07:35 -0400
X-MC-Unique: ZGjCfHpdOvqiflp_J2r9EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70D2710CE780;
 Mon,  7 Jun 2021 20:07:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B77A65C1C2;
 Mon,  7 Jun 2021 20:07:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 39/42] scripts/qmp-shell: add docstrings
Date: Mon,  7 Jun 2021 16:06:46 -0400
Message-Id: <20210607200649.1840382-40-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 1a8a4ba18a..15aedb80c2 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -106,15 +106,20 @@ LOG = logging.getLogger(__name__)
 
 
 class QMPCompleter:
+    """
+    QMPCompleter provides a readline library tab-complete behavior.
+    """
     # NB: Python 3.9+ will probably allow us to subclass list[str] directly,
     # but pylint as of today does not know that List[str] is simply 'list'.
     def __init__(self) -> None:
         self._matches: List[str] = []
 
     def append(self, value: str) -> None:
+        """Append a new valid completion to the list of possibilities."""
         return self._matches.append(value)
 
     def complete(self, text: str, state: int) -> Optional[str]:
+        """readline.set_completer() callback implementation."""
         for cmd in self._matches:
             if cmd.startswith(text):
                 if state == 0:
@@ -124,7 +129,9 @@ class QMPCompleter:
 
 
 class QMPShellError(qmp.QMPError):
-    pass
+    """
+    QMP Shell Base error class.
+    """
 
 
 class FuzzyJSON(ast.NodeTransformer):
@@ -137,6 +144,9 @@ class FuzzyJSON(ast.NodeTransformer):
     @classmethod
     def visit_Name(cls,  # pylint: disable=invalid-name
                    node: ast.Name) -> ast.AST:
+        """
+        Transform Name nodes with certain values into Constant (keyword) nodes.
+        """
         if node.id == 'true':
             return ast.Constant(value=True)
         if node.id == 'false':
@@ -147,6 +157,13 @@ class FuzzyJSON(ast.NodeTransformer):
 
 
 class QMPShell(qmp.QEMUMonitorProtocol):
+    """
+    QMPShell provides a basic readline-based QMP shell.
+
+    :param address: Address of the QMP server.
+    :param pretty: Pretty-print QMP messages.
+    :param verbose: Echo outgoing QMP messages to console.
+    """
     def __init__(self, address: qmp.SocketAddrT,
                  pretty: bool = False, verbose: bool = False):
         super().__init__(address)
@@ -333,6 +350,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
     def show_banner(self,
                     msg: str = 'Welcome to the QMP low-level shell!') -> None:
+        """
+        Print to stdio a greeting, and the QEMU version if available.
+        """
         print(msg)
         if not self._greeting:
             print('Connected')
@@ -342,6 +362,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
     @property
     def prompt(self) -> str:
+        """
+        Return the current shell prompt, including a trailing space.
+        """
         if self._transmode:
             return 'TRANS> '
         return '(QEMU) '
@@ -367,6 +390,9 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         return self._execute_cmd(cmdline)
 
     def repl(self) -> Iterator[None]:
+        """
+        Return an iterator that implements the REPL.
+        """
         self.show_banner()
         while self.read_exec_command():
             yield
@@ -374,6 +400,13 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
 
 class HMPShell(QMPShell):
+    """
+    HMPShell provides a basic readline-based HMP shell, tunnelled via QMP.
+
+    :param address: Address of the QMP server.
+    :param pretty: Pretty-print QMP messages.
+    :param verbose: Echo outgoing QMP messages to console.
+    """
     def __init__(self, address: qmp.SocketAddrT,
                  pretty: bool = False, verbose: bool = False):
         super().__init__(address, pretty, verbose)
@@ -451,11 +484,15 @@ class HMPShell(QMPShell):
 
 
 def die(msg: str) -> NoReturn:
+    """Write an error to stderr, then exit with a return code of 1."""
     sys.stderr.write('ERROR: %s\n' % msg)
     sys.exit(1)
 
 
 def main() -> None:
+    """
+    qmp-shell entry point: parse command line arguments and start the REPL.
+    """
     parser = argparse.ArgumentParser()
     parser.add_argument('-H', '--hmp', action='store_true',
                         help='Use HMP interface')
-- 
2.31.1


