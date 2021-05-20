Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6B1389B0E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 03:51:24 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljXqN-0000dW-Ck
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 21:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljXpS-0008Je-ID
 for qemu-devel@nongnu.org; Wed, 19 May 2021 21:50:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:60627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljXpO-0006zS-Tm
 for qemu-devel@nongnu.org; Wed, 19 May 2021 21:50:25 -0400
IronPort-SDR: vKCJAYILUjGmjS2P+R3v1p/c33jjJuPHuPg1WDllbNBAe9YrVpXSycbJ/+yeYOSB1pcEM9BmOb
 NRCPBSLS7HMg==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="181399760"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="181399760"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 18:50:17 -0700
IronPort-SDR: ZFcILlp2W90u+QkYhFifjDFrpQ92MHx+KTi9MEU8+zNfbW+w7q36G8okMX638EBP2AOILJ+QLd
 srhgyUAcJJ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="474929930"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 19 May 2021 18:50:17 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 19 May 2021 18:50:16 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 09:50:14 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Thu, 20 May 2021 09:50:14 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH V6 4/6] net/colo-compare: Move data structure and define
 to .h file.
Thread-Topic: [PATCH V6 4/6] net/colo-compare: Move data structure and define
 to .h file.
Thread-Index: AQHXNfjtMvzw0DFerkq94PRUQO3+Y6rnvWcAgAJ48XA=
Date: Thu, 20 May 2021 01:50:14 +0000
Message-ID: <834c0738041d4ebc82774b8231b0f76c@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-5-chen.zhang@intel.com>
 <20210517220340.387bd21e@gecko.fritz.box>
In-Reply-To: <20210517220340.387bd21e@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=192.55.52.151; envelope-from=chen.zhang@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Tuesday, May 18, 2021 4:04 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd Hoffmann
> <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Zhang Chen
> <zhangckid@gmail.com>
> Subject: Re: [PATCH V6 4/6] net/colo-compare: Move data structure and
> define to .h file.
>=20
> On Tue, 20 Apr 2021 23:15:35 +0800
> Zhang Chen <chen.zhang@intel.com> wrote:
>=20
> > Rename structure with COLO index and move it to .h file, It make other
> > modules can reuse COLO code.
>=20
> Hi,
> There are some definitions that don't need to be moved into the header,
> more comments below.
>=20

OK.

> In general I think the new passthrough feature can be exclusive to colo-
> compare for now and that everything can remain there. If other net filter=
s
> implement the feature, we can still move it outside of colo-compare later=
.
>=20

Agree, This patch move some code to colo-compare.h, it still in colo-compar=
e.

Thanks
Chen

> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/colo-compare.c | 134
> > +++++----------------------------------------
> >  net/colo-compare.h | 106 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 120 insertions(+), 120 deletions(-)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > 9d1ad99941..b51b1437ef 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -17,44 +17,24 @@
> >  #include "qemu/error-report.h"
> >  #include "trace.h"
> >  #include "qapi/error.h"
> > -#include "net/net.h"
> >  #include "net/eth.h"
> >  #include "qom/object_interfaces.h"
> >  #include "qemu/iov.h"
> >  #include "qom/object.h"
> >  #include "net/queue.h"
> > -#include "chardev/char-fe.h"
> >  #include "qemu/sockets.h"
> > -#include "colo.h"
> > -#include "sysemu/iothread.h"
> >  #include "net/colo-compare.h"
> > -#include "migration/colo.h"
> > -#include "migration/migration.h"
> >  #include "util.h"
> >
> >  #include "block/aio-wait.h"
> >  #include "qemu/coroutine.h"
> >
> > -#define TYPE_COLO_COMPARE "colo-compare"
> > -typedef struct CompareState CompareState;
> > -DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
> > -                         TYPE_COLO_COMPARE)
> > -
> >  static QTAILQ_HEAD(, CompareState) net_compares =3D
> >         QTAILQ_HEAD_INITIALIZER(net_compares);
> >
> >  static NotifierList colo_compare_notifiers =3D
> >      NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
> >
> > -#define COMPARE_READ_LEN_MAX NET_BUFSIZE -#define
> MAX_QUEUE_SIZE 1024
> > -
> > -#define COLO_COMPARE_FREE_PRIMARY     0x01
> > -#define COLO_COMPARE_FREE_SECONDARY   0x02
> > -
> > -#define REGULAR_PACKET_CHECK_MS 1000
> > -#define DEFAULT_TIME_OUT_MS 3000
> > -
>=20
> These 6 defines should stay here.
>=20
> >  /* #define DEBUG_COLO_PACKETS */
> >
> >  static QemuMutex colo_compare_mutex;
> > @@ -64,92 +44,6 @@ static QemuCond event_complete_cond;  static int
> > event_unhandled_count;  static uint32_t max_queue_size;
> >
> > -/*
> > - *  + CompareState ++
> > - *  |               |
> > - *  +---------------+   +---------------+         +---------------+
> > - *  |   conn list   + - >      conn     + ------- >      conn     + --=
 > ......
> > - *  +---------------+   +---------------+         +---------------+
> > - *  |               |     |           |             |          |
> > - *  +---------------+ +---v----+  +---v----+    +---v----+ +---v----+
> > - *                    |primary |  |secondary    |primary | |secondary
> > - *                    |packet  |  |packet  +    |packet  | |packet  +
> > - *                    +--------+  +--------+    +--------+ +--------+
> > - *                        |           |             |          |
> > - *                    +---v----+  +---v----+    +---v----+ +---v----+
> > - *                    |primary |  |secondary    |primary | |secondary
> > - *                    |packet  |  |packet  +    |packet  | |packet  +
> > - *                    +--------+  +--------+    +--------+ +--------+
> > - *                        |           |             |          |
> > - *                    +---v----+  +---v----+    +---v----+ +---v----+
> > - *                    |primary |  |secondary    |primary | |secondary
> > - *                    |packet  |  |packet  +    |packet  | |packet  +
> > - *                    +--------+  +--------+    +--------+ +--------+
> > - */
> > -
> > -typedef struct SendCo {
> > -    Coroutine *co;
> > -    struct CompareState *s;
> > -    CharBackend *chr;
> > -    GQueue send_list;
> > -    bool notify_remote_frame;
> > -    bool done;
> > -    int ret;
> > -} SendCo;
>=20
> This struct should stay here.
>=20
> > -typedef struct SendEntry {
> > -    uint32_t size;
> > -    uint32_t vnet_hdr_len;
> > -    uint8_t *buf;
> > -} SendEntry;
>=20
> This struct should stay here.
>=20
> > -struct CompareState {
> > -    Object parent;
> > -
> > -    char *pri_indev;
> > -    char *sec_indev;
> > -    char *outdev;
> > -    char *notify_dev;
> > -    CharBackend chr_pri_in;
> > -    CharBackend chr_sec_in;
> > -    CharBackend chr_out;
> > -    CharBackend chr_notify_dev;
> > -    SocketReadState pri_rs;
> > -    SocketReadState sec_rs;
> > -    SocketReadState notify_rs;
> > -    SendCo out_sendco;
> > -    SendCo notify_sendco;
> > -    bool vnet_hdr;
> > -    uint64_t compare_timeout;
> > -    uint32_t expired_scan_cycle;
> > -
> > -    /*
> > -     * Record the connection that through the NIC
> > -     * Element type: Connection
> > -     */
> > -    GQueue conn_list;
> > -    /* Record the connection without repetition */
> > -    GHashTable *connection_track_table;
> > -
> > -    IOThread *iothread;
> > -    GMainContext *worker_context;
> > -    QEMUTimer *packet_check_timer;
> > -
> > -    QEMUBH *event_bh;
> > -    enum colo_event event;
> > -
> > -    QTAILQ_ENTRY(CompareState) next;
> > -};
> > -
> > -typedef struct CompareClass {
> > -    ObjectClass parent_class;
> > -} CompareClass;
> > -
> > -enum {
> > -    PRIMARY_IN =3D 0,
> > -    SECONDARY_IN,
> > -};
>=20
> The enum should stay here.
>=20
> >  static const char *colo_mode[] =3D {
> >      [PRIMARY_IN] =3D "primary",
> >      [SECONDARY_IN] =3D "secondary",
> > @@ -737,19 +631,19 @@ static void colo_compare_connection(void
> > *opaque, void *user_data)
> >
> >  static void coroutine_fn _compare_chr_send(void *opaque)  {
> > -    SendCo *sendco =3D opaque;
> > +    COLOSendCo *sendco =3D opaque;
> >      CompareState *s =3D sendco->s;
> >      int ret =3D 0;
> >
> >      while (!g_queue_is_empty(&sendco->send_list)) {
> > -        SendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
> > +        COLOSendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
> >          uint32_t len =3D htonl(entry->size);
> >
> >          ret =3D qemu_chr_fe_write_all(sendco->chr, (uint8_t *)&len,
> > sizeof(len));
> >
> >          if (ret !=3D sizeof(len)) {
> >              g_free(entry->buf);
> > -            g_slice_free(SendEntry, entry);
> > +            g_slice_free(COLOSendEntry, entry);
> >              goto err;
> >          }
> >
> > @@ -766,7 +660,7 @@ static void coroutine_fn _compare_chr_send(void
> > *opaque)
> >
> >              if (ret !=3D sizeof(len)) {
> >                  g_free(entry->buf);
> > -                g_slice_free(SendEntry, entry);
> > +                g_slice_free(COLOSendEntry, entry);
> >                  goto err;
> >              }
> >          }
> > @@ -777,12 +671,12 @@ static void coroutine_fn
> _compare_chr_send(void
> > *opaque)
> >
> >          if (ret !=3D entry->size) {
> >              g_free(entry->buf);
> > -            g_slice_free(SendEntry, entry);
> > +            g_slice_free(COLOSendEntry, entry);
> >              goto err;
> >          }
> >
> >          g_free(entry->buf);
> > -        g_slice_free(SendEntry, entry);
> > +        g_slice_free(COLOSendEntry, entry);
> >      }
> >
> >      sendco->ret =3D 0;
> > @@ -790,9 +684,9 @@ static void coroutine_fn _compare_chr_send(void
> > *opaque)
> >
> >  err:
> >      while (!g_queue_is_empty(&sendco->send_list)) {
> > -        SendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
> > +        COLOSendEntry *entry =3D g_queue_pop_tail(&sendco->send_list);
> >          g_free(entry->buf);
> > -        g_slice_free(SendEntry, entry);
> > +        g_slice_free(COLOSendEntry, entry);
> >      }
> >      sendco->ret =3D ret < 0 ? ret : -EIO;
> >  out:
> > @@ -808,8 +702,8 @@ static int compare_chr_send(CompareState *s,
> >                              bool notify_remote_frame,
> >                              bool zero_copy)  {
> > -    SendCo *sendco;
> > -    SendEntry *entry;
> > +    COLOSendCo *sendco;
> > +    COLOSendEntry *entry;
> >
> >      if (notify_remote_frame) {
> >          sendco =3D &s->notify_sendco;
> > @@ -821,7 +715,7 @@ static int compare_chr_send(CompareState *s,
> >          return 0;
> >      }
> >
> > -    entry =3D g_slice_new(SendEntry);
> > +    entry =3D g_slice_new(COLOSendEntry);
> >      entry->size =3D size;
> >      entry->vnet_hdr_len =3D vnet_hdr_len;
> >      if (zero_copy) {
> > @@ -1274,17 +1168,17 @@ static void
> > colo_compare_complete(UserCreatable *uc, Error **errp)
> >
> >      if (!s->compare_timeout) {
> >          /* Set default value to 3000 MS */
> > -        s->compare_timeout =3D DEFAULT_TIME_OUT_MS;
> > +        s->compare_timeout =3D COLO_DEFAULT_TIME_OUT_MS;
> >      }
> >
> >      if (!s->expired_scan_cycle) {
> >          /* Set default value to 3000 MS */
> > -        s->expired_scan_cycle =3D REGULAR_PACKET_CHECK_MS;
> > +        s->expired_scan_cycle =3D COLO_REGULAR_PACKET_CHECK_MS;
> >      }
> >
> >      if (!max_queue_size) {
> >          /* Set default queue size to 1024 */
> > -        max_queue_size =3D MAX_QUEUE_SIZE;
> > +        max_queue_size =3D MAX_COLO_QUEUE_SIZE;
> >      }
> >
> >      if (find_and_check_chardev(&chr, s->pri_indev, errp) || diff
> > --git a/net/colo-compare.h b/net/colo-compare.h index
> > 22ddd512e2..ab649c9dbe 100644
> > --- a/net/colo-compare.h
> > +++ b/net/colo-compare.h
> > @@ -17,6 +17,112 @@
> >  #ifndef QEMU_COLO_COMPARE_H
> >  #define QEMU_COLO_COMPARE_H
> >
> > +#include "net/net.h"
> > +#include "chardev/char-fe.h"
> > +#include "migration/colo.h"
> > +#include "migration/migration.h"
> > +#include "sysemu/iothread.h"
> > +#include "colo.h"
> > +
> > +#define TYPE_COLO_COMPARE "colo-compare"
> > +typedef struct CompareState CompareState;
> > +DECLARE_INSTANCE_CHECKER(CompareState, COLO_COMPARE,
> > +                         TYPE_COLO_COMPARE)
> > +
> > +#define COMPARE_READ_LEN_MAX NET_BUFSIZE #define
> MAX_COLO_QUEUE_SIZE
> > +1024
> > +
> > +#define COLO_COMPARE_FREE_PRIMARY     0x01
> > +#define COLO_COMPARE_FREE_SECONDARY   0x02
> > +
> > +#define COLO_REGULAR_PACKET_CHECK_MS 1000 #define
> > +COLO_DEFAULT_TIME_OUT_MS 3000
> > +
> > +typedef struct COLOSendCo {
> > +    Coroutine *co;
> > +    struct CompareState *s;
> > +    CharBackend *chr;
> > +    GQueue send_list;
> > +    bool notify_remote_frame;
> > +    bool done;
> > +    int ret;
> > +} COLOSendCo;
> > +
> > +typedef struct COLOSendEntry {
> > +    uint32_t size;
> > +    uint32_t vnet_hdr_len;
> > +    uint8_t *buf;
> > +} COLOSendEntry;
> > +
> > +/*
> > + *  + CompareState ++
> > + *  |               |
> > + *  +---------------+   +---------------+         +---------------+
> > + *  |   conn list   + - >      conn     + ------- >      conn     + --=
 > ......
> > + *  +---------------+   +---------------+         +---------------+
> > + *  |               |     |           |             |          |
> > + *  +---------------+ +---v----+  +---v----+    +---v----+ +---v----+
> > + *                    |primary |  |secondary    |primary | |secondary
> > + *                    |packet  |  |packet  +    |packet  | |packet  +
> > + *                    +--------+  +--------+    +--------+ +--------+
> > + *                        |           |             |          |
> > + *                    +---v----+  +---v----+    +---v----+ +---v----+
> > + *                    |primary |  |secondary    |primary | |secondary
> > + *                    |packet  |  |packet  +    |packet  | |packet  +
> > + *                    +--------+  +--------+    +--------+ +--------+
> > + *                        |           |             |          |
> > + *                    +---v----+  +---v----+    +---v----+ +---v----+
> > + *                    |primary |  |secondary    |primary | |secondary
> > + *                    |packet  |  |packet  +    |packet  | |packet  +
> > + *                    +--------+  +--------+    +--------+ +--------+
> > + */
> > +struct CompareState {
> > +    Object parent;
> > +
> > +    char *pri_indev;
> > +    char *sec_indev;
> > +    char *outdev;
> > +    char *notify_dev;
> > +    CharBackend chr_pri_in;
> > +    CharBackend chr_sec_in;
> > +    CharBackend chr_out;
> > +    CharBackend chr_notify_dev;
> > +    SocketReadState pri_rs;
> > +    SocketReadState sec_rs;
> > +    SocketReadState notify_rs;
> > +    COLOSendCo out_sendco;
> > +    COLOSendCo notify_sendco;
> > +    bool vnet_hdr;
> > +    uint64_t compare_timeout;
> > +    uint32_t expired_scan_cycle;
> > +
> > +    /*
> > +     * Record the connection that through the NIC
> > +     * Element type: Connection
> > +     */
> > +    GQueue conn_list;
> > +    /* Record the connection without repetition */
> > +    GHashTable *connection_track_table;
> > +
> > +    IOThread *iothread;
> > +    GMainContext *worker_context;
> > +    QEMUTimer *packet_check_timer;
> > +
> > +    QEMUBH *event_bh;
> > +    enum colo_event event;
> > +
> > +    QTAILQ_ENTRY(CompareState) next;
> > +};
> > +
> > +typedef struct CompareClass {
> > +    ObjectClass parent_class;
> > +} CompareClass;
> > +
> > +enum {
> > +    PRIMARY_IN =3D 0,
> > +    SECONDARY_IN,
> > +};
> > +
> >  void colo_notify_compares_event(void *opaque, int event, Error
> > **errp);  void colo_compare_register_notifier(Notifier *notify);  void
> > colo_compare_unregister_notifier(Notifier *notify);
>=20
>=20
>=20
> --


