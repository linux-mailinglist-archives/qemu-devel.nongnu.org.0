Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E53607BF
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:52:57 +0200 (CEST)
Received: from localhost ([::1]:41244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzcG-0002Si-Tc
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzb9-0001cG-Lf
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:51:48 -0400
Received: from mga17.intel.com ([192.55.52.151]:46869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lWzb4-0007eI-Rt
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:51:47 -0400
IronPort-SDR: aJTfmYZgEC+aUKZ+B/ATb0bbwcheUQ4fpfaQ6npZkccPLGzsr5+QQZID1eFbcFduz2gFqqRLhY
 Ocf/o/W63TuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="174936994"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="174936994"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:51:35 -0700
IronPort-SDR: TvbPXESV5onfSXmWlJDL2yDx479lusym3jYZsoN8WF86BdVO99vnKzVkJgA0R5070wt5dMOG9b
 GH6Zf1cXbmQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="418702416"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 15 Apr 2021 03:51:34 -0700
Received: from shsmsx603.ccr.corp.intel.com (10.109.6.143) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 03:51:34 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.109.6.142) by
 SHSMSX603.ccr.corp.intel.com (10.109.6.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 18:51:32 +0800
Received: from shsmsx602.ccr.corp.intel.com ([10.109.6.142]) by
 SHSMSX602.ccr.corp.intel.com ([10.109.6.142]) with mapi id 15.01.2106.013;
 Thu, 15 Apr 2021 18:51:32 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: RE: [PATCH V4 4/7] hmp-commands: Add new HMP command for COLO
 passthrough
Thread-Topic: [PATCH V4 4/7] hmp-commands: Add new HMP command for COLO
 passthrough
Thread-Index: AQHXHHR2Gj4NyL/LzEGqaF3Z1JCYgKqSdPiAgCKAaHA=
Date: Thu, 15 Apr 2021 10:51:32 +0000
Message-ID: <dfd26b5e1d6c4aebb5b844dc9122d2d5@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-5-chen.zhang@intel.com> <YFsW7ZTXx/lAcVWW@work-vm>
In-Reply-To: <YFsW7ZTXx/lAcVWW@work-vm>
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
> Sent: Wednesday, March 24, 2021 6:40 PM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Markus Armbruster
> <armbru@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Zhang Chen
> <zhangckid@gmail.com>; Lukas Straub <lukasstraub2@web.de>
> Subject: Re: [PATCH V4 4/7] hmp-commands: Add new HMP command for
> COLO passthrough
>=20
> * Zhang Chen (chen.zhang@intel.com) wrote:
> > Add hmp_colo_passthrough_add and hmp_colo_passthrough_del make
> user
> > can maintain COLO network passthrough list in human monitor.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  hmp-commands.hx       | 26 ++++++++++++++++++++++++++
> >  include/monitor/hmp.h |  2 ++
> >  monitor/hmp-cmds.c    | 34 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 62 insertions(+)
> >
> > diff --git a/hmp-commands.hx b/hmp-commands.hx index
> > d4001f9c5d..b67a5a04cb 100644
> > --- a/hmp-commands.hx
> > +++ b/hmp-commands.hx
> > @@ -1335,6 +1335,32 @@ SRST
> >    Remove host network device.
> >  ERST
> >
> > +    {
> > +        .name       =3D "colo_passthrough_add",
> > +        .args_type  =3D
> "protocol:s,id:s?,src_ip:s?,dst_ip:s?,src_port:i?,dst_port:i?",
> > +        .params     =3D "protocol [id] [src_ip] [dst_ip] [src_port] [d=
st_port]",
>=20
> That ordering is a bit unnatural; it's normal to keep ip and port togethe=
r;
> maybe this would be better as:
>=20
>    protocol:s,id:s,src:s?,dst:s?
>=20
> then pass src and dst through inet_parse to get your hostname and port ?

OK, already update to V5, please review it.

Thanks
Chen

>=20
> Dave
>=20
> > +        .help       =3D "Add network stream to colo passthrough list",
> > +        .cmd        =3D hmp_colo_passthrough_add,
> > +    },
> > +
> > +SRST
> > +``colo_passthrough_add``
> > +  Add network stream to colo passthrough list.
> > +ERST
> > +
> > +    {
> > +        .name       =3D "colo_passthrough_del",
> > +        .args_type  =3D
> "protocol:s,id:s?,src_ip:s?,dst_ip:s?,src_port:i?,dst_port:i?",
> > +        .params     =3D "protocol [id] [src_ip] [dst_ip] [src_port] [d=
st_port]",
> > +        .help       =3D "Delete network stream from colo passthrough l=
ist",
> > +        .cmd        =3D hmp_colo_passthrough_del,
> > +    },
> > +
> > +SRST
> > +``colo_passthrough_del``
> > +  Delete network stream from colo passthrough list.
> > +ERST
> > +
> >      {
> >          .name       =3D "object_add",
> >          .args_type  =3D "object:O",
> > diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h index
> > ed2913fd18..3c4943b09f 100644
> > --- a/include/monitor/hmp.h
> > +++ b/include/monitor/hmp.h
> > @@ -81,6 +81,8 @@ void hmp_device_del(Monitor *mon, const QDict
> > *qdict);  void hmp_dump_guest_memory(Monitor *mon, const QDict
> > *qdict);  void hmp_netdev_add(Monitor *mon, const QDict *qdict);  void
> > hmp_netdev_del(Monitor *mon, const QDict *qdict);
> > +void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict);
> void
> > +hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict);
> >  void hmp_getfd(Monitor *mon, const QDict *qdict);  void
> > hmp_closefd(Monitor *mon, const QDict *qdict);  void
> > hmp_sendkey(Monitor *mon, const QDict *qdict); diff --git
> > a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c index
> 3c88a4faef..b57e3430ab
> > 100644
> > --- a/monitor/hmp-cmds.c
> > +++ b/monitor/hmp-cmds.c
> > @@ -1668,6 +1668,40 @@ void hmp_netdev_del(Monitor *mon, const
> QDict *qdict)
> >      hmp_handle_error(mon, err);
> >  }
> >
> > +void hmp_colo_passthrough_add(Monitor *mon, const QDict *qdict) {
> > +    const char *prot =3D qdict_get_str(qdict, "protocol");
> > +    L4_Connection *l4_conn =3D g_new0(L4_Connection, 1);
> > +    Error *err =3D NULL;
> > +
> > +    l4_conn->id =3D g_strdup(qdict_get_try_str(qdict, "id"));
> > +    l4_conn->protocol =3D qapi_enum_parse(&IP_PROTOCOL_lookup, prot, -
> 1, &err);
> > +    l4_conn->src_ip =3D g_strdup(qdict_get_try_str(qdict, "src_ip"));
> > +    l4_conn->dst_ip =3D g_strdup(qdict_get_try_str(qdict, "dst_ip"));
> > +    l4_conn->src_port =3D qdict_get_try_int(qdict, "src_port", 0);
> > +    l4_conn->dst_port =3D qdict_get_try_int(qdict, "dst_port", 0);
> > +
> > +    qmp_colo_passthrough_add(l4_conn, &err);
> > +    hmp_handle_error(mon, err);
> > +}
> > +
> > +void hmp_colo_passthrough_del(Monitor *mon, const QDict *qdict) {
> > +    const char *prot =3D qdict_get_str(qdict, "protocol");
> > +    L4_Connection *l4_conn =3D g_new0(L4_Connection, 1);
> > +    Error *err =3D NULL;
> > +
> > +    l4_conn->id =3D g_strdup(qdict_get_try_str(qdict, "id"));
> > +    l4_conn->protocol =3D qapi_enum_parse(&IP_PROTOCOL_lookup, prot, -
> 1, &err);
> > +    l4_conn->src_ip =3D g_strdup(qdict_get_try_str(qdict, "src_ip"));
> > +    l4_conn->dst_ip =3D g_strdup(qdict_get_try_str(qdict, "dst_ip"));
> > +    l4_conn->src_port =3D qdict_get_try_int(qdict, "src_port", 0);
> > +    l4_conn->dst_port =3D qdict_get_try_int(qdict, "dst_port", 0);
> > +
> > +    qmp_colo_passthrough_del(l4_conn, &err);
> > +    hmp_handle_error(mon, err);
> > +}
> > +
> >  void hmp_object_add(Monitor *mon, const QDict *qdict)  {
> >      Error *err =3D NULL;
> > --
> > 2.25.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


