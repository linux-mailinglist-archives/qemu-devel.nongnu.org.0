Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B02A5B5C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 01:57:07 +0100 (CET)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ka76o-0002bi-Rt
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 19:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ka6ne-0007CJ-NU
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 19:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ka6nc-0004vw-UN
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 19:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604450236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIMjZAoZPo6ny5PBtyWC0I9lcIqZo7oz/v3yVY473cQ=;
 b=gQ/CCJIbLIS9kPxO1/QnmOGHFni7vWkl8wqVYgUMyKR/GnqhRHUMY5C2RR8/9FYDMJ2FuI
 m+LYzsHQIEW6YICF8huIcBiDG5d3dDbeYXqg6HHSmrX3kW5l3idSSwMOm5j7CvWIqk0ZEe
 88mtlv85NC03DJL4G7WnPft0gplf08Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-oYFDkvcLNiKt-AmOUD4grw-1; Tue, 03 Nov 2020 19:37:14 -0500
X-MC-Unique: oYFDkvcLNiKt-AmOUD4grw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A85964151
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 00:37:13 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-97.rdu2.redhat.com [10.10.119.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7958B55766;
 Wed,  4 Nov 2020 00:37:12 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 49/72] scripts/qmp-shell: Make verbose a public attribute
Date: Tue,  3 Nov 2020 19:35:39 -0500
Message-Id: <20201104003602.1293560-50-jsnow@redhat.com>
In-Reply-To: <20201104003602.1293560-1-jsnow@redhat.com>
References: <20201104003602.1293560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No real reason to hide this behind an underscore; make it part of the
initializer and make it a regular RW attribute.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index ba27e9801c68..cfcefb95f9da 100755
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
@@ -319,8 +319,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
 
 class HMPShell(QMPShell):
-    def __init__(self, address, pretty=False):
-        super().__init__(address, pretty)
+    def __init__(self, address, pretty=False, verbose=False):
+        super().__init__(address, pretty, verbose)
         self.__cpu_index = 0
 
     def __cmd_completion(self):
@@ -420,7 +420,7 @@ def main():
 
     shell_class = HMPShell if args.hmp else QMPShell
     try:
-        qemu = shell_class(args.qmp_server, args.pretty)
+        qemu = shell_class(args.qmp_server, args.pretty, args.verbose)
     except qmp.QMPBadPortError:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
@@ -435,7 +435,6 @@ def main():
         die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
     qemu.show_banner()
-    qemu.set_verbosity(args.verbose)
     while qemu.read_exec_command(qemu.get_prompt()):
         pass
     qemu.close()
-- 
2.26.2


