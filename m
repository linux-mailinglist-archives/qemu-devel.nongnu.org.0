Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C7649F62
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:07:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iPM-0000v8-V5; Mon, 12 Dec 2022 07:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPE-0000k1-76
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPC-0000ZF-9q
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snOC6N8Qmx4rnpNsWU285qEKJ/QBpo3HYAbrLWVrVJU=;
 b=bVRnjJbpmPzVYVv6GXJhzuwX8jnLziVc2YAsOLfJ4CTETB+2dj9LHQqhrESuBFsOEkPMmW
 YgdRWFk76yeHLzeFMLlk7xbqAD4l7IvBq1Kby1vnEAXlyHYjSFHMgf3BQsR6vQlKMNB9WK
 MW15YN6tq8gqqwdx39qfc812H2f3bQ4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-qARjSM4FMgicnTO8R-ijRQ-1; Mon, 12 Dec 2022 07:59:36 -0500
X-MC-Unique: qARjSM4FMgicnTO8R-ijRQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r129-20020a1c4487000000b003d153a83d27so3347048wma.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=snOC6N8Qmx4rnpNsWU285qEKJ/QBpo3HYAbrLWVrVJU=;
 b=q4ALUvj36MbZPzfdOph6smAVKmy3n+uUx7UcSGpU74Gv7Zi7AE9J6or3iQRUM55jx9
 WjSawO+Kjyo+Kf4V6VOV2fT+4nvaUUu9KX+xzJHAFMGmSoaFjC7Ldd5DkMmuWYQ3XBuD
 SHmDZ6Tdv3NseClCReg47A7stKKnS6kelwJhwE1Yj/1wxJyJPbfERkON/G6soRvbxBfE
 LFNmrjxNKtxRayfr/lPkkNvCN3S9IW+U2AJJ0oFQxiCKVr/ZwD1JnsiCMrUieps/f2x3
 7NEfDn2Ol2Y5GYF7MqX44CQPBXUmQ5C/CbZObn333z1SIGvoRHHcyJ/WkYQ0wcfrO2F1
 zXdA==
X-Gm-Message-State: ANoB5pkay4sgtsekvuGkEnFI/DFB+kvQ0v6DQycamVK++qmCu7lzmOaa
 UTaX1+PXx3hrG6CjpOiFEDegdz/UimSmFwr78I3JyOy0GL+EjqK/uzzLaiSMWmpkyJwsu0gKldb
 TlqKxrMPLF2dMCwoy/vcJHmJsB7860MqFf7NJttMmiIdxmM2CkYd3FNOdZ4WyBtSk984=
X-Received: by 2002:a7b:c417:0:b0:3cc:cc18:b490 with SMTP id
 k23-20020a7bc417000000b003cccc18b490mr12190164wmi.28.1670849975138; 
 Mon, 12 Dec 2022 04:59:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6w0f0SloPkHU2nM+WiKkkSMfxO5w3snPsFi1MKUDh0iiGwLazAgDH8p3hf7VFnHo2La3pjvQ==
X-Received: by 2002:a7b:c417:0:b0:3cc:cc18:b490 with SMTP id
 k23-20020a7bc417000000b003cccc18b490mr12190143wmi.28.1670849974738; 
 Mon, 12 Dec 2022 04:59:34 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 t123-20020a1c4681000000b003cf87623c16sm9306776wma.4.2022.12.12.04.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:34 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, eesposit@redhat.com, kwolf@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 04/15] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Date: Mon, 12 Dec 2022 13:59:09 +0100
Message-Id: <20221212125920.248567-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

This test uses a callback of an I/O function (blk_aio_preadv)
to modify the graph, using bdrv_attach_child.
This is simply not allowed anymore. I/O cannot change the graph.

Before "block/io.c: make bdrv_do_drained_begin_quiesce static
and introduce bdrv_drained_begin_no_poll", the test would simply
be at risk of failure, because if bdrv_replace_child_noperm()
(called to modify the graph) would call a drain,
then one callback of .drained_begin() is bdrv_do_drained_begin_quiesce,
that specifically asserts that we are not in a coroutine.

Now that we fixed the behavior, the drain will invoke a bh in the
main loop, so we don't have such problem. However, this test is still
illegal and fails because we forbid graph changes from I/O paths.

Once we add the required subtree_drains to protect
bdrv_replace_child_noperm(), the key problem in this test is in:

acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
/* Drain and check the expected result */
bdrv_subtree_drained_begin(parent_b);

because the detach_by_parent_aio_cb calls detach_indirect_bh(), that
modifies the graph and is invoked during bdrv_subtree_drained_begin().
The call stack is the following:
1. blk_aio_preadv() creates a coroutine, increments in_flight counter
and enters the coroutine running blk_aio_read_entry()
2. blk_aio_read_entry() performs the read and then schedules a bh to
   complete (blk_aio_complete)
3. at this point, subtree_drained_begin() kicks in and waits for all
   in_flight requests, polling
4. polling allows the bh to be scheduled, so blk_aio_complete runs
5. blk_aio_complete *first* invokes the callback
   (detach_by_parent_aio_cb) and then decrements the in_flight counter
6. Here we have the problem: detach_by_parent_aio_cb modifies the graph,
   so both bdrv_unref_child() and bdrv_attach_child() will have
   subtree_drains inside. And this causes a deadlock, because the
   nested drain will wait for in_flight counter to go to zero, which
   is only happening once the drain itself finishes.

