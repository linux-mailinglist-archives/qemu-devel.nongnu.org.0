Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3764454E007
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:29:09 +0200 (CEST)
Received: from localhost ([::1]:48486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1ngR-0000wV-Td
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9472a68965433dde3d30184863fbaf0b66776d4a@lizzy.crudebyte.com>)
 id 1o1nLT-00079z-C6
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:29 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:45469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <9472a68965433dde3d30184863fbaf0b66776d4a@lizzy.crudebyte.com>)
 id 1o1nLR-0003HW-Tc
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:07:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=nUIOvnRFEHoLIJvozGzVxyozJn/l6t57BcihMVejN9I=; b=iczrL
 VHPz/NZYkium5sdVQLR73HLv33bJSBOD3Gd6cGLNb/a+4uD2mI5g/2x4uchSjsIJfo9npHAeY0XpK
 m4x24iDAmqDASrD9mEj25ime7yCBn8F90pf/VJq07pwE04TCNviCQjfWdWMxkB0or7AyN4thoLepx
 xUujedUubJi9CNMCIC8HEQXyTY112/2hnPKjXTYgATrb62Y3rL0SJx2gnYQrgHhfmlrL0znFmoIoN
 Ue/AYwPYTPOHRsBoh+VULPY/dPc4M6vHrfGCYuqBuSrQHnm3VYPpvo5tL6d86Cjfblo6q6/DyMHXo
 fpPo+eChwRBUvhsTkSVfEtuuZzoQw==;
Message-Id: <9472a68965433dde3d30184863fbaf0b66776d4a.1655377203.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1655377203.git.qemu_oss@crudebyte.com>
References: <cover.1655377203.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 16 Jun 2022 13:00:04 +0200
Subject: [PULL 1/7] tests/9pfs: walk to non-existent dir
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=9472a68965433dde3d30184863fbaf0b66776d4a@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Expect ENOENT Rlerror response when trying to walk to a
non-existent directory.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Based-on: <E1nTpyU-0000yR-9o@lizzy.crudebyte.com>
Message-Id: <1f5aa50ace3ba3861ea31e8888367518282065a6.1647339025.git.qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index e28c71bd8f..b3837546be 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -606,6 +606,25 @@ static uint32_t do_walk(QVirtio9P *v9p, const char *path)
     return fid;
 }
 
+/* utility function: walk to requested dir and expect passed error response */
+static void do_walk_expect_error(QVirtio9P *v9p, const char *path, uint32_t err)
+{
+    char **wnames;
+    P9Req *req;
+    uint32_t _err;
+    const uint32_t fid = genfid();
+
+    int nwnames = split(path, "/", &wnames);
+
+    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rlerror(req, &_err);
+
+    g_assert_cmpint(_err, ==, err);
+
+    split_free(&wnames);
+}
+
 static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     alloc = t_alloc;
@@ -974,6 +993,15 @@ static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
+static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+
+    do_attach(v9p);
+    do_walk_expect_error(v9p, "non-existent", ENOENT);
+}
+
 static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -1409,6 +1437,8 @@ static void register_virtio_9p_test(void)
                   &opts);
     qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
                  fs_walk_dotdot,  &opts);
+    qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexistent,
+                  &opts);
     qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen,  &opts);
     qos_add_test("synth/write/basic", "virtio-9p", fs_write,  &opts);
     qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,
-- 
2.30.2


