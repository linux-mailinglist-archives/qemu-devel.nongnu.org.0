Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAFC2F74EC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:11:14 +0100 (CET)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0L8T-0006DP-DS
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1l0L5L-0004PT-5g
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:07:59 -0500
Received: from mga14.intel.com ([192.55.52.115]:37081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1l0L5I-0005tB-2h
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:07:58 -0500
IronPort-SDR: IGoAgvgxLgIbvwbNtuZt7J4vVJokL+IRiyjopcia3931Je10yoOPTKW9XBbTaINR477PZR6GdK
 dsfYlA8/94ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="177743503"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="177743503"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 01:07:50 -0800
IronPort-SDR: krvIXMqvSSioAscMCKMuViAFbUwkaLyn8rFNCAp9f8zgCoruZa5JcC0mi7i3ZWkq4N9/wxLczo
 L3VAtnx8RpuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="382597257"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 15 Jan 2021 01:07:49 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 01:07:48 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 Jan 2021 17:07:47 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.1713.004;
 Fri, 15 Jan 2021 17:07:47 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 3/3] net/colo-compare: Add handler for passthrough
 connection
Thread-Topic: [PATCH 3/3] net/colo-compare: Add handler for passthrough
 connection
Thread-Index: AQHW2ZH5s2h38bDoTUGttKnR+TafgqomvcCAgAHIsRA=
Date: Fri, 15 Jan 2021 09:07:47 +0000
Message-ID: <63df670857ed4a278fab273557ee97d6@intel.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-4-chen.zhang@intel.com>
 <20210114144521.76a6a135@gecko.fritz.box>
In-Reply-To: <20210114144521.76a6a135@gecko.fritz.box>
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
Received-SPF: pass client-ip=192.55.52.115; envelope-from=chen.zhang@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
> Sent: Thursday, January 14, 2021 9:45 PM
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
>=20
> Hi,
> I think this should be per colo-compare instance e.g. inside 'struct
> CompareState'.

It looks QMP and HMP also need to add colo-compare object ID to control it.
Do we need make this command more general?

Thanks
Chen

>=20
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


