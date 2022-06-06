Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D0A53E156
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:36:08 +0200 (CEST)
Received: from localhost ([::1]:39028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny7HS-00012W-AN
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79q-0005Qr-5Z; Mon, 06 Jun 2022 03:28:14 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:59682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79h-0002ZJ-Fv; Mon, 06 Jun 2022 03:28:13 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id BF1A82E1230;
 Mon,  6 Jun 2022 10:27:56 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 kCU3twHIGP-RuKC9pSI; Mon, 06 Jun 2022 10:27:56 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654500476; bh=frK434ukP9pX160p0eR39lgCPLM+UTm942aqSZhPazo=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=gUxn4XmMBtFnNWE1XLODrhh7n2BzTugb+qy6cMnVebdSjZ1i8qEErrINaveynlgCq
 gfa7ro7aE7b5YMluMwE32YE82svBVBENOSZCFAY4t2/MLXv8Wk2kRTGWh3QfwCsyK7
 89Y3eMt/P55s62vjaCyDMiyswhxYtC0GPNn3EBAk=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y8SDrjDjAj-RuM4OOMn; Mon, 06 Jun 2022 10:27:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 jsnow@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 07/11] iotests: drop some occasional semicolons
Date: Mon,  6 Jun 2022 10:27:27 +0300
Message-Id: <20220606072731.878226-8-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606072731.878226-1-vsementsov@yandex-team.ru>
References: <20220606072731.878226-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/041 | 2 +-
 tests/qemu-iotests/196 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 4d7a829b65..550e4dc391 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1086,7 +1086,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
     def test_after_a_quorum_snapshot(self):
         result = self.vm.qmp('blockdev-snapshot-sync', node_name='img1',
                              snapshot_file=quorum_snapshot_file,
-                             snapshot_node_name="snap1");
+                             snapshot_node_name="snap1")
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index 76509a5ad1..27c1629be3 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -46,7 +46,7 @@ class TestInvalidateAutoclear(iotests.QMPTestCase):
 
     def test_migration(self):
         result = self.vm_a.qmp('migrate', uri='exec:cat>' + migfile)
-        self.assert_qmp(result, 'return', {});
+        self.assert_qmp(result, 'return', {})
         self.assertNotEqual(self.vm_a.event_wait("STOP"), None)
 
         with open(disk, 'r+b') as f:
-- 
2.25.1


