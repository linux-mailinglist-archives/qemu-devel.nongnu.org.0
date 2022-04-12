Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C863A4FE90D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:46:10 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMSn-0000ve-Si
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMP0-0006N9-6z
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMOy-0008Ej-9o
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:13 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r13so29181723wrr.9
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ICTAFqjODa1pbnr/S4aM70jsbTXlw7TNW2OZgqFup8=;
 b=jVeRko9hfK36+MZwehI9f92R2Rf442IZ4J7VbsbiCQBGTZIConTGyiSLy4W8ZBB093
 +CpuNo6EgYfIcKqVfplarZlNXqs0GPKrTfQScxf5GIgdoIylNLAyqbGLTa1gP1ZixAJz
 BNbNpugShbM3d/eiYh23g0jWpONU5i0q4wClhIHd9ESPcs4sjEHsF7LO7FoLw9Opnxr5
 xIUXJoZA16hfgfcmXwx83k0uv/XHI8PKDKHXhQ5A5Rkh/POPajVRHHZftMx4/sgiwqoo
 qimiXYxznDmqF0vUNAflAtgjyt8QBrOY/f9TdDVrvdcZnkOA5UiXZftBu7MZNuT2hNB5
 zk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6ICTAFqjODa1pbnr/S4aM70jsbTXlw7TNW2OZgqFup8=;
 b=u8jQtK2Vg6mFiVzh0dVthQYz635E3TFe9VZsJQcU13URDamIn5EVU3m/XBiW2iT2uw
 7dIxemjA3GI0lTdClFJkrptfj2FgNpds1zFQZlWNzAftWNOOQbYF+0fN3W3mwdT0y/lR
 VC8jLphdeEaxYH6mU4ZXuOl8vi/8FMC0HkBcKat3hT86blSlw1nQx2tu8+ieQU+IgWIS
 pN0F/K0kkQcR08pYhELVqxR52ZgFXXT8mVoaMW0PBa0QnrfArb3gBAsR1qCs7Q0ninVL
 2Ut1kuRncvNCf5+RQEUunlx3CkkKbDrIdxzQhHeyqUj2HaYEm7tsqFdae9Z1Q/XmXWqP
 WQDA==
X-Gm-Message-State: AOAM531IUR9vqHswqk01ZEhgZ4joN5jLrS5iKJ1PQURdP+IcVCgAWuxk
 xtS0af+Rgcixkd3ZD6SAfSeSTdXX3bk7rw==
X-Google-Smtp-Source: ABdhPJx1Mitq4qJL63UF9qhOvhKrEX1Quqwx2LE7KFT3ztLIXolHk8Mq2i2czM1Vi8IKzyw73Ql88Q==
X-Received: by 2002:a05:6000:2ab:b0:204:f77:c1a with SMTP id
 l11-20020a05600002ab00b002040f770c1amr30150710wry.173.1649792530763; 
 Tue, 12 Apr 2022 12:42:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 2/8] nbd: mark more coroutine_fns
Date: Tue, 12 Apr 2022 21:41:58 +0200
Message-Id: <20220412194204.350889-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several coroutine functions in block/nbd.c are not marked as such.  This
patch adds a few more markers; it is not exhaustive, but it focuses
especially on:

- places that wake other coroutines, because aio_co_wake() has very
different semantics inside a coroutine (queuing after yield vs. entering
immediately);

- functions with _co_ in their names, to avoid confusion

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 64 ++++++++++++++++++++++++++---------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6a5e410e5f..81b319318e 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -133,7 +133,7 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }
 
-static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
+static bool coroutine_fn nbd_recv_coroutine_wake_one(NBDClientRequest *req)
 {
     if (req->receiving) {
         req->receiving = false;
@@ -144,7 +144,7 @@ static bool nbd_recv_coroutine_wake_one(NBDClientRequest *req)
     return false;
 }
 
-static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
+static void coroutine_fn nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
 {
     int i;
 
@@ -155,7 +155,7 @@ static void nbd_recv_coroutines_wake(BDRVNBDState *s, bool all)
     }
 }
 
-static void nbd_channel_error(BDRVNBDState *s, int ret)
+static void coroutine_fn nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (nbd_client_connected(s)) {
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
@@ -468,9 +468,9 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
     }
 }
 
