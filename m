Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2353A8AB8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:09:37 +0200 (CEST)
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltGJU-0007w1-AI
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFz1-0002Zf-NU
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ltFyw-000188-VT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 16:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623790102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pv8yi6pgb0b49kmgyArOHXB7KPQRK0jmmDA7LKPFvg=;
 b=JW1/1LtfQCoOR5+6YRs0t6QQ2zTnSZEzUNJxDIqn+mQko6ma4fPP1St6uRHRUZejgVqAVa
 6sNoF7OCwdOUFhIHKMJAGLQBj+wZxEkjJcPDsKry2k5qvwX77X6WFnAOHVYpBu+Gq3qyoY
 8ZVZjEJj5/e6YkfpdPscjA4w6R3FCRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-RXDZKMLwPPqheW22e1o7BQ-1; Tue, 15 Jun 2021 16:48:20 -0400
X-MC-Unique: RXDZKMLwPPqheW22e1o7BQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3F78195D563;
 Tue, 15 Jun 2021 20:48:19 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-191.phx2.redhat.com [10.3.114.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FD665D9CA;
 Tue, 15 Jun 2021 20:48:19 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/34] block/nbd: rename NBDConnectThread to NBDClientConnection
Date: Tue, 15 Jun 2021 15:47:38 -0500
Message-Id: <20210615204756.281505-17-eblake@redhat.com>
In-Reply-To: <20210615204756.281505-1-eblake@redhat.com>
References: <20210615204756.281505-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to move the connection code to its own file, and want
clear names and APIs first.

The structure is shared between user and (possibly) several runs of
connect-thread. So it's wrong to call it "thread". Let's rename to
something more generic.

Appropriately rename connect_thread and thr variables to conn.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210610100802.5888-15-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 134 ++++++++++++++++++++++++++--------------------------
 1 file changed, 67 insertions(+), 67 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index bee615e5c4c1..ce8d38d17abf 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -66,7 +66,7 @@ typedef enum NBDClientState {
     NBD_CLIENT_QUIT
 } NBDClientState;

-typedef struct NBDConnectThread {
+typedef struct NBDClientConnection {
     /* Initialization constants */
     SocketAddress *saddr; /* address to connect to */

@@ -91,7 +91,7 @@ typedef struct NBDConnectThread {
      * nbd_co_establish_connection() after yield()
      */
     Coroutine *wait_co;
-} NBDConnectThread;
+} NBDClientConnection;

 typedef struct BDRVNBDState {
     QIOChannelSocket *sioc; /* The master data channel */
@@ -124,36 +124,36 @@ typedef struct BDRVNBDState {
     char *x_dirty_bitmap;
     bool alloc_depth;

-    NBDConnectThread *connect_thread;
+    NBDClientConnection *conn;
 } BDRVNBDState;

-static void nbd_free_connect_thread(NBDConnectThread *thr);
+static void nbd_free_connect_thread(NBDClientConnection *conn);
 static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *saddr,
                                     Error **errp);
 static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDConnectThread *thr, Error **errp);
