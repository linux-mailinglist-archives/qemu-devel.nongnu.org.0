Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53EB51E369
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:03:36 +0200 (CEST)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn9nD-0004iN-MS
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iP-0005AO-O6
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nn9iN-0006hW-Kc
 for qemu-devel@nongnu.org; Fri, 06 May 2022 21:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651888715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uyXuwOlxJLf3o8B/kD02vex6vMx1GYpu6R7WnXWXsI=;
 b=h9SMSaS97OCHyCnz77L2SpWGpzuw48GeObYr8O/Rmrwymrs4infFrpIhzEB2iDsewiTlvI
 PjM9VGRrTJ1biNEJYumIbQqnubE/eNPPYGiRo9dNM4UnLfwXRAg1wq3kqVULQp7Xri1FVL
 LrC6DvK+I1r2uqQI0BfvLoyWs1SLfqY=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-IvxVthaAP9y8yP3pON6g0A-1; Fri, 06 May 2022 21:58:33 -0400
X-MC-Unique: IvxVthaAP9y8yP3pON6g0A-1
Received: by mail-ot1-f71.google.com with SMTP id
 d6-20020a9d51c6000000b0060621097166so3587837oth.16
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 18:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uyXuwOlxJLf3o8B/kD02vex6vMx1GYpu6R7WnXWXsI=;
 b=xK6DOubwHb88Zr8GLnZ7piJdcFV15oszqgdH13OXZ7Lh7thrZbWjPisINH4g4pR/MT
 l7bKJjPFnN7Lg6+l9aqgJDAslyX8JwzaqL5MzeqS8QOr70H9zczkbAdfkFi4jiFRQksn
 agSoMuvQijXXh72ICPzE392ys257ZUr7KhrSyDai+3UdSRh1rLTCRniNkAXoGd9pyk83
 4GxxRefbPwiB1Si3vLCOqi7728ISooKK0MMTf3y93LdEKSG2Z8+F/J+ZbM0kRrumbOKG
 jWw+GGK/2hC5W8O6/1D0roOlsQ06Vdtm7x8UTfP4NU+1ZVnnUxNGyrsN+W/PX9WbhM9N
 tcgQ==
X-Gm-Message-State: AOAM532rXYuSXZ4pns/LEBAFliKd+No1TyGaENi1XAt6ebMdymMJ1ANM
 ypED44jTZNVBKCqPy5aaxEDsz5NrxQRTxveRwayI52+6uBiY6ABUBYbdwtdlcDgTaaaFXGeTX3a
 Tmwb2kpRmPmlbuXE=
X-Received: by 2002:a9d:5188:0:b0:605:f135:161c with SMTP id
 y8-20020a9d5188000000b00605f135161cmr2069584otg.70.1651888713061; 
 Fri, 06 May 2022 18:58:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7DEln4aLquc1pev9Knlcqdktzu9T1xqOSuZLr++vKWF0Z7RFWW2Mng6QBGPWuK24k4m/TEw==
X-Received: by 2002:a9d:5188:0:b0:605:f135:161c with SMTP id
 y8-20020a9d5188000000b00605f135161cmr2069567otg.70.1651888712810; 
 Fri, 06 May 2022 18:58:32 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f0:55e:b3e6:9ebe:4b75:fe72])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a056830141200b0060603221281sm2218124otp.81.2022.05.06.18.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 18:58:32 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v12 2/7] QIOChannelSocket: Implement io_writev zero copy flag
 & io_flush for CONFIG_LINUX
Date: Fri,  6 May 2022 22:57:54 -0300
Message-Id: <20220507015759.840466-3-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220507015759.840466-1-leobras@redhat.com>
References: <20220507015759.840466-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

For CONFIG_LINUX, implement the new zero copy flag and the optional callback
io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
feature is available in the host kernel, which is checked on
qio_channel_socket_connect_sync()

qio_channel_socket_flush() was implemented by counting how many times
sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
socket's error queue, in order to find how many of them finished sending.
Flush will loop until those counters are the same, or until some error occurs.

Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
1: Buffer
- As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
some caution is necessary to avoid overwriting any buffer before it's sent.
If something like this happen, a newer version of the buffer may be sent instead.
- If this is a problem, it's recommended to call qio_channel_flush() before freeing
or re-using the buffer.

2: Locked memory
- When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
unlocked after it's sent.
- Depending on the size of each buffer, and how often it's sent, it may require
a larger amount of locked memory than usually available to non-root user.
- If the required amount of locked memory is not available, writev_zero_copy
will return an error, which can abort an operation like migration,
- Because of this, when an user code wants to add zero copy as a feature, it
requires a mechanism to disable it, so it can still be accessible to less
privileged users.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/io/channel-socket.h |   2 +
 io/channel-socket.c         | 117 ++++++++++++++++++++++++++++++++++--
 2 files changed, 115 insertions(+), 4 deletions(-)

diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
index e747e63514..513c428fe4 100644
--- a/include/io/channel-socket.h
+++ b/include/io/channel-socket.h
@@ -47,6 +47,8 @@ struct QIOChannelSocket {
     socklen_t localAddrLen;
     struct sockaddr_storage remoteAddr;
     socklen_t remoteAddrLen;
+    ssize_t zero_copy_queued;
+    ssize_t zero_copy_sent;
 };
 
 
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 05c425abb8..f03a068f25 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -25,9 +25,18 @@
 #include "io/channel-watch.h"
 #include "trace.h"
 #include "qapi/clone-visitor.h"
