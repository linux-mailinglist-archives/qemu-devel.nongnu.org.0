Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87EE51ADB2
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 21:23:43 +0200 (CEST)
Received: from localhost ([::1]:41728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmKb8-0000US-G1
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 15:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXZ-0005ql-Nz
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nmKXX-0004v1-Ex
 for qemu-devel@nongnu.org; Wed, 04 May 2022 15:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651691998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ukjPhv1Z+2rF9p/VCJwfH3dzg1DJLH5Q5ghzWxxWgDM=;
 b=J/ANmjQUIUe5ojgfQ1nKxrNrP8of5ACFe3meMKKdyTr7P+TN0ou5w6MyI5Q1wPFx9FiIQA
 JDGAkcD5OFWdwWzuoRzqSnD2ExoPAmKvcTBZMD0M1pA+DHjZwT8uZgmkYs6NeapyG2Kb6/
 tfxim7CSO04PRjfyS1Kt20L/AUncWqs=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-cDYBluJIP9C0ItjJedFgYQ-1; Wed, 04 May 2022 15:19:57 -0400
X-MC-Unique: cDYBluJIP9C0ItjJedFgYQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 t12-20020ab0688c000000b0036274f5d6a4so931887uar.9
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 12:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukjPhv1Z+2rF9p/VCJwfH3dzg1DJLH5Q5ghzWxxWgDM=;
 b=7kkTlczYnQ/oavuYBm66OQ12ptvjb8dGEuYgGnYm0eLmS3td68m3aq/SEmrDbLn6uF
 GfwiFXYj9TfdSesO0hZAKtQMRAn3qlMHU1XMceYpVUWcs1aosITWFOjewltYw4m9gSMc
 2dRbLjTjv/VfpQDPtuiALhIQMSzG4R++m1Rz7MydnWS/aLOV/gtKultqGBoVWTubn6K2
 1VS5Jk+/F+owPMh86X/h9fUwyEsTeBKJ9JJq8XgXAk8iD8S/CWuSVFB/oREr7mTfc+Gt
 jLYlLBL0iD0wDdF6lOJ/nt1+U/AY17DZSNlSbR/at20EaUQNYGwrdaCYVOLWJ+hfrNFX
 BuKg==
X-Gm-Message-State: AOAM530U/xa8wv6GwxrdeRqJIkj+dTOqoqhWgdnUxWhTFbIhYhdkNcvT
 AkBcjG5YjyQU2f9Ek+gkQV6qVVwtYKm8wQiDvcHi8Tg5yO7VjXIlqhnv6aQfDNlUhHZdoSFzdBz
 3VIfLDpeFB5t7LFc=
X-Received: by 2002:a05:6122:511:b0:34e:e406:a66d with SMTP id
 x17-20020a056122051100b0034ee406a66dmr4998650vko.6.1651691996724; 
 Wed, 04 May 2022 12:19:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1TGC8J/Wtnt1Ba0Y30NNVAheFQBGGPjcSKXGpwVq5Nou/47jkVfdSvEM1oa4jf8z0fpn9aA==
X-Received: by 2002:a05:6122:511:b0:34e:e406:a66d with SMTP id
 x17-20020a056122051100b0034ee406a66dmr4998632vko.6.1651691996432; 
 Wed, 04 May 2022 12:19:56 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:1312:73ed:3343:f316:7ef5])
 by smtp.gmail.com with ESMTPSA id
 o80-20020a1fa553000000b0034e6f1fd04esm1647302vke.24.2022.05.04.12.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 12:19:55 -0700 (PDT)
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
Subject: [PATCH v11 1/7] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
Date: Wed,  4 May 2022 16:18:30 -0300
Message-Id: <20220504191835.791580-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504191835.791580-1-leobras@redhat.com>
References: <20220504191835.791580-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Add flags to io_writev and introduce io_flush as optional callback to
QIOChannelClass, allowing the implementation of zero copy writes by
subclasses.

How to use them:
- Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_COPY),
- Wait write completion with qio_channel_flush().