-static void nbd_co_establish_connection_cancel(NBDConnectThread *thr);
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp);
+static void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
 static void nbd_yank(void *opaque);

 static void nbd_clear_bdrvstate(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
-    NBDConnectThread *thr = s->connect_thread;
+    NBDClientConnection *conn = s->conn;
     bool do_free = false;

-    qemu_mutex_lock(&thr->mutex);
-    assert(!thr->detached);
-    if (thr->running) {
-        thr->detached = true;
+    qemu_mutex_lock(&conn->mutex);
+    assert(!conn->detached);
+    if (conn->running) {
+        conn->detached = true;
     } else {
         do_free = true;
     }
-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);

     /* the runaway thread will clean up itself */
     if (do_free) {
-        nbd_free_connect_thread(thr);
+        nbd_free_connect_thread(conn);
     }

     yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
@@ -295,7 +295,7 @@ static void coroutine_fn nbd_client_co_drain_begin(BlockDriverState *bs)
     s->drained = true;
     qemu_co_sleep_wake(&s->reconnect_sleep);

-    nbd_co_establish_connection_cancel(s->connect_thread);
+    nbd_co_establish_connection_cancel(s->conn);

     reconnect_delay_timer_del(s);

@@ -333,7 +333,7 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     s->state = NBD_CLIENT_QUIT;
     if (s->connection_co) {
         qemu_co_sleep_wake(&s->reconnect_sleep);
-        nbd_co_establish_connection_cancel(s->connect_thread);
+        nbd_co_establish_connection_cancel(s->conn);
     }
     if (qemu_in_coroutine()) {
         s->teardown_co = qemu_coroutine_self();
@@ -360,65 +360,65 @@ static bool nbd_client_connecting_wait(BDRVNBDState *s)

 static void nbd_init_connect_thread(BDRVNBDState *s)
 {
-    s->connect_thread = g_new(NBDConnectThread, 1);
+    s->conn = g_new(NBDClientConnection, 1);

-    *s->connect_thread = (NBDConnectThread) {
+    *s->conn = (NBDClientConnection) {
         .saddr = QAPI_CLONE(SocketAddress, s->saddr),
     };

-    qemu_mutex_init(&s->connect_thread->mutex);
+    qemu_mutex_init(&s->conn->mutex);
 }

-static void nbd_free_connect_thread(NBDConnectThread *thr)
+static void nbd_free_connect_thread(NBDClientConnection *conn)
 {
-    if (thr->sioc) {
-        qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
-        object_unref(OBJECT(thr->sioc));
+    if (conn->sioc) {
+        qio_channel_close(QIO_CHANNEL(conn->sioc), NULL);
+        object_unref(OBJECT(conn->sioc));
     }
-    error_free(thr->err);
-    qapi_free_SocketAddress(thr->saddr);
-    g_free(thr);
+    error_free(conn->err);
+    qapi_free_SocketAddress(conn->saddr);
+    g_free(conn);
 }

 static void *connect_thread_func(void *opaque)
 {
-    NBDConnectThread *thr = opaque;
+    NBDClientConnection *conn = opaque;
     int ret;
     bool do_free;

-    thr->sioc = qio_channel_socket_new();
+    conn->sioc = qio_channel_socket_new();

-    error_free(thr->err);
-    thr->err = NULL;
-    ret = qio_channel_socket_connect_sync(thr->sioc, thr->saddr, &thr->err);
+    error_free(conn->err);
+    conn->err = NULL;
+    ret = qio_channel_socket_connect_sync(conn->sioc, conn->saddr, &conn->err);
     if (ret < 0) {
-        object_unref(OBJECT(thr->sioc));
-        thr->sioc = NULL;
+        object_unref(OBJECT(conn->sioc));
+        conn->sioc = NULL;
     }

-    qio_channel_set_delay(QIO_CHANNEL(thr->sioc), false);
+    qio_channel_set_delay(QIO_CHANNEL(conn->sioc), false);

-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);

-    assert(thr->running);
-    thr->running = false;
-    if (thr->wait_co) {
-        aio_co_wake(thr->wait_co);
-        thr->wait_co = NULL;
+    assert(conn->running);
+    conn->running = false;
+    if (conn->wait_co) {
+        aio_co_wake(conn->wait_co);
+        conn->wait_co = NULL;
     }
-    do_free = thr->detached;
+    do_free = conn->detached;

-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);

     if (do_free) {
-        nbd_free_connect_thread(thr);
+        nbd_free_connect_thread(conn);
     }

     return NULL;
 }

 /*
- * Get a new connection in context of @thr:
+ * Get a new connection in context of @conn:
  *   if the thread is running, wait for completion
  *   if the thread already succeeded in the background, and user didn't get the
  *     result, just return it now
@@ -426,38 +426,38 @@ static void *connect_thread_func(void *opaque)
  *     completion
  */
 static coroutine_fn QIOChannelSocket *
-nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
+nbd_co_establish_connection(NBDClientConnection *conn, Error **errp)
 {
     QIOChannelSocket *sioc = NULL;
     QemuThread thread;

-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);

     /*
      * Don't call nbd_co_establish_connection() in several coroutines in
      * parallel. Only one call at once is supported.
      */
-    assert(!thr->wait_co);
+    assert(!conn->wait_co);

-    if (!thr->running) {
-        if (thr->sioc) {
+    if (!conn->running) {
+        if (conn->sioc) {
             /* Previous attempt finally succeeded in background */
-            sioc = g_steal_pointer(&thr->sioc);
-            qemu_mutex_unlock(&thr->mutex);
+            sioc = g_steal_pointer(&conn->sioc);
+            qemu_mutex_unlock(&conn->mutex);

             return sioc;
         }

-        thr->running = true;
-        error_free(thr->err);
-        thr->err = NULL;
+        conn->running = true;
+        error_free(conn->err);
+        conn->err = NULL;
         qemu_thread_create(&thread, "nbd-connect",
-                           connect_thread_func, thr, QEMU_THREAD_DETACHED);
+                           connect_thread_func, conn, QEMU_THREAD_DETACHED);
     }

-    thr->wait_co = qemu_coroutine_self();
+    conn->wait_co = qemu_coroutine_self();

-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);

     /*
      * We are going to wait for connect-thread finish, but
@@ -465,9 +465,9 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
      */
     qemu_coroutine_yield();

-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);

-    if (thr->running) {
+    if (conn->running) {
         /*
          * The connection attempt was canceled and the coroutine resumed
          * before the connection thread finished its job.  Report the
@@ -476,12 +476,12 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
          */
         error_setg(errp, "Connection attempt cancelled by other operation");
     } else {
-        error_propagate(errp, thr->err);
-        thr->err = NULL;
-        sioc = g_steal_pointer(&thr->sioc);
+        error_propagate(errp, conn->err);
+        conn->err = NULL;
+        sioc = g_steal_pointer(&conn->sioc);
     }

-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);

     return sioc;
 }
@@ -494,15 +494,15 @@ nbd_co_establish_connection(NBDConnectThread *thr, Error **errp)
  * socket, but rather safely wakes nbd_co_establish_connection() which is
  * sleeping in yield()
  */
-static void nbd_co_establish_connection_cancel(NBDConnectThread *thr)
+static void nbd_co_establish_connection_cancel(NBDClientConnection *conn)
 {
     Coroutine *wait_co;

-    qemu_mutex_lock(&thr->mutex);
+    qemu_mutex_lock(&conn->mutex);

-    wait_co = g_steal_pointer(&thr->wait_co);
+    wait_co = g_steal_pointer(&conn->wait_co);

-    qemu_mutex_unlock(&thr->mutex);
+    qemu_mutex_unlock(&conn->mutex);

     if (wait_co) {
         aio_co_wake(wait_co);
@@ -552,7 +552,7 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
         s->ioc = NULL;
     }

-    s->sioc = nbd_co_establish_connection(s->connect_thread, NULL);
+    s->sioc = nbd_co_establish_connection(s->conn, NULL);
     if (!s->sioc) {
         ret = -ECONNREFUSED;
         goto out;
-- 
2.31.1