-static int nbd_co_send_request(BlockDriverState *bs,
-                               NBDRequest *request,
-                               QEMUIOVector *qiov)
+static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
+                                            NBDRequest *request,
+                                            QEMUIOVector *qiov)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     int rc, i = -1;
@@ -724,9 +724,9 @@ static int nbd_parse_error_payload(NBDStructuredReplyChunk *chunk,
     return 0;
 }
 
-static int nbd_co_receive_offset_data_payload(BDRVNBDState *s,
-                                              uint64_t orig_offset,
-                                              QEMUIOVector *qiov, Error **errp)
+static int coroutine_fn nbd_co_receive_offset_data_payload(BDRVNBDState *s,
+                                                           uint64_t orig_offset,
+                                                           QEMUIOVector *qiov, Error **errp)
 {
     QEMUIOVector sub_qiov;
     uint64_t offset;
@@ -1042,8 +1042,8 @@ break_loop:
     return false;
 }
 
-static int nbd_co_receive_return_code(BDRVNBDState *s, uint64_t handle,
-                                      int *request_ret, Error **errp)
+static int coroutine_fn nbd_co_receive_return_code(BDRVNBDState *s, uint64_t handle,
+                                                   int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
 
@@ -1056,9 +1056,9 @@ static int nbd_co_receive_return_code(BDRVNBDState *s, uint64_t handle,
     return iter.ret;
 }
 
-static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
-                                        uint64_t offset, QEMUIOVector *qiov,
-                                        int *request_ret, Error **errp)
+static int coroutine_fn nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
+                                                     uint64_t offset, QEMUIOVector *qiov,
+                                                     int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
     NBDReply reply;
@@ -1108,10 +1108,10 @@ static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
     return iter.ret;
 }
 
-static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
-                                            uint64_t handle, uint64_t length,
-                                            NBDExtent *extent,
-                                            int *request_ret, Error **errp)
+static int coroutine_fn nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
+                                                         uint64_t handle, uint64_t length,
+                                                         NBDExtent *extent,
+                                                         int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
     NBDReply reply;
@@ -1168,8 +1168,8 @@ static int nbd_co_receive_blockstatus_reply(BDRVNBDState *s,
     return iter.ret;
 }
 
-static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
-                          QEMUIOVector *write_qiov)
+static int coroutine_fn nbd_co_request(BlockDriverState *bs, NBDRequest *request,
+                                       QEMUIOVector *write_qiov)
 {
     int ret, request_ret;
     Error *local_err = NULL;
@@ -1205,9 +1205,9 @@ static int nbd_co_request(BlockDriverState *bs, NBDRequest *request,
     return ret ? ret : request_ret;
 }
 
-static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
-                                int64_t bytes, QEMUIOVector *qiov,
-                                BdrvRequestFlags flags)
+static int coroutine_fn nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
+                                             int64_t bytes, QEMUIOVector *qiov,
+                                             BdrvRequestFlags flags)
 {
     int ret, request_ret;
     Error *local_err = NULL;
@@ -1264,9 +1264,9 @@ static int nbd_client_co_preadv(BlockDriverState *bs, int64_t offset,
     return ret ? ret : request_ret;
 }
 
-static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
-                                 int64_t bytes, QEMUIOVector *qiov,
-                                 BdrvRequestFlags flags)
+static int coroutine_fn nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
+                                              int64_t bytes, QEMUIOVector *qiov,
+                                              BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1289,8 +1289,8 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
     return nbd_co_request(bs, &request, qiov);
 }
 
-static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
-                                       int64_t bytes, BdrvRequestFlags flags)
+static int coroutine_fn nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
+                                                    int64_t bytes, BdrvRequestFlags flags)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1324,7 +1324,7 @@ static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
     return nbd_co_request(bs, &request, NULL);
 }
 
-static int nbd_client_co_flush(BlockDriverState *bs)
+static int coroutine_fn nbd_client_co_flush(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = { .type = NBD_CMD_FLUSH };
@@ -1339,8 +1339,8 @@ static int nbd_client_co_flush(BlockDriverState *bs)
     return nbd_co_request(bs, &request, NULL);
 }
 
-static int nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
-                                  int64_t bytes)
+static int coroutine_fn nbd_client_co_pdiscard(BlockDriverState *bs, int64_t offset,
+                                               int64_t bytes)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
     NBDRequest request = {
@@ -1916,7 +1916,7 @@ fail:
     return ret;
 }
 
-static int nbd_co_flush(BlockDriverState *bs)
+static int coroutine_fn nbd_co_flush(BlockDriverState *bs)
 {
     return nbd_client_co_flush(bs);
 }
-- 
2.35.1



