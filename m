Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF5F375B9F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:20:02 +0200 (CEST)
Received: from localhost ([::1]:41118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejXV-0006qn-VC
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cennedee@protonmail.com>)
 id 1lejRU-0002mJ-Rx
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:13:48 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:14050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cennedee@protonmail.com>)
 id 1lejRQ-0005NQ-QT
 for qemu-devel@nongnu.org; Thu, 06 May 2021 15:13:48 -0400
Date: Thu, 06 May 2021 19:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1620328420;
 bh=s0MHVU4poxeQJKBAlLnPguRQv2yMdCBUbj0texaM0Rg=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=OlXVRnJ05uGZ4A+NYU6wwqcpdGI3xf0hnHBmPdITZLDteMVToWlnqE+MnJFt1Vpze
 L3oZVp87SqQ9WBuoJKO+oQjeZJvyGh9acXetlDByGKqwfyvrC9Hf23WBtOvzbsUgIu
 BRCE0jSfmsYubGIoF/tOexHUHzZqQXPZevsvf5CA=
To: Stefan Hajnoczi <stefanha@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
From: cennedee <cennedee@protonmail.com>
Subject: Re: [PATCH] Add missing coroutine_fn function signature to functions
Message-ID: <jIsKogXaCAXLrz6EQmoe_JD8TSR6h0Ud-nnXrdPRaupurt9VN_ZmxF0IYqKOExfwuCRPiKp1kTXweklz9uuXqkvoG7_g3pR9kCrr01sZtv4=@protonmail.com>
In-Reply-To: <YJAt8r78WAVdFrpa@stefanha-x1.localdomain>
References: <8y2vfZuyQoZPUsO-9E_Vl_x5LG4S3-ewrNqvmbgOTUHPglYpU2A0-jjdIh78JySlGCqhHgfXXezC_HGTIbSdlsqcT9YzUKr0b_FKp1OLk00=@protonmail.com>
 <YJAt8r78WAVdFrpa@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.130;
 envelope-from=cennedee@protonmail.com; helo=mail-40130.protonmail.ch
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: cennedee <cennedee@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for the feedback. Here is an updated patch.
Added more functions related to do_sgio() as suggested. Also found one rela=
ted to prh_co_entry()

I have removed (edits on) two files as there are many more functions I foun=
d in those. So I think another thread might be more appropriate (where I'll=
 send patches flie by file). Focusing on two files here now.

For reference the path of calls that end up on a coroutine_fn below

do_pr_in() --> do_sgio()
do_pr_out() --> do_sgio()
mpath_reconstruct_sense() --> do_sgio()
multipath_pr_out() --> mpath_reconstruct_sense() --> do_sgio()
multipath_pr_in() --> mpath_reconstruct_sense() --> do_sgio()
accept_client() --> prh_co_entry()



From 79f787c2ef5f713546b38a76367d273ff65742d6 Mon Sep 17 00:00:00 2001
From: Cenne Dee <cennedee+qemu-devel@protonmail.com>
Date: Fri, 30 Apr 2021 15:52:28 -0400
Subject: [PATCH] Add missing coroutine_fn function signature to some _co()
 functions

Patch adds the signature for relevant functions ending with _co
or those that use them.

Signed-off-by: Cenne Dee <cennedee+qemu-devel@protonmail.com>
---
 scsi/qemu-pr-helper.c         | 14 +++++++-------
 tests/unit/test-thread-pool.c |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 7b9389b..695539b 100644
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
@@ -318,7 +318,7 @@ static SCSISense mpath_generic_sense(int r)
     }
 }

-static int mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
+static int coroutine_fn mpath_reconstruct_sense(int fd, int r, uint8_t *se=
nse)
 {
     switch (r) {
     case MPATH_PR_SUCCESS:
@@ -370,7 +370,7 @@ static int mpath_reconstruct_sense(int fd, int r, uint8=
_t *sense)
     }
 }

-static int multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
+static int coroutine_fn multipath_pr_in(int fd, const uint8_t *cdb, uint8_=
t *sense,
                            uint8_t *data, int sz)
 {
     int rq_servact =3D cdb[1];
@@ -425,7 +425,7 @@ static int multipath_pr_in(int fd, const uint8_t *cdb, =
uint8_t *sense,
     return mpath_reconstruct_sense(fd, r, sense);
 }

-static int multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
+static int coroutine_fn multipath_pr_out(int fd, const uint8_t *cdb, uint8=
_t *sense,
                             const uint8_t *param, int sz)
 {
     int rq_servact =3D cdb[1];
@@ -543,7 +543,7 @@ static int multipath_pr_out(int fd, const uint8_t *cdb,=
 uint8_t *sense,
 }
 #endif

-static int do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
+static int coroutine_fn do_pr_in(int fd, const uint8_t *cdb, uint8_t *sens=
e,
                     uint8_t *data, int *resp_sz)
 {
 #ifdef CONFIG_MPATH
@@ -561,7 +561,7 @@ static int do_pr_in(int fd, const uint8_t *cdb, uint8_t=
 *sense,
                    SG_DXFER_FROM_DEV);
 }

-static int do_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
+static int coroutine_fn do_pr_out(int fd, const uint8_t *cdb, uint8_t *sen=
se,
                      const uint8_t *param, int sz)
 {
     int resp_sz;
@@ -804,7 +804,7 @@ out:
     g_free(client);
 }

-static gboolean accept_client(QIOChannel *ioc, GIOCondition cond, gpointer=
 opaque)
+static gboolean coroutine_fn accept_client(QIOChannel *ioc, GIOCondition c=
ond, gpointer opaque)
 {
     QIOChannelSocket *cioc;
     PRHelperClient *prh;
diff --git a/tests/unit/test-thread-pool.c b/tests/unit/test-thread-pool.c
index 70dc631..dbaf72c 100644
--- a/tests/unit/test-thread-pool.c
+++ b/tests/unit/test-thread-pool.c
@@ -72,7 +72,7 @@ static void test_submit_aio(void)
     g_assert_cmpint(data.ret, =3D=3D, 0);
 }

-static void co_test_cb(void *opaque)
+static void coroutine_fn co_test_cb(void *opaque)
 {
     WorkerTestData *data =3D opaque;

--
2.31.1



