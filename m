Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A9386529
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 22:05:53 +0200 (CEST)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lijUv-0003Zg-1z
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 16:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijTM-00029q-TA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:04:17 -0400
Received: from mout.web.de ([217.72.192.78]:58059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1lijTK-0003if-4V
 for qemu-devel@nongnu.org; Mon, 17 May 2021 16:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1621281838;
 bh=MhfKtByfE+b7yNC5L4KHxuZHJFAB/Ntti2tWVD5FfiA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=BgOnKqrmKe4SQi2TdCkWaY+vYSfsIRFpSVsZxRGAXTe670mTFadZn/h6SAGQkyF5D
 t2o+m3YsBqP+21mH+WHzAYA3BV2UZJXu9gSvrXrzZrPaUk5mrnhcu70tH4WkuAGXXH
 UBy2kUYFcN7f9XVP4eu20l3j8hq/rtwHYI6EoC0k=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([88.130.61.102]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Md6y1-1l97rp0Lbv-00aH8i; Mon, 17
 May 2021 22:03:58 +0200
Date: Mon, 17 May 2021 22:03:40 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V6 4/6] net/colo-compare: Move data structure and define
 to .h file.
Message-ID: <20210517220340.387bd21e@gecko.fritz.box>
In-Reply-To: <20210420151537.64360-5-chen.zhang@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-5-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vh0fMLFjqlU+j4ArqZtU5WP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:El0DDho2mIQja72opgxWbfex/Un9KLHaK3wMzc88VxkVtN0iIIp
 9Outd/+3xWXQySB7G6270szOggbqJVOH3yFWw0FwjApDhMrpHjXMG+ICqDfkeHuUpYeR79E
 3F91l4uqiIWXWnhTwWhmGzzn+A/QZZpDcSr4lpxJ6bQCoD/Y2DkKBTKZR1DWvH3/myuQHAT
 dQAiIneYtV7YfZQfaTVDg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FVo5i0aph1A=:K3jcqFcctuNw0D9zBTxucz
 bQHzdVTuGbHChGcHob/+NzshphrnwtQa0cWS0eYh6wrXRjsqZypRdi4yQ7O/KSnjctoTmdFPI
 xopBt0Kz/DI2hGSIKbaZmYNeyioMfwwvcuOUJWWGh2flu/hi89336kkg0N6YQvazTbCwaAR+Y
 1WU+MIYaspW+MkzymC80E09gIoFNOvMEwSM9q7u6xxTKIHncZpk6C3Q90mfn0gEONu5SgHzTA
 JYQPgJX1Iqg8wX0SldrEWHM4R+F0ZifbOHpiqP+wStYvhsnkIrvtUsm4/JAMNsB/uUPrOSQGH
 eYW7BEhRW52u7Ftw/c/DlRqhIsN313PZSUtMY22G8kMjnUt1wp0PrsQiN+U+nbyVWvVM+fN/M
 R3lkSX/bc1nMGrWyU8EJVXziygdNOwi5lRIYrRsQ8+inW1cr75iMHysFBxid2d+69UU1KAeIu
 +K6NoRTA6yFwkoOvpa8dLnExOzKgzguUEngTH/xOB5L4UQPEBJpgurB7zMMLhEFQLZW/Iz0NI
 WfcIA5OACy3ksSScj93nK2LnBIz81kXySJbfmZxDR3vK1cROL043bXR6GJfvKj9tync+LzuDL
 +QYKCICh5xKmHNiDvbI/kboZkf4bZ+SYWQC26qmxXf+6x4w7tIOUepTB0hwvUp5sMJjwtmIYp
 K/9KLrAsWAiE1hDnSjbfzazrelmqjTCbBXGspcUT543EfUk5+CsJlIaC7XlvOJAytl92ky4fr
 5xurSw+wOqqd0dL0PgL1H1rOqye5yqfnrw78AIfJvmevL0fWP9pb0p//oeG4XyWUzdBCYtxJH
 WzNmuWXye47Z99lx2A8vq2vSoVsy1HcZNRx1G//UWcomXC4K59wc5Jo/zCsnswZSc7zNGxLug
 v7CXsdTf1a1NK8mZtnrqPcyVbb9v9dKOg6lxkosmVhrA05+sximE0NESyKhfADDiQ0CuX+eTK
 InaccAIfgxj4ZCWlArtrl+YKCGKsnzbC2T18frovVxAkoCgyZMsI4HOa73szEoWNKCMLOKH1m
 j439vbjgHvV4nIraN1zeBLGYXumnaOMVlP9Hg3T8kU0eDZZZ/Ak+nA4qDS8LwB838DKljowvN
 3Lc8lfxTsPeobw8UO7l5ozxTMm8I1uHDhVAFmmhb69Lizj9c92qa3V9xTSbvGAi2UetLQ4xgM
 1tbfHjGOq4e4Dylp3uKIsmt2R1qcLEDdDwyo8bm9d1aVPI6tPJXR/o96oVdcqgx9pCcrZRdHa
 0rzWG5l9vSfwAsizG
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
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
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/vh0fMLFjqlU+j4ArqZtU5WP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Apr 2021 23:15:35 +0800
Zhang Chen <chen.zhang@intel.com> wrote:

> Rename structure with COLO index and move it to .h file,
> It make other modules can reuse COLO code.

Hi,
There are some definitions that don't need to be moved into the header,
more comments below.

In general I think the new passthrough feature can be exclusive to
colo-compare for now and that everything can remain there. If other net
filters implement the feature, we can still move it outside of
colo-compare later.

> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo-compare.c | 134 +++++----------------------------------------
>  net/colo-compare.h | 106 +++++++++++++++++++++++++++++++++++
>  2 files changed, 120 insertions(+), 120 deletions(-)
>=20
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index 9d1ad99941..b51b1437ef 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -17,44 +17,24 @@
>  #include "qemu/error-report.h"
>  #include "trace.h"
>  #include "qapi/error.h"
> -#include "net/net.h"
>  #include "net/eth.h"
>  #include "qom/object_interfaces.h"
>  #include "qemu/iov.h"
>  #include "qom/object.h"
>  #include "net/queue.h"
> -#include "chardev/char-fe.h"
>  #include "qemu/sockets.h"
> -#include "colo.h"
> -#include "sysemu/iothread.h"
>  #include "net/colo-compare.h"
> -#include "migration/colo.h"
> -#include "migration/migration.h"
>  #include "util.h"
> =20
>  #include "block/aio-wait.h"
>  #include "qemu/coroutine.h"
> =20
> -#define TYPE_COLO_COMPARE "colo-compare"
> -typedef struct CompareState CompareState;
> -DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
> -                         TYPE_COLO_COMPARE)
> -
>  static QTAILQ_HEAD(, CompareState) net_compares =3D
>         QTAILQ_HEAD_INITIALIZER(net_compares);
> =20
>  static NotifierList colo_compare_notifiers =3D
>      NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
> =20
> -#define COMPARE_READ_LEN_MAX NET_BUFSIZE
> -#define MAX_QUEUE_SIZE 1024
> -
> -#define COLO_COMPARE_FREE_PRIMARY     0x01
> -#define COLO_COMPARE_FREE_SECONDARY   0x02
> -
> -#define REGULAR_PACKET_CHECK_MS 1000
> -#define DEFAULT_TIME_OUT_MS 3000
> -