+#ifdef CONFIG_LINUX
+#include <linux/errqueue.h>
+#include <sys/socket.h>
+
+#if (defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY))
+#define QEMU_MSG_ZEROCOPY
+#endif
+#endif
 
 #define SOCKET_MAX_FDS 16
 
+
 SocketAddress *
 qio_channel_socket_get_local_address(QIOChannelSocket *ioc,
                                      Error **errp)
@@ -54,6 +63,8 @@ qio_channel_socket_new(void)
 
     sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
     sioc->fd = -1;
+    sioc->zero_copy_queued = 0;
+    sioc->zero_copy_sent = 0;
 
     ioc = QIO_CHANNEL(sioc);
     qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
@@ -153,6 +164,16 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
         return -1;
     }
 
+#ifdef QEMU_MSG_ZEROCOPY
+    int ret, v = 1;
+    ret = setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
+    if (ret == 0) {
+        /* Zero copy available on host */
+        qio_channel_set_feature(QIO_CHANNEL(ioc),
+                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
+    }
+#endif
+
     return 0;
 }
 
@@ -533,6 +554,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
     char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
     size_t fdsize = sizeof(int) * nfds;
     struct cmsghdr *cmsg;
+    int sflags = 0;
 
     memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
 
@@ -557,15 +579,31 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
         memcpy(CMSG_DATA(cmsg), fds, fdsize);
     }
 
+#ifdef QEMU_MSG_ZEROCOPY
+    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+        sflags = MSG_ZEROCOPY;
+    }
+#endif
+
  retry:
-    ret = sendmsg(sioc->fd, &msg, 0);
+    ret = sendmsg(sioc->fd, &msg, sflags);
     if (ret <= 0) {
-        if (errno == EAGAIN) {
+        switch (errno) {
+        case EAGAIN:
             return QIO_CHANNEL_ERR_BLOCK;
-        }
-        if (errno == EINTR) {
+        case EINTR:
             goto retry;
+#ifdef QEMU_MSG_ZEROCOPY
+        case ENOBUFS:
+            if (sflags & MSG_ZEROCOPY) {
+                error_setg_errno(errp, errno,
+                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
+                return -1;
+            }
+            break;
+#endif
         }
+
         error_setg_errno(errp, errno,
                          "Unable to write to socket");
         return -1;
@@ -659,6 +697,74 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
 }
 #endif /* WIN32 */
 
+
+#ifdef QEMU_MSG_ZEROCOPY
+static int qio_channel_socket_flush(QIOChannel *ioc,
+                                    Error **errp)
+{
+    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
+    struct msghdr msg = {};
+    struct sock_extended_err *serr;
+    struct cmsghdr *cm;
+    char control[CMSG_SPACE(sizeof(*serr))];
+    int received;
+    int ret = 1;
+
+    msg.msg_control = control;
+    msg.msg_controllen = sizeof(control);
+    memset(control, 0, sizeof(control));
+
+    while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
+        received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
+        if (received < 0) {
+            switch (errno) {
+            case EAGAIN:
+                /* Nothing on errqueue, wait until something is available */
+                qio_channel_wait(ioc, G_IO_ERR);
+                continue;
+            case EINTR:
+                continue;
+            default:
+                error_setg_errno(errp, errno,
+                                 "Unable to read errqueue");
+                return -1;
+            }
+        }
+
+        cm = CMSG_FIRSTHDR(&msg);
+        if (cm->cmsg_level != SOL_IP &&
+            cm->cmsg_type != IP_RECVERR) {
+            error_setg_errno(errp, EPROTOTYPE,
+                             "Wrong cmsg in errqueue");
+            return -1;
+        }
+
+        serr = (void *) CMSG_DATA(cm);
+        if (serr->ee_errno != SO_EE_ORIGIN_NONE) {
+            error_setg_errno(errp, serr->ee_errno,
+                             "Error on socket");
+            return -1;
+        }
+        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
+            error_setg_errno(errp, serr->ee_origin,
+                             "Error not from zero copy");
+            return -1;
+        }
+
+        /* No errors, count successfully finished sendmsg()*/
+        sioc->zero_copy_sent += serr->ee_data - serr->ee_info + 1;
+
+        /* If any sendmsg() succeeded using zero copy, return 0 at the end */
+        if (serr->ee_code != SO_EE_CODE_ZEROCOPY_COPIED) {
+            ret = 0;
+        }
+    }
+
+    return ret;
+}
+
+#endif /* QEMU_MSG_ZEROCOPY */
+
 static int
 qio_channel_socket_set_blocking(QIOChannel *ioc,
                                 bool enabled,
@@ -789,6 +895,9 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
     ioc_klass->io_set_delay = qio_channel_socket_set_delay;
     ioc_klass->io_create_watch = qio_channel_socket_create_watch;
     ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
+#ifdef QEMU_MSG_ZEROCOPY
+    ioc_klass->io_flush = qio_channel_socket_flush;
+#endif
 }
 
 static const TypeInfo qio_channel_socket_info = {
-- 
2.36.0