Different story is test_detach_by_driver_cb(): in this case,
detach_by_parent_aio_cb() does not call detach_indirect_bh(),
but it is instead called as a bh running in the main loop by
detach_by_driver_cb_drained_begin(), the callback for
.drained_begin().

This test was added in 231281ab42 and part of the series
"Drain fixes and cleanups, part 3"
https://lists.nongnu.org/archive/html/qemu-block/2018-05/msg01132.html
but as explained above I believe that it is not valid anymore, and
can be discarded.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220314131854.2202651-8-eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 42 +++++++++---------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 172bc6debc23..3be214f30186 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1106,7 +1106,6 @@ struct detach_by_parent_data {
     BdrvChild *child_b;
     BlockDriverState *c;
     BdrvChild *child_c;
-    bool by_parent_cb;
 };
 static struct detach_by_parent_data detach_by_parent_data;
 
@@ -1124,12 +1123,7 @@ static void detach_indirect_bh(void *opaque)
 
 static void detach_by_parent_aio_cb(void *opaque, int ret)
 {
-    struct detach_by_parent_data *data = &detach_by_parent_data;
-
     g_assert_cmpint(ret, ==, 0);
-    if (data->by_parent_cb) {
-        detach_indirect_bh(data);
-    }
 }
 
 static void detach_by_driver_cb_drained_begin(BdrvChild *child)
@@ -1148,33 +1142,26 @@ static BdrvChildClass detach_by_driver_cb_class;
  *    \ /   \
  *     A     B     C
  *
- * by_parent_cb == true:  Test that parent callbacks don't poll
- *
- *     PA has a pending write request whose callback changes the child nodes of
- *     PB: It removes B and adds C instead. The subtree of PB is drained, which
- *     will indirectly drain the write request, too.
- *
- * by_parent_cb == false: Test that bdrv_drain_invoke() doesn't poll
+ * Test that bdrv_drain_invoke() doesn't poll
  *
  *     PA's BdrvChildClass has a .drained_begin callback that schedules a BH
  *     that does the same graph change. If bdrv_drain_invoke() calls it, the
  *     state is messed up, but if it is only polled in the single
  *     BDRV_POLL_WHILE() at the end of the drain, this should work fine.
  */
-static void test_detach_indirect(bool by_parent_cb)
+static void test_detach_indirect(void)
 {
     BlockBackend *blk;
     BlockDriverState *parent_a, *parent_b, *a, *b, *c;
     BdrvChild *child_a, *child_b;
     BlockAIOCB *acb;
+    BDRVTestState *s;
 
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
 
-    if (!by_parent_cb) {
-        detach_by_driver_cb_class = child_of_bds;
-        detach_by_driver_cb_class.drained_begin =
-            detach_by_driver_cb_drained_begin;
-    }
+    detach_by_driver_cb_class = child_of_bds;
+    detach_by_driver_cb_class.drained_begin =
+        detach_by_driver_cb_drained_begin;
 
     /* Create all involved nodes */
     parent_a = bdrv_new_open_driver(&bdrv_test, "parent-a", BDRV_O_RDWR,
@@ -1193,10 +1180,8 @@ static void test_detach_indirect(bool by_parent_cb)
 
     /* If we want to get bdrv_drain_invoke() to call aio_poll(), the driver
      * callback must not return immediately. */
-    if (!by_parent_cb) {
-        BDRVTestState *s = parent_a->opaque;
-        s->sleep_in_drain_begin = true;
-    }
+    s = parent_a->opaque;
+    s->sleep_in_drain_begin = true;
 
     /* Set child relationships */
     bdrv_ref(b);
@@ -1208,7 +1193,7 @@ static void test_detach_indirect(bool by_parent_cb)
 
     bdrv_ref(a);
     bdrv_attach_child(parent_a, a, "PA-A",
-                      by_parent_cb ? &child_of_bds : &detach_by_driver_cb_class,
+                      &detach_by_driver_cb_class,
                       BDRV_CHILD_DATA, &error_abort);
 
     g_assert_cmpint(parent_a->refcnt, ==, 1);
@@ -1226,7 +1211,6 @@ static void test_detach_indirect(bool by_parent_cb)
         .parent_b = parent_b,
         .child_b = child_b,
         .c = c,
-        .by_parent_cb = by_parent_cb,
     };
     acb = blk_aio_preadv(blk, 0, &qiov, 0, detach_by_parent_aio_cb, NULL);
     g_assert(acb != NULL);
@@ -1271,14 +1255,9 @@ static void test_detach_indirect(bool by_parent_cb)
     bdrv_unref(c);
 }
 
-static void test_detach_by_parent_cb(void)
-{
-    test_detach_indirect(true);
-}
-
 static void test_detach_by_driver_cb(void)
 {
-    test_detach_indirect(false);
+    test_detach_indirect();
 }
 
 static void test_append_to_drained(void)
@@ -2029,7 +2008,6 @@ int main(int argc, char **argv)
     g_test_add_func("/bdrv-drain/deletion/drain", test_delete_by_drain);
     g_test_add_func("/bdrv-drain/detach/drain_all", test_detach_by_drain_all);
     g_test_add_func("/bdrv-drain/detach/drain", test_detach_by_drain);
-    g_test_add_func("/bdrv-drain/detach/parent_cb", test_detach_by_parent_cb);
     g_test_add_func("/bdrv-drain/detach/driver_cb", test_detach_by_driver_cb);
 
     g_test_add_func("/bdrv-drain/attach/drain", test_append_to_drained);
-- 
2.38.1