These 6 defines should stay here.

>  /* #define DEBUG_COLO_PACKETS */
> =20
>  static QemuMutex colo_compare_mutex;
> @@ -64,92 +44,6 @@ static QemuCond event_complete_cond;
>  static int event_unhandled_count;
>  static uint32_t max_queue_size;
> =20
> -/*
> - *  + CompareState ++
> - *  |               |
> - *  +---------------+   +---------------+         +---------------+
> - *  |   conn list   + - >      conn     + ------- >      conn     + -- >=
 ......
> - *  +---------------+   +---------------+         +---------------+
> - *  |               |     |           |             |          |
> - *  +---------------+ +---v----+  +---v----+    +---v----+ +---v----+
> - *                    |primary |  |secondary    |primary | |secondary
> - *                    |packet  |  |packet  +    |packet  | |packet  +
> - *                    +--------+  +--------+    +--------+ +--------+
> - *                        |           |             |          |
> - *                    +---v----+  +---v----+    +---v----+ +---v----+
> - *                    |primary |  |secondary    |primary | |secondary
> - *                    |packet  |  |packet  +    |packet  | |packet  +
> - *                    +--------+  +--------+    +--------+ +--------+
> - *                        |           |             |          |
> - *                    +---v----+  +---v----+    +---v----+ +---v----+
> - *                    |primary |  |secondary    |primary | |secondary
> - *                    |packet  |  |packet  +    |packet  | |packet  +
> - *                    +--------+  +--------+    +--------+ +--------+
> - */
> -
> -typedef struct SendCo {
> -    Coroutine *co;
> -    struct CompareState *s;
> -    CharBackend *chr;
> -    GQueue send_list;
> -    bool notify_remote_frame;
> -    bool done;
> -    int ret;
> -} SendCo;

