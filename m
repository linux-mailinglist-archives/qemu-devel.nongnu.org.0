Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5DE39E838
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:17:39 +0200 (CEST)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLgo-0004S9-Gb
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLX0-00049s-8P
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLWt-0006V6-OO
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yi3zJ/W406FA0wH8HIrQXSAWRKf9EFPpOyS7sMrer8=;
 b=UA+7PllmgkXkBBPvx1BqbnCBqs04BbkaloQR332d8RXiqfEYQC/0qdyeqQ/cagsvybaiXN
 IkJ513gNJzQQ6iN6fu5nEmyokA+NJjfhYN2/SoYygDl54MkAtbe0akApHOFKKKR4zThD9B
 EZAD14s49rCj+QkFhRyvxgnaW4QjAU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-AJR95NzSOy-r0Mag9JaFjQ-1; Mon, 07 Jun 2021 16:07:21 -0400
X-MC-Unique: AJR95NzSOy-r0Mag9JaFjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 583451922987;
 Mon,  7 Jun 2021 20:07:12 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5725C1C2;
 Mon,  7 Jun 2021 20:07:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/42] scripts/qmp-shell: Make verbose a public attribute
Date: Mon,  7 Jun 2021 16:06:26 -0400
Message-Id: <20210607200649.1840382-20-jsnow@redhat.com>
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

No real reason to hide this behind an underscore; make it part of the
initializer and make it a regular RW attribute.
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index de5fa189f0..cfcefb95f9 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -113,7 +113,7 @@ class FuzzyJSON(ast.NodeTransformer):
 # TODO: QMPShell's interface is a bit ugly (eg. _fill_completion() and
 #       _execute_cmd()). Let's design a better one.
 class QMPShell(qmp.QEMUMonitorProtocol):
-    def __init__(self, address, pretty=False):
+    def __init__(self, address, pretty=False, verbose=False):
         super().__init__(self.parse_address(address))
         self._greeting = None
         self._completer = None
@@ -122,7 +122,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         self._actions = list()
         self._histfile = os.path.join(os.path.expanduser('~'),
                                       '.qmp-shell_history')
-        self._verbose = False
+        self.verbose = verbose
 
     def _fill_completion(self):
         cmds = self.cmd('query-commands')
@@ -271,7 +271,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         # For transaction mode, we may have just cached the action:
         if qmpcmd is None:
             return True
-        if self._verbose:
+        if self.verbose:
             self._print(qmpcmd)
         resp = self.cmd_obj(qmpcmd)
         if resp is None:
@@ -317,13 +317,10 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
         return self._execute_cmd(cmdline)
 
-    def set_verbosity(self, verbose):
-        self._verbose = verbose
-
 
 class HMPShell(QMPShell):
-    def __init__(self, address, pretty=False):
-        super().__init__(address, pretty)
+    def __init__(self, address, pretty=False, verbose=False):
+        super().__init__(address, pretty, verbose)
         self.__cpu_index = 0
 
     def __cmd_completion(self):
@@ -423,7 +420,7 @@ def main():
 
     shell_class = HMPShell if args.hmp else QMPShell
     try:
-        qemu = shell_class(args.qmp_server, args.pretty)
+        qemu = shell_class(args.qmp_server, args.pretty, args.verbose)
     except qmp.QMPBadPortError:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
@@ -438,7 +435,6 @@ def main():
         die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
     qemu.show_banner()
-    qemu.set_verbosity(args.verbose)
     while qemu.read_exec_command(qemu.get_prompt()):
         pass
     qemu.close()
-- 
2.31.1


