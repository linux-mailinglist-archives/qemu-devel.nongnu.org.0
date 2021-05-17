Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97637382C7E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:46:11 +0200 (CEST)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licdO-0003PR-Iy
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cennedee@protonmail.com>)
 id 1licWY-0003Xl-HM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:39:08 -0400
Received: from mail-40138.protonmail.ch ([185.70.40.138]:54015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cennedee@protonmail.com>)
 id 1licWS-0002pb-D1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:39:06 -0400
Date: Mon, 17 May 2021 12:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1621255131;
 bh=oTDijWQh0Nw1iqsYn8JM5mMJBvZMYBlsFtO0G+6BI8I=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=CWZ9MQGr6gdC0UCDd+hgg+y2D8SHWWklsZ2Ll1DwUstgsD4DZSVLSMHof4H2CzhZq
 505j6CuhpTNf8dGmnuqHyKbBdFz404r+e8boPytTCSkP09IEQIzan57EU5bJWtBppu
 e8jpLnZu3kY0BO9Wjc75JkHXoeL8nO33oeS926Gk=
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
From: cennedee <cennedee@protonmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@gmail.com>, John Snow <jsnow@redhat.com>
Subject: Re: [PATCH] Add missing coroutine_fn function signature to functions
Message-ID: <9z7gf5G0OppBW1TLTGHhpvQY7nqQbJ9-9uBK847DMGg1Lq6IaqEWuda_oRVYHLN4ANJ9INng-WlQHliEHMmezGXQ5ssf8WvVi3lXFuz5MnI=@protonmail.com>
In-Reply-To: <jIsKogXaCAXLrz6EQmoe_JD8TSR6h0Ud-nnXrdPRaupurt9VN_ZmxF0IYqKOExfwuCRPiKp1kTXweklz9uuXqkvoG7_g3pR9kCrr01sZtv4=@protonmail.com>
References: <8y2vfZuyQoZPUsO-9E_Vl_x5LG4S3-ewrNqvmbgOTUHPglYpU2A0-jjdIh78JySlGCqhHgfXXezC_HGTIbSdlsqcT9YzUKr0b_FKp1OLk00=@protonmail.com>
 <YJAt8r78WAVdFrpa@stefanha-x1.localdomain>
 <jIsKogXaCAXLrz6EQmoe_JD8TSR6h0Ud-nnXrdPRaupurt9VN_ZmxF0IYqKOExfwuCRPiKp1kTXweklz9uuXqkvoG7_g3pR9kCrr01sZtv4=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.138;
 envelope-from=cennedee@protonmail.com; helo=mail-40138.protonmail.ch
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Focusing on a single file at a time now, this particular revised patch adds
missing function signature `coroutine_fn` to definitions in scsi/qemu-pr-he=
lper.c
Intend to do more files in a separate patch series once I get the full flow=
 of this.

Compared to my previous e-mail, have also confirmed this edit passes checkp=
atch.pl

The following functions are affected.

do_sgio()
do_pr_in() --> do_sgio()
do_pr_out() --> do_sgio()
mpath_reconstruct_sense() --> do_sgio()
multipath_pr_out() --> mpath_reconstruct_sense() --> do_sgio()
multipath_pr_in() --> mpath_reconstruct_sense() --> do_sgio()
accept_client() --> prh_co_entry()


From 5bdef14027457d412972131dace76c3cabcc45a0 Mon Sep 17 00:00:00 2001
From: Cenne Dee <cennedee+qemu-devel@protonmail.com>
Date: Fri, 30 Apr 2021 15:52:28 -0400
Subject: [PATCH] Add missing coroutine_fn function signature to some _co()
 functions

Patch adds the signature for relevant functions ending with _co
or those that use them.

Signed-off-by: Cenne Dee <cennedee+qemu-devel@protonmail.com>
---
 scsi/qemu-pr-helper.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 7b9389b47b..7ed47c17c7 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -175,8 +175,8 @@ static int do_sgio_worker(void *opaque)
     return status;
 }

-static int do_sgio(int fd, const uint8_t *cdb, uint8_t *sense,
-                    uint8_t *buf, int *sz, int dir)
+static int coroutine_fn do_sgio(int fd, const uint8_t *cdb, uint8_t *sense=
,
+                                uint8_t *buf, int *sz, int dir)
 {
     ThreadPool *pool =3D aio_get_thread_pool(qemu_get_aio_context());
     int r;
@@ -318,7 +318,7 @@ static SCSISense mpath_generic_sense(int r)
     }
 }

-static int mpath_reconstruct_sense(int fd, int r, uint8_t *sense)
+static int coroutine_fn mpath_reconstruct_sense(int fd, int r, uint8_t *se=
nse)
 {
     switch (r) {
     case MPATH_PR_SUCCESS:
@@ -370,8 +370,8 @@ static int mpath_reconstruct_sense(int fd, int r, uint8=
_t *sense)
     }
 }

-static int multipath_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
-                           uint8_t *data, int sz)
+static int coroutine_fn multipath_pr_in(int fd, const uint8_t *cdb,
+                                        uint8_t *sense, uint8_t *data, int=
 sz)
 {
     int rq_servact =3D cdb[1];
     struct prin_resp resp;
@@ -425,8 +425,9 @@ static int multipath_pr_in(int fd, const uint8_t *cdb, =
uint8_t *sense,
     return mpath_reconstruct_sense(fd, r, sense);
 }

-static int multipath_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
-                            const uint8_t *param, int sz)
+static int coroutine_fn multipath_pr_out(int fd, const uint8_t *cdb,
+                                         uint8_t *sense, const uint8_t *pa=
ram,
+                                         int sz)
 {
     int rq_servact =3D cdb[1];
     int rq_scope =3D cdb[2] >> 4;
@@ -543,8 +544,8 @@ static int multipath_pr_out(int fd, const uint8_t *cdb,=
 uint8_t *sense,
 }
 #endif

-static int do_pr_in(int fd, const uint8_t *cdb, uint8_t *sense,
-                    uint8_t *data, int *resp_sz)
+static int coroutine_fn do_pr_in(int fd, const uint8_t *cdb, uint8_t *sens=
e,
+                                 uint8_t *data, int *resp_sz)
 {
 #ifdef CONFIG_MPATH
     if (is_mpath(fd)) {
@@ -561,8 +562,8 @@ static int do_pr_in(int fd, const uint8_t *cdb, uint8_t=
 *sense,
                    SG_DXFER_FROM_DEV);
 }

-static int do_pr_out(int fd, const uint8_t *cdb, uint8_t *sense,
-                     const uint8_t *param, int sz)
+static int coroutine_fn do_pr_out(int fd, const uint8_t *cdb, uint8_t *sen=
se,
+                                  const uint8_t *param, int sz)
 {
     int resp_sz;

@@ -804,7 +805,8 @@ out:
     g_free(client);
 }

-static gboolean accept_client(QIOChannel *ioc, GIOCondition cond, gpointer=
 opaque)
+static gboolean coroutine_fn accept_client(QIOChannel *ioc, GIOCondition c=
ond,
+                                           gpointer opaque)
 {
     QIOChannelSocket *cioc;
     PRHelperClient *prh;
--
2.31.1


