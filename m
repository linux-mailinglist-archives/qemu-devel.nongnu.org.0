Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F5344A1A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:01:48 +0100 (CET)
Received: from localhost ([::1]:41724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMzz-0005P2-CN
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjd-0004iu-HF
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjb-0006uD-Bt
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wfKO2rZFFtkKy5CCLD/ZROT2nv5W2q7ph4quX8YOEw=;
 b=THxpRYPj65oIdEf9OblgszCq9ZEqpPZmegjVKOIZ9VwR3FVpK4991R+RfUd+pBrkoFWBhb
 6VDbMbU6c8INo1Xb9BOfIvxrLrkBxWcQvwKQqpXZGpi9id5ivI9AV5sy008M6Sb3RNZNvw
 P+WrBgeBMo0nI2ZZ3zzX/dunwjh/5S0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-W9NGPMIIMzuAhl-PXTIcIg-1; Mon, 22 Mar 2021 11:44:49 -0400
X-MC-Unique: W9NGPMIIMzuAhl-PXTIcIg-1
Received: by mail-wr1-f71.google.com with SMTP id y5so26307424wrp.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3wfKO2rZFFtkKy5CCLD/ZROT2nv5W2q7ph4quX8YOEw=;
 b=nL21u+7hfRUM5Joh/jWbgkEXMDZfFlsZWaMOTzA/Po6Ep9rmr+sD3+g/IUPUxXkmBu
 ygGDtM1EEU93jIRrNukTqw9xgk7qIEx8oQIW9D1pGOyaKUJKE9u9iZSbQQCp6om/YX+H
 DegIVc3CWtF4sYWf3gVf1igZUUqS2YqjqNUCk0zT5XgaoMgqYulLVtF+F81yPQAyZaaz
 ChdOifqEZCuVwKUfvSzK5qooqdU2TmtaxiefT3Cs2SjMUcSOV036TuRiDWNLuXYo2rYl
 r0BOeudiwoppHm5FMhH3TA/fOUvqPahjJ8aOqrEAWLDKfGl4VFqOiB8Xg1N9keS37+ON
 sbMA==
X-Gm-Message-State: AOAM533q9k3ocuKvvL5C+zMarqPgNV/oE5bNYwRg81qhbQMy64CoUEFb
 9+459qgzJt36EeoQyQS/rNH+tZwNH+H40XPxsnfBG6XNq4GOvQCtnlsXgururvQQf98Gy2qTYXX
 wkaD6HVnnu0jGRFbhYUuF4vLFNdnIUqnaCtTMCij/ZXwg0TNNsepIcGffHAlO
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr451202wmc.100.1616427887640; 
 Mon, 22 Mar 2021 08:44:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW8PZMf4gO/mow8W5vk0NBc7+X2aBItG6bE/AXHcriBZysBZ+RIb/dNluZa1NXSIOsOKactg==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr451173wmc.100.1616427887311; 
 Mon, 22 Mar 2021 08:44:47 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id z2sm22944393wrm.0.2021.03.22.08.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:44:46 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:44:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] vhost-user: Convert slave channel to QIOChannelSocket
Message-ID: <20210322154417.524229-6-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The slave channel is implemented with socketpair() : QEMU creates
the pair, passes one of the socket to virtiofsd and monitors the
other one with the main event loop using qemu_set_fd_handler().

In order to fix a potential deadlock between QEMU and a vhost-user
external process (e.g. virtiofsd with DAX), we want to be able to
monitor and service the slave channel while handling vhost-user
requests.

Prepare ground for this by converting the slave channel to be a
QIOChannelSocket. This will make monitoring of the slave channel
as simple as calling qio_channel_add_watch_source(). Since the
connection is already established between the two sockets, only
incoming I/O (G_IO_IN) and disconnect (G_IO_HUP) need to be
serviced.