This struct should stay here.

> -typedef struct SendEntry {
> -    uint32_t size;
> -    uint32_t vnet_hdr_len;
> -    uint8_t *buf;
> -} SendEntry;

This struct should stay here.

> -struct CompareState {
> -    Object parent;
> -
> -    char *pri_indev;
> -    char *sec_indev;
> -    char *outdev;
> -    char *notify_dev;
> -    CharBackend chr_pri_in;
> -    CharBackend chr_sec_in;
> -    CharBackend chr_out;
> -    CharBackend chr_notify_dev;
> -    SocketReadState pri_rs;
> -    SocketReadState sec_rs;
> -    SocketReadState notify_rs;
> -    SendCo out_sendco;
> -    SendCo notify_sendco;
> -    bool vnet_hdr;
> -    uint64_t compare_timeout;
> -    uint32_t expired_scan_cycle;
> -
> -    /*
> -     * Record the connection that through the NIC
> -     * Element type: Connection
> -     */
> -    GQueue conn_list;
> -    /* Record the connection without repetition */
> -    GHashTable *connection_track_table;
> -
> -    IOThread *iothread;
> -    GMainContext *worker_context;
> -    QEMUTimer *packet_check_timer;
> -
> -    QEMUBH *event_bh;
> -    enum colo_event event;
> -
> -    QTAILQ_ENTRY(CompareState) next;
> -};
> -
> -typedef struct CompareClass {
> -    ObjectClass parent_class;
> -} CompareClass;
> -
> -enum {
> -    PRIMARY_IN =3D 0,
> -    SECONDARY_IN,
> -};

The enum should stay here.

