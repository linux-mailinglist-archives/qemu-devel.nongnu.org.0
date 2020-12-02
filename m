Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA49E2CB7DB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:58:05 +0100 (CET)
Received: from localhost ([::1]:36042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNxc-0002tc-Px
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:58:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCi-0003MB-Cw
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCL-0003jM-1n
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFuS7cQ8LVM+1jJS9y/7mDeBblC+qCfgn25inE2fsjA=;
 b=QcImYGMPrp8fJTMZsCZXADhZVdDTSSSt+8mgx4CFOrNaPkBWHQI17K2Jb93nr0My/Kx8jb
 s9keOrwqgQLh4P9IVAItrxhNLsLoYkdCDUBDe8/rrneb3/K2svKOiImJizARR8X5zkT8HH
 4Xa0eQ/NHeApUbLCA+dkgJyn+GAroec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-pTBPoHoDMla7OCZv17xxYw-1; Wed, 02 Dec 2020 03:09:09 -0500
X-MC-Unique: pTBPoHoDMla7OCZv17xxYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CCA58558E7
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDAC05D705
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 051/113] treewide: do not use short-form boolean options
Date: Wed,  2 Dec 2020 03:07:47 -0500
Message-Id: <20201202080849.4125477-52-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are going to be deprecated, avoid warnings on stdout while the
tests run.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/specs/tpm.rst                   |  2 +-
 python/qemu/machine.py               |  2 +-
 qemu-options.hx                      | 32 ++++++++++++++--------------
 tests/qtest/bios-tables-test.c       |  2 +-
 tests/qtest/pflash-cfi02-test.c      |  4 ++--
 tests/qtest/test-filter-redirector.c |  8 +++----
 tests/qtest/vhost-user-test.c        |  8 +++----
 tests/test-char.c                    |  8 +++----
 8 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 5e9aef4db3..3be190343a 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -343,7 +343,7 @@ In case an Arm virt machine is emulated, use the following command line:
     -device tpm-tis-device,tpmdev=tpm0 \
     -device virtio-blk-pci,drive=drv0 \
     -drive format=qcow2,file=hda.qcow2,if=none,id=drv0 \
-    -drive if=pflash,format=raw,file=flash0.img,readonly \
+    -drive if=pflash,format=raw,file=flash0.img,readonly=on \
     -drive if=pflash,format=raw,file=flash1.img
 
 In case SeaBIOS is used as firmware, it should show the TPM menu item
diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 64d966aeeb..7a40f4604b 100644
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
diff --git a/qemu-options.hx b/qemu-options.hx
index 104632ea34..e60ad42976 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1406,25 +1406,25 @@ ERST
 
 DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
     "-fsdev local,id=id,path=path,security_model=mapped-xattr|mapped-file|passthrough|none\n"
-    " [,writeout=immediate][,readonly][,fmode=fmode][,dmode=dmode]\n"
+    " [,writeout=immediate][,readonly=on][,fmode=fmode][,dmode=dmode]\n"
     " [[,throttling.bps-total=b]|[[,throttling.bps-read=r][,throttling.bps-write=w]]]\n"
     " [[,throttling.iops-total=i]|[[,throttling.iops-read=r][,throttling.iops-write=w]]]\n"
     " [[,throttling.bps-total-max=bm]|[[,throttling.bps-read-max=rm][,throttling.bps-write-max=wm]]]\n"
     " [[,throttling.iops-total-max=im]|[[,throttling.iops-read-max=irm][,throttling.iops-write-max=iwm]]]\n"
     " [[,throttling.iops-size=is]]\n"
-    "-fsdev proxy,id=id,socket=socket[,writeout=immediate][,readonly]\n"
-    "-fsdev proxy,id=id,sock_fd=sock_fd[,writeout=immediate][,readonly]\n"
+    "-fsdev proxy,id=id,socket=socket[,writeout=immediate][,readonly=on]\n"
+    "-fsdev proxy,id=id,sock_fd=sock_fd[,writeout=immediate][,readonly=on]\n"
     "-fsdev synth,id=id\n",
     QEMU_ARCH_ALL)
 
 SRST
-``-fsdev local,id=id,path=path,security_model=security_model [,writeout=writeout][,readonly][,fmode=fmode][,dmode=dmode] [,throttling.option=value[,throttling.option=value[,...]]]``
+``-fsdev local,id=id,path=path,security_model=security_model [,writeout=writeout][,readonly=on][,fmode=fmode][,dmode=dmode] [,throttling.option=value[,throttling.option=value[,...]]]``
   \ 
