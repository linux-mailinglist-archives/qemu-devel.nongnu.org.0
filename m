Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B20663C9F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:19:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA9d-00013G-5Q; Tue, 10 Jan 2023 03:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9S-0000xT-Gv; Tue, 10 Jan 2023 03:38:35 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pFA9Q-0000YU-LZ; Tue, 10 Jan 2023 03:38:33 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 7E4265E606;
 Tue, 10 Jan 2023 11:38:24 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b685::1:3c])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 2cYnPs1R4a61-dGFaTEzz; Tue, 10 Jan 2023 11:38:23 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1673339903; bh=aJbCaKySm+BZo0Y85DEBNFhcpLKCYyf/p7nL4epKZS4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=UM4HhxPxO35EnlB068J0Bp2RrIYdylnySL7+Y15pBfFQOH2RewXXeQ8z0PkYMEg3U
 mYZfJwthxnMVsNNamZHr6iowF4da5Nw2UTI/mvxIlw1jIysiX+DWOccoB+EsfjnQYx
 Do6X6tv1yl51cUKsVVZDoNbvVN66Hg1kv3SnxghU=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: vsementsov@yandex-team.ru, jsnow@redhat.com, crosa@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v4 07/11] iotests: drop some occasional semicolons
Date: Tue, 10 Jan 2023 11:37:54 +0300
Message-Id: <20230110083758.161201-8-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110083758.161201-1-vsementsov@yandex-team.ru>
References: <20230110083758.161201-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
2.34.1


