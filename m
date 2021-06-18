Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F7A3AD60E
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:39:41 +0200 (CEST)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luO5M-00045l-4g
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYn-0007sr-CL
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYl-0006Zi-Kh
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCdSAuwmmwCzCvojQiVVROnxNgdAvSwKpzZeLcIR8wU=;
 b=IAuu+CpBzDoq+6p1n6HfKOD13KIDV0PvQTvD4scCbpJDIpduVBJDT2qoKno6jd37iizaMf
 gup20qbExxiC4gk36X0OJv7jwhf5gKtb12K8SqSdjuQQuZfaWv59AReRSFsmT6Jcri3dCq
 cA5BiIhsw7KiOZ8Bo7w5pLsp+Q0hcGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-Fmy6xl-DOPy-WEqeCrZfNQ-1; Fri, 18 Jun 2021 19:05:57 -0400
X-MC-Unique: Fmy6xl-DOPy-WEqeCrZfNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7779818D6A2A;
 Fri, 18 Jun 2021 23:05:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9DF0101E249;
 Fri, 18 Jun 2021 23:05:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/72] scripts/qmp-shell: Make verbose a public attribute
Date: Fri, 18 Jun 2021 19:04:32 -0400
Message-Id: <20210618230455.2891199-50-jsnow@redhat.com>
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

No real reason to hide this behind an underscore; make it part of the
initializer and make it a regular RW attribute.
Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-20-jsnow@redhat.com
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