This also allows to get rid of the ancillary data parsing since
QIOChannelSocket can do this for us. Note that the MSG_CTRUNC
check is dropped on the way because QIOChannelSocket ignores this
case. This isn't a problem since slave_read() provisions space for
8 file descriptors, but affected vhost-user slave protocol messages
generally only convey one. If for some reason a buggy implementation
passes more file descriptors, no need to break the connection, just
like we don't break it if some other type of ancillary data is
received : this isn't explicitely violating the protocol per-se so
it seems better to ignore it.

The current code errors out on short reads and writes. Use the
qio_channel_*_all() variants to address this on the way.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210312092212.782255-5-groug@kaod.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/vhost-user.c | 99 +++++++++++++++++-------------------------
 1 file changed, 39 insertions(+), 60 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index cb0c98f30a..3c1e1611b0 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -16,6 +16,7 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-net.h"
 #include "chardev/char-fe.h"
+#include "io/channel-socket.h"
 #include "sysemu/kvm.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
@@ -237,7 +238,8 @@ struct vhost_user {
     struct vhost_dev *dev;
     /* Shared between vhost devs of the same virtio device */
     VhostUserState *user;
-    int slave_fd;
+    QIOChannel *slave_ioc;
+    GSource *slave_src;
     NotifierWithReturn postcopy_notifier;
     struct PostCopyFD  postcopy_fd;
     uint64_t           postcopy_client_bases[VHOST_USER_MAX_RAM_SLOTS];
@@ -1394,61 +1396,37 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
 static void close_slave_channel(struct vhost_user *u)
 {
-    qemu_set_fd_handler(u->slave_fd, NULL, NULL, NULL);
-    close(u->slave_fd);
-    u->slave_fd = -1;
+    g_source_destroy(u->slave_src);
+    g_source_unref(u->slave_src);
+    u->slave_src = NULL;
+    object_unref(OBJECT(u->slave_ioc));
+    u->slave_ioc = NULL;
 }
 
-static void slave_read(void *opaque)
+static gboolean slave_read(QIOChannel *ioc, GIOCondition condition,
+                           gpointer opaque)
 {
     struct vhost_dev *dev = opaque;
     struct vhost_user *u = dev->opaque;
     VhostUserHeader hdr = { 0, };
     VhostUserPayload payload = { 0, };
-    int size, ret = 0;
+    Error *local_err = NULL;
+    gboolean rc = G_SOURCE_CONTINUE;
+    int ret = 0;
     struct iovec iov;
-    struct msghdr msgh;
-    int fd[VHOST_USER_SLAVE_MAX_FDS];
-    char control[CMSG_SPACE(sizeof(fd))];
-    struct cmsghdr *cmsg;
-    int i, fdsize = 0;
-
-    memset(&msgh, 0, sizeof(msgh));
-    msgh.msg_iov = &iov;
-    msgh.msg_iovlen = 1;
-    msgh.msg_control = control;
-    msgh.msg_controllen = sizeof(control);
-
-    memset(fd, -1, sizeof(fd));
+    g_autofree int *fd = NULL;
+    size_t fdsize = 0;
+    int i;
 
     /* Read header */
     iov.iov_base = &hdr;
     iov.iov_len = VHOST_USER_HDR_SIZE;
 
-    do {
-        size = recvmsg(u->slave_fd, &msgh, 0);
-    } while (size < 0 && errno == EINTR);
-
-    if (size != VHOST_USER_HDR_SIZE) {
-        error_report("Failed to read from slave.");
+    if (qio_channel_readv_full_all(ioc, &iov, 1, &fd, &fdsize, &local_err)) {
+        error_report_err(local_err);
         goto err;
     }
 
-    if (msgh.msg_flags & MSG_CTRUNC) {
-        error_report("Truncated message.");
-        goto err;
-    }
-
-    for (cmsg = CMSG_FIRSTHDR(&msgh); cmsg != NULL;
-         cmsg = CMSG_NXTHDR(&msgh, cmsg)) {
-            if (cmsg->cmsg_level == SOL_SOCKET &&
-                cmsg->cmsg_type == SCM_RIGHTS) {
-                    fdsize = cmsg->cmsg_len - CMSG_LEN(0);
-                    memcpy(fd, CMSG_DATA(cmsg), fdsize);
-                    break;
-            }
-    }
-
     if (hdr.size > VHOST_USER_PAYLOAD_SIZE) {
         error_report("Failed to read msg header."
                 " Size %d exceeds the maximum %zu.", hdr.size,
@@ -1457,12 +1435,8 @@ static void slave_read(void *opaque)
     }
 
     /* Read payload */
-    do {
-        size = read(u->slave_fd, &payload, hdr.size);
-    } while (size < 0 && errno == EINTR);
-
-    if (size != hdr.size) {
-        error_report("Failed to read payload from slave.");
+    if (qio_channel_read_all(ioc, (char *) &payload, hdr.size, &local_err)) {
+        error_report_err(local_err);
         goto err;
     }
 
@@ -1475,7 +1449,7 @@ static void slave_read(void *opaque)
         break;
     case VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG:
         ret = vhost_user_slave_handle_vring_host_notifier(dev, &payload.area,
-                                                          fd[0]);
+                                                          fd ? fd[0] : -1);
         break;
     default:
         error_report("Received unexpected msg type: %d.", hdr.request);
@@ -1501,12 +1475,8 @@ static void slave_read(void *opaque)
         iovec[1].iov_base = &payload;
         iovec[1].iov_len = hdr.size;
 
-        do {
-            size = writev(u->slave_fd, iovec, ARRAY_SIZE(iovec));
-        } while (size < 0 && errno == EINTR);
-
-        if (size != VHOST_USER_HDR_SIZE + hdr.size) {
-            error_report("Failed to send msg reply to slave.");
+        if (qio_channel_writev_all(ioc, iovec, ARRAY_SIZE(iovec), &local_err)) {
+            error_report_err(local_err);
             goto err;
         }
     }
@@ -1515,14 +1485,15 @@ static void slave_read(void *opaque)
 
 err:
     close_slave_channel(u);
+    rc = G_SOURCE_REMOVE;
 
 fdcleanup:
-    for (i = 0; i < fdsize; i++) {
-        if (fd[i] != -1) {
+    if (fd) {
+        for (i = 0; i < fdsize; i++) {
             close(fd[i]);
         }
     }
-    return;
+    return rc;
 }
 
 static int vhost_setup_slave_channel(struct vhost_dev *dev)
@@ -1535,6 +1506,8 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
     int sv[2], ret = 0;
     bool reply_supported = virtio_has_feature(dev->protocol_features,
                                               VHOST_USER_PROTOCOL_F_REPLY_ACK);
+    Error *local_err = NULL;
+    QIOChannel *ioc;
 
     if (!virtio_has_feature(dev->protocol_features,
                             VHOST_USER_PROTOCOL_F_SLAVE_REQ)) {
@@ -1546,8 +1519,15 @@ static int vhost_setup_slave_channel(struct vhost_dev *dev)
         return -1;
     }
 
-    u->slave_fd = sv[0];
-    qemu_set_fd_handler(u->slave_fd, slave_read, NULL, dev);
+    ioc = QIO_CHANNEL(qio_channel_socket_new_fd(sv[0], &local_err));
+    if (!ioc) {
+        error_report_err(local_err);
+        return -1;
+    }
+    u->slave_ioc = ioc;
+    u->slave_src = qio_channel_add_watch_source(u->slave_ioc,
+                                                G_IO_IN | G_IO_HUP,
+                                                slave_read, dev, NULL, NULL);
 
     if (reply_supported) {
         msg.hdr.flags |= VHOST_USER_NEED_REPLY_MASK;
@@ -1802,7 +1782,6 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
 
     u = g_new0(struct vhost_user, 1);
     u->user = opaque;
-    u->slave_fd = -1;
     u->dev = dev;
     dev->opaque = u;
 
@@ -1917,7 +1896,7 @@ static int vhost_user_backend_cleanup(struct vhost_dev *dev)
         close(u->postcopy_fd.fd);
         u->postcopy_fd.handler = NULL;
     }
-    if (u->slave_fd >= 0) {
+    if (u->slave_ioc) {
         close_slave_channel(u);
     }
     g_free(u->region_rb);
-- 
MST


