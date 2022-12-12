Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90ED649F43
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:00:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iPN-0000vT-A9; Mon, 12 Dec 2022 07:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPH-0000qi-6q
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPF-0000Zc-BN
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbsEJKW9F3PhNnVVdbZPvZl4EDjDR53UnrFcZTkNxbk=;
 b=aj7CoYR6A41oDQ55UyiNfuwGXNLKHXozxNZYi8HewuKX7BsgZtEZ2J33fhvZEvNdUjIyGz
 Uy4CtB01KMN9jZq89udQk6HG5bx0pwXCOoMCH3ZyANE/xCI5ZlYlcgkZ/88+Wwir6+r4KW
 lHQXhrEXDWpwX9MH+5EMxcwCXR5Kuvo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-13RiYR62PN2Utp7arV06aw-1; Mon, 12 Dec 2022 07:59:39 -0500
X-MC-Unique: 13RiYR62PN2Utp7arV06aw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso3323784wma.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VbsEJKW9F3PhNnVVdbZPvZl4EDjDR53UnrFcZTkNxbk=;
 b=wGYsFWZQju3sFQhSGDiN8szGY9pOzZaQITNKLyTSQQpDfIM0pyGDLz/h1xrAmyS7id
 qpmeo+g+7bRapyUj3ip0J6rgBRsVVGEHy1m7VR2PnxkY+MkDZJlBez3Rm4RtDFvKYezb
 NdXcfXqVE8j5Y15gqkIoHnMXAcs4eCrMLeJSUVKN2D/caTyaMhx71rcEzZWD2IHwfSXQ
 YFk+NjjYkh/9pkJYh4yor020pObNskQZjwWfQE0JssVj+ehbAJDhUl4bT87EHqfh5pea
 h587Hr1/Isp31GP0aR56bP5AwkVhLNKCDY+PXK5j7xm7Hs4XGtGbjD2F+X3g/pNtavAP
 wq5g==
X-Gm-Message-State: ANoB5pnPKJkq/6IlTC8bs+MOX2hxNjKpMjI3Nb94M3Y4UcL4lTQhk9RU
 HdRoOgO8L7Tgw0JwFW55snxbGP3Tzy8pNjN1q+FanihBcMhkn6rHPXm6cOrhtJb4KDY3tPGhn4r
 Akub24JgO1WlZGQj/u+b4ZBJ/mcW93yJPvo0Ox0f8M1/5N2iwC9s7uSRkbm9gtU5+6Dg=
X-Received: by 2002:a05:600c:1c9e:b0:3d2:7a7:5cc6 with SMTP id
 k30-20020a05600c1c9e00b003d207a75cc6mr10288532wms.18.1670849978084; 
 Mon, 12 Dec 2022 04:59:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4E8DqwvsoJwSrBffwYTWyWfGVeX6dSyCB0WT4qrV1Zb6sxPqpOuig3C55p8/dGdg+YY0+koQ==
X-Received: by 2002:a05:600c:1c9e:b0:3d2:7a7:5cc6 with SMTP id
 k30-20020a05600c1c9e00b003d207a75cc6mr10288513wms.18.1670849977760; 
 Mon, 12 Dec 2022 04:59:37 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a5d5448000000b0022584c82c80sm8758395wrv.19.2022.12.12.04.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:37 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 05/15] tests/unit/test-bdrv-drain.c: graph setup functions
 can't run in coroutines
Date: Mon, 12 Dec 2022 13:59:10 +0100
Message-Id: <20221212125920.248567-6-pbonzini@redhat.com>
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Graph initialization functions like blk_new(), bdrv_new() and so on
should not run in a coroutine. In fact, they might invoke a drain
(for example blk_insert_bs eventually calls bdrv_replace_child_noperm)
that in turn can invoke callbacks like bdrv_do_drained_begin_quiesce(),
that asserts exactly that we are not in a coroutine.

Move the initialization phase of test_drv_cb and test_quiesce_common
outside the coroutine logic.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220314131854.2202651-9-eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 110 ++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 41 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 3be214f30186..f677f1d9fc25 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -126,7 +126,8 @@ static void aio_ret_cb(void *opaque, int ret)
 }
 
 typedef struct CallInCoroutineData {
-    void (*entry)(void);
+    void (*entry)(void *);
+    void *arg;
     bool done;
 } CallInCoroutineData;
 
@@ -134,15 +135,16 @@ static coroutine_fn void call_in_coroutine_entry(void *opaque)
 {
     CallInCoroutineData *data = opaque;
 
-    data->entry();
+    data->entry(data->arg);
     data->done = true;
 }
 
-static void call_in_coroutine(void (*entry)(void))
+static void call_in_coroutine(void (*entry)(void *), void *arg)
 {
     Coroutine *co;
     CallInCoroutineData data = {
         .entry  = entry,
+        .arg    = arg,
         .done   = false,
     };
 
@@ -199,26 +201,28 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
     }
 }
 
