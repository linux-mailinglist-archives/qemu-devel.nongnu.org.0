Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84162BAF25
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:42:40 +0100 (CET)
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8YZ-00048F-FU
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8X0-0003dN-0Q
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:41:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8Wx-0000og-Ba
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605886857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OYOx7x0ULV0XD2JV3FikoVg/IzAiHk7x1eiNdi3h6Uo=;
 b=WpB02vQKn1s2XyWa++oaYu6dsi3i+m0wAgMDeY64mx2rs48QxlKg/pjeVUo6a2ip5Y7vbg
 SANcdZZ8all+oIRCQuKW5V/PF0nrH1qfR7rrG4sRclIy2UEOWbQOzKg7jG3ITKB7+DIJWg
 YmVeMjZwCKCpmp7uk1+1gHv8Z8SFCew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-QESmMXX7MjKEvhOMs5uCVA-1; Fri, 20 Nov 2020 10:40:52 -0500
X-MC-Unique: QESmMXX7MjKEvhOMs5uCVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED99E80ED8B
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 15:40:51 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F44760853;
 Fri, 20 Nov 2020 15:40:51 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] python, tests: do not use short-form boolean options
Date: Fri, 20 Nov 2020 10:40:51 -0500
Message-Id: <20201120154051.2495221-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are going to be deprecated, avoid warnings on stdout while the
tests run.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/machine.py               | 2 +-
 tests/qtest/pflash-cfi02-test.c      | 4 ++--
 tests/qtest/test-filter-redirector.c | 8 ++++----
 tests/qtest/vhost-user-test.c        | 8 ++++----
 tests/test-char.c                    | 8 ++++----
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6420f01bed..6216530b0d 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -292,7 +292,7 @@ class QEMUMachine:
         for _ in range(self._console_index):
             args.extend(['-serial', 'null'])
         if self._console_set:
