Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609351901C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:36:36 +0200 (CEST)
Received: from localhost ([::1]:60336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0CA-0004IT-Ht
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz3E-0007Gr-Ig
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:23:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlz3C-0005ED-E0
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651609393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ath0I+YpFYfi5D/WBhzoab2jtqGjLmdzRZiFt4Deeo8=;
 b=h70/LS9P5yjrBL1vgtYlhZT0fyL6uCNeSrOkDoTU+v2/ShtGAOyqIGGqFC2BykSRIvH21O
 2J0ScB5MSaQfDM3b90yxEt9WuD0MKb+nmFf226pZKMqpAJRQ8mN7l/w2YxdaVkd5WnP4es
 YGw+6wRk6Z7tdeHIgiS1R+FAWtkMrFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-6HNC6-5jNiGg7tF5Ts6LmA-1; Tue, 03 May 2022 11:47:34 -0400
X-MC-Unique: 6HNC6-5jNiGg7tF5Ts6LmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E26191317FCB;
 Tue,  3 May 2022 13:02:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60ADF1537D61;
 Tue,  3 May 2022 13:02:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 23/23] util: rename qemu_*block() socket functions
Date: Tue,  3 May 2022 17:00:23 +0400
Message-Id: <20220503130023.180544-24-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The qemu_*block() functions are meant to be be used with sockets (the
win32 implementation expects SOCKET)

Over time, those functions where used with Win32 SOCKET or
file-descriptors interchangeably. But for portability, they must only be
used with socket-like file-descriptors. FDs can use
g_unix_set_fd_nonblocking() instead.

Rename the functions with "socket" in the name to prevent bad usages.

This is effectively reverting commit f9e8cacc5557e43 ("oslib-posix:
rename socket_set_nonblock() to qemu_set_nonblock()").

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/sockets.h                  |  6 +++---
 chardev/char-socket.c                   |  2 +-
 contrib/ivshmem-server/ivshmem-server.c |  2 +-
 hw/hyperv/syndbg.c                      |  2 +-
 hw/virtio/vhost-user.c                  |  2 +-
 io/channel-socket.c                     |  6 +++---
 net/l2tpv3.c                            |  2 +-
 net/socket.c                            | 10 +++++-----
 qga/channel-posix.c                     |  2 +-
 tests/unit/socket-helpers.c             |  2 +-
 tests/unit/test-crypto-tlssession.c     |  8 ++++----
 util/oslib-posix.c                      |  8 ++++----
 util/oslib-win32.c                      |  8 ++++----
 util/vhost-user-server.c                |  4 ++--
 14 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
index 0c34bf23987e..038faa157f59 100644
--- a/include/qemu/sockets.h
+++ b/include/qemu/sockets.h
@@ -17,9 +17,9 @@ int qemu_socket(int domain, int type, int protocol);
 int qemu_accept(int s, struct sockaddr *addr, socklen_t *addrlen);
 int socket_set_cork(int fd, int v);
 int socket_set_nodelay(int fd);
-void qemu_set_block(int fd);
-int qemu_try_set_nonblock(int fd);
-void qemu_set_nonblock(int fd);
+void qemu_socket_set_block(int fd);
+int qemu_socket_try_set_nonblock(int fd);
+void qemu_socket_set_nonblock(int fd);
 int socket_set_fast_reuse(int fd);
 
 #ifdef WIN32
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index fab2d791d43d..dc4e218eeb6a 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -311,7 +311,7 @@ static ssize_t tcp_chr_recv(Chardev *chr, char *buf, size_t len)
         }
 
         /* O_NONBLOCK is preserved across SCM_RIGHTS so reset it */
-        qemu_set_block(fd);
+        qemu_socket_set_block(fd);
 
 #ifndef MSG_CMSG_CLOEXEC
         qemu_set_cloexec(fd);
diff --git a/contrib/ivshmem-server/ivshmem-server.c b/contrib/ivshmem-server/ivshmem-server.c
index 39a6ffdb5df9..2f3c7320a678 100644
--- a/contrib/ivshmem-server/ivshmem-server.c
+++ b/contrib/ivshmem-server/ivshmem-server.c
@@ -146,7 +146,7 @@ ivshmem_server_handle_new_conn(IvshmemServer *server)
         return -1;
     }
 
-    qemu_set_nonblock(newfd);
+    qemu_socket_set_nonblock(newfd);
     IVSHMEM_SERVER_DEBUG(server, "accept()=%d\n", newfd);
 
     /* allocate new structure for this peer */