>  static const char *colo_mode[] =3D {
>      [PRIMARY_IN] =3D "primary",
>      [SECONDARY_IN] =3D "secondary",
> @@ -737,19 +631,19 @@ static void colo_compare_connection(void *opaque, v=
oid *user_data)
> =20
>  static void coroutine_fn _compare_chr_send(void *opaque)
>  {
> -    SendCo *sendco =3D opaque;
> +    COLOSendCo *sendco =3D opaque;
>      CompareState *s =3D sendco->s;
>      int ret =3D 0;
> =20
>      while (!g_queue_is_empty(&sendco->send_list)) {
> -        SendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
> +        COLOSendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
>          uint32_t len =3D htonl(entry->size);
> =20
>          ret =3D qemu_chr_fe_write_all(sendco->chr, (uint8_t *)&len, size=
of(len));
> =20
>          if (ret !=3D sizeof(len)) {
>              g_free(entry->buf);
> -            g_slice_free(SendEntry, entry);
> +            g_slice_free(COLOSendEntry, entry);
>              goto err;
>          }
> =20
> @@ -766,7 +660,7 @@ static void coroutine_fn _compare_chr_send(void *opaq=
ue)
> =20
>              if (ret !=3D sizeof(len)) {
>                  g_free(entry->buf);
> -                g_slice_free(SendEntry, entry);
> +                g_slice_free(COLOSendEntry, entry);
>                  goto err;
>              }
>          }
> @@ -777,12 +671,12 @@ static void coroutine_fn _compare_chr_send(void *op=
aque)
> =20
>          if (ret !=3D entry->size) {
>              g_free(entry->buf);
> -            g_slice_free(SendEntry, entry);
> +            g_slice_free(COLOSendEntry, entry);
>              goto err;
>          }
> =20
>          g_free(entry->buf);
> -        g_slice_free(SendEntry, entry);
> +        g_slice_free(COLOSendEntry, entry);
>      }
> =20
>      sendco->ret =3D 0;
> @@ -790,9 +684,9 @@ static void coroutine_fn _compare_chr_send(void *opaq=
ue)
> =20
>  err:
>      while (!g_queue_is_empty(&sendco->send_list)) {
> -        SendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
> +        COLOSendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
>          g_free(entry->buf);
> -        g_slice_free(SendEntry, entry);
> +        g_slice_free(COLOSendEntry, entry);
>      }
>      sendco->ret =3D ret < 0 ? ret : -EIO;
>  out:
> @@ -808,8 +702,8 @@ static int compare_chr_send(CompareState *s,
>                              bool notify_remote_frame,
>                              bool zero_copy)
>  {
> -    SendCo *sendco;
> -    SendEntry *entry;
> +    COLOSendCo *sendco;
> +    COLOSendEntry *entry;
> =20
>      if (notify_remote_frame) {
>          sendco =3D &s->notify_sendco;
> @@ -821,7 +715,7 @@ static int compare_chr_send(CompareState *s,
>          return 0;
>      }
> =20
> -    entry =3D g_slice_new(SendEntry);
> +    entry =3D g_slice_new(COLOSendEntry);
>      entry->size =3D size;
>      entry->vnet_hdr_len =3D vnet_hdr_len;
>      if (zero_copy) {
> @@ -1274,17 +1168,17 @@ static void colo_compare_complete(UserCreatable *=
uc, Error **errp)
> =20
>      if (!s->compare_timeout) {
>          /* Set default value to 3000 MS */
> -        s->compare_timeout =3D DEFAULT_TIME_OUT_MS;
> +        s->compare_timeout =3D COLO_DEFAULT_TIME_OUT_MS;
>      }
> =20
>      if (!s->expired_scan_cycle) {
>          /* Set default value to 3000 MS */
> -        s->expired_scan_cycle =3D REGULAR_PACKET_CHECK_MS;
> +        s->expired_scan_cycle =3D COLO_REGULAR_PACKET_CHECK_MS;
>      }
> =20
>      if (!max_queue_size) {
>          /* Set default queue size to 1024 */
> -        max_queue_size =3D MAX_QUEUE_SIZE;
> +        max_queue_size =3D MAX_COLO_QUEUE_SIZE;
>      }
> =20
>      if (find_and_check_chardev(&chr, s->pri_indev, errp) ||
> diff --git a/net/colo-compare.h b/net/colo-compare.h
> index 22ddd512e2..ab649c9dbe 100644
> --- a/net/colo-compare.h
> +++ b/net/colo-compare.h
> @@ -17,6 +17,112 @@
>  #ifndef QEMU_COLO_COMPARE_H
>  #define QEMU_COLO_COMPARE_H
> =20
> +#include "net/net.h"
> +#include "chardev/char-fe.h"
> +#include "migration/colo.h"
> +#include "migration/migration.h"
> +#include "sysemu/iothread.h"
> +#include "colo.h"
> +
> +#define TYPE_COLO_COMPARE "colo-compare"
> +typedef struct CompareState CompareState;
> +DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
> +                         TYPE_COLO_COMPARE)
> +
> +#define COMPARE_READ_LEN_MAX NET_BUFSIZE
> +#define MAX_COLO_QUEUE_SIZE 1024
> +
> +#define COLO_COMPARE_FREE_PRIMARY     0x01
> +#define COLO_COMPARE_FREE_SECONDARY   0x02
> +
> +#define COLO_REGULAR_PACKET_CHECK_MS 1000
> +#define COLO_DEFAULT_TIME_OUT_MS 3000
> +
> +typedef struct COLOSendCo {
> +    Coroutine *co;
> +    struct CompareState *s;
> +    CharBackend *chr;
> +    GQueue send_list;
> +    bool notify_remote_frame;
> +    bool done;
> +    int ret;
> +} COLOSendCo;
> +
> +typedef struct COLOSendEntry {
> +    uint32_t size;
> +    uint32_t vnet_hdr_len;
> +    uint8_t *buf;
> +} COLOSendEntry;
> +
> +/*
> + *  + CompareState ++
> + *  |               |
> + *  +---------------+   +---------------+         +---------------+
> + *  |   conn list   + - >      conn     + ------- >      conn     + -- >=
 ......
> + *  +---------------+   +---------------+         +---------------+
> + *  |               |     |           |             |          |
> + *  +---------------+ +---v----+  +---v----+    +---v----+ +---v----+
> + *                    |primary |  |secondary    |primary | |secondary
> + *                    |packet  |  |packet  +    |packet  | |packet  +
> + *                    +--------+  +--------+    +--------+ +--------+
> + *                        |           |             |          |
> + *                    +---v----+  +---v----+    +---v----+ +---v----+
> + *                    |primary |  |secondary    |primary | |secondary
> + *                    |packet  |  |packet  +    |packet  | |packet  +
> + *                    +--------+  +--------+    +--------+ +--------+
> + *                        |           |             |          |
> + *                    +---v----+  +---v----+    +---v----+ +---v----+
> + *                    |primary |  |secondary    |primary | |secondary
> + *                    |packet  |  |packet  +    |packet  | |packet  +
> + *                    +--------+  +--------+    +--------+ +--------+
> + */
> +struct CompareState {
> +    Object parent;
> +
> +    char *pri_indev;
> +    char *sec_indev;
> +    char *outdev;
> +    char *notify_dev;
> +    CharBackend chr_pri_in;
> +    CharBackend chr_sec_in;
> +    CharBackend chr_out;
> +    CharBackend chr_notify_dev;
> +    SocketReadState pri_rs;
> +    SocketReadState sec_rs;
> +    SocketReadState notify_rs;
> +    COLOSendCo out_sendco;
> +    COLOSendCo notify_sendco;
> +    bool vnet_hdr;
> +    uint64_t compare_timeout;
> +    uint32_t expired_scan_cycle;
> +
> +    /*
> +     * Record the connection that through the NIC
> +     * Element type: Connection
> +     */
> +    GQueue conn_list;
> +    /* Record the connection without repetition */
> +    GHashTable *connection_track_table;
> +
> +    IOThread *iothread;
> +    GMainContext *worker_context;
> +    QEMUTimer *packet_check_timer;
> +
> +    QEMUBH *event_bh;
> +    enum colo_event event;
> +
> +    QTAILQ_ENTRY(CompareState) next;
> +};
> +
> +typedef struct CompareClass {
> +    ObjectClass parent_class;
> +} CompareClass;
> +
> +enum {
> +    PRIMARY_IN =3D 0,
> +    SECONDARY_IN,
> +};
> +
>  void colo_notify_compares_event(void *opaque, int event, Error **errp);
>  void colo_compare_register_notifier(Notifier *notify);
>  void colo_compare_unregister_notifier(Notifier *notify);



--=20


--Sig_/vh0fMLFjqlU+j4ArqZtU5WP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmCizBwACgkQNasLKJxd
sliFmhAAoHvItWp/bfYXJHHDPtlqYI1Vb2wEZkO2v22MKwaGRRkfkHyYX3CDYepe
Z5fOxpBt0JAkmNLGnFadh5TNWwkjU2JROj/XW+DjWIzgCFDRsyj/6rCn2Qo9/wWw
dLpa/9dUhgXjICvo3ShzPPADH9bBMXtahLx4mJQBXuL70nyT4YaHIhm2h8qALqHp
DL/IhNcEq9tY42UAYPvZX8ThGVxtLtptq7nJX3B/bpIwJ8I47u5B6ZWR0Yok+EW3
8GaVqgLLeva7s6OXm03v2zeQpkGuKGDMCmE90rtMmodwvhtNm+KzsBknRELnHSWX
8yPZP0Yv2SclSmgKBGP3FrHjXDTJyktILRiloTl2BzSTVW/WUnpIH24i129+/6cf
UuaMQjPNOUkx0pdWAZgxuC9beUqR618s+zrQSabUet8wpvB0KM6xyxoaTmSRYNhw
drVlrdM6hJeD+MZd4GhGN11xHuMCaz/VjMSK0sdl+CO1z2rnp2ziTokUpbGOCIr2
7Ty6JIopkDh5xm+dnWzF5VN+agoWsM183RlIXNU1TI2slkeWZjUKBI7vF98Egm/j
PsIF/4jW4DtHkbGa83+ickU+soxLvOYtnRlbY2EOArkgN+9tyeeHS51IyoEMZLEk
gKcgGaUtVJP4q3aTmhgc7dCBbq6LdlDkbil5QuYDNpudMblT/aI=
=VIPb
-----END PGP SIGNATURE-----

--Sig_/vh0fMLFjqlU+j4ArqZtU5WP--