-``-fsdev proxy,id=id,socket=socket[,writeout=writeout][,readonly]``
+``-fsdev proxy,id=id,socket=socket[,writeout=writeout][,readonly=on]``
   \
-``-fsdev proxy,id=id,sock_fd=sock_fd[,writeout=writeout][,readonly]``
+``-fsdev proxy,id=id,sock_fd=sock_fd[,writeout=writeout][,readonly=on]``
   \
-``-fsdev synth,id=id[,readonly]``
+``-fsdev synth,id=id[,readonly=on]``
     Define a new file system device. Valid options are:
 
     ``local``
@@ -1467,7 +1467,7 @@ SRST
         guest only when the data has been reported as written by the
         storage subsystem.
 
-    ``readonly``
+    ``readonly=on``
         Enables exporting 9p share as a readonly mount for guests. By
         default read-write access is given.
 
@@ -1532,18 +1532,18 @@ ERST
 
 DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
     "-virtfs local,path=path,mount_tag=tag,security_model=mapped-xattr|mapped-file|passthrough|none\n"
-    "        [,id=id][,writeout=immediate][,readonly][,fmode=fmode][,dmode=dmode][,multidevs=remap|forbid|warn]\n"
-    "-virtfs proxy,mount_tag=tag,socket=socket[,id=id][,writeout=immediate][,readonly]\n"
-    "-virtfs proxy,mount_tag=tag,sock_fd=sock_fd[,id=id][,writeout=immediate][,readonly]\n"
-    "-virtfs synth,mount_tag=tag[,id=id][,readonly]\n",
+    "        [,id=id][,writeout=immediate][,readonly=on][,fmode=fmode][,dmode=dmode][,multidevs=remap|forbid|warn]\n"
+    "-virtfs proxy,mount_tag=tag,socket=socket[,id=id][,writeout=immediate][,readonly=on]\n"
+    "-virtfs proxy,mount_tag=tag,sock_fd=sock_fd[,id=id][,writeout=immediate][,readonly=on]\n"
+    "-virtfs synth,mount_tag=tag[,id=id][,readonly=on]\n",
     QEMU_ARCH_ALL)
 
 SRST
-``-virtfs local,path=path,mount_tag=mount_tag ,security_model=security_model[,writeout=writeout][,readonly] [,fmode=fmode][,dmode=dmode][,multidevs=multidevs]``
+``-virtfs local,path=path,mount_tag=mount_tag ,security_model=security_model[,writeout=writeout][,readonly=on] [,fmode=fmode][,dmode=dmode][,multidevs=multidevs]``
   \ 
-``-virtfs proxy,socket=socket,mount_tag=mount_tag [,writeout=writeout][,readonly]``
+``-virtfs proxy,socket=socket,mount_tag=mount_tag [,writeout=writeout][,readonly=on]``
   \ 
-``-virtfs proxy,sock_fd=sock_fd,mount_tag=mount_tag [,writeout=writeout][,readonly]``
+``-virtfs proxy,sock_fd=sock_fd,mount_tag=mount_tag [,writeout=writeout][,readonly=on]``
   \
 ``-virtfs synth,mount_tag=mount_tag``
     Define a new virtual filesystem device and expose it to the guest using
@@ -1598,7 +1598,7 @@ SRST
         guest only when the data has been reported as written by the
         storage subsystem.
 
-    ``readonly``
+    ``readonly=on``
         Enables exporting 9p share as a readonly mount for guests. By
         default read-write access is given.
 
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index f23a5335a8..b93cbd0e97 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -672,7 +672,7 @@ static void test_acpi_one(const char *params, test_data *data)
          * when arm/virt boad starts to support it.
          */
         args = g_strdup_printf("-machine %s %s -accel tcg -nodefaults -nographic "
-            "-drive if=pflash,format=raw,file=%s,readonly "
+            "-drive if=pflash,format=raw,file=%s,readonly=on "
             "-drive if=pflash,format=raw,file=%s,snapshot=on -cdrom %s %s",
             data->machine, data->tcg_only ? "" : "-accel kvm",
             data->uefi_fl1, data->uefi_fl2, data->cd, params ? params : "");
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



