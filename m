Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2D2F7500
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:13:25 +0100 (CET)
Received: from localhost ([::1]:52520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LAa-0003YF-Cr
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1l0L5u-00056v-Hq
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:08:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1l0L5r-00068s-FO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:08:33 -0500
IronPort-SDR: Q+lkdLaoo0ckjPKRVI0IyR28XVl/D68TMHOwyvOBwrCVCYOLY/n3Ju1PzrQaxTf/e3ZqxR80jj
 sZp7KYeaq2MA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240067023"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="240067023"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 01:08:27 -0800
IronPort-SDR: jFfDUoWqU6QLpm8aOyWnFbfYeHV9T3WmeRdRbN+TAMnKMYRXMAbL2pQGPeipxtJhJm6THRzDeu
 QR99Ny70Phvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="382597374"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 15 Jan 2021 01:08:27 -0800
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 01:08:26 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 17:08:24 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Fri, 15 Jan 2021 17:08:24 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 3/3] net/colo-compare: Add handler for passthrough
 connection
Thread-Topic: [PATCH 3/3] net/colo-compare: Add handler for passthrough
 connection
Thread-Index: AQHW2ZH5s2h38bDoTUGttKnR+TafgqomvzmAgAHJe4A=
Date: Fri, 15 Jan 2021 09:08:24 +0000
Message-ID: <7b08aa481627408fbe930382d7ef4af1@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-4-chen.zhang@intel.com>
 <20210114145037.706fe8c7@gecko.fritz.box>
In-Reply-To: <20210114145037.706fe8c7@gecko.fritz.box>
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
Received-SPF: pass client-ip=134.134.136.31; envelope-from=chen.zhang@intel.com;
 helo=mga06.intel.com
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
Cc: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub <lukasstraub2@web.de>
> Sent: Thursday, January 14, 2021 9:51 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH 3/3] net/colo-compare: Add handler for passthrough
> connection
>=20
> On Thu, 24 Dec 2020 09:09:18 +0800
> Zhang Chen <chen.zhang@intel.com > wrote:
>=20
> > From: Zhang Chen <chen.zhang@intel.com>
> >
> > Currently, we just use guest's TCP/UDP source port as the key to
> > bypass certain network traffic.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/colo-compare.c | 49
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  net/colo-compare.h |  2 ++
> >  net/net.c          | 27 +++++++++++++++++++++++++
> >  3 files changed, 78 insertions(+)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > 337025b44f..11a32caa9b 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -46,6 +46,9 @@ static QTAILQ_HEAD(, CompareState) net_compares =3D
> > static NotifierList colo_compare_notifiers =3D
> >      NOTIFIER_LIST_INITIALIZER(colo_compare_notifiers);
> >
> > +static QLIST_HEAD(, PassthroughEntry) passthroughlist =3D
> > +    QLIST_HEAD_INITIALIZER(passthroughlist);
> > +
> >  #define COMPARE_READ_LEN_MAX NET_BUFSIZE  #define
> MAX_QUEUE_SIZE 1024
> >
> > @@ -103,6 +106,12 @@ typedef struct SendEntry {
> >      uint8_t *buf;
> >  } SendEntry;
> >
> > +typedef struct PassthroughEntry {
> > +    bool is_tcp;
> > +    uint16_t port;
> > +    QLIST_ENTRY(PassthroughEntry) node; } PassthroughEntry;
> > +
> >  struct CompareState {
> >      Object parent;
> >
> > @@ -247,6 +256,7 @@ static int packet_enqueue(CompareState *s, int
> mode, Connection **con)
> >      ConnectionKey key;
> >      Packet *pkt =3D NULL;
> >      Connection *conn;
> > +    PassthroughEntry *bypass, *next;
> >      int ret;
> >
> >      if (mode =3D=3D PRIMARY_IN) {
> > @@ -264,8 +274,23 @@ static int packet_enqueue(CompareState *s, int
> mode, Connection **con)
> >          pkt =3D NULL;
> >          return -1;
> >      }
> > +
> >      fill_connection_key(pkt, &key);
> >
> > +    /* Check COLO passthrough connenction */
> > +    if (!QLIST_EMPTY(&passthroughlist)) {
> > +        QLIST_FOREACH_SAFE(bypass, &passthroughlist, node, next) {
> > +            if (((key.ip_proto =3D=3D IPPROTO_TCP) && bypass->is_tcp) =
||
> > +                ((key.ip_proto =3D=3D IPPROTO_UDP) && !bypass->is_tcp)=
) {
> > +                if (bypass->port =3D=3D key.src_port) {
> > +                    packet_destroy(pkt, NULL);
> > +                    pkt =3D NULL;
> > +                    return -1;
> > +                }
> > +            }
> > +        }
> > +    }
> > +
> >      conn =3D connection_get(s->connection_track_table,
> >                            &key,
> >                            &s->conn_list); @@ -1373,6 +1398,30 @@
> > static void colo_flush_packets(void *opaque, void *user_data)
> >      }
> >  }
> >
> > +void colo_compare_passthrough_add(bool is_tcp, const uint16_t port) {
> > +    PassthroughEntry *bypass =3D NULL;
> > +
> > +    bypass =3D g_new0(PassthroughEntry, 1);
> > +    bypass->is_tcp =3D is_tcp;
> > +    bypass->port =3D port;
> > +    QLIST_INSERT_HEAD(&passthroughlist, bypass, node); }
> > +
> > +void colo_compare_passthrough_del(bool is_tcp, const uint16_t port) {
> > +    PassthroughEntry *bypass =3D NULL, *next =3D NULL;
> > +
> > +    if (!QLIST_EMPTY(&passthroughlist)) {
> > +        QLIST_FOREACH_SAFE(bypass, &passthroughlist, node, next) {
> > +            if ((bypass->is_tcp =3D=3D is_tcp) && (bypass->port =3D=3D=
 port)) {
> > +                QLIST_REMOVE(bypass, node);
> > +                g_free(bypass);
> > +            }
> > +        }
> > +    }
> > +}
> > +
>=20
> Access to "passtroughlist" needs to be protected by a lock, as
> "packet_enqueue" is called from a different iothread.