-            chardev = ('socket,id=console,path=%s,server,nowait' %
+            chardev = ('socket,id=console,path=%s,server=on,wait=off' %
                        self._console_address)
             args.extend(['-chardev', chardev])
             if self._console_device_type is None:
diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
index afb702b565..60db81a3a2 100644
--- a/tests/qtest/pflash-cfi02-test.c
+++ b/tests/qtest/pflash-cfi02-test.c
@@ -261,7 +261,7 @@ static void test_geometry(const void *opaque)
     const FlashConfig *config = opaque;
     QTestState *qtest;
     qtest = qtest_initf("-M musicpal"
-                        " -drive if=pflash,file=%s,format=raw,copy-on-read"
+                        " -drive if=pflash,file=%s,format=raw,copy-on-read=on"
                         /* Device geometry properties. */
                         " -global driver=cfi.pflash02,"
                         "property=num-blocks0,value=%d"
@@ -581,7 +581,7 @@ static void test_cfi_in_autoselect(const void *opaque)
     const FlashConfig *config = opaque;
     QTestState *qtest;
     qtest = qtest_initf("-M musicpal"
-                        " -drive if=pflash,file=%s,format=raw,copy-on-read",
+                        " -drive if=pflash,file=%s,format=raw,copy-on-read=on",
                         image_path);
     FlashConfig explicit_config = expand_config_defaults(config);
     explicit_config.qtest = qtest;
diff --git a/tests/qtest/test-filter-redirector.c b/tests/qtest/test-filter-redirector.c
index 829db8c2ea..4269b2cdd9 100644
--- a/tests/qtest/test-filter-redirector.c
+++ b/tests/qtest/test-filter-redirector.c
@@ -95,8 +95,8 @@ static void test_redirector_tx(void)
     qts = qtest_initf(
         "-netdev socket,id=qtest-bn0,fd=%d "
         "-device %s,netdev=qtest-bn0,id=qtest-e0 "
-        "-chardev socket,id=redirector0,path=%s,server,nowait "
-        "-chardev socket,id=redirector1,path=%s,server,nowait "
+        "-chardev socket,id=redirector0,path=%s,server=on,wait=off "
+        "-chardev socket,id=redirector1,path=%s,server=on,wait=off "
         "-chardev socket,id=redirector2,path=%s "
         "-object filter-redirector,id=qtest-f0,netdev=qtest-bn0,"
         "queue=tx,outdev=redirector0 "
@@ -165,8 +165,8 @@ static void test_redirector_rx(void)
     qts = qtest_initf(
         "-netdev socket,id=qtest-bn0,fd=%d "
         "-device %s,netdev=qtest-bn0,id=qtest-e0 "
-        "-chardev socket,id=redirector0,path=%s,server,nowait "
-        "-chardev socket,id=redirector1,path=%s,server,nowait "
+        "-chardev socket,id=redirector0,path=%s,server=on,wait=off "
+        "-chardev socket,id=redirector1,path=%s,server=on,wait=off "
         "-chardev socket,id=redirector2,path=%s "
         "-object filter-redirector,id=qtest-f0,netdev=qtest-bn0,"
         "queue=rx,indev=redirector0 "
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3df5322614..1a5f5313ff 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -537,7 +537,7 @@ static void test_server_create_chr(TestServer *server, const gchar *opt)
 
 static void test_server_listen(TestServer *server)
 {
-    test_server_create_chr(server, ",server,nowait");
+    test_server_create_chr(server, ",server=on,wait=off");
 }
 
 static void test_server_free(TestServer *server)
@@ -846,7 +846,7 @@ static void *vhost_user_test_setup_reconnect(GString *cmd_line, void *arg)
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    s->vu_ops->append_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server=on");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -883,7 +883,7 @@ static void *vhost_user_test_setup_connect_fail(GString *cmd_line, void *arg)
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    s->vu_ops->append_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server=on");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
@@ -898,7 +898,7 @@ static void *vhost_user_test_setup_flags_mismatch(GString *cmd_line, void *arg)
 
     g_thread_new("connect", connect_thread, s);
     append_mem_opts(s, cmd_line, 256, TEST_MEMFD_AUTO);
-    s->vu_ops->append_opts(s, cmd_line, ",server");
+    s->vu_ops->append_opts(s, cmd_line, ",server=on");
 
     g_test_queue_destroy(vhost_user_test_cleanup, s);
 
diff --git a/tests/test-char.c b/tests/test-char.c
index 9196e566e9..953e0d1c1f 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -413,7 +413,7 @@ static void char_websock_test(void)
     CharBackend client_be;
     Chardev *chr_client;
     Chardev *chr = qemu_chr_new("server",
-                                "websocket:127.0.0.1:0,server,nowait", NULL);
+                                "websocket:127.0.0.1:0,server=on,wait=off", NULL);
     const char handshake[] = "GET / HTTP/1.1\r\n"
                              "Upgrade: websocket\r\n"
                              "Connection: Upgrade\r\n"
@@ -696,7 +696,7 @@ char_socket_addr_to_opt_str(SocketAddress *addr, bool fd_pass,
         fd = ioc->fd;
         ioc->fd = -1;
         optstr = g_strdup_printf("socket,id=cdev0,fd=%d%s",
-                                 fd, is_listen ? ",server,nowait" : "");
+                                 fd, is_listen ? ",server=on,wait=off" : "");
         object_unref(OBJECT(ioc));
         return optstr;
     } else {
@@ -706,13 +706,13 @@ char_socket_addr_to_opt_str(SocketAddress *addr, bool fd_pass,
                                    addr->u.inet.host,
                                    addr->u.inet.port,
                                    reconnect ? reconnect : "",
-                                   is_listen ? ",server,nowait" : "");
+                                   is_listen ? ",server=on,wait=off" : "");
 
         case SOCKET_ADDRESS_TYPE_UNIX:
             return g_strdup_printf("socket,id=cdev0,path=%s%s%s",
                                    addr->u.q_unix.path,
                                    reconnect ? reconnect : "",
-                                   is_listen ? ",server,nowait" : "");
+                                   is_listen ? ",server=on,wait=off" : "");
 
         default:
             g_assert_not_reached();
-- 
2.26.2


