Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF5E39BC93
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:08:55 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCNT-0008Tk-1q
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAr-00019Q-Uj
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAi-0001VS-AJ
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8QZLQkMFCMaEsiD+0Lrc8dRGYjO8zJRP6vlPMh9DRK0=;
 b=blnMXfBXhZgs6WxRhFEi03KkqnBHqlHCuSyhRTaW75XS/Gzr6Sx2zDM6VdfySUQ5c3SK3I
 dq/yRem4UEOUwyrZXYHAjlKArX2Mtvz2nhzgpeR8Lu9oGympRo4V4RyDoG/I/4dfjkmYmb
 3PcdYCIjE16cAdfTb/mEy1SsoVOwh00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-YbscPlFgNI61E0FhCNpYjg-1; Fri, 04 Jun 2021 11:55:41 -0400
X-MC-Unique: YbscPlFgNI61E0FhCNpYjg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 941AD9F92B;
 Fri,  4 Jun 2021 15:55:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D192D50C0A;
 Fri,  4 Jun 2021 15:55:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] scripts/qemu-ga-client: apply (most) pylint rules
Date: Fri,  4 Jun 2021 11:55:27 -0400
Message-Id: <20210604155532.1499282-7-jsnow@redhat.com>
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
References: <20210604155532.1499282-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm only doing a very quick best-effort to preserve this script, to help
keep it from breaking further. I think there are pending ideas swirling
on the right way to implement better SDKs and better clients, and this
script might be a handy reference for those discussions. It presents
some interesting design problems, like static type safety when using a
dynamic RPC mechanism.

I believe it's worth preserving the effort and care that went into
making this script by updating it to work with our current
infrastructure. However, I am disabling the requirement for docstrings
in this file.

If you would like to help improve this script, please add docstrings
alongside any refactors or rejuvenations you might apply at that time.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index e81937e0ea..ece9f74fa8 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -40,6 +40,7 @@ See also: https://wiki.qemu.org/Features/QAPI/GuestAgent
 
 import argparse
 import base64
+import errno
 import os
 import random
 import sys
@@ -49,6 +50,13 @@ sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
 
 
+# This script has not seen many patches or careful attention in quite
+# some time. If you would like to improve it, please review the design
+# carefully and add docstrings at that point in time. Until then:
+
+# pylint: disable=missing-docstring
+
+
 class QemuGuestAgent(qmp.QEMUMonitorProtocol):
     def __getattr__(self, name):
         def wrapper(**kwds):
@@ -104,7 +112,8 @@ class QemuGuestAgentClient:
 
         return '\n'.join(msgs)
 
-    def __gen_ipv4_netmask(self, prefixlen):
+    @classmethod
+    def __gen_ipv4_netmask(cls, prefixlen):
         mask = int('1' * prefixlen + '0' * (32 - prefixlen), 2)
         return '.'.join([str(mask >> 24),
                          str((mask >> 16) & 0xff),
@@ -207,10 +216,12 @@ def _cmd_fstrim(client, args):
 
 
 def _cmd_ifconfig(client, args):
+    assert not args
     print(client.ifconfig())
 
 
 def _cmd_info(client, args):
+    assert not args
     print(client.info())
 
 
@@ -239,6 +250,7 @@ def _cmd_suspend(client, args):
 
 
 def _cmd_shutdown(client, args):
+    assert not args
     client.shutdown()
 
 
@@ -246,10 +258,12 @@ _cmd_powerdown = _cmd_shutdown
 
 
 def _cmd_halt(client, args):
+    assert not args
     client.shutdown('halt')
 
 
 def _cmd_reboot(client, args):
+    assert not args
     client.shutdown('reboot')
 
 
@@ -269,8 +283,6 @@ def send_command(address, cmd, args):
     try:
         client = QemuGuestAgentClient(address)
     except OSError as err:
-        import errno
-
         print(err)
         if err.errno == errno.ECONNREFUSED:
             print('Hint: qemu is not running?')
-- 
2.31.1


