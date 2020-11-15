Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E462B34A4
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 12:38:29 +0100 (CET)
Received: from localhost ([::1]:53486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keGMW-0006pc-6O
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 06:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKN-0004tx-Qb; Sun, 15 Nov 2020 06:36:15 -0500
Received: from mout.web.de ([212.227.15.4]:45823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1keGKL-0008FM-85; Sun, 15 Nov 2020 06:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1605440167;
 bh=w5u/TurdVtqqwpqqly6JdrVriXQLZl9jUyOIFeIdfFY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=HikAQx9ftOFuD0KH9V/+sWYFW7yUDr9INqIpthlDb2y8mnnyF7GInNU+pF3beVEHl
 nf177eIQps5S2AD839b28cfiY4SdTxmM1vUoYzkCBBt8Ie96tvSoY5LdE1MSPHxnKu
 t1Tcm1v0QlLY30RKJArUIj6XN+udCAzJ3+i8GINw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([87.123.206.172]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LuIAZ-1kFTxx43zr-011gOm; Sun, 15
 Nov 2020 12:36:07 +0100
Date: Sun, 15 Nov 2020 12:36:05 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH v11 2/7] block/nbd.c: Add yank feature
Message-ID: <14b78aebabb64b9f2ffaac025ee3b683bd7c9167.1605439674.git.lukasstraub2@web.de>
In-Reply-To: <cover.1605439674.git.lukasstraub2@web.de>
References: <cover.1605439674.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CZLu4x/nddYetB.KdDiwQay";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Provags-ID: V03:K1:m/a6x3iO3LBhzyEU36G4nZAnMONYm5/Obtq7Idpgb1CD6RoJnT/
 2KJf3xbLbSagXnzgAhWFQrCfjCLAZxhHoAeP41f3ZENu/7v6rYFST6RS3xLk1GGj+gIb++4
 UJ+VeA7BLYoTwWFS7/BR4aqjKc7GOpBk4xBuLn7EbhidiyQ88iJXDv7g1xWrF4AZgaN3IH3
 TepRNj5MS4ZTUwm8gTGSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ox1auFY+z1w=:0++ReZhz0NoLyBfagKyIhy
 HlYhcxu+HWS+SeyKkraiYxvr5izmkZ4gLSANFaY8kp95E5RoS4BxCVSaG/g3tEyL6zMHejoRF
 l1iNDjgSFUN9TiY/QkrH87LfFlze366kiI04KOgT9LqZIG6d6inCKSzciRU+kj1dWT45EF3XY
 9fDs6mjCYV6ht4Kge20g0DevCppYMPc9E0a2fgc4ho8tpuFllNfPj1lWrZ97SqT2OeCTKcyO7
 1cD+vrK+Dw+I1v8hveJwr5wOoMhydj/VQn7XYfBUBqaM07U1lhlbh4jZpFab4mcV/73Shwlav
 tWAp+0A/rkeqr8wFAPWt0s/cuqPUCOW1Ud/+YUrxaZ39c289fFPtfT5nHuSXmkeuPCnKVdm/e
 cY7ZFAgXLFK9PpWFnVyYaza9AqzUj1ytlV0UsH5/OEPmdb0p+eB5JkmSY1hL9+WzHUpat4k/D
 /EbooCMfw7s9xV8iBcKpsh+ayLp05eeHjs+OdnkfeukA8b57sSbkWFADRcO4S7amv9dxCPz6E
 7NTi30saYUAfPBb/tA4ax63OJpsdnck8QjJiaotvRcM7E5Df2Pnx4HjG3JYaEvaUtZTe4g4Ez
 ArDnhLNjlTEoGtoO0V9ggmoQnEXjmEsBdMbS/E9SoUQqWSlIWBwiVHuIG2txj02O7mipNhMc2
 b7VjwcJUfKt2w1Itg2WmSDOXH10VopzJuIrHmSX93o44AM+XkagO/KsMVNPz1Ct03aY0Zcczr
 bR6DxrUVik9agDZUF04uDuJQWB1wpnRpQlZDzSVW4ivLc97ouKA6pXPnPtGqc4AhOAA9COcD8
 lvrJe5GZmUULEGF7bPoyps9K0u3XNTFn06vXHmLW+HlV1DtLqSrBWBCf2oyY1mANiSuPDPrnP
 FqEaMmXIE5gvtcWBaoCg==
Received-SPF: pass client-ip=212.227.15.4; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 06:19:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/CZLu4x/nddYetB.KdDiwQay
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Register a yank function which shuts down the socket and sets
s->state =3D NBD_CLIENT_QUIT. This is the same behaviour as if an
error occured.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/nbd.c | 154 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 93 insertions(+), 61 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 42536702b6..994d1e7b33 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -35,6 +35,7 @@
 #include "qemu/option.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
+#include "qemu/atomic.h"

 #include "qapi/qapi-visit-sockets.h"
 #include "qapi/qmp/qstring.h"
@@ -44,6 +45,8 @@
 #include "block/nbd.h"
 #include "block/block_int.h"

+#include "qemu/yank.h"
+
 #define EN_OPTSTR ":exportname=3D"
 #define MAX_NBD_REQUESTS    16

@@ -141,14 +144,13 @@ typedef struct BDRVNBDState {
     NBDConnectThread *connect_thread;
 } BDRVNBDState;

-static QIOChannelSocket *nbd_establish_connection(SocketAddress *saddr,
-                                                  Error **errp);
-static QIOChannelSocket *nbd_co_establish_connection(BlockDriverState *bs,
-                                                     Error **errp);
+static int nbd_establish_connection(BlockDriverState *bs, SocketAddress *s=
addr,
+                                    Error **errp);
+static int nbd_co_establish_connection(BlockDriverState *bs, Error **errp);
 static void nbd_co_establish_connection_cancel(BlockDriverState *bs,
                                                bool detach);
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *si=
oc,
-                                Error **errp);
+static int nbd_client_handshake(BlockDriverState *bs, Error **errp);
+static void nbd_yank(void *opaque);

 static void nbd_clear_bdrvstate(BDRVNBDState *s)
 {
@@ -166,12 +168,12 @@ static void nbd_clear_bdrvstate(BDRVNBDState *s)
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (ret =3D=3D -EIO) {
-        if (s->state =3D=3D NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTED) {
             s->state =3D s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        if (s->state =3D=3D NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTED) {
             qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
         }
         s->state =3D NBD_CLIENT_QUIT;
@@ -204,7 +206,7 @@ static void reconnect_delay_timer_cb(void *opaque)
 {
     BDRVNBDState *s =3D opaque;

-    if (s->state =3D=3D NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTING_WAIT)=
 {
         s->state =3D NBD_CLIENT_CONNECTING_NOWAIT;
         while (qemu_co_enter_next(&s->free_sema, NULL)) {
             /* Resume all queued requests */
@@ -216,7 +218,7 @@ static void reconnect_delay_timer_cb(void *opaque)

 static void reconnect_delay_timer_init(BDRVNBDState *s, uint64_t expire_ti=
me_ns)
 {
-    if (s->state !=3D NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) !=3D NBD_CLIENT_CONNECTING_WAIT) {
         return;
     }

@@ -261,7 +263,7 @@ static void nbd_client_attach_aio_context(BlockDriverSt=
ate *bs,
      * s->connection_co is either yielded from nbd_receive_reply or from
      * nbd_co_reconnect_loop()
      */
-    if (s->state =3D=3D NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTED) {
         qio_channel_attach_aio_context(QIO_CHANNEL(s->ioc), new_context);
     }

@@ -287,7 +289,7 @@ static void coroutine_fn nbd_client_co_drain_begin(Bloc=
kDriverState *bs)

     reconnect_delay_timer_del(s);

-    if (s->state =3D=3D NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTING_WAIT)=
 {
         s->state =3D NBD_CLIENT_CONNECTING_NOWAIT;
         qemu_co_queue_restart_all(&s->free_sema);
     }
@@ -338,13 +340,14 @@ static void nbd_teardown_connection(BlockDriverState =
*bs)

 static bool nbd_client_connecting(BDRVNBDState *s)
 {
-    return s->state =3D=3D NBD_CLIENT_CONNECTING_WAIT ||
-        s->state =3D=3D NBD_CLIENT_CONNECTING_NOWAIT;
+    NBDClientState state =3D qatomic_load_acquire(&s->state);
+    return state =3D=3D NBD_CLIENT_CONNECTING_WAIT ||
+        state =3D=3D NBD_CLIENT_CONNECTING_NOWAIT;
 }

 static bool nbd_client_connecting_wait(BDRVNBDState *s)
 {
-    return s->state =3D=3D NBD_CLIENT_CONNECTING_WAIT;
+    return qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTING_WA=
IT;
 }

 static void connect_bh(void *opaque)
@@ -424,12 +427,12 @@ static void *connect_thread_func(void *opaque)
     return NULL;
 }

-static QIOChannelSocket *coroutine_fn
+static int coroutine_fn
 nbd_co_establish_connection(BlockDriverState *bs, Error **errp)
 {
+    int ret;
     QemuThread thread;
     BDRVNBDState *s =3D bs->opaque;
-    QIOChannelSocket *res;
     NBDConnectThread *thr =3D s->connect_thread;

     qemu_mutex_lock(&thr->mutex);
@@ -446,10 +449,12 @@ nbd_co_establish_connection(BlockDriverState *bs, Err=
or **errp)
     case CONNECT_THREAD_SUCCESS:
         /* Previous attempt finally succeeded in background */
         thr->state =3D CONNECT_THREAD_NONE;
-        res =3D thr->sioc;
+        s->sioc =3D thr->sioc;
         thr->sioc =3D NULL;
+        yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                               nbd_yank, bs);
         qemu_mutex_unlock(&thr->mutex);
-        return res;
+        return 0;
     case CONNECT_THREAD_RUNNING:
         /* Already running, will wait */
         break;
@@ -481,8 +486,13 @@ nbd_co_establish_connection(BlockDriverState *bs, Erro=
r **errp)
         thr->state =3D CONNECT_THREAD_NONE;
         error_propagate(errp, thr->err);
         thr->err =3D NULL;
-        res =3D thr->sioc;
+        s->sioc =3D thr->sioc;
         thr->sioc =3D NULL;
+        if (s->sioc) {
+            yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                   nbd_yank, bs);
+        }
+        ret =3D (s->sioc ? 0 : -1);
         break;
     case CONNECT_THREAD_RUNNING:
     case CONNECT_THREAD_RUNNING_DETACHED:
@@ -491,7 +501,7 @@ nbd_co_establish_connection(BlockDriverState *bs, Error=
 **errp)
          * failed. Still connect thread is executing in background, and its
          * result may be used for next connection attempt.
          */
-        res =3D NULL;
+        ret =3D -1;
         error_setg(errp, "Connection attempt cancelled by other operation"=
);
         break;

@@ -508,7 +518,7 @@ nbd_co_establish_connection(BlockDriverState *bs, Error=
 **errp)

     qemu_mutex_unlock(&thr->mutex);

-    return res;
+    return ret;
 }

 /*
@@ -561,7 +571,6 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDS=
tate *s)
 {
     int ret;
     Error *local_err =3D NULL;
-    QIOChannelSocket *sioc;

     if (!nbd_client_connecting(s)) {
         return;
@@ -594,21 +603,22 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNB=
DState *s)
     /* Finalize previous connection if any */
     if (s->ioc) {
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
         object_unref(OBJECT(s->sioc));
         s->sioc =3D NULL;
         object_unref(OBJECT(s->ioc));
         s->ioc =3D NULL;
     }

-    sioc =3D nbd_co_establish_connection(s->bs, &local_err);
-    if (!sioc) {
+    if (nbd_co_establish_connection(s->bs, &local_err) < 0) {
         ret =3D -ECONNREFUSED;
         goto out;
     }

     bdrv_dec_in_flight(s->bs);

-    ret =3D nbd_client_handshake(s->bs, sioc, &local_err);
+    ret =3D nbd_client_handshake(s->bs, &local_err);

     if (s->drained) {
         s->wait_drained_end =3D true;
@@ -640,7 +650,7 @@ static coroutine_fn void nbd_co_reconnect_loop(BDRVNBDS=
tate *s)
     uint64_t timeout =3D 1 * NANOSECONDS_PER_SECOND;
     uint64_t max_timeout =3D 16 * NANOSECONDS_PER_SECOND;

-    if (s->state =3D=3D NBD_CLIENT_CONNECTING_WAIT) {
+    if (qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTING_WAIT)=
 {
         reconnect_delay_timer_init(s, qemu_clock_get_ns(QEMU_CLOCK_REALTIM=
E) +
                                    s->reconnect_delay * NANOSECONDS_PER_SE=
COND);
     }
@@ -683,7 +693,7 @@ static coroutine_fn void nbd_connection_entry(void *opa=
que)
     int ret =3D 0;
     Error *local_err =3D NULL;

-    while (s->state !=3D NBD_CLIENT_QUIT) {
+    while (qatomic_load_acquire(&s->state) !=3D NBD_CLIENT_QUIT) {
         /*
          * The NBD client can only really be considered idle when it has
          * yielded from qio_channel_readv_all_eof(), waiting for data. Thi=
s is
@@ -698,7 +708,7 @@ static coroutine_fn void nbd_connection_entry(void *opa=
que)
             nbd_co_reconnect_loop(s);
         }

-        if (s->state !=3D NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) !=3D NBD_CLIENT_CONNECTED) {
             continue;
         }

@@ -753,6 +763,8 @@ static coroutine_fn void nbd_connection_entry(void *opa=
que)
     s->connection_co =3D NULL;
     if (s->ioc) {
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
+                                 nbd_yank, s->bs);
         object_unref(OBJECT(s->sioc));
         s->sioc =3D NULL;
         object_unref(OBJECT(s->ioc));
@@ -777,7 +789,7 @@ static int nbd_co_send_request(BlockDriverState *bs,
         qemu_co_queue_wait(&s->free_sema, &s->send_mutex);
     }

-    if (s->state !=3D NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) !=3D NBD_CLIENT_CONNECTED) {
         rc =3D -EIO;
         goto err;
     }
@@ -804,7 +816,8 @@ static int nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc =3D nbd_send_request(s->ioc, request);
-        if (rc >=3D 0 && s->state =3D=3D NBD_CLIENT_CONNECTED) {
+        if (qatomic_load_acquire(&s->state) =3D=3D NBD_CLIENT_CONNECTED &&
+            rc >=3D 0) {
             if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
                                        NULL) < 0) {
                 rc =3D -EIO;
@@ -1129,7 +1142,7 @@ static coroutine_fn int nbd_co_do_receive_one_chunk(
     s->requests[i].receiving =3D true;
     qemu_coroutine_yield();
     s->requests[i].receiving =3D false;
-    if (s->state !=3D NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) !=3D NBD_CLIENT_CONNECTED) {
         error_setg(errp, "Connection closed");
         return -EIO;
     }
@@ -1288,7 +1301,7 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState=
 *s,
     NBDReply local_reply;
     NBDStructuredReplyChunk *chunk;
     Error *local_err =3D NULL;
-    if (s->state !=3D NBD_CLIENT_CONNECTED) {
+    if (qatomic_load_acquire(&s->state) !=3D NBD_CLIENT_CONNECTED) {
         error_setg(&local_err, "Connection closed");
         nbd_iter_channel_error(iter, -EIO, &local_err);
         goto break_loop;
@@ -1313,7 +1326,8 @@ static bool nbd_reply_chunk_iter_receive(BDRVNBDState=
 *s,
     }

     /* Do not execute the body of NBD_FOREACH_REPLY_CHUNK for simple reply=
. */
-    if (nbd_reply_is_simple(reply) || s->state !=3D NBD_CLIENT_CONNECTED) {
+    if (nbd_reply_is_simple(reply) ||
+        qatomic_load_acquire(&s->state) !=3D NBD_CLIENT_CONNECTED) {
         goto break_loop;
     }

@@ -1745,6 +1759,15 @@ static int nbd_client_reopen_prepare(BDRVReopenState=
 *state,
     return 0;
 }

+static void nbd_yank(void *opaque)
+{
+    BlockDriverState *bs =3D opaque;
+    BDRVNBDState *s =3D (BDRVNBDState *)bs->opaque;
+
+    qatomic_store_release(&s->state, NBD_CLIENT_QUIT);
+    qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH, =
NULL);
+}
+
 static void nbd_client_close(BlockDriverState *bs)
 {
     BDRVNBDState *s =3D (BDRVNBDState *)bs->opaque;
@@ -1757,52 +1780,53 @@ static void nbd_client_close(BlockDriverState *bs)
     nbd_teardown_connection(bs);
 }

-static QIOChannelSocket *nbd_establish_connection(SocketAddress *saddr,
-                                                  Error **errp)
+static int nbd_establish_connection(BlockDriverState *bs,
+                                    SocketAddress *saddr,
+                                    Error **errp)
 {
     ERRP_GUARD();
-    QIOChannelSocket *sioc;
+    BDRVNBDState *s =3D (BDRVNBDState *)bs->opaque;

-    sioc =3D qio_channel_socket_new();
-    qio_channel_set_name(QIO_CHANNEL(sioc), "nbd-client");
+    s->sioc =3D qio_channel_socket_new();
+    qio_channel_set_name(QIO_CHANNEL(s->sioc), "nbd-client");

-    qio_channel_socket_connect_sync(sioc, saddr, errp);
+    qio_channel_socket_connect_sync(s->sioc, saddr, errp);
     if (*errp) {
-        object_unref(OBJECT(sioc));
-        return NULL;
+        object_unref(OBJECT(s->sioc));
+        s->sioc =3D NULL;
+        return -1;
     }

-    qio_channel_set_delay(QIO_CHANNEL(sioc), false);
+    yank_register_function(BLOCKDEV_YANK_INSTANCE(bs->node_name), nbd_yank=
, bs);
+    qio_channel_set_delay(QIO_CHANNEL(s->sioc), false);

-    return sioc;
+    return 0;
 }

-/* nbd_client_handshake takes ownership on sioc. On failure it is unref'ed=
. */
-static int nbd_client_handshake(BlockDriverState *bs, QIOChannelSocket *si=
oc,
-                                Error **errp)
+/* nbd_client_handshake takes ownership on s->sioc. On failure it's unref'=
ed. */
+static int nbd_client_handshake(BlockDriverState *bs, Error **errp)
 {
     BDRVNBDState *s =3D (BDRVNBDState *)bs->opaque;
     AioContext *aio_context =3D bdrv_get_aio_context(bs);
     int ret;

     trace_nbd_client_handshake(s->export);
-
-    s->sioc =3D sioc;
-
-    qio_channel_set_blocking(QIO_CHANNEL(sioc), false, NULL);
-    qio_channel_attach_aio_context(QIO_CHANNEL(sioc), aio_context);
+    qio_channel_set_blocking(QIO_CHANNEL(s->sioc), false, NULL);
+    qio_channel_attach_aio_context(QIO_CHANNEL(s->sioc), aio_context);

     s->info.request_sizes =3D true;
     s->info.structured_reply =3D true;
     s->info.base_allocation =3D true;
     s->info.x_dirty_bitmap =3D g_strdup(s->x_dirty_bitmap);
     s->info.name =3D g_strdup(s->export ?: "");
-    ret =3D nbd_receive_negotiate(aio_context, QIO_CHANNEL(sioc), s->tlscr=
eds,
+    ret =3D nbd_receive_negotiate(aio_context, QIO_CHANNEL(s->sioc), s->tl=
screds,
                                 s->hostname, &s->ioc, &s->info, errp);
     g_free(s->info.x_dirty_bitmap);
     g_free(s->info.name);
     if (ret < 0) {
-        object_unref(OBJECT(sioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                 nbd_yank, bs);
+        object_unref(OBJECT(s->sioc));
         s->sioc =3D NULL;
         return ret;
     }
@@ -1835,7 +1859,7 @@ static int nbd_client_handshake(BlockDriverState *bs,=
 QIOChannelSocket *sioc,
     }

     if (!s->ioc) {
-        s->ioc =3D QIO_CHANNEL(sioc);
+        s->ioc =3D QIO_CHANNEL(s->sioc);
         object_ref(OBJECT(s->ioc));
     }

@@ -1851,9 +1875,11 @@ static int nbd_client_handshake(BlockDriverState *bs=
, QIOChannelSocket *sioc,
     {
         NBDRequest request =3D { .type =3D NBD_CMD_DISC };

-        nbd_send_request(s->ioc ?: QIO_CHANNEL(sioc), &request);
+        nbd_send_request(s->ioc ?: QIO_CHANNEL(s->sioc), &request);

-        object_unref(OBJECT(sioc));
+        yank_unregister_function(BLOCKDEV_YANK_INSTANCE(bs->node_name),
+                                 nbd_yank, bs);
+        object_unref(OBJECT(s->sioc));
         s->sioc =3D NULL;

         return ret;
@@ -2245,7 +2271,6 @@ static int nbd_open(BlockDriverState *bs, QDict *opti=
ons, int flags,
 {
     int ret;
     BDRVNBDState *s =3D (BDRVNBDState *)bs->opaque;
-    QIOChannelSocket *sioc;

     ret =3D nbd_process_options(bs, options, errp);
     if (ret < 0) {
@@ -2256,17 +2281,23 @@ static int nbd_open(BlockDriverState *bs, QDict *op=
tions, int flags,
     qemu_co_mutex_init(&s->send_mutex);
     qemu_co_queue_init(&s->free_sema);

+    yank_register_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name), errp);
+    if (*errp) {
+        return -EEXIST;
+    }
+
     /*
      * establish TCP connection, return error if it fails
      * TODO: Configurable retry-until-timeout behaviour.
      */
-    sioc =3D nbd_establish_connection(s->saddr, errp);
-    if (!sioc) {
+    if (nbd_establish_connection(bs, s->saddr, errp) < 0) {
+        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
         return -ECONNREFUSED;
     }

-    ret =3D nbd_client_handshake(bs, sioc, errp);
+    ret =3D nbd_client_handshake(bs, errp);
     if (ret < 0) {
+        yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
         nbd_clear_bdrvstate(s);
         return ret;
     }
@@ -2326,6 +2357,7 @@ static void nbd_close(BlockDriverState *bs)
     BDRVNBDState *s =3D bs->opaque;

     nbd_client_close(bs);
+    yank_unregister_instance(BLOCKDEV_YANK_INSTANCE(bs->node_name));
     nbd_clear_bdrvstate(s);
 }

--
2.20.1


--Sig_/CZLu4x/nddYetB.KdDiwQay
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAl+xEqUACgkQNasLKJxd
slg1dhAAmcEmqG7g8/Hv0gUGcaKhpHS7Ybcapoe0Eytnm6PRviJ4en2tj3YlrBpO
0w2p44RWwxHTB6aXlrpG/XPon9jkuRM6uKQRbLsD2JhEHnm+v0w+zQXxPOj3k7ql
pE24bw43Jzkt2qIH2x9P6u7LJe61pQbSsjnIrp0IfeyEGOVirh0sK2AYPQJuXYGn
IFddUDINLfK5c7Ji5b15kiB3/Lf2X49Rkjg190i01fth9HB1WFhnq7mnAHeSf8aI
tQ27kTbjJOzMAqGavK/eY5E6cL1MsQVcKbhkGmO5ywtzqg/yT38EPUy7TM0VcuNj
dujaszko290DUOsjka/qL9Qo1yvvLDLJzDuolc9GDb/HAmH7KbRIJ/jtQfeptxMt
5AD07zY1KRdsetox4QVo/k+/xu6C8I05j1kbaqcIUyLaDBLVrNPvWccqGvbMXWaa
k7cYSNABK6pJZrVJzldlIYizoi0LlZ642ERmLGWZDxwCevdGpzWOoO97RbbrMMYv
B9HXrbK2tbu02RapcCfQlILyeJQ27wv2RI9MCxn6VXrNu0+tg71b0Ycu30BqG25a
4vwqSsuTrxsG6XB5Ac0SnApvNhhaINIbja2iF7FL+iQVSaRc1AdlrzRdFjMfNatZ
pPkDecRuV1j+NqW0IWbz3SefnLr2A8sGK34Qr49+rYFkeKp0yNY=
=XVJm
-----END PGP SIGNATURE-----

--Sig_/CZLu4x/nddYetB.KdDiwQay--

