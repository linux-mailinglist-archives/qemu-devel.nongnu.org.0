Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA7633702D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:39:19 +0100 (CET)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIit-0002fh-06
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcy-0002dc-5F
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKIcv-0005ge-AU
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615458788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fYKx2ieK1/tYfA5vuFEOCC31lx6aOsd0QKKtmT39dk=;
 b=hJQM78aPZXPW9rPXOJJgflHhD+jOhxq3tGvdfHyBs/YdqZX4UHCB3xfNVT9+7e5glPfrww
 mrEDLgIWTR+Sub0HYJM2/VoePSJfVi5V2A9+mcbX891wiClmotv9D0Ho36ZEuo6V0dufY7
 HeJwQaxfzPQi0lR6XWfsR/KORpwjFjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-Ooj-1acfP9OWZ9Knsh3KaQ-1; Thu, 11 Mar 2021 05:33:06 -0500
X-MC-Unique: Ooj-1acfP9OWZ9Knsh3KaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74227802B4F
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:05 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DA275DEF9;
 Thu, 11 Mar 2021 10:33:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] libvhost-user: rename struct VuDev fields from "slave" to
 "backend"
Date: Thu, 11 Mar 2021 05:32:50 -0500
Message-Id: <20210311103250.532191-8-pbonzini@redhat.com>
In-Reply-To: <20210311103250.532191-1-pbonzini@redhat.com>
References: <20210311103250.532191-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Technically these are parts of the API, but the file descriptor seems
to be managed by libvhost-user itself only.

Nevertheless, I am keeping this as a separate change.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 46 +++++++++++------------
 subprojects/libvhost-user/libvhost-user.h |  6 +--
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b7aef17e4e..53fa8b8f38 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -400,8 +400,8 @@ vu_send_reply(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
 }
 
 /*
- * Processes a reply on the slave channel.
- * Entered with slave_mutex held and releases it before exit.
+ * Processes a reply from the frontend on the backend channel.
+ * Entered with backend_mutex held and releases it before exit.
  * Returns true on success.
  */
 static bool
@@ -415,7 +415,7 @@ vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg)
         goto out;
     }
 
-    if (!vu_message_read_default(dev, dev->slave_fd, &msg_reply)) {
+    if (!vu_message_read_default(dev, dev->backend_fd, &msg_reply)) {
         goto out;
     }
 
@@ -428,7 +428,7 @@ vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg)
     result = msg_reply.payload.u64 == 0;
 
 out:
-    pthread_mutex_unlock(&dev->slave_mutex);
+    pthread_mutex_unlock(&dev->backend_mutex);
     return result;
 }
 
@@ -1335,13 +1335,13 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
         return false;
     }
 
-    pthread_mutex_lock(&dev->slave_mutex);
-    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
-        pthread_mutex_unlock(&dev->slave_mutex);
+    pthread_mutex_lock(&dev->backend_mutex);
+    if (!vu_message_write(dev, dev->backend_fd, &vmsg)) {
+        pthread_mutex_unlock(&dev->backend_mutex);
         return false;
     }
 
-    /* Also unlocks the slave_mutex */
+    /* Also unlocks the backend_mutex */
     return vu_process_message_reply(dev, &vmsg);
 }
 
@@ -1492,18 +1492,18 @@ vu_set_vring_enable_exec(VuDev *dev, VhostUserMsg *vmsg)
 }
 
 static bool
-vu_set_slave_req_fd(VuDev *dev, VhostUserMsg *vmsg)
+vu_set_backend_req_fd(VuDev *dev, VhostUserMsg *vmsg)
 {
     if (vmsg->fd_num != 1) {
-        vu_panic(dev, "Invalid slave_req_fd message (%d fd's)", vmsg->fd_num);
+        vu_panic(dev, "Invalid backend_req_fd message (%d fd's)", vmsg->fd_num);
         return false;
     }
 
-    if (dev->slave_fd != -1) {
-        close(dev->slave_fd);
+    if (dev->backend_fd != -1) {
+        close(dev->backend_fd);
     }
-    dev->slave_fd = vmsg->fds[0];
-    DPRINT("Got slave_fd: %d\n", vmsg->fds[0]);
+    dev->backend_fd = vmsg->fds[0];
+    DPRINT("Got backend_fd: %d\n", vmsg->fds[0]);
 
     return false;
 }
@@ -1865,7 +1865,7 @@ vu_process_message(VuDev *dev, VhostUserMsg *vmsg)
     case VHOST_USER_SET_VRING_ENABLE:
         return vu_set_vring_enable_exec(dev, vmsg);
     case VHOST_USER_SET_BACKEND_REQ_FD:
-        return vu_set_slave_req_fd(dev, vmsg);
+        return vu_set_backend_req_fd(dev, vmsg);
     case VHOST_USER_GET_CONFIG:
         return vu_get_config(dev, vmsg);
     case VHOST_USER_SET_CONFIG:
@@ -1986,11 +1986,11 @@ vu_deinit(VuDev *dev)
     }
 
     vu_close_log(dev);
-    if (dev->slave_fd != -1) {
-        close(dev->slave_fd);
-        dev->slave_fd = -1;
+    if (dev->backend_fd != -1) {
+        close(dev->backend_fd);
+        dev->backend_fd = -1;
     }
-    pthread_mutex_destroy(&dev->slave_mutex);
+    pthread_mutex_destroy(&dev->backend_mutex);
 
     if (dev->sock != -1) {
         close(dev->sock);
@@ -2028,8 +2028,8 @@ vu_init(VuDev *dev,
     dev->remove_watch = remove_watch;
     dev->iface = iface;
     dev->log_call_fd = -1;
-    pthread_mutex_init(&dev->slave_mutex, NULL);
-    dev->slave_fd = -1;
+    pthread_mutex_init(&dev->backend_mutex, NULL);
+    dev->backend_fd = -1;
     dev->max_queues = max_queues;
 
     dev->vq = malloc(max_queues * sizeof(dev->vq[0]));
@@ -2387,9 +2387,9 @@ static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
             vmsg.flags |= VHOST_USER_NEED_REPLY_MASK;
         }
 
-        vu_message_write(dev, dev->slave_fd, &vmsg);
+        vu_message_write(dev, dev->backend_fd, &vmsg);
         if (ack) {
-            vu_message_read_default(dev, dev->slave_fd, &vmsg);
+            vu_message_read_default(dev, dev->backend_fd, &vmsg);
         }
         return;
     }
diff --git a/subprojects/libvhost-user/libvhost-user.h b/subprojects/libvhost-user/libvhost-user.h
index eba3e1fc05..f29cbf4754 100644
--- a/subprojects/libvhost-user/libvhost-user.h
+++ b/subprojects/libvhost-user/libvhost-user.h
@@ -397,9 +397,9 @@ struct VuDev {
     VuVirtq *vq;
     VuDevInflightInfo inflight_info;
     int log_call_fd;
-    /* Must be held while using slave_fd */
-    pthread_mutex_t slave_mutex;
-    int slave_fd;
+    /* Must be held while using backend */
+    pthread_mutex_t backend_mutex;
+    int backend_fd;
     uint64_t log_size;
     uint8_t *log_table;
     uint64_t features;
-- 
2.26.2


