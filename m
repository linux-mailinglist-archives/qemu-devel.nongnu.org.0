Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F859A606
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 05:25:54 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i10D3-0003w3-49
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 23:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chen.zhang@intel.com>) id 1i10BV-0002un-IL
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 23:24:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chen.zhang@intel.com>) id 1i10BS-0002EG-UA
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 23:24:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:30810)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <chen.zhang@intel.com>)
 id 1i10BS-0002AG-Kc
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 23:24:14 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 20:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="330596513"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga004.jf.intel.com with ESMTP; 22 Aug 2019 20:24:06 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 20:24:06 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 22 Aug 2019 20:24:05 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.19]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.62]) with mapi id 14.03.0439.000;
 Fri, 23 Aug 2019 11:24:03 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 2/3] net/filter.c: Add Options to insert filters
 anywhere in the filter list
Thread-Index: AQHVU5oiMguPMz5nEE2bcmsx0goHsqcIGSaw
Date: Fri, 23 Aug 2019 03:24:02 +0000
Message-ID: <9CFF81C0F6B98A43A459C9EDAD400D780622D3DC@shsmsx102.ccr.corp.intel.com>
References: <cover.1565894837.git.lukasstraub2@web.de>
 <6643a807a5f4c5ceb2f09e0718e97e5f968577f7.1565894837.git.lukasstraub2@web.de>
In-Reply-To: <6643a807a5f4c5ceb2f09e0718e97e5f968577f7.1565894837.git.lukasstraub2@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjFmYzk5Y2MtZGIwOC00MzQ0LTk0NzMtMDI1NWU1Yzg1NmZlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiY1wvQzluMGhjbWhTZFFhZlFEQnJzeWtUZ3RcLzhuRXRtRFwvbCs4Q0Nsd3lXWFBIT1wvZ3Y5aWtMbDhqM1ZmM1hwWXcifQ==
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [PATCH v2 2/3] net/filter.c: Add Options to insert
 filters anywhere in the filter list
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
Cc: Wen Congyang <wencongyang2@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Lukas Straub [mailto:lukasstraub2@web.de]
> Sent: Friday, August 16, 2019 2:49 AM
> To: qemu-devel <qemu-devel@nongnu.org>
> Cc: Zhang, Chen <chen.zhang@intel.com>; Jason Wang
> <jasowang@redhat.com>; Wen Congyang <wencongyang2@huawei.com>; Xie
> Changlong <xiechanglong.d@gmail.com>
> Subject: [PATCH v2 2/3] net/filter.c: Add Options to insert filters anywh=
ere in
> the filter list
>=20
> To switch the Secondary to Primary, we need to insert new filters before =
the
> filter-rewriter.
>=20
> Add the options insert=3D and position=3D to be able to insert filters an=
ywhere in the
> filter list.
>=20
> position should be either "head", "tail" or the id of another filter.
> insert should be either "before" or "after" to specify where to insert th=
e new
> filter relative to the one specified with position.
>=20

Hi Lukas,

It looks no need to add the "insert =3D xxx" for this operation.
For example:

We have 3 net-filters, the running order like that:

Fiter1   ---------->   Filter2 ------------> Filter3

If we want to add another filter between filter1 and filter2.
The "Position =3D head, insert =3D after" always seam with "position =3D fi=
lter2 id, insert =3D before". It seems the "insert" is a redundant args.
So I think it is enough with the "position", we can make the "insert" alway=
s equal "after" except the "head".


Thanks
Zhang Chen

> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>  include/net/filter.h |  2 ++
>  net/filter.c         | 71 +++++++++++++++++++++++++++++++++++++++++++-
>  qemu-options.hx      | 10 +++----
>  3 files changed, 77 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/net/filter.h b/include/net/filter.h index
> 49da666ac0..355c178f75 100644
> --- a/include/net/filter.h
> +++ b/include/net/filter.h
> @@ -62,6 +62,8 @@ struct NetFilterState {
>      NetClientState *netdev;
>      NetFilterDirection direction;
>      bool on;
> +    char *position;
> +    bool insert_before;
>      QTAILQ_ENTRY(NetFilterState) next;
>  };
>=20
> diff --git a/net/filter.c b/net/filter.c index 28d1930db7..309fd778df 100=
644
> --- a/net/filter.c
> +++ b/net/filter.c
> @@ -171,11 +171,47 @@ static void netfilter_set_status(Object *obj, const
> char *str, Error **errp)
>      }
>  }
>=20
> +static char *netfilter_get_position(Object *obj, Error **errp) {
> +    NetFilterState *nf =3D NETFILTER(obj);
> +
> +    return g_strdup(nf->position);
> +}
> +
> +static void netfilter_set_position(Object *obj, const char *str, Error
> +**errp) {
> +    NetFilterState *nf =3D NETFILTER(obj);
> +
> +    nf->position =3D g_strdup(str);
> +}
> +
> +static char *netfilter_get_insert(Object *obj, Error **errp) {
> +    NetFilterState *nf =3D NETFILTER(obj);
> +
> +    return nf->insert_before ? g_strdup("before") : g_strdup("after");
> +}
> +
> +static void netfilter_set_insert(Object *obj, const char *str, Error
> +**errp) {
> +    NetFilterState *nf =3D NETFILTER(obj);
> +
> +    if (strcmp(str, "before") && strcmp(str, "after")) {
> +        error_setg(errp, "Invalid value for netfilter insert, "
> +                         "should be 'head' or 'tail'");
> +        return;
> +    }
> +
> +    nf->insert_before =3D !strcmp(str, "before"); }
> +
>  static void netfilter_init(Object *obj)  {
>      NetFilterState *nf =3D NETFILTER(obj);
>=20
>      nf->on =3D true;
> +    nf->insert_before =3D false;
> +    nf->position =3D g_strdup("tail");
>=20
>      object_property_add_str(obj, "netdev",
>                              netfilter_get_netdev_id, netfilter_set_netde=
v_id, @@ -187,11
> +223,18 @@ static void netfilter_init(Object *obj)
>      object_property_add_str(obj, "status",
>                              netfilter_get_status, netfilter_set_status,
>                              NULL);
> +    object_property_add_str(obj, "position",
> +                            netfilter_get_position, netfilter_set_positi=
on,
> +                            NULL);
> +    object_property_add_str(obj, "insert",
> +                            netfilter_get_insert, netfilter_set_insert,
> +                            NULL);
>  }
>=20
>  static void netfilter_complete(UserCreatable *uc, Error **errp)  {
>      NetFilterState *nf =3D NETFILTER(uc);
> +    NetFilterState *position =3D NULL;
>      NetClientState *ncs[MAX_QUEUE_NUM];
>      NetFilterClass *nfc =3D NETFILTER_GET_CLASS(uc);
>      int queues;
> @@ -219,6 +262,20 @@ static void netfilter_complete(UserCreatable *uc,
> Error **errp)
>          return;
>      }
>=20
> +    if (strcmp(nf->position, "head") && strcmp(nf->position, "tail")) {
> +        /* Search for the position to insert before/after */
> +        Object *container;
> +        Object *obj;
> +
> +        container =3D object_get_objects_root();
> +        obj =3D object_resolve_path_component(container, nf->position);
> +        if (!obj) {
> +            error_setg(errp, "filter '%s' not found", nf->position);
> +            return;
> +        }
> +        position =3D NETFILTER(obj);
> +    }
> +
>      nf->netdev =3D ncs[0];
>=20
>      if (nfc->setup) {
> @@ -228,7 +285,18 @@ static void netfilter_complete(UserCreatable *uc,
> Error **errp)
>              return;
>          }
>      }
> -    QTAILQ_INSERT_TAIL(&nf->netdev->filters, nf, next);
> +
> +    if (position) {
> +        if (nf->insert_before) {
> +            QTAILQ_INSERT_BEFORE(position, nf, next);
> +        } else {
> +            QTAILQ_INSERT_AFTER(&nf->netdev->filters, position, nf, next=
);
> +        }
> +    } else if (!strcmp(nf->position, "head")) {
> +        QTAILQ_INSERT_HEAD(&nf->netdev->filters, nf, next);
> +    } else if (!strcmp(nf->position, "tail")) {
> +        QTAILQ_INSERT_TAIL(&nf->netdev->filters, nf, next);
> +    }
>  }
>=20
>  static void netfilter_finalize(Object *obj) @@ -245,6 +313,7 @@ static v=
oid
> netfilter_finalize(Object *obj)
>          QTAILQ_REMOVE(&nf->netdev->filters, nf, next);
>      }
>      g_free(nf->netdev_id);
> +    g_free(nf->position);
>  }
>=20
>  static void default_handle_event(NetFilterState *nf, int event, Error **=
errp)
> diff --git a/qemu-options.hx b/qemu-options.hx index 08749a3391..f0a47a07=
46
> 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4368,7 +4368,7 @@ applications, they can do this through this paramet=
er.
> Its format is  a gnutls priority string as described at
> @url{https://gnutls.org/manual/html_node/Priority-Strings.html}.
>=20
> -@item -object filter-
> buffer,id=3D@var{id},netdev=3D@var{netdevid},interval=3D@var{t}[,queue=3D=
@var{all|r
> x|tx}][,status=3D@var{on|off}]
> +@item -object
> +filter-buffer,id=3D@var{id},netdev=3D@var{netdevid},interval=3D@var{t}[,=
queue
> +=3D@var{all|rx|tx}][,status=3D@var{on|off}][,position=3D@var{head|tail|i=
d}][,
> +insert=3D@var{after|before}]
>=20
>  Interval @var{t} can't be 0, this filter batches the packet delivery: al=
l  packets
> arriving in a given interval on netdev @var{netdevid} are delayed @@ -438=
7,11
> +4387,11 @@ queue @var{all|rx|tx} is an option that can be applied to any
> netfilter.
>  @option{tx}: the filter is attached to the transmit queue of the netdev,
>               where it will receive packets sent by the netdev.
>=20
> -@item -object filter-
> mirror,id=3D@var{id},netdev=3D@var{netdevid},outdev=3D@var{chardevid},que=
ue=3D@v
> ar{all|rx|tx}[,vnet_hdr_support]
> +@item -object
> +filter-mirror,id=3D@var{id},netdev=3D@var{netdevid},outdev=3D@var{charde=
vid},
> +queue=3D@var{all|rx|tx}[,vnet_hdr_support][,position=3D@var{head|tail|id=
}][
> +,insert=3D@var{after|before}]
>=20
>  filter-mirror on netdev @var{netdevid},mirror net packet to
> chardev@var{chardevid}, if it has the vnet_hdr_support flag, filter-mirro=
r will
> mirror packet with vnet_hdr_len.
>=20
> -@item -object filter-
> redirector,id=3D@var{id},netdev=3D@var{netdevid},indev=3D@var{chardevid},=
outdev=3D
> @var{chardevid},queue=3D@var{all|rx|tx}[,vnet_hdr_support]
> +@item -object
> +filter-redirector,id=3D@var{id},netdev=3D@var{netdevid},indev=3D@var{cha=
rdevi
> +d},outdev=3D@var{chardevid},queue=3D@var{all|rx|tx}[,vnet_hdr_support][,=
pos
> +ition=3D@var{head|tail|id}][,insert=3D@var{after|before}]
>=20
>  filter-redirector on netdev @var{netdevid},redirect filter's net packet =
to
> chardev  @var{chardevid},and redirect indev's packet to filter.if it has =
the
> vnet_hdr_support flag, @@ -4400,7 +4400,7 @@ Create a filter-redirector w=
e
> need to differ outdev id from indev id, id can not  be the same. we can j=
ust use
> indev or outdev, but at least one of indev or outdev  need to be specifie=
d.
>=20
> -@item -object filter-
> rewriter,id=3D@var{id},netdev=3D@var{netdevid},queue=3D@var{all|rx|tx},[v=
net_hdr_
> support]
> +@item -object
> +filter-rewriter,id=3D@var{id},netdev=3D@var{netdevid},queue=3D@var{all|r=
x|tx}
> +,[vnet_hdr_support][,position=3D@var{head|tail|id}][,insert=3D@var{after=
|be
> +fore}]
>=20
>  Filter-rewriter is a part of COLO project.It will rewrite tcp packet to =
 secondary
> from primary to keep secondary tcp connection,and rewrite @@ -4413,7
> +4413,7 @@ colo secondary:
>  -object filter-redirector,id=3Df2,netdev=3Dhn0,queue=3Drx,outdev=3Dred1
>  -object filter-rewriter,id=3Drew0,netdev=3Dhn0,queue=3Dall
>=20
> -@item -object filter-
> dump,id=3D@var{id},netdev=3D@var{dev}[,file=3D@var{filename}][,maxlen=3D@=
var{len}]
> +@item -object
> +filter-dump,id=3D@var{id},netdev=3D@var{dev}[,file=3D@var{filename}][,ma=
xlen=3D
> +@var{len}][,position=3D@var{head|tail|id}][,insert=3D@var{after|before}]
>=20
>  Dump the network traffic on netdev @var{dev} to the file specified by
> @var{filename}. At most @var{len} bytes (64k by default) per packet are s=
tored.
> --
> 2.20.1


