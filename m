Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B2343D62
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:02:36 +0100 (CET)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHON-0002lH-Su
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOHLq-0001po-5J
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:59:58 -0400
Received: from mga14.intel.com ([192.55.52.115]:54316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1lOHLl-0005x3-Q4
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 05:59:57 -0400
IronPort-SDR: iZtdqZ9xAuP5kSfdcA/hf8kNOHhqhk5TwdEkNET9q9Ja+k9/x/lRgJqTRDK/0H6UN9VT1YGxfn
 gXkpiLrt4rQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="189639811"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="189639811"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 02:59:49 -0700
IronPort-SDR: c7iOo15wlT3Ce85m3TV93WbV5wI3SqLGAoO/IQjN+GjzselCUg5ljILZPPQdYhqWa6NkDp9qEb
 ghiOgLldGlTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="373795924"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga003.jf.intel.com with ESMTP; 22 Mar 2021 02:59:49 -0700
Received: from shsmsx604.ccr.corp.intel.com (10.109.6.214) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 02:59:48 -0700
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 SHSMSX604.ccr.corp.intel.com (10.109.6.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 17:59:46 +0800
Received: from shsmsx605.ccr.corp.intel.com ([10.109.6.215]) by
 SHSMSX605.ccr.corp.intel.com ([10.109.6.215]) with mapi id 15.01.2106.013;
 Mon, 22 Mar 2021 17:59:46 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: RE: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Topic: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
Thread-Index: AQHXHHR2COkU3F5OI06xFEZCxXoB9aqLedyvgARKr2A=
Date: Mon, 22 Mar 2021 09:59:46 +0000
Message-ID: <ecf5a9f4ba3044bebefbb7c19be9fb93@intel.com>
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-4-chen.zhang@intel.com>
 <87tup7gmgu.fsf@dusky.pond.sub.org>
In-Reply-To: <87tup7gmgu.fsf@dusky.pond.sub.org>
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Saturday, March 20, 2021 12:03 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
> Gilbert <dgilbert@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Luk=
as
> Straub <lukasstraub2@web.de>; Zhang Chen <zhangckid@gmail.com>
> Subject: Re: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO
> passthrough
>=20
> Zhang Chen <chen.zhang@intel.com> writes:
>=20
> > Since the real user scenario does not need COLO to monitor all traffic.
> > Add colo-passthrough-add and colo-passthrough-del to maintain a COLO
> > network passthrough list.
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  net/net.c     | 10 ++++++++++
> >  qapi/net.json | 40 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> >
> > diff --git a/net/net.c b/net/net.c
> > index 725a4e1450..7c7cefe0e0 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -1199,6 +1199,16 @@ void qmp_netdev_del(const char *id, Error
> **errp)
> >      }
> >  }
> >
> > +void qmp_colo_passthrough_add(L4_Connection *conn, Error **errp) {
> > +    /* Setup passthrough connection */
>=20
> Do you mean to say
>=20
>        /* TODO implement */
>=20
> ?

Yes, I will input real code here in 7/7 patch.

>=20
> > +}
> > +
> > +void qmp_colo_passthrough_del(L4_Connection *conn, Error **errp) {
> > +    /* Delete passthrough connection */ }
>=20
> Likewise.
>=20
> > +
> >  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)  {
> >      char *str;
> > diff --git a/qapi/net.json b/qapi/net.json index
> > cd4a8ed95e..ec7d3b1128 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -851,3 +851,43 @@
> >    'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str',=
 '*dst_ip': 'str',
> >      '*src_port': 'int', '*dst_port': 'int' } }
> >
> > +##
> > +# @colo-passthrough-add:
> > +#
> > +# Add passthrough entry according to customer's needs in COLO-compare.
>=20
> QEMU doesn't have customers, it has users :)

Thanks note.

>=20
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "colo-passthrough-add",
> > +#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip":
> "192.168.1.1",
> > +#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'colo-passthrough-add', 'boxed': true,
> > +     'data': 'L4_Connection' }
> > +
> > +##
> > +# @colo-passthrough-del:
> > +#
> > +# Delete passthrough entry according to customer's needs in COLO-
> compare.
> > +#
> > +# Returns: Nothing on success
> > +#
> > +# Since: 6.1
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "colo-passthrough-del",
> > +#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip":
> "192.168.1.1",
> > +#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
> > +# <- { "return": {} }
> > +#
> > +##
> > +{ 'command': 'colo-passthrough-del', 'boxed': true,
> > +     'data': 'L4_Connection' }
> > +
>=20
> To make sense of this, I have to refer back to PATCH 1 and 2:
>=20
>    { 'enum': 'IP_PROTOCOL', 'data': [ 'tcp', 'udp', 'dccp', 'sctp', 'udpl=
ite',
>        'icmp', 'igmp', 'ipv6' ] }
>=20
>    { 'struct': 'L4_Connection',
>      'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str',=
 '*dst_ip': 'str',
>        '*src_port': 'int', '*dst_port': 'int' } }
>=20
> Please squash the three patches together.

OK.

>=20
> I figure colo-passthrough-add adds some kind of packet matching thingy th=
at
> can match packets by source IP, source port, destination IP, destination =
port,
> and protocol.  Correct?

Yes, you are right.

>=20
> The protocol is mandatory, all others are optional.  What does it mean to=
 omit
> an optional one?  Match all?

Yes, match all. The idea from Jason Wang, for example:
User just set the protocol/source IP(tcp/192.168.1.1) , others empty.
The rule will bypass all the TCP packet from the source IP.

>=20
> I have no idea what @id is supposed to mean.  Please explain intended use=
.

The @id means packet hander in Qemu. Because not all the guest network pack=
et into the colo-compare module, the net-filters are same cases.
There modules attach to NIC or chardev socket to work, VM maybe have multi =
modules running. So we use the ID to set the rule to the specific module.=20

Thanks
Chen

>=20
> I'm ignoring colo-passthrough-del for now, because I feel need to
> understand -add first.