-static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
-{
+typedef struct TestDriverCBData {
+    enum drain_type drain_type;
+    bool recursive;
     BlockBackend *blk;
     BlockDriverState *bs, *backing;
-    BDRVTestState *s, *backing_s;
+} TestDriverCBData;
+
+static void test_drv_cb_common(void *arg)
+{
+    TestDriverCBData *data = arg;
+    BlockBackend *blk = data->blk;
+    BlockDriverState *bs = data->bs;
+    BlockDriverState *backing = data->backing;
+    enum drain_type drain_type = data->drain_type;
+    bool recursive = data->recursive;
+    BDRVTestState *s = bs->opaque;
+    BDRVTestState *backing_s = backing->opaque;
     BlockAIOCB *acb;
     int aio_ret;
 
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
 
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
-    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
-                              &error_abort);
-    s = bs->opaque;
-    blk_insert_bs(blk, bs, &error_abort);
-
-    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
-    backing_s = backing->opaque;
-    bdrv_set_backing_hd(bs, backing, &error_abort);
-
     /* Simple bdrv_drain_all_begin/end pair, check that CBs are called */
     g_assert_cmpint(s->drain_count, ==, 0);
     g_assert_cmpint(backing_s->drain_count, ==, 0);
@@ -252,44 +256,67 @@ static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
 
     g_assert_cmpint(s->drain_count, ==, 0);
     g_assert_cmpint(backing_s->drain_count, ==, 0);
+}
 
-    bdrv_unref(backing);
-    bdrv_unref(bs);
-    blk_unref(blk);
+static void test_common_cb(enum drain_type drain_type, bool in_coroutine,
+                           void (*cb)(void *))
+{
+    TestDriverCBData data;
+
+    data.drain_type = drain_type;
+    data.recursive = (drain_type != BDRV_DRAIN);
+
+    data.blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    data.bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
+                              &error_abort);
+    blk_insert_bs(data.blk, data.bs, &error_abort);
+
+    data.backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
+    bdrv_set_backing_hd(data.bs, data.backing, &error_abort);
+
+    if (in_coroutine) {
+        call_in_coroutine(cb, &data);
+    } else {
+        cb(&data);
+    }
+
+    bdrv_unref(data.backing);
+    bdrv_unref(data.bs);
+    blk_unref(data.blk);
+}
+
+static void test_drv_cb(enum drain_type drain_type, bool in_coroutine)
+{
+    test_common_cb(drain_type, in_coroutine, test_drv_cb_common);
 }
 
 static void test_drv_cb_drain_all(void)
 {
-    test_drv_cb_common(BDRV_DRAIN_ALL, true);
+    test_drv_cb(BDRV_DRAIN_ALL, false);
 }
 
 static void test_drv_cb_drain(void)
 {
-    test_drv_cb_common(BDRV_DRAIN, false);
+    test_drv_cb(BDRV_DRAIN, false);
 }
 
 static void test_drv_cb_co_drain_all(void)
 {
-    call_in_coroutine(test_drv_cb_drain_all);
+    test_drv_cb(BDRV_DRAIN_ALL, true);
 }
 
 static void test_drv_cb_co_drain(void)
 {
-    call_in_coroutine(test_drv_cb_drain);
+    test_drv_cb(BDRV_DRAIN, true);
 }
 
-static void test_quiesce_common(enum drain_type drain_type, bool recursive)
+static void test_quiesce_common(void *arg)
 {
-    BlockBackend *blk;
-    BlockDriverState *bs, *backing;
-
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
-    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
-                              &error_abort);
-    blk_insert_bs(blk, bs, &error_abort);
-
-    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
-    bdrv_set_backing_hd(bs, backing, &error_abort);
+    TestDriverCBData *data = arg;
+    BlockDriverState *bs = data->bs;
+    BlockDriverState *backing = data->backing;
+    enum drain_type drain_type = data->drain_type;
+    bool recursive = data->recursive;
 
     g_assert_cmpint(bs->quiesce_counter, ==, 0);
     g_assert_cmpint(backing->quiesce_counter, ==, 0);
@@ -307,30 +334,31 @@ static void test_quiesce_common(enum drain_type drain_type, bool recursive)
 
     g_assert_cmpint(bs->quiesce_counter, ==, 0);
     g_assert_cmpint(backing->quiesce_counter, ==, 0);
+}
 
-    bdrv_unref(backing);
-    bdrv_unref(bs);
-    blk_unref(blk);
+static void test_quiesce(enum drain_type drain_type, bool in_coroutine)
+{
+    test_common_cb(drain_type, in_coroutine, test_quiesce_common);
 }
 
 static void test_quiesce_drain_all(void)
 {
-    test_quiesce_common(BDRV_DRAIN_ALL, true);
+    test_quiesce(BDRV_DRAIN_ALL, false);
 }
 
 static void test_quiesce_drain(void)
 {
-    test_quiesce_common(BDRV_DRAIN, false);
+    test_quiesce(BDRV_DRAIN, false);
 }
 
 static void test_quiesce_co_drain_all(void)
 {
-    call_in_coroutine(test_quiesce_drain_all);
+    test_quiesce(BDRV_DRAIN_ALL, true);
 }
 
 static void test_quiesce_co_drain(void)
 {
-    call_in_coroutine(test_quiesce_drain);
+    test_quiesce(BDRV_DRAIN, true);
 }
 
 static void test_nested(void)
-- 
2.38.1