Notes:
As some zero copy write implementations work asynchronously, it's
recommended to keep the write buffer untouched until the return of
qio_channel_flush(), to avoid the risk of sending an updated buffer
instead of the buffer state during write.

As io_flush callback is optional, if a subclass does not implement it, then:
- io_flush will return 0 without changing anything.

Also, some functions like qio_channel_writev_full_all() were adapted to
receive a flag parameter. That allows shared code between zero copy and
non-zero copy writev, and also an easier implementation on new flags.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/io/channel.h                | 38 +++++++++++++++++++++-
 chardev/char-io.c                   |  2 +-
 hw/remote/mpqemu-link.c             |  2 +-
 io/channel-buffer.c                 |  1 +
 io/channel-command.c                |  1 +
 io/channel-file.c                   |  1 +
 io/channel-socket.c                 |  2 ++
 io/channel-tls.c                    |  1 +
 io/channel-websock.c                |  1 +
 io/channel.c                        | 49 +++++++++++++++++++++++------
 migration/rdma.c                    |  1 +
 scsi/pr-manager-helper.c            |  2 +-
 tests/unit/test-io-channel-socket.c |  1 +
 13 files changed, 88 insertions(+), 14 deletions(-)

diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..c680ee7480 100644
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
@@ -228,6 +234,7 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  * Write data to the IO channel, reading it from the
@@ -260,6 +267,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
                                 size_t niov,
                                 int *fds,
                                 size_t nfds,
