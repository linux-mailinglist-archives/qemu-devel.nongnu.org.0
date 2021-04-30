Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2412F37035B
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 00:12:35 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcbNB-0007CH-Oc
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 18:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cennedee@protonmail.com>)
 id 1lcamt-0007jj-OH; Fri, 30 Apr 2021 17:35:03 -0400
Received: from mail-40137.protonmail.ch ([185.70.40.137]:58355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cennedee@protonmail.com>)
 id 1lcamq-0000m2-LE; Fri, 30 Apr 2021 17:35:03 -0400
Date: Fri, 30 Apr 2021 21:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1619818490;
 bh=/UTzgRglq2koKH0w/UaBTvK78WfrbfeSRziifYBYPzY=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=RvgEKSMg5kmpomKF9knhF0kId3h4w5waPyAPY+RHcBN5CIWHml75u2Npms+ACZLN7
 QgTsViL4AO5sqt2dEAomx0A00Y6cAc8UlbJgMVdpRfPW2zKAmWW3QfDQE6S/wi64Ct
 vJluYIyyrzWfshv6jWz7WprNPRnJa4rH0EYmqLXg=
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
From: cennedee <cennedee@protonmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Juan Quintela <quintela@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: [PATCH] Add missing coroutine_fn function signature to functions
Message-ID: <8y2vfZuyQoZPUsO-9E_Vl_x5LG4S3-ewrNqvmbgOTUHPglYpU2A0-jjdIh78JySlGCqhHgfXXezC_HGTIbSdlsqcT9YzUKr0b_FKp1OLk00=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.137;
 envelope-from=cennedee@protonmail.com; helo=mail-40137.protonmail.ch
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 30 Apr 2021 18:11:42 -0400
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
Reply-To: cennedee <cennedee@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From 447601c28d5ed0b1208a0560390f760e75ce5613 Mon Sep 17 00:00:00 2001
From: Cenne Dee <cennedee+qemu-devel@protonmail.com>
Date: Fri, 30 Apr 2021 15:52:28 -0400
Subject: [PATCH] Add missing coroutine_fn function signature to functions

Patch adds the signature for all relevant functions ending with _co
or those that use them.

Signed-off-by: Cenne Dee <cennedee+qemu-devel@protonmail.com>
---
 block/block-gen.h             | 2 +-
 migration/migration.c         | 2 +-
 monitor/hmp.c                 | 2 +-
 scsi/qemu-pr-helper.c         | 2 +-
 tests/unit/test-thread-pool.c | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/block-gen.h b/block/block-gen.h
index f80cf48..4963372 100644
--- a/block/block-gen.h
+++ b/block/block-gen.h
@@ -36,7 +36,7 @@ typedef struct BdrvPollCo {
     Coroutine *co; /* Keep pointer here for debugging */
 } BdrvPollCo;

-static inline int bdrv_poll_co(BdrvPollCo *s)
+static inline int coroutine_fn bdrv_poll_co(BdrvPollCo *s)
 {
     assert(!qemu_in_coroutine());

diff --git a/migration/migration.c b/migration/migration.c
index 8ca0341..1acade8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -539,7 +539,7 @@ static void process_incoming_migration_bh(void *opaque)
     migration_incoming_state_destroy();
 }

-static void process_incoming_migration_co(void *opaque)
+static void coroutine_fn process_incoming_migration_co(void *opaque)
 {
     MigrationIncomingState *mis =3D migration_incoming_get_current();
     PostcopyState ps;
diff --git a/monitor/hmp.c b/monitor/hmp.c
index 6c0b33a..0a16d61 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1068,7 +1068,7 @@ typedef struct HandleHmpCommandCo {
     bool done;
 } HandleHmpCommandCo;

-static void handle_hmp_command_co(void *opaque)
+static void coroutine_fn handle_hmp_command_co(void *opaque)
 {
     HandleHmpCommandCo *data =3D opaque;
     data->cmd->cmd(data->mon, data->qdict);
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 7b9389b..7c1ed2a 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -175,7 +175,7 @@ static int do_sgio_worker(void *opaque)
     return status;
 }

-static int do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
+static int coroutine_fn do_sgio(int fd, const uint8_t *cdb, uint8_t *sense=
,
                     uint8_t *buf, int *sz, int dir)
 {
     ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
diff --git a/tests/unit/test-thread-pool.c b/tests/unit/test-thread-pool.c
index 70dc631..21fc118 100644
--- a/tests/unit/test-thread-pool.c
+++ b/tests/unit/test-thread-pool.c
@@ -72,7 +72,7 @@ static void test_submit_aio(void)
     g_assert_cmpint(data.ret, =3D=3D, 0);
 }

-static void co_test_cb(void *opaque)
+static void coroutine_fn co_test_cb(void *opaque)
 {
     WorkerTestData *data =3D opaque;

@@ -90,7 +90,7 @@ static void co_test_cb(void *opaque)
     /* The test continues in test_submit_co, after aio_poll... */
 }

-static void test_submit_co(void)
+static void coroutine_fn test_submit_co(void)
 {
     WorkerTestData data;
     Coroutine *co =3D qemu_coroutine_create(co_test_cb, &data);
--
2.31.1



