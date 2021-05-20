Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E2389BF8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 05:39:44 +0200 (CEST)
Received: from localhost ([::1]:49562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljZXD-0004Sr-3w
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 23:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljZW4-0003nC-RD
 for qemu-devel@nongnu.org; Wed, 19 May 2021 23:38:32 -0400
Received: from mga17.intel.com ([192.55.52.151]:24392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1ljZW2-0000Hb-0d
 for qemu-devel@nongnu.org; Wed, 19 May 2021 23:38:32 -0400
IronPort-SDR: bbm8T+5XxoWZWrzYrzMr4Npo07FdthiP68yXw0PzLTvXP4lLY5vxt6Hne5T2IykgWqrWzXGhEI
 lbhoxGOUtTaQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9989"; a="181412067"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="181412067"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2021 20:38:21 -0700
IronPort-SDR: Yvsaz8SH90KD1C8zvQJuTRNcu9ecfYLen0/7W+1zUeB5fZOhvuhvuP23/BIq2PEiBDGR8qcYtP
 /xABfghGByDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; d="scan'208";a="433739693"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 19 May 2021 20:38:21 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 19 May 2021 20:38:20 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX602.ccr.corp.intel.com (10.109.6.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 11:38:18 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2242.008;
 Thu, 20 May 2021 11:38:18 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH V6 5/6] net/colo-compare: Add passthrough list to
 CompareState
Thread-Topic: [PATCH V6 5/6] net/colo-compare: Add passthrough list to
 CompareState
Thread-Index: AQHXNfjunfKMDNmteUG4XQC0ZqQmParnvloAgAQomgA=
Date: Thu, 20 May 2021 03:38:18 +0000
Message-ID: <b9378b12786b48ef94681ffb7b77d8d9@intel.com>
References: <20210420151537.64360-1-chen.zhang@intel.com>
 <20210420151537.64360-6-chen.zhang@intel.com>
 <20210517220704.50f86bfd@gecko.fritz.box>
In-Reply-To: <20210517220704.50f86bfd@gecko.fritz.box>
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
> Sent: Tuesday, May 18, 2021 4:07 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>;
> Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd Hoffmann
> <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Zhang Chen
> <zhangckid@gmail.com>
> Subject: Re: [PATCH V6 5/6] net/colo-compare: Add passthrough list to
> CompareState
>=20
> On Tue, 20 Apr 2021 23:15:36 +0800
> Zhang Chen <chen.zhang@intel.com> wrote:
>=20
> > Add passthrough list for each CompareState.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/colo-compare.c | 28 ++++++++++++++++++++++++++++
> > net/colo-compare.h | 12 ++++++++++++
> >  2 files changed, 40 insertions(+)
> >
> > diff --git a/net/colo-compare.c b/net/colo-compare.c index
> > b51b1437ef..7109e2ed30 100644
> > --- a/net/colo-compare.c
> > +++ b/net/colo-compare.c
> > @@ -141,6 +141,7 @@ static int packet_enqueue(CompareState *s, int
> mode, Connection **con)
> >      ConnectionKey key;
> >      Packet *pkt =3D NULL;
> >      Connection *conn;
> > +    COLOPassthroughEntry *pass, *next;
> >      int ret;
> >
> >      if (mode =3D=3D PRIMARY_IN) {
> > @@ -160,6 +161,31 @@ static int packet_enqueue(CompareState *s, int
> mode, Connection **con)
> >      }
> >      fill_connection_key(pkt, &key);
> >
> > +    /* Check COLO passthrough specifications */
> > +    qemu_mutex_lock(&s->passthroughlist_mutex);
> > +    if (!QLIST_EMPTY(&s->passthroughlist)) {
> > +        QLIST_FOREACH_SAFE(pass, &s->passthroughlist, node, next) {
> > +            if (key.ip_proto =3D=3D pass->l4_protocol->p_proto) {
> > +                if (pass->src_port =3D=3D 0 || pass->src_port =3D=3D k=
ey.dst_port) {
> > +                    if (pass->src_ip.s_addr =3D=3D 0 ||
> > +                        pass->src_ip.s_addr =3D=3D key.src.s_addr) {
> > +                        if (pass->dst_port =3D=3D 0 ||
> > +                            pass->dst_port =3D=3D key.src_port) {
> > +                            if (pass->dst_ip.s_addr =3D=3D 0 ||
> > +                                pass->dst_ip.s_addr =3D=3D key.dst.s_a=
ddr) {
> > +                                packet_destroy(pkt, NULL);
> > +                                pkt =3D NULL;
> > +                                qemu_mutex_unlock(&s->passthroughlist_=
mutex);
> > +                                return -1;
> > +                            }
> > +                        }
> > +                    }
> > +                }
> > +            }
> > +        }
> > +    }
> > +    qemu_mutex_unlock(&s->passthroughlist_mutex);
> > +
> >      conn =3D connection_get(s->connection_track_table,
> >                            &key,
> >                            &s->conn_list); @@ -1225,6 +1251,7 @@
> > static void colo_compare_complete(UserCreatable *uc, Error **errp)
> >      }
> >
> >      g_queue_init(&s->conn_list);
> > +    QLIST_INIT(&s->passthroughlist);
> >
> >      s->connection_track_table =3D
> g_hash_table_new_full(connection_key_hash,
> >
> > connection_key_equal, @@ -1237,6 +1264,7 @@ static void
> colo_compare_complete(UserCreatable *uc, Error **errp)
> >      if (!colo_compare_active) {
> >          qemu_mutex_init(&event_mtx);
> >          qemu_cond_init(&event_complete_cond);
> > +        qemu_mutex_init(&s->passthroughlist_mutex);
>=20
> This initializes the mutex only for the first colo-compare object that is=
 created.
> The mutex has to be initialized every time, as it separate for each colo-
> compare object.

Good catch. I will fix it in the V7.

Thanks
Chen

>=20
> >          colo_compare_active =3D true;
> >      }
> >      QTAILQ_INSERT_TAIL(&net_compares, s, next); diff --git
> > a/net/colo-compare.h b/net/colo-compare.h index
> ab649c9dbe..7ca74de840
> > 100644
> > --- a/net/colo-compare.h
> > +++ b/net/colo-compare.h
> > @@ -23,6 +23,7 @@
> >  #include "migration/migration.h"
> >  #include "sysemu/iothread.h"
> >  #include "colo.h"
> > +#include <netdb.h>
> >
> >  #define TYPE_COLO_COMPARE "colo-compare"
> >  typedef struct CompareState CompareState; @@ -54,6 +55,15 @@
> typedef
> > struct COLOSendEntry {
> >      uint8_t *buf;
> >  } COLOSendEntry;
> >
> > +typedef struct COLOPassthroughEntry {
> > +    struct protoent *l4_protocol;
> > +    int src_port;
> > +    int dst_port;
> > +    struct in_addr src_ip;
> > +    struct in_addr dst_ip;
> > +    QLIST_ENTRY(COLOPassthroughEntry) node; } COLOPassthroughEntry;
> > +
> >  /*
> >   *  + CompareState ++
> >   *  |               |
> > @@ -110,6 +120,8 @@ struct CompareState {
> >
> >      QEMUBH *event_bh;
> >      enum colo_event event;
> > +    QLIST_HEAD(, COLOPassthroughEntry) passthroughlist;
> > +    QemuMutex passthroughlist_mutex;
> >
> >      QTAILQ_ENTRY(CompareState) next;
> >  };
>=20
>=20
>=20
> --


