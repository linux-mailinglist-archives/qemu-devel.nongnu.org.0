Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F0E486D18
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 23:17:15 +0100 (CET)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5b4M-00006K-40
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 17:17:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1S-0005ID-GA
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1n5b1P-0006Fv-CF
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 17:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641507249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDaez9BUtW4cAqTIxZlO+K029x+1Co0AzBVNeAsnpuI=;
 b=Ik1BiYASpQAB/iCCFjtPZhJNkVv6DJVhAcMfmRiKO6mi1oiWmjrmJRdAttScWCTJYGDdp8
 6/nf9NcrpNILvqV9Nq2+4oYcpN+hMmtsFZ66TTkCPuGobFuQDA9CvLNNc0GRko/r8BNicX
 ZxzY1Yedzo/vdBJQjs+Nh9/UDK6/RoE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-DcyzZCWuPzyfW-aLEPfoig-1; Thu, 06 Jan 2022 17:14:09 -0500
X-MC-Unique: DcyzZCWuPzyfW-aLEPfoig-1
Received: by mail-ua1-f72.google.com with SMTP id
 w14-20020ab055ce000000b002fedc60272fso2141317uaa.21
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 14:14:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PDaez9BUtW4cAqTIxZlO+K029x+1Co0AzBVNeAsnpuI=;
 b=EVRDdMQFVndZPk42H6FuRIuswebiBXH64xoPc57VXgMd/ZpSS+gDLb04MEwVx+M7vF
 FLXYtUnUDBThFfjADg1m06m/u+MnJLUJzE/QIDfhY8h0pWqC3lp+h7qrqO/TxNwvNhCt
 6aotq7em00qeXZfXJ8+iO7rK6i5icbxDvGvqpjJSxCboptKHCuTr1obFwXsYXSB+qoM4
 UDgLvTqnzVpfEstjI1OOHqJwUhfOgzmHERm+IrpHrLMAfz35+mCklb6A6rljkXpgq34H
 bCXsq7IX0ppoyL5M4C6RRplskf8IfU4/Iy+HzVub3A2j4DZKmXX6ydNwI3V6IZe/pLYh
 QM3Q==
X-Gm-Message-State: AOAM5316nMP2EpXlYElCNcLtgGaGPhUU7MlDxujNGNbrcjbqeqwRzsxi
 Fa8zrcywl/RB17PveuXwBr4UWveIqKBDnePBk/Risp2XgQpYjsQ5W8EL3jWK61dxxQDDSvmBCdG
 SUnHplCT+kJz8p18=
X-Received: by 2002:a05:6102:34f5:: with SMTP id
 bi21mr19678534vsb.1.1641507247206; 
 Thu, 06 Jan 2022 14:14:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx28tiEDNccKeJaLFPCGKVpXwkO0EMe4mG/aVGLJD5o1HWpt6FZuDCRXgRtpomfoAXgeI+/ew==
X-Received: by 2002:a05:6102:34f5:: with SMTP id
 bi21mr19678524vsb.1.1641507246983; 
 Thu, 06 Jan 2022 14:14:06 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7f1:cc01:fae1:7982:b010:d91])
 by smtp.gmail.com with ESMTPSA id c15sm2098831uaj.13.2022.01.06.14.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 14:14:06 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH v7 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Date: Thu,  6 Jan 2022 19:13:38 -0300
Message-Id: <20220106221341.8779-2-leobras@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106221341.8779-1-leobras@redhat.com>
References: <20220106221341.8779-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add flags to io_writev and introduce io_flush as optional callback to
QIOChannelClass, allowing the implementation of zero copy writes by
subclasses.