diff --git a/hw/hyperv/syndbg.c b/hw/hyperv/syndbg.c
index ebb8a29f7838..16d04cfdc669 100644
--- a/hw/hyperv/syndbg.c
+++ b/hw/hyperv/syndbg.c
@@ -334,7 +334,7 @@ static void hv_syndbg_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qemu_set_nonblock(syndbg->socket);
+    qemu_socket_set_nonblock(syndbg->socket);
 
     syndbg->servaddr.sin_port = htons(syndbg->host_port);
     syndbg->servaddr.sin_family = AF_INET;
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 9c4f84f35f61..a80315ecfc40 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1826,7 +1826,7 @@ static int vhost_user_postcopy_advise(struct vhost_dev *dev, Error **errp)
         error_setg(errp, "%s: Failed to get ufd", __func__);
         return -EIO;
     }
-    qemu_set_nonblock(ufd);
+    qemu_socket_set_nonblock(ufd);
 
     /* register ufd with userfault thread */
     u->postcopy_fd.fd = ufd;
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 9f5ddf68b687..e531d7bd2af5 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -460,7 +460,7 @@ static void qio_channel_socket_copy_fds(struct msghdr *msg,
             }
 
             /* O_NONBLOCK is preserved across SCM_RIGHTS so reset it */
-            qemu_set_block(fd);
+            qemu_socket_set_block(fd);
 
 #ifndef MSG_CMSG_CLOEXEC
             qemu_set_cloexec(fd);
@@ -665,9 +665,9 @@ qio_channel_socket_set_blocking(QIOChannel *ioc,
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
 
     if (enabled) {
-        qemu_set_block(sioc->fd);
+        qemu_socket_set_block(sioc->fd);
     } else {
-        qemu_set_nonblock(sioc->fd);
+        qemu_socket_set_nonblock(sioc->fd);
     }
     return 0;
 }
diff --git a/net/l2tpv3.c b/net/l2tpv3.c
index b8faa8796c8f..af373e5c300c 100644
--- a/net/l2tpv3.c
+++ b/net/l2tpv3.c
@@ -716,7 +716,7 @@ int net_init_l2tpv3(const Netdev *netdev,
     s->vec = g_new(struct iovec, MAX_L2TPV3_IOVCNT);
     s->header_buf = g_malloc(s->header_size);
 
-    qemu_set_nonblock(fd);
+    qemu_socket_set_nonblock(fd);
 
     s->fd = fd;
     s->counter = 0;
diff --git a/net/socket.c b/net/socket.c
index ea5220a2eb51..bfd8596250c4 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -297,7 +297,7 @@ static int net_socket_mcast_create(struct sockaddr_in *mcastaddr,
         }
     }
 
-    qemu_set_nonblock(fd);
+    qemu_socket_set_nonblock(fd);
     return fd;
 fail:
     if (fd >= 0)
@@ -522,7 +522,7 @@ static int net_socket_listen_init(NetClientState *peer,
         error_setg_errno(errp, errno, "can't create stream socket");
         return -1;
     }
-    qemu_set_nonblock(fd);
+    qemu_socket_set_nonblock(fd);
 
     socket_set_fast_reuse(fd);
 
@@ -570,7 +570,7 @@ static int net_socket_connect_init(NetClientState *peer,
         error_setg_errno(errp, errno, "can't create stream socket");
         return -1;
     }