OK, I will add the lock in next version.

Thanks
Chen

>=20
> >  static void colo_compare_class_init(ObjectClass *oc, void *data)  {
> >      UserCreatableClass *ucc =3D USER_CREATABLE_CLASS(oc); diff --git
> > a/net/colo-compare.h b/net/colo-compare.h index
> 22ddd512e2..1fa026c85e
> > 100644
> > --- a/net/colo-compare.h
> > +++ b/net/colo-compare.h
> > @@ -20,5 +20,7 @@
> >  void colo_notify_compares_event(void *opaque, int event, Error
> > **errp);  void colo_compare_register_notifier(Notifier *notify);  void
> > colo_compare_unregister_notifier(Notifier *notify);
> > +void colo_compare_passthrough_add(bool is_tcp, const uint16_t port);
> > +void colo_compare_passthrough_del(bool is_tcp, const uint16_t port);
> >
> >  #endif /* QEMU_COLO_COMPARE_H */
> > diff --git a/net/net.c b/net/net.c
> > index eac7a92618..1f303e8309 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -55,6 +55,7 @@
> >  #include "sysemu/sysemu.h"
> >  #include "net/filter.h"
> >  #include "qapi/string-output-visitor.h"
> > +#include "net/colo-compare.h"
> >
> >  /* Net bridge is currently not supported for W32. */  #if
> > !defined(_WIN32) @@ -1155,12 +1156,38 @@ void
> > qmp_colo_passthrough_add(const char *prot, const uint32_t port,
> >                                Error **errp)  {
> >      /* Setup passthrough connection */
> > +    if (port > 65536) {
> > +        error_setg(errp, "COLO pass through get wrong port");
> > +        return;
> > +    }
> > +
> > +    if (!strcmp(prot, "tcp") || !strcmp(prot, "TCP")) {
> > +        colo_compare_passthrough_add(true, (uint16_t)port);
> > +    } else if (!strcmp(prot, "udp") || !strcmp(prot, "UDP")) {
> > +        colo_compare_passthrough_add(false, (uint16_t)port);
> > +    } else {
> > +        error_setg(errp, "COLO pass through just support tcp or udp
> protocol");
> > +        return;
> > +    }
> >  }
> >
> >  void qmp_colo_passthrough_del(const char *prot, const uint32_t port,
> >                                Error **errp)  {
> >      /* Delete passthrough connection */
> > +    if (port > 65536) {
> > +        error_setg(errp, "COLO pass through get wrong port");
> > +        return;
> > +    }
> > +
> > +    if (!strcmp(prot, "tcp") || !strcmp(prot, "TCP")) {
> > +        colo_compare_passthrough_del(true, (uint16_t)port);
> > +    } else if (!strcmp(prot, "udp") || !strcmp(prot, "UDP")) {
> > +        colo_compare_passthrough_del(false, (uint16_t)port);
> > +    } else {
> > +        error_setg(errp, "COLO pass through just support tcp or udp
> protocol");
> > +        return;
> > +    }
> >  }
> >
> >  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>=20
>=20
>=20
> --


