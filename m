Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D70134C0F1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 03:19:55 +0200 (CEST)
Received: from localhost ([::1]:56784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQgZO-0006zb-Cn
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 21:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lQgYK-0006Sq-Sz
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 21:18:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:49751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lQgYH-00030C-TA
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 21:18:48 -0400
IronPort-SDR: NP5qM7AQdtxoex3TDyyLpl6FS2zaH+iquDGvDAL24tBdGagHC8Mse1rYL5Ez/wAJ6+vLBymSjn
 El0JNxEVE9dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="171469187"
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="171469187"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2021 18:18:38 -0700
IronPort-SDR: XhERDS1vjhszqDwxUMWhT8EqqoiO8AXVE0C8tffMk074jN7AIX3kzBrinIGcee2mzWyaF2Wwi7
 YCsxl37Sa/8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,285,1610438400"; d="scan'208";a="609555949"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2021 18:18:38 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 28 Mar 2021 18:18:37 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 09:18:35 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Mon, 29 Mar 2021 09:18:35 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH V4 5/7] net/colo-compare: Move data structure and define
 to .h file.
Thread-Topic: [PATCH V4 5/7] net/colo-compare: Move data structure and define
 to .h file.
Thread-Index: AQHXHHR4ttVovajvt0ybKWSDKG9HOqqSeziAgAe+j7A=
Date: Mon, 29 Mar 2021 01:18:35 +0000
Message-ID: <4ac5c3a9970447898940771801877a41@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-6-chen.zhang@intel.com> <YFscK6+H69dXLY/Z@work-vm>
In-Reply-To: <YFscK6+H69dXLY/Z@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
Content-Type: text/plain; charset="us-ascii"
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Wednesday, March 24, 2021 7:02 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Markus Armbruster
> <armbru@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Zhang Chen
> <zhangckid@gmail.com>; Lukas Straub <lukasstraub2@web.de>
> Subject: Re: [PATCH V4 5/7] net/colo-compare: Move data structure and
> define to .h file.
>=20
> * Zhang Chen (chen.zhang@intel.com) wrote:
> > Make other modules can reuse COLO code.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/colo-compare.c | 106
> > ---------------------------------------------
> >  net/colo-compare.h | 106
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 106 insertions(+), 106 deletions(-)
> >
>=20
> <snip>
>=20
> > diff --git a/net/colo-compare.h b/net/colo-compare.h index
> > 22ddd512e2..2a9dcac0a7 100644
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
> MAX_QUEUE_SIZE 1024
>=20
> ^^^^
>=20
> > +#define COLO_COMPARE_FREE_PRIMARY     0x01
> > +#define COLO_COMPARE_FREE_SECONDARY   0x02
> > +
> > +#define REGULAR_PACKET_CHECK_MS 1000
> > +#define DEFAULT_TIME_OUT_MS 3000
> > +
> > +typedef struct SendCo {
> > +    Coroutine *co;
> > +    struct CompareState *s;
> > +    CharBackend *chr;
> > +    GQueue send_list;
> > +    bool notify_remote_frame;
> > +    bool done;
> > +    int ret;
> > +} SendCo;
>=20
> ^^^^^
> > +typedef struct SendEntry {
> > +    uint32_t size;
> > +    uint32_t vnet_hdr_len;
> > +    uint8_t *buf;
> > +} SendEntry;
>=20
> ^^^^^
>=20
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
>=20
>  ^^^^^
>=20
> For a header, these are too generic names - they need to have Colo in the=
m;
> e.g. MAX_COLOQUEUE_SIZE and COLOSendEntry etc

Thanks Dave, I will fix it in next version.

Thanks
Chen

>=20
> Dave
>=20
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
> > +    SendCo out_sendco;
> > +    SendCo notify_sendco;
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
> > --
> > 2.25.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


