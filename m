Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C842A5B6C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 02:02:25 +0100 (CET)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ka7Bw-0001DG-A5
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 20:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ka6ni-0007GW-51
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 19:37:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ka6ne-0004w9-R1
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 19:37:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604450238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iskghmMZ9Cu+o7H8nn+qox8VkTJEOcWFJKDnEwqu+FQ=;
 b=QZJPviMlBHrDAkFTz0AykgDYdwMmcHpJll0F3o8A559wIaKabvxkx944P4gXkYjIlGMDZX
 LZIkkxcRXV+MbGfblhVRW+jIGb3eAPF95klVmQq89+FEYlZ6dZ+4GWn8/ORpN0RF9h++o+
 6VupRhKN1ygBuJsF0W5GRqx/5DPuUXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-k4vPhkd8PVKpgUT_nNwbCw-1; Tue, 03 Nov 2020 19:37:16 -0500
X-MC-Unique: k4vPhkd8PVKpgUT_nNwbCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1679108E1AF
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 00:37:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-97.rdu2.redhat.com [10.10.119.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C07B055766;
 Wed,  4 Nov 2020 00:37:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 51/72] scripts/qmp-shell: remove prompt argument from
 read_exec_command
Date: Tue,  3 Nov 2020 19:35:41 -0500
Message-Id: <20201104003602.1293560-52-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

It's only ever used by one caller, we can just absorb that logic.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 3b86ef7d8844..31269859c4c4 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -298,14 +298,14 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             return 'TRANS> '
         return '(QEMU) '
 
-    def read_exec_command(self, prompt):
+    def read_exec_command(self):
         """
         Read and execute a command.
 
         @return True if execution was ok, return False if disconnected.
         """
         try:
-            cmdline = input(prompt)
+            cmdline = input(self.prompt)
         except EOFError:
             print()
             return False
@@ -436,7 +436,7 @@ def main():
         die(f"Couldn't connect to {args.qmp_server}: {err!s}")
 
     qemu.show_banner()
-    while qemu.read_exec_command(qemu.prompt):
+    while qemu.read_exec_command():
         pass
     qemu.close()
 
-- 
2.26.2


