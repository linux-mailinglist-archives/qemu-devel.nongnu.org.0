Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D923B8E9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 12:40:14 +0200 (CEST)
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2uMf-0002vq-GA
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 06:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1k2uKP-0000xU-HS; Tue, 04 Aug 2020 06:37:53 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:54330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dimastep@yandex-team.ru>)
 id 1k2uKM-0002LP-G4; Tue, 04 Aug 2020 06:37:53 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 1E78F2E1902;
 Tue,  4 Aug 2020 13:37:48 +0300 (MSK)
Received: from iva8-88b7aa9dc799.qloud-c.yandex.net
 (iva8-88b7aa9dc799.qloud-c.yandex.net [2a02:6b8:c0c:77a0:0:640:88b7:aa9d])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 CwlcxYsVO7-bktu9HBS; Tue, 04 Aug 2020 13:37:48 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1596537468; bh=gDOPq1RV3CLuGyPljyeYmAP4zg0EO7xHieFeyJevpn0=;
 h=In-Reply-To:In-Reply-To:Message-Id:References:References:Date:
 Subject:To:From:Cc;
 b=OSysRTPN4osU1/Y0OHPltaalA5GqyvSlXHATZwKNQ8Q+nRrKFXy1mOC0LWwUAgHsG
 kCvLcOTqaRYrFzpqMrev4d5PPWFZO+2+AvJQzq177q276sWNyuKjIwiQ+eF22/qdX9
 mhi+O55C4C8pn8yPERL4wsoZNP5/22NuHFDUsfS4=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:2::1:a])
 by iva8-88b7aa9dc799.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZZLKBSFEhl-bkiW6Imp; Tue, 04 Aug 2020 13:37:46 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: Dima Stepanov <dimastep@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/7] tests/qtest/vhost-user-test: prepare the tests for
 adding new dev class
Date: Tue,  4 Aug 2020 13:36:48 +0300
Message-Id: <b6866ae7ae0b17332bfa00c2caa1145eebc7aeec.1596536559.git.dimastep@yandex-team.ru>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1596536559.git.dimastep@yandex-team.ru>
References: <cover.1596536559.git.dimastep@yandex-team.ru>
In-Reply-To: <cover.1596536559.git.dimastep@yandex-team.ru>
References: <cover.1596536559.git.dimastep@yandex-team.ru>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=dimastep@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 06:37:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 qemu-block@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 dgilbert@redhat.com, mreitz@redhat.com, fengli@smartx.com,
 yc-core@yandex-team.ru, pbonzini@redhat.com, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For now only vhost-user-net device is supported by the test. Other
vhost-user devices are not tested. As a first step make source code
refactoring so new devices can reuse the same test routines. To make
this provide a new vhost_user_ops structure with the methods to
initialize device, its command line or make a proper vhost-user
responses.