+                                int flags,
                                 Error **errp);
 
 /**
@@ -837,6 +845,7 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
  * @niov: the length of the @iov array
  * @fds: an array of file handles to send
  * @nfds: number of file handles in @fds
+ * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
  * @errp: pointer to a NULL-initialized error object
  *
  *
@@ -846,6 +855,14 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
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
 
@@ -853,6 +870,25 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds, size_t nfds,
-                                Error **errp);
+                                int flags, Error **errp);
+
+/**
+ * qio_channel_flush:
+ * @ioc: the channel object
+ * @errp: pointer to a NULL-initialized error object
+ *
+ * Will block until every packet queued with
+ * qio_channel_writev_full() + QIO_CHANNEL_WRITE_FLAG_ZERO_COPY
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
diff --git a/chardev/char-io.c b/chardev/char-io.c
index 8ced184160..4451128cba 100644
--- a/chardev/char-io.c
+++ b/chardev/char-io.c
@@ -122,7 +122,7 @@ int io_channel_send_full(QIOChannel *ioc,
 
         ret = qio_channel_writev_full(
             ioc, &iov, 1,
-            fds, nfds, NULL);
+            fds, nfds, 0, NULL);
         if (ret == QIO_CHANNEL_ERR_BLOCK) {
             if (offset) {
                 return offset;
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
index 2a4aa651ca..9bd98e8219 100644
--- a/hw/remote/mpqemu-link.c
+++ b/hw/remote/mpqemu-link.c
@@ -68,7 +68,7 @@ bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
     }
 
     if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
-                                    fds, nfds, errp)) {
+                                    fds, nfds, 0, errp)) {
         ret = true;
     } else {
         trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
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
index 338da73ade..54560464ae 100644
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
index d7cf6d278f..ef6807a6be 100644
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
index 9f5ddf68b6..696a04dc9c 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -524,6 +524,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
                                          size_t niov,
                                          int *fds,
                                          size_t nfds,
+                                         int flags,
                                          Error **errp)
 {
     QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
@@ -619,6 +620,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
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
index 55145a6a8c..9619906ac3 100644
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
index e8b019dc36..0640941ac5 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -72,18 +72,32 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
                                 size_t niov,
                                 int *fds,
                                 size_t nfds,
+                                int flags,
                                 Error **errp)
 {
     QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
 
-    if ((fds || nfds) &&
-        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
+    if (fds || nfds) {
+        if (!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
+            error_setg_errno(errp, EINVAL,
+                             "Channel does not support file descriptor passing");
+            return -1;
+        }
+        if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
+            error_setg_errno(errp, EINVAL,
+                             "Zero Copy does not support file descriptor passing");
+            return -1;
+        }
+    }
+
+    if ((flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) &&
+        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY)) {
         error_setg_errno(errp, EINVAL,
-                         "Channel does not support file descriptor passing");
+                         "Requested Zero Copy feature is not available");
         return -1;
     }
 
-    return klass->io_writev(ioc, iov, niov, fds, nfds, errp);
+    return klass->io_writev(ioc, iov, niov, fds, nfds, flags, errp);
 }
 
 
@@ -217,14 +231,14 @@ int qio_channel_writev_all(QIOChannel *ioc,
                            size_t niov,
                            Error **errp)
 {
-    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, errp);
+    return qio_channel_writev_full_all(ioc, iov, niov, NULL, 0, 0, errp);
 }
 
 int qio_channel_writev_full_all(QIOChannel *ioc,
                                 const struct iovec *iov,
                                 size_t niov,
                                 int *fds, size_t nfds,
-                                Error **errp)
+                                int flags, Error **errp)
 {
     int ret = -1;
     struct iovec *local_iov = g_new(struct iovec, niov);
@@ -237,8 +251,10 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
 
     while (nlocal_iov > 0) {
         ssize_t len;
-        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds, nfds,
-                                      errp);
+
+        len = qio_channel_writev_full(ioc, local_iov, nlocal_iov, fds,
+                                            nfds, flags, errp);
+
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
@@ -277,7 +293,7 @@ ssize_t qio_channel_writev(QIOChannel *ioc,
                            size_t niov,
                            Error **errp)
 {
-    return qio_channel_writev_full(ioc, iov, niov, NULL, 0, errp);
+    return qio_channel_writev_full(ioc, iov, niov, NULL, 0, 0, errp);
 }
 
 
@@ -297,7 +313,7 @@ ssize_t qio_channel_write(QIOChannel *ioc,
                           Error **errp)
 {
     struct iovec iov = { .iov_base = (char *)buf, .iov_len = buflen };
-    return qio_channel_writev_full(ioc, &iov, 1, NULL, 0, errp);
+    return qio_channel_writev_full(ioc, &iov, 1, NULL, 0, 0, errp);
 }
 
 
@@ -473,6 +489,19 @@ off_t qio_channel_io_seek(QIOChannel *ioc,
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
index ef1e65ec36..672d1958a9 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2840,6 +2840,7 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
                                        size_t niov,
                                        int *fds,
                                        size_t nfds,
+                                       int flags,
                                        Error **errp)
 {
     QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(ioc);
diff --git a/scsi/pr-manager-helper.c b/scsi/pr-manager-helper.c
index 451c7631b7..3be52a98d5 100644
--- a/scsi/pr-manager-helper.c
+++ b/scsi/pr-manager-helper.c
@@ -77,7 +77,7 @@ static int pr_manager_helper_write(PRManagerHelper *pr_mgr,
         iov.iov_base = (void *)buf;
         iov.iov_len = sz;
         n_written = qio_channel_writev_full(QIO_CHANNEL(pr_mgr->ioc), &iov, 1,
-                                            nfds ? &fd : NULL, nfds, errp);
+                                            nfds ? &fd : NULL, nfds, 0, errp);
 
         if (n_written <= 0) {
             assert(n_written != QIO_CHANNEL_ERR_BLOCK);
diff --git a/tests/unit/test-io-channel-socket.c b/tests/unit/test-io-channel-socket.c
index c49eec1f03..6713886d02 100644
--- a/tests/unit/test-io-channel-socket.c
+++ b/tests/unit/test-io-channel-socket.c
@@ -444,6 +444,7 @@ static void test_io_channel_unix_fd_pass(void)
                             G_N_ELEMENTS(iosend),
                             fdsend,
                             G_N_ELEMENTS(fdsend),
+                            0,
                             &error_abort);
 
     qio_channel_readv_full(dst,
-- 
2.36.0