-    qemu_set_nonblock(fd);
+    qemu_socket_set_nonblock(fd);
 
     connected = 0;
     for(;;) {
@@ -688,7 +688,7 @@ static int net_socket_udp_init(NetClientState *peer,
         closesocket(fd);
         return -1;
     }
-    qemu_set_nonblock(fd);
+    qemu_socket_set_nonblock(fd);
 
     s = net_socket_fd_init(peer, model, name, fd, 0, NULL, errp);
     if (!s) {
@@ -730,7 +730,7 @@ int net_init_socket(const Netdev *netdev, const char *name,
         if (fd == -1) {
             return -1;
         }
-        ret = qemu_try_set_nonblock(fd);
+        ret = qemu_socket_try_set_nonblock(fd);
         if (ret < 0) {
             error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
                              name, fd);
diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 03739753607d..a996858e2492 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -34,7 +34,7 @@ static gboolean ga_channel_listen_accept(GIOChannel *channel,
         g_warning("error converting fd to gsocket: %s", strerror(errno));
         goto out;
     }
-    qemu_set_nonblock(client_fd);
+    qemu_socket_set_nonblock(client_fd);
     ret = ga_channel_client_add(c, client_fd);
     if (ret) {
         g_warning("error setting up connection");
diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index 0a9e090a68dd..5af4de513bb6 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -88,7 +88,7 @@ static int socket_can_bind_connect(const char *hostname, int family)
         goto cleanup;
     }
 
-    qemu_set_nonblock(cfd);
+    qemu_socket_set_nonblock(cfd);
     if (connect(cfd, (struct sockaddr *)&ss, sslen) < 0) {
         if (errno == EINPROGRESS) {
             check_soerr = true;
diff --git a/tests/unit/test-crypto-tlssession.c b/tests/unit/test-crypto-tlssession.c
index 5f0da9192c53..a266dc32dac9 100644
--- a/tests/unit/test-crypto-tlssession.c
+++ b/tests/unit/test-crypto-tlssession.c
@@ -90,8 +90,8 @@ static void test_crypto_tls_session_psk(void)
      * thread, so we need these non-blocking to avoid deadlock
      * of ourselves
      */
-    qemu_set_nonblock(channel[0]);
-    qemu_set_nonblock(channel[1]);
+    qemu_socket_set_nonblock(channel[0]);
+    qemu_socket_set_nonblock(channel[1]);
 
     clientCreds = test_tls_creds_psk_create(
         QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
@@ -244,8 +244,8 @@ static void test_crypto_tls_session_x509(const void *opaque)
      * thread, so we need these non-blocking to avoid deadlock
      * of ourselves
      */
-    qemu_set_nonblock(channel[0]);
-    qemu_set_nonblock(channel[1]);
+    qemu_socket_set_nonblock(channel[0]);
+    qemu_socket_set_nonblock(channel[1]);
 
 #define CLIENT_CERT_DIR "tests/test-crypto-tlssession-client/"
 #define SERVER_CERT_DIR "tests/test-crypto-tlssession-server/"
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 72f25e599dba..477990f39baf 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -224,20 +224,20 @@ void qemu_anon_ram_free(void *ptr, size_t size)
     qemu_ram_munmap(-1, ptr, size);
 }
 
-void qemu_set_block(int fd)
+void qemu_socket_set_block(int fd)
 {
     g_unix_set_fd_nonblocking(fd, false, NULL);
 }
 
-int qemu_try_set_nonblock(int fd)
+int qemu_socket_try_set_nonblock(int fd)
 {
     return g_unix_set_fd_nonblocking(fd, true, NULL) ? 0 : -errno;
 }
 
-void qemu_set_nonblock(int fd)
+void qemu_socket_set_nonblock(int fd)
 {
     int f;
-    f = qemu_try_set_nonblock(fd);
+    f = qemu_socket_try_set_nonblock(fd);
     assert(f == 0);
 }
 
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 9c1e8121fd6d..dafef4f15733 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -184,14 +184,14 @@ static int socket_error(void)
     }
 }
 
-void qemu_set_block(int fd)
+void qemu_socket_set_block(int fd)
 {
     unsigned long opt = 0;
     WSAEventSelect(fd, NULL, 0);
     ioctlsocket(fd, FIONBIO, &opt);
 }
 
-int qemu_try_set_nonblock(int fd)
+int qemu_socket_try_set_nonblock(int fd)
 {
     unsigned long opt = 1;
     if (ioctlsocket(fd, FIONBIO, &opt) != NO_ERROR) {
@@ -200,9 +200,9 @@ int qemu_try_set_nonblock(int fd)
     return 0;
 }
 
-void qemu_set_nonblock(int fd)
+void qemu_socket_set_nonblock(int fd)
 {
-    (void)qemu_try_set_nonblock(fd);
+    (void)qemu_socket_try_set_nonblock(fd);
 }
 
 int socket_set_fast_reuse(int fd)
diff --git a/util/vhost-user-server.c b/util/vhost-user-server.c
index f66fbba7108b..232984ace6d7 100644
--- a/util/vhost-user-server.c
+++ b/util/vhost-user-server.c
@@ -65,7 +65,7 @@ static void vmsg_unblock_fds(VhostUserMsg *vmsg)
 {
     int i;
     for (i = 0; i < vmsg->fd_num; i++) {
-        qemu_set_nonblock(vmsg->fds[i]);
+        qemu_socket_set_nonblock(vmsg->fds[i]);
     }
 }
 
@@ -270,7 +270,7 @@ set_watch(VuDev *vu_dev, int fd, int vu_evt,
 
         vu_fd_watch->fd = fd;
         vu_fd_watch->cb = cb;
-        qemu_set_nonblock(fd);
+        qemu_socket_set_nonblock(fd);
         aio_set_fd_handler(server->ioc->ctx, fd, true, kick_handler,
                            NULL, NULL, NULL, vu_fd_watch);
         vu_fd_watch->vu_dev = vu_dev;
-- 
2.36.0.44.g0f828332d5ac