How to use them:
- Write data using qio_channel_writev(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
- Wait write completion with qio_channel_flush().

Notes:
As some zero copy implementations work asynchronously, it's
recommended to keep the write buffer untouched until the return of
qio_channel_flush(), to avoid the risk of sending an updated buffer
instead of the buffer state during write.

As io_flush callback is optional, if a subclass does not implement it, then:
- io_flush will return 0 without changing anything.

Also, some functions like qio_channel_writev_full_all() were adapted to
receive a flag parameter. That allows shared code between zero copy and
non-zero copy writev, and also an easier implementation on new flags.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/io/channel.h | 67 +++++++++++++++++++++++++++++++++++---------
 io/channel-buffer.c  |  1 +
 io/channel-command.c |  1 +
 io/channel-file.c    |  1 +
 io/channel-socket.c  |  2 ++
 io/channel-tls.c     |  1 +
 io/channel-websock.c |  1 +
 io/channel.c         | 51 +++++++++++++++++++++++----------
 migration/rdma.c     |  1 +
 9 files changed, 98 insertions(+), 28 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..343766ce5b 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
 
 #define QIO_CHANNEL_ERR_BLOCK -2
 
+#define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
+
 typedef enum QIOChannelFeature QIOChannelFeature;
 
 enum QIOChannelFeature {
     QIO_CHANNEL_FEATURE_FD_PASS,
     QIO_CHANNEL_FEATURE_SHUTDOWN,
     QIO_CHANNEL_FEATURE_LISTEN,
+    QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
 };
 
 
@@ -104,6 +107,7 @@ struct QIOChannelClass {
                          size_t niov,
                          int *fds,
                          size_t nfds,
+                         int flags,
                          Error **errp);
     ssize_t (*io_readv)(QIOChannel *ioc,
                         const struct iovec *iov,
@@ -136,6 +140,8 @@ struct QIOChannelClass {
                                   IOHandler *io_read,
                                   IOHandler *io_write,
                                   void *opaque);
+    int (*io_flush)(QIOChannel *ioc,
+                    Error **errp);
 };
 
 /* General I/O handling functions */
@@ -222,12 +228,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
 
 
 /**
- * qio_channel_writev_full:
+ * qio_channel_writev_full_flags:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Write data to the IO channel, reading it from the
@@ -255,12 +262,16 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
  * or QIO_CHANNEL_ERR_BLOCK if no data is can be sent
  * and the channel is non-blocking
  */
-ssize_t qio_channel_writev_full(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds,
-                                size_t nfds,
-                                Error **errp);
+ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds,
+                                      size_t nfds,
+                                      int flags,
+                                      Error **errp);
+
+#define qio_channel_writev_full(ioc, iov, niov, fds, nfds, errp) \
+    qio_channel_writev_full_flags(ioc, iov, niov, fds, nfds, 0, errp)
 
 /**
  * qio_channel_readv_all_eof:
@@ -831,12 +842,13 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
                                Error **errp);
 
 /**
- * qio_channel_writev_full_all:
+ * qio_channel_writev_full_all_flags:
  * @ioc: the channel object
  * @iov: the array of memory regions to write data from
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  *
@@ -846,13 +858,42 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * to be written, yielding from the current coroutine
  * if required.
  *
+ * If QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is passed in flags,
+ * instead of waiting for all requested data to be written,
+ * this function will wait until it's all queued for writing.
+ * In this case, if the buffer gets changed between queueing and
+ * sending, the updated buffer will be sent. If this is not a
+ * desired behavior, it's suggested to call qio_channel_flush()
+ * before reusing the buffer.
+ *
  * Returns: 0 if all bytes were written, or -1 on error
  */
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
-                                Error **errp);
+int qio_channel_writev_full_all_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds, size_t nfds,
+                                      int flags, Error **errp);
+#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
+    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, errp)
+
+/**
+ * qio_channel_flush:
+ * @ioc: the channel object
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Will block until every packet queued with
+ * qio_channel_writev_full_flags() + QIO_CHANNEL_WRITE_FLAG_ZERO_COPY
+ * is sent, or return in case of any error.
+ *
+ * If not implemented, acts as a no-op, and returns 0.
+ *
+ * Returns -1 if any error is found,
+ *          1 if every send failed to use zero copy.
+ *          0 otherwise.
+ */
+
+int qio_channel_flush(QIOChannel *ioc,
+                      Error **errp);
 
 #endif /* QIO_CHANNEL_H */