Signed-off-by: Dima Stepanov <dimastep@yandex-team.ru>
---
 tests/qtest/vhost-user-test.c | 105 ++++++++++++++++++++++++++++++------------
 1 file changed, 76 insertions(+), 29 deletions(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 9ee0f1e..3df5322 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -135,6 +135,10 @@ enum {
     TEST_FLAGS_END,
 };
 
+enum {
+    VHOST_USER_NET,
+};
+
 typedef struct TestServer {
     gchar *socket_path;
     gchar *mig_path;
@@ -154,10 +158,25 @@ typedef struct TestServer {
     bool test_fail;
     int test_flags;
     int queues;
+    struct vhost_user_ops *vu_ops;
 } TestServer;
 
+struct vhost_user_ops {
+    /* Device types. */
+    int type;
+    void (*append_opts)(TestServer *s, GString *cmd_line,
+            const char *chr_opts);
+
+    /* VHOST-USER commands. */
+    void (*set_features)(TestServer *s, CharBackend *chr,
+            VhostUserMsg *msg);
+    void (*get_protocol_features)(TestServer *s,
+            CharBackend *chr, VhostUserMsg *msg);
+};
+
 static const char *init_hugepagefs(void);
-static TestServer *test_server_new(const gchar *name);
+static TestServer *test_server_new(const gchar *name,
+        struct vhost_user_ops *ops);
 static void test_server_free(TestServer *server);
 static void test_server_listen(TestServer *server);
 
@@ -167,7 +186,7 @@ enum test_memfd {
     TEST_MEMFD_NO,
 };
 
-static void append_vhost_opts(TestServer *s, GString *cmd_line,
+static void append_vhost_net_opts(TestServer *s, GString *cmd_line,
                              const char *chr_opts)
 {
     g_string_append_printf(cmd_line, QEMU_CMD_CHR QEMU_CMD_NETDEV,
@@ -332,25 +351,15 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         break;
 
     case VHOST_USER_SET_FEATURES:
-        g_assert_cmpint(msg.payload.u64 & (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES),
-                        !=, 0ULL);
-        if (s->test_flags == TEST_FLAGS_DISCONNECT) {
-            qemu_chr_fe_disconnect(chr);
-            s->test_flags = TEST_FLAGS_BAD;
+        if (s->vu_ops->set_features) {
+            s->vu_ops->set_features(s, chr, &msg);
         }
         break;
 
     case VHOST_USER_GET_PROTOCOL_FEATURES:
-        /* send back features to qemu */
-        msg.flags |= VHOST_USER_REPLY_MASK;
-        msg.size = sizeof(m.payload.u64);
-        msg.payload.u64 = 1 << VHOST_USER_PROTOCOL_F_LOG_SHMFD;
-        msg.payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_CROSS_ENDIAN;
-        if (s->queues > 1) {
-            msg.payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_MQ;
+        if (s->vu_ops->get_protocol_features) {
+            s->vu_ops->get_protocol_features(s, chr, &msg);
         }
-        p = (uint8_t *) &msg;
-        qemu_chr_fe_write_all(chr, p, VHOST_USER_HDR_SIZE + msg.size);
         break;
 
     case VHOST_USER_GET_VRING_BASE:
@@ -467,7 +476,8 @@ static const char *init_hugepagefs(void)
 #endif
 }
 
-static TestServer *test_server_new(const gchar *name)
+static TestServer *test_server_new(const gchar *name,
+        struct vhost_user_ops *ops)
 {
     TestServer *server = g_new0(TestServer, 1);
     char template[] = "/tmp/vhost-test-XXXXXX";
@@ -495,6 +505,7 @@ static TestServer *test_server_new(const gchar *name)
 
     server->log_fd = -1;
     server->queues = 1;
+    server->vu_ops = ops;
 
     return server;
 }
@@ -669,11 +680,11 @@ static void vhost_user_test_cleanup(void *s)
 
 static void *vhost_user_test_setup(GString *cmd_line, void *arg)
 {
-    TestServer *server = test_server_new("vhost-user-test");
+    TestServer *server = test_server_new("vhost-user-test", arg);
     test_server_listen(server);
 
     append_mem_opts(server, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(server, cmd_line, "");
+    server->vu_ops->append_opts(server, cmd_line, "");
 
     g_test_queue_destroy(vhost_user_test_cleanup, server);
 
@@ -682,11 +693,11 @@ static void *vhost_user_test_setup(GString *cmd_line, void *arg)
 
 static void *vhost_user_test_setup_memfd(GString *cmd_line, void *arg)
 {
-    TestServer *server = test_server_new("vhost-user-test");
+    TestServer *server = test_server_new("vhost-user-test", arg);
     test_server_listen(server);
 
     append_mem_opts(server, cmd_line, 256, TEST_MEMFD_YES);
-    append_vhost_opts(server, cmd_line, "");
+    server->vu_ops->append_opts(server, cmd_line, "");
 
     g_test_queue_destroy(vhost_user_test_cleanup, server);
 
@@ -720,7 +731,7 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
         return;
     }
 
-    dest = test_server_new("dest");
+    dest = test_server_new("dest", s->vu_ops);
     dest_cmdline = g_string_new(qos_get_current_command_line());
     uri = g_strdup_printf("%s%s", "unix:", dest->mig_path);
 
@@ -730,7 +741,7 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
     test_server_listen(dest);
     g_string_append_printf(dest_cmdline, " -incoming %s", uri);
     append_mem_opts(dest, dest_cmdline, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(dest, dest_cmdline, "");
+    dest->vu_ops->append_opts(dest, dest_cmdline, "");
     to = qtest_init(dest_cmdline->str);
 
     /* This would be where you call qos_allocate_objects(to, NULL), if you want
@@ -831,11 +842,11 @@ connect_thread(gpointer data)
 
 static void *vhost_user_test_setup_reconnect(GString *cmd_line, void *arg)
 {
-    TestServer *s = test_server_new("reconnect");
+    TestServer *s = test_server_new("reconnect", arg);
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -866,13 +877,13 @@ static void test_reconnect(void *obj, void *arg, QGuestAllocator *alloc)
 
 static void *vhost_user_test_setup_connect_fail(GString *cmd_line, void *arg)
 {
-    TestServer *s = test_server_new("connect-fail");
+    TestServer *s = test_server_new("connect-fail", arg);
 
     s->test_fail = true;
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -881,13 +892,13 @@ static void *vhost_user_test_setup_connect_fail(GString *cmd_line, void *arg)
 
 static void *vhost_user_test_setup_flags_mismatch(GString *cmd_line, void *arg)
 {
-    TestServer *s = test_server_new("flags-mismatch");
+    TestServer *s = test_server_new("flags-mismatch", arg);
 
     s->test_flags = TEST_FLAGS_DISCONNECT;
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    append_vhost_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -924,11 +935,47 @@ static void test_multiqueue(void *obj, void *arg, QGuestAllocator *alloc)
     wait_for_rings_started(s, s->queues * 2);
 }
 
+static void vu_net_set_features(TestServer *s, CharBackend *chr,
+        VhostUserMsg *msg)
+{
+    g_assert_cmpint(msg->payload.u64 &
+            (0x1ULL << VHOST_USER_F_PROTOCOL_FEATURES), !=, 0ULL);
+    if (s->test_flags == TEST_FLAGS_DISCONNECT) {
+        qemu_chr_fe_disconnect(chr);
+        s->test_flags = TEST_FLAGS_BAD;
+    }
+}
+
+static void vu_net_get_protocol_features(TestServer *s, CharBackend *chr,
+        VhostUserMsg *msg)
+{
+    /* send back features to qemu */
+    msg->flags |= VHOST_USER_REPLY_MASK;
+    msg->size = sizeof(m.payload.u64);
+    msg->payload.u64 = 1 << VHOST_USER_PROTOCOL_F_LOG_SHMFD;
+    msg->payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_CROSS_ENDIAN;
+    if (s->queues > 1) {
+        msg->payload.u64 |= 1 << VHOST_USER_PROTOCOL_F_MQ;
+    }
+    qemu_chr_fe_write_all(chr, (uint8_t *)msg, VHOST_USER_HDR_SIZE + msg->size);
+}
+
+/* Each VHOST-USER device should have its ops structure defined. */
+static struct vhost_user_ops g_vu_net_ops = {
+    .type = VHOST_USER_NET,
+
+    .append_opts = append_vhost_net_opts,
+
+    .set_features = vu_net_set_features,
+    .get_protocol_features = vu_net_get_protocol_features,
+};
+
 static void register_vhost_user_test(void)
 {
     QOSGraphTestOptions opts = {
         .before = vhost_user_test_setup,
         .subprocess = true,
+        .arg = &g_vu_net_ops,
     };
 
     qemu_add_opts(&qemu_chardev_opts);
-- 
2.7.4


