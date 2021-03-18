Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696DD33FC93
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 02:14:32 +0100 (CET)
Received: from localhost ([::1]:47332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMhF8-0002GK-Vk
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 21:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMhEP-0001pG-6N
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 21:13:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:32271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lMhEM-00061r-CT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 21:13:44 -0400
IronPort-SDR: dtmDZ0pyaLRlcM+sRZDnWTQxjT+XYFn2tWlgls65KUn/JD459C9MekRhY4W2wJnWzgueTgtom8
 htuM5FPcsm/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="168855643"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="168855643"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 18:13:33 -0700
IronPort-SDR: SUW+K4NqtBxsv2GV4zcot21n/GLFcpdoDcPGddzBG+Hf4ySZE/I9SOsWJCGoLO9Fbj+uMaS75Q
 oBlwhz1gH7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="374368168"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 17 Mar 2021 18:13:32 -0700
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 18:13:31 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX606.ccr.corp.intel.com (10.109.6.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 09:13:29 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Thu, 18 Mar 2021 09:13:29 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH V2 6/7] net/colo-compare: Add passthrough list to
 CompareState
Thread-Topic: [PATCH V2 6/7] net/colo-compare: Add passthrough list to
 CompareState
Thread-Index: AQHXD+SnGbk1Kgso2EKjP3j3bZsvQaqIP24AgADIdJA=
Date: Thu, 18 Mar 2021 01:13:29 +0000
Message-ID: <8ad641b245434564978961b695fe3682@intel.com>
References: <20210303041539.1032415-1-chen.zhang@intel.com>
 <20210303041539.1032415-7-chen.zhang@intel.com>
 <20210317221532.164526d5@gecko.fritz.box>
In-Reply-To: <20210317221532.164526d5@gecko.fritz.box>
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
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Sent: Thursday, March 18, 2021 5:16 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V2 6/7] net/colo-compare: Add passthrough list to
> CompareState
>=20
> On Wed,  3 Mar 2021 12:15:38 +0800
> Zhang Chen <chen.zhang@intel.com > wrote:
>=20
> > From: Zhang Chen <chen.zhang@intel.com>
> >
> > Add passthrough list for each CompareState.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/colo-compare.c | 25 +++++++++++++++++++++++++  net/colo-
> compare.h
> > | 10 ++++++++++
> >  2 files changed, 35 insertions(+)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > a803f8b888..80cea32c20 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -141,6 +141,7 @@ static int packet_enqueue(CompareState *s, int
> mode, Connection **con)
> >      ConnectionKey key;
> >      Packet *pkt =3D NULL;
> >      Connection *conn;
> > +    PassthroughEntry *bypass, *next;
> >      int ret;
> >
> >      if (mode =3D=3D PRIMARY_IN) {
> > @@ -160,6 +161,29 @@ static int packet_enqueue(CompareState *s, int
> mode, Connection **con)
> >      }
> >      fill_connection_key(pkt, &key);
> >
> > +    /* Check COLO passthrough connenction */
> > +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> > +        QLIST_FOREACH_SAFE(bypass, &s->passthroughlist, node, next) {
> > +            if (((key.ip_proto =3D=3D IPPROTO_TCP) && (bypass->l4_prot=
ocol =3D=3D 0))
> ||
> > +                ((key.ip_proto =3D=3D IPPROTO_UDP) && (bypass->l4_prot=
ocol =3D=3D 1)))
> {
> > +                if (bypass->src_port =3D=3D 0 || bypass->src_port =3D=
=3D key.dst_port) {
> > +                    if (bypass->src_ip.s_addr =3D=3D 0 ||
> > +                        bypass->src_ip.s_addr =3D=3D key.src.s_addr) {
> > +                        if (bypass->dst_port =3D=3D 0 ||
> > +                            bypass->dst_port =3D=3D key.src_port) {
> > +                            if (bypass->dst_ip.s_addr =3D=3D 0 ||
> > +                                bypass->dst_ip.s_addr =3D=3D key.dst.s=
_addr) {
> > +                                packet_destroy(pkt, NULL);
> > +                                pkt =3D NULL;
> > +                                return -1;
> > +                            }
> > +                        }
> > +                    }
> > +                }
> > +            }
> > +        }
> > +    }
> > +
>=20
> Hi,
> Access to s->passthroughlist still needs to be protected by a lock.
>=20

OK, will fix it in next version.

Thanks
Chen

> Regards,
> Lukas Straub
>=20
> >      conn =3D connection_get(s->connection_track_table,
> >                            &key,
> >                            &s->conn_list); @@ -1224,6 +1248,7 @@
> > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> >      }
> >
> >      g_queue_init(&s->conn_list);
> > +    QLIST_INIT(&s->passthroughlist);
> >
> >      s->connection_track_table =3D
> g_hash_table_new_full(connection_key_hash,
> >
> > connection_key_equal, diff --git a/net/colo-compare.h
> > b/net/colo-compare.h index 2a9dcac0a7..31644f145b 100644
> > --- a/net/colo-compare.h
> > +++ b/net/colo-compare.h
> > @@ -54,6 +54,15 @@ typedef struct SendEntry {
> >      uint8_t *buf;
> >  } SendEntry;
> >
> > +typedef struct PassthroughEntry {
> > +    int l4_protocol;
> > +    int src_port;
> > +    int dst_port;
> > +    struct in_addr src_ip;
> > +    struct in_addr dst_ip;
> > +    QLIST_ENTRY(PassthroughEntry) node; } PassthroughEntry;
> > +
> >  /*
> >   *  + CompareState ++
> >   *  |               |
> > @@ -110,6 +119,7 @@ struct CompareState {
> >
> >      QEMUBH *event_bh;
> >      enum colo_event event;
> > +    QLIST_HEAD(, PassthroughEntry) passthroughlist;
> >
> >      QTAILQ_ENTRY(CompareState) next;
> >  };
>=20
>=20
>=20
> --