diff --git a/io/channel-buffer.c b/io/channel-buffer.c
index baa4e2b089..bf52011be2 100644
--- a/io/channel-buffer.c
+++ b/io/channel-buffer.c
@@ -81,6 +81,7 @@ static ssize_t qio_channel_buffer_writev(QIOChannel *ioc,
                                          size_t niov,
                                          int *fds,
                                          size_t nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelBuffer *bioc = QIO_CHANNEL_BUFFER(ioc);
diff --git a/io/channel-command.c b/io/channel-command.c
index b2a9e27138..5ff1691bad 100644
--- a/io/channel-command.c
+++ b/io/channel-command.c
@@ -258,6 +258,7 @@ static ssize_t qio_channel_command_writev(QIOChannel *ioc,
                                           size_t niov,
                                           int *fds,
                                           size_t nfds,
+                                          int flags,
                                           Error **errp)
 {
     QIOChannelCommand *cioc = QIO_CHANNEL_COMMAND(ioc);
diff --git a/io/channel-file.c b/io/channel-file.c
index c4bf799a80..348a48545e 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -114,6 +114,7 @@ static ssize_t qio_channel_file_writev(QIOChannel *ioc,
                                        size_t niov,
                                        int *fds,
                                        size_t nfds,
+                                       int flags,
                                        Error **errp)
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 606ec97cf7..bfbd64787e 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -525,6 +525,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                                          size_t niov,
                                          int *fds,
                                          size_t nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -620,6 +621,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                                          size_t niov,
                                          int *fds,
                                          size_t nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
diff --git a/io/channel-tls.c b/io/channel-tls.c
index 2ae1b92fc0..4ce890a538 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -301,6 +301,7 @@ static ssize_t qio_channel_tls_writev(QIOChannel *ioc,
                                       size_t niov,
                                       int *fds,
                                       size_t nfds,
+                                      int flags,
                                       Error **errp)
 {
     QIOChannelTLS *tioc = QIO_CHANNEL_TLS(ioc);
diff --git a/io/channel-websock.c b/io/channel-websock.c
index 70889bb54d..035dd6075b 100644
--- a/io/channel-websock.c
+++ b/io/channel-websock.c
@@ -1127,6 +1127,7 @@ static ssize_t qio_channel_websock_writev(QIOChannel *ioc,
                                           size_t niov,
                                           int *fds,
                                           size_t nfds,
+                                          int flags,
                                           Error **errp)
 {
     QIOChannelWebsock *wioc = QIO_CHANNEL_WEBSOCK(ioc);
diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..904855e16e 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -67,12 +67,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
 }
 
 
-ssize_t qio_channel_writev_full(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds,
-                                size_t nfds,
-                                Error **errp)
+ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds,
+                                      size_t nfds,
+                                      int flags,
+                                      Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
@@ -83,7 +84,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
         return -1;
     }
 
-    return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
+    return klass->io_writev(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -217,14 +218,15 @@ int qio_channel_writev_all(QIOChannel *ioc,
                            size_t niov,
                            Error **errp)
 {
-    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
+    return qio_channel_writev_full_all_flags(ioc, iov, niov, NULL, 0, 0,
+                                             errp);
 }
 
-int qio_channel_writev_full_all(QIOChannel *ioc,
-                                const struct iovec *iov,
-                                size_t niov,
-                                int *fds, size_t nfds,
-                                Error **errp)
+int qio_channel_writev_full_all_flags(QIOChannel *ioc,
+                                      const struct iovec *iov,
+                                      size_t niov,
+                                      int *fds, size_t nfds,
+                                      int flags, Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
@@ -235,10 +237,16 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
                           iov, niov,
                           0, iov_size(iov, niov));
 
+    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+        assert(fds == NULL && nfds == 0);
+    }
+
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+
+        len = qio_channel_writev_full_flags(ioc, local_iov, nlocal_iov, fds,
+                                            nfds, flags, errp);
+
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -473,6 +481,19 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
     return klass->io_seek(ioc, offset, whence, errp);
 }
 
+int qio_channel_flush(QIOChannel *ioc,
+                                Error **errp)
+{
+    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
+
+    if (!klass->io_flush ||
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
+        return 0;
+    }
+
+    return klass->io_flush(ioc, errp);
+}
+
 
 static void qio_channel_restart_read(void *opaque)
 {
diff --git a/migration/rdma.c b/migration/rdma.c
index f5d3bbe7e9..54acd2000e 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2833,6 +2833,7 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
                                        size_t niov,
                                        int *fds,
                                        size_t nfds,
+                                       int flags,
                                        Error **errp)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
-- 
2.34.1


